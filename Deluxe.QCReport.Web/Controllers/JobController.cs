using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using System.Text;
using System.Web.Script.Serialization;
using System.IO;
using System.Reflection;
using Deluxe.QCReport.Common;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Services;
using Deluxe.QCReport.Web.Models;
using Deluxe.QCReport.Web.Utilities;
using Deluxe.QCReport.Common.Utilities;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Web.Fillter;



namespace Deluxe.QCReport.Web.Controllers
{
    //[Authorize]
    [CustomAuthorize]
    public class JobController : Controller
    {
        
        HeaderService _headSrv = new HeaderService();
        HistoryService _histSrv = new HistoryService();
        AudioTCService _atcSrv = new AudioTCService();
        IndividualSpecsService _isSrv = new IndividualSpecsService();
        OverallSpecsService _oasSrv = new OverallSpecsService();
        FinalService _fSrv = new FinalService();
        QCReportService _qcRSrv = new QCReportService();

        private readonly ChecklistService _checklistService = null;
        private readonly TapeLayoutService _tlSrv = null;
        private readonly TextInfoService _tiSrv = null;
        private readonly LogService _logSrv = null;
        private readonly ILoggerService _loggerService = null;
        private readonly IESISpecificsService _esiSpecificsService = null;
        private readonly IESIFinalService _esiFinalService = null;
        private readonly IClientService _clientService = null;

        public JobController()
        {
            var conn = ConfigManager.DatabaseConnection;

            var loggerRepository = new LoggerRepository(conn);
            _loggerService = new LoggerService(loggerRepository);

            _checklistService = new ChecklistService(
                                   new ChecklistRepository(
                                       conn, 
                                       _loggerService));

            _tlSrv = new TapeLayoutService(
                                   new TapeLayoutRepository(
                                       conn,
                                       _loggerService));


            _tiSrv = new TextInfoService(
                                   new TextInfoRepository(
                                       conn,
                                       _loggerService));


            _logSrv = new LogService(
                                  new LogRepository(
                                      conn,
                                      _loggerService));



            _esiSpecificsService = new ESISpecificsService(
                                  new ESISpecificsRepository(
                                      conn,
                                      _loggerService));

            _esiFinalService = new ESIFinalService(
                                 new ESIFinalRepository(
                                     conn,
                                     _loggerService));

            _clientService = new ClientService(
                                new ClientRepository(
                                    conn,
                                    _loggerService));


        }

        

       
        public ActionResult HeaderDetails(int qcnum, int revnum)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            HomeVM model = new HomeVM();
            model.Header_VM = _headSrv.GetHeaderDetails(qcnum, revnum);
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            model.AudioTCList = LookUpsService.GetAudioTC();
            model.AspectRatioList = LookUpsService.GetAspectRatio();
            model.ClientNameList = LookUpsService.GetCustName();
            model.VersionList = LookUpsService.GetVersion();
            model.FormatList = LookUpsService.GetFormat();
            model.DescriptionList = LookUpsService.GetTapeDesc();
            model.StandardList = LookUpsService.GetStandard();
            model.OperatorList = LookUpsService.GetOperator();
            model.QCRoomList = LookUpsService.GetQCRoom();
            model.TimecodeList = LookUpsService.GetAudioTC();

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Header info QC [Id: {0}]; Rev No; {1} was viewed.",
                                             qcnum,
                                             revnum),
                                        Constants.ActivityType.HeaderViewed);

            /*******************************************************************************************/



            var qcType = _headSrv.GetHeaderDetails(qcnum, revnum).QCType;

            if(qcType != "E")
            {
                return PartialView("_Header", model);
            }
            else
            {
                return PartialView("_ESIHeader", model);
            }
            
        }

        [HttpPost]
        public ActionResult SaveHeaderDetails(HomeVM model)
        {
            var qcType = _headSrv.GetHeaderDetails(model.Header_VM.Qcnum, model.Header_VM.subQcnum).QCType;


            // set selected customerId 
            Dictionary<int, string> custList = LookUpsService.GetCustName();
            KeyValuePair<int, string> selCustomer = custList.FirstOrDefault(c => c.Value == model.Header_VM.CustName);
            if (selCustomer.Key == 0 && string.IsNullOrEmpty(selCustomer.Value))
            {
                return Json(new { success = false, msg = "Data not saved! Customer name not found." });
            }
            else
            {
                model.Header_VM.CustId = selCustomer.Key;
            }

            Dictionary<int, string> versionList = LookUpsService.GetVersion();
            KeyValuePair<int, string> selVersion = versionList.FirstOrDefault(c => c.Value == model.Header_VM.Version);
            if (selVersion.Key == 0 && string.IsNullOrEmpty(selVersion.Value))
            {
                return Json(new { success = false, msg = "Data not saved! Version not found." });
            }

            if(string.IsNullOrWhiteSpace(qcType) && qcType != "E")
            {
                Dictionary<int, string> descList = LookUpsService.GetTapeDesc();
                KeyValuePair<int, string> selDesc = descList.FirstOrDefault(c => c.Value == model.Header_VM.TapeDesc1);
                if (selDesc.Key == 0 && string.IsNullOrEmpty(selDesc.Value))
                {
                    return Json(new { success = false, msg = "Data not saved! Description not found." });
                }
            }
           
            bool result = _headSrv.UpdateHeaderDetails(model.Header_VM);
            string resultMsg = "Header data saved successfully.";

            if (!result)
            {
                resultMsg = "Header update failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Header info QC [Id: {0}]; Rev No; {1} was updated.",
                                                 model.Header_VM.Qcnum,
                                                model.Header_VM.subQcnum),
                                            Constants.ActivityType.UpdatedHeader);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }


       
        public ActionResult HistoryDetails(int qcnum, int revnum)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;

            HomeVM model = new HomeVM();
            model.History_VM = _histSrv.GetHistoryDetails(qcnum, revnum);
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            model.AspectRatioList = LookUpsService.GetAspectRatio();
            model.ClientNameList = LookUpsService.GetCustName();
            model.VersionList = LookUpsService.GetVersion();
            model.FormatList = LookUpsService.GetFormat();
            model.DescriptionList = LookUpsService.GetTapeDesc();
            model.StandardList = LookUpsService.GetStandard();
            model.OperatorList = LookUpsService.GetOperator();
            model.RevisedByList = LookUpsService.GetOperator();
            model.QCRoomList = LookUpsService.GetQCRoom();

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "History info QC [Id: {0}]; Rev No; {1} was viewed.",
                                            qcnum,
                                            revnum),
                                        Constants.ActivityType.HistoryViewed);

            /*******************************************************************************************/

            var qcType = _headSrv.GetHeaderDetails(qcnum, revnum).QCType;

            if (qcType != "E")
            {
                return PartialView("_History", model);
            }
            else
            {
                return PartialView("_ESIHistory", model); ;
            }

            
        }

        [HttpPost]
        public ActionResult SaveHistoryDetails(HomeVM model)
        {

            if (!model.History_VM.OperatorId.HasValue)
            {
                return Json(new { success = false, msg = "Please set the original QC Operator and continue..." });
            }

            bool result = _histSrv.UpdateHistoryDetails(model.History_VM);
            string resultMsg = "History data saved successfully.";

            if (!result)
            {
                resultMsg = "History update failed !"; 
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "History info QC [Id: {0}]; Rev No; {1} was updated.",
                                                 model.History_VM.Qcnum,
                                                model.History_VM.subQcnum),
                                            Constants.ActivityType.UpdatedHeader);

                /*******************************************************************************************/

            }
        
            return Json(new { success = result, msg = resultMsg });
        }


        
        public ActionResult TapeLayoutDetails(int qcnum, int revnum, int? tfid)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;

            HomeVM model = new HomeVM();
            model.TapeLayout_VM = _tlSrv.GetTapeLayoutTCDetails(qcnum, revnum);
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Layout QC [Id: {0}]; Rev No; {1} was viewed",
                                             qcnum,
                                            revnum),
                                        Constants.ActivityType.TapeLayoutViewed);

            /*******************************************************************************************/

            if (tfid.HasValue)
            {
                model.TapeLayout_VM.CurrentTimecodes = model.TapeLayout_VM.Timecodes.FirstOrDefault(i => i.TapeFormatId == tfid.Value);
            }
            else
            {
                model.TapeLayout_VM.CurrentTimecodes = new TLTimeCodeVM();
            }


            return PartialView("_TapeLayout", model);
        }

        public ActionResult PopulateLayoutItemDetails(int qcnum, int revnum, int tfid)
        {
            var layoutVM = _tlSrv.GetTapeLayoutTCDetails(qcnum, revnum);
            var timecodes = layoutVM.Timecodes.FirstOrDefault(i => i.TapeFormatId == tfid);
            return Json(timecodes, JsonRequestBehavior.AllowGet);

        }

        [HttpPost]
        public ActionResult SaveTapeLayoutDetails(HomeVM model)
        {
          
            if (string.IsNullOrWhiteSpace(model.TapeLayout_VM.CurrentTimecodes?.Description))
            {
                return Json(new { success = false, msg = "Please add a description and continue..." });
            }

            //if (string.IsNullOrWhiteSpace(model.TapeLayout_VM.CurrentTimecodes?.Time_Code))
            //{
            //    return Json(new { success = false, msg = "Please add a timecode and continue..." });
            //}


            bool result = _tlSrv.SaveTapeLayoutTCDetails(model.TapeLayout_VM);

            string resultMsg = "Layout data saved successfully.";

            if (!result)
            {
                resultMsg = "Layout saving failed !"; 
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Layout details for QC with Id {0} and Rev No {1} was updated.",
                                                 model.TapeLayout_VM.Qcnum,
                                                model.TapeLayout_VM.subQcnum),
                                            Constants.ActivityType.UpdatedTapeLayout);

                /*******************************************************************************************/
            }


            return Json(new { success = result, msg = resultMsg });
        }

        [HttpPost]
        public ActionResult DeleteTapeLayoutDetails(HomeVM model)
        {

            bool result = _tlSrv.DeleteTapeLayoutTCDetails(model.TapeLayout_VM);

            string resultMsg = "Tape layout deleted successfully.";

            if (!result)
            { 
                resultMsg = "Tape layout deletion failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Tapa layout TC details for QC with Id {0} and Rev No {1} was deleted.",
                                                 model.TapeLayout_VM.Qcnum,
                                                model.TapeLayout_VM.subQcnum),
                                                Constants.ActivityType.DeletedTapeLayout);

                /*******************************************************************************************/
            }


            return Json(new { success = result, msg = resultMsg });
        }


      
        public ActionResult TextInfoDetails(int qcnum, int revnum, int? tiid)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;

            HomeVM model = new HomeVM();
            model.TextInfo_VM = _tiSrv.GetTextInfoDetails(qcnum, revnum);
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Text Info QC [Id: {0}]; Rev No; {1} was viewed.",
                                             qcnum,
                                             revnum),
                                        Constants.ActivityType.TextInfoViewed);

            /*******************************************************************************************/

            if (tiid.HasValue)
            {
                model.TextInfo_VM.CurrentTimecodes = model.TextInfo_VM.Timecodes.FirstOrDefault(i => i.TextInfoId == tiid.Value);
            }
            else
            {
                model.TextInfo_VM.CurrentTimecodes = new TimeCodeVM();
            }

            return PartialView("_Textinfo", model);
        }

        [HttpPost]
        public ActionResult PopulateTextInfoItemDetails(int qcnum, int revnum, int tiid)
        {
            var textInfoVM = _tiSrv.GetTextInfoDetails(qcnum, revnum);
            var timecodes = textInfoVM.Timecodes.FirstOrDefault(i => i.TextInfoId == tiid);
            return Json(timecodes, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult SaveTextInfoDetails(HomeVM model)
        {

            //if (string.IsNullOrWhiteSpace(model.TextInfo_VM.CurrentTimecodes?.TimecodeIn))
            //{
            //    return Json(new { success = false, msg = "Please add an in timecode and continue... " });
            //}

            //if (string.IsNullOrWhiteSpace(model.TextInfo_VM.CurrentTimecodes?.TimecodeOut))
            //{
            //    return Json(new { success = false, msg = "Please add an out timecode and continue... " });
            //}

            bool result = _tiSrv.SaveTextInfoDetails(model.TextInfo_VM);

            string resultMsg = "Text info data saved successfully.";

            if (!result) 
            { 
                resultMsg = "Text info saving failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Text Info for QC with Id {0} and Rev No {1} was updated.",
                                                 model.TextInfo_VM.Qcnum,
                                                model.TextInfo_VM.subQcnum),
                                            Constants.ActivityType.UpdatedTextInfo);

                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });
        }

        [HttpPost]
        public ActionResult DeleteTextInfoDetails(HomeVM model)
        {

            bool result = _tiSrv.DeleteTextInfoDetails(model.TextInfo_VM);

            string resultMsg = "Text info deleted successfully.";

            if (!result)
            { 
                resultMsg = "Text info deletion failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Text Info for QC with Id {0} and Rev No {1} was deleted.",
                                                 model.TextInfo_VM.Qcnum,
                                                model.TextInfo_VM.subQcnum),
                                             Constants.ActivityType.DeletedTextInfo);

                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });
        }


       
        public ActionResult AudioTCDetails(int qcnum, int revnum)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;

            HomeVM model = new HomeVM();
            model.AudioTC_VM = _atcSrv.GetAudioTCDetails(qcnum, revnum);
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            model.ChannelCountList = LookUpsService.GetChannelCount();
            model.AudioDescList = LookUpsService.GetAudioDesc();
            model.AudioTCList = LookUpsService.GetAudioTC();
            model.LanguageList = LookUpsService.GetLanguage();
            model.ToneList = LookUpsService.GetTone();
            model.FullSpotCheckList = LookUpsService.GetFullSpotCheck();
            model.TCIntegrityList = LookUpsService.GetTCIntegrity();
            model.NoiseReductionList = LookUpsService.GetNoiseReduction();
            model.ChannelPhaseList = LookUpsService.GetChPhase();
            model.YesNoList = LookUpsService.GetYesNo();

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Audio TC QC [Id: {0}]; Rev No; {1}",
                                            qcnum,
                                            revnum),
                                        Constants.ActivityType.AudioTCViewed);

            /*******************************************************************************************/


            return PartialView("_AudioTC", model);
        }

        [HttpPost]
        public ActionResult AudioTCChannelCountChanged(HomeVM model)
        {

            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            model.ChannelCountList = LookUpsService.GetChannelCount();
            model.AudioDescList = LookUpsService.GetAudioDesc();
            model.AudioTCList = LookUpsService.GetAudioTC();
            model.LanguageList = LookUpsService.GetLanguage();
            model.ToneList = LookUpsService.GetTone();
            model.FullSpotCheckList = LookUpsService.GetFullSpotCheck();
            model.TCIntegrityList = LookUpsService.GetTCIntegrity();
            model.NoiseReductionList = LookUpsService.GetNoiseReduction();
            model.ChannelPhaseList = LookUpsService.GetChPhase();
            model.YesNoList = LookUpsService.GetYesNo();


            int rowCnt = Convert.ToInt32(model.AudioTC_VM.ChannelCount.Replace("Channels", "").Trim());

            // make sure channels list is not null
            if (model.AudioTC_VM.ChannelsList == null) { model.AudioTC_VM.ChannelsList = new List<AudioTCChannel>(); }

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Audio TC was changed. QC [Id: {0}]; Rev No; {1}",
                                             model.AudioTC_VM?.Qcnum,
                                            model.AudioTC_VM?.subQcnum),
                                        Constants.ActivityType.AudioTCChanged);

            /*******************************************************************************************/


            // if row count didn't changed, it's an update
            if (model.AudioTC_VM.ChannelsList.Count == rowCnt)
            {

                model.ResponseSuccess = _atcSrv.SaveAudioTCDetails(model.AudioTC_VM);
                model.ResponseText = "Audio TC data saved successfully.";

                if (!model.ResponseSuccess) { model.ResponseText = "Audio TC saving failed !"; }


            }
            else if (model.AudioTC_VM.ChannelsList.Count < rowCnt)
            {
                while (model.AudioTC_VM.ChannelsList.Count != rowCnt)
                {
                    int chNo = model.AudioTC_VM.ChannelsList.Count + 1;

                    model.AudioTC_VM.ChannelsList.Add(
                        new AudioTCChannel()
                        {
                            ChannelNo = chNo
                        }
                    );

                }
            }
            else if (model.AudioTC_VM.ChannelsList.Count > rowCnt)
            {
                while (model.AudioTC_VM.ChannelsList.Count != rowCnt)
                {
                    int chNo = model.AudioTC_VM.ChannelsList.Count - 1;
                    model.AudioTC_VM.ChannelsList.RemoveAt(chNo);

                }
            }


            return PartialView("_AudioTC", model);
        }
               
        [HttpPost]
         public ActionResult SaveAudioTCDetails(HomeVM model, string modelAsJSONString )
        {
           
          var audioChannelEnumerable = modelAsJSONString.Replace(@"""","").Split(',').Where(c => c.Contains("AudioTC_VM.ChannelsList")) ;
          var audioChannelArrayList = audioChannelEnumerable.ToArray();


          if (model.AudioTC_VM?.ChannelsList == null)
            {
                       
                int rowCnt = Convert.ToInt32(model.AudioTC_VM.ChannelCount.Replace("Channels", "").Trim());
                var channelList = new List<AudioTCChannel>();
                int i = 0;
                var channelsFields = 11; // Used to be 9 + 2 (In Phase and Discrete)
                var channelsFieldNo = 0;
                var channelNo = 0;
                var description = string.Empty;
                var LKFS = string.Empty;
                var tone = string.Empty;
                var language = string.Empty;
                var average = string.Empty;
                var peak = string.Empty;
                var truePeak = string.Empty;
                var fullSpotQC = string.Empty;

                var inPhase = string.Empty;
                var discreate = string.Empty;

                for (var index = 0; index < audioChannelArrayList.Length; index++)
                {
                    if (i == rowCnt)
                    {
                        break;
                    }

                    var audioChanneItem = audioChannelArrayList[index].Replace(@"""", "");
                    var audioChannelArray = audioChanneItem.Split(':');  //AudioTC_VM.ChannelsList[0].Description: MO
                       

                    if (audioChanneItem.Contains("[" + i + "].ChannelNo"))
                    {
                        channelNo = Convert.ToInt32(audioChannelArray[1]);
                        channelsFieldNo++;
                    }
                    else if (audioChanneItem.Contains("[" + i + "].Description"))
                    {
                        description = audioChannelArray[1];
                        channelsFieldNo++;
                    }
                    else if (audioChanneItem.Contains("[" + i + "].LKFS"))
                    {
                        LKFS = audioChannelArray[1];
                        channelsFieldNo++;
                    }
                    else if (audioChanneItem.Contains("[" + i + "].Tone"))
                    {
                        tone = audioChannelArray[1];
                        channelsFieldNo++;
                    }
                    else if (audioChanneItem.Contains("[" + i + "].Language"))
                    {
                        language = audioChannelArray[1];
                        channelsFieldNo++;
                    }

                    else if (audioChanneItem.Contains("[" + i + "].InPhase"))
                    {
                        inPhase = audioChannelArray[1];
                        channelsFieldNo++;
                    }
                    else if (audioChanneItem.Contains("[" + i + "].Discreate"))
                    {
                        discreate = audioChannelArray[1];
                        channelsFieldNo++;
                    }

                    else if (audioChanneItem.Contains("[" + i + "].Average"))
                    {
                        average = audioChannelArray[1];
                        channelsFieldNo++;
                    }
                    else if (audioChanneItem.Contains("[" + i + "].Peak"))
                    {
                        peak = audioChannelArray[1];
                        channelsFieldNo++;
                    }
                    else if (audioChanneItem.Contains("[" + i + "].TruePeak"))
                    {
                        truePeak = audioChannelArray[1];
                        channelsFieldNo++;
                    }
                    else if (audioChanneItem.Contains("[" + i + "].FullSpotQC"))
                    {
                        fullSpotQC = audioChannelArray[1];
                        channelsFieldNo++;
                    }


                    if (channelsFieldNo == channelsFields)
                    {
                        AudioTCChannel channel = new AudioTCChannel()
                        {
                            ChannelNo = channelNo,
                            Description = description,

                            InPhase = inPhase,
                            Discreate = discreate,

                            LKFS = LKFS,
                            Tone = tone,
                            Language = language,
                            Average = average,
                            Peak = peak,
                            TruePeak = truePeak,
                            FullSpotQC = fullSpotQC
                        };

                        channelList.Add(channel);
                        channelsFieldNo = 0;
                        i++;
                   }

                  
                }

                 model.AudioTC_VM.ChannelsList = channelList;

              
            }
                      

            bool result = _atcSrv.SaveAudioTCDetails(model.AudioTC_VM);

            string resultMsg = "Audio TC data saved successfully.";

            if (!result)
            { 
                resultMsg = "Audio TC saving failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Text Info for QC with Id {0} and Rev No {1} was updated.",
                                                 model.AudioTC_VM.Qcnum,
                                                model.AudioTC_VM.subQcnum),
                                                Constants.ActivityType.UpdatedAudioTC);

                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });

        }


     
        public ActionResult IndividualSpecsDetails(int qcnum, int revnum)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;

            HomeVM model = new HomeVM();
            model.IndividualSpecs_VM = _isSrv.GetIndividualSpecsDetails(qcnum, revnum);
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            model.ClosedCapsList = LookUpsService.GetCloseCap();
            model.ChannelPhaseList = LookUpsService.GetChPhase();

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Individual Specs QC [Id: {0}]; Rev No; {1} was viewed",
                                             qcnum,
                                            revnum),
                                        Constants.ActivityType.IndividualSpecsViwed);

            /*******************************************************************************************/

            return PartialView("_Individual", model);
        }

        [HttpPost]
        public ActionResult SaveIndividualSpecsDetails(HomeVM model)
        {
            bool result = _isSrv.SaveIndividualSpecsDetails(model.IndividualSpecs_VM);

            string resultMsg = "Individual specs data saved successfully.";

            if (!result) 
            { 
                resultMsg = "Individual specs saving failed !"; 
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Individual specs for QC with Id {0} and Rev No {1} was updated.",
                                                 model.IndividualSpecs_VM.Qcnum,
                                                model.IndividualSpecs_VM.subQcnum),
                                                Constants.ActivityType.UpdatedIndividualSpecs);

                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });
        }


        /// <summary>
        /// It's now called MEASUREMENTS
        /// </summary>
        /// <param name="qcnum"></param>
        /// <param name="revnum"></param>
        /// <returns></returns>
        public ActionResult OverallSpecsDetails(int qcnum, int revnum)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;

            HomeVM model = new HomeVM();
            model.OverallSpecs_VM = _oasSrv.GetOverallSpecsDetails(qcnum, revnum);
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            model.VideoCodecList = LookUpsService.GetVideoCodec();
            model.VideoBitDepthList = LookUpsService.GetVideoBitDepth();
            model.BitRateModeList = LookUpsService.GetBitRateMode();
            model.AudioCodecList = LookUpsService.GetAudioCodec();
            model.AudioBitDepthList = LookUpsService.GetAudioBitDepth();
            model.GOPStructureList = LookUpsService.GetGOPStructure();
            model.GamutList = LookUpsService.GetGamut();
            model.ColourEncodingList = LookUpsService.GetColourEncoding();

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Measurements QC [Id: {0}]; Rev No; {1} was viewed.",
                                             qcnum,
                                            revnum),
                                        Constants.ActivityType.MeasurementsViewed);

            /*******************************************************************************************/

            return PartialView("_Overall", model);
        }

        /// <summary>
        /// It's now called MEASUREMENTS
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveOverallSpecsDetails(HomeVM model)
        {

            bool result = _oasSrv.SaveOverallSpecsDetails(model.OverallSpecs_VM);

            /****** Save Banijay Rights Measurments. Split the Save method into Measurements and Specifics *****************************************************************/

            //if(model.ChecklistBanijayRights != null)
            //{
            //    model.ChecklistBanijayRights.IsMeasurements = true;// Should be modified and replace IsFile to FileToSpec across all the checklists
            //    model.ChecklistBanijayRights.IsFile = model.ChecklistBanijayRights.FileToSpec;
            //    bool result2 = _checklistService.SaveChecklistBanijayRights(model.ChecklistBanijayRights);
            //}


            string resultMsg = "Measurements saved successfully.";

            if (!result)
            {
                resultMsg = "Measurements saving failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Measurements for QC with Id {0} and Rev No {1} was updated.",
                                                 model.OverallSpecs_VM.Qcnum,
                                                model.OverallSpecs_VM.subQcnum),
                                                Constants.ActivityType.UpdatedMeasurements);

                /*******************************************************************************************/

            }

            return Json(new { success = result, msg = resultMsg });
        }


        public ActionResult ESIMeasurements(int qcnum, int revnum)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            var customerDetails = _clientService.GetClientDetails(qcnum, revnum);
            var customerId = customerDetails.CustID;

            HomeVM model = new HomeVM();
            //model.OverallSpecs_VM = _oasSrv.GetOverallSpecsDetails(qcnum, revnum);  // Not required anymore
            model.ChecklistBanijayRights = _checklistService.GetChecklistBanijayRights(qcnum, revnum, customerId);
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            model.VideoCodecList = LookUpsService.GetVideoCodec();
            model.VideoBitDepthList = LookUpsService.GetVideoBitDepth();
            model.BitRateModeList = LookUpsService.GetBitRateMode();
            model.AudioCodecList = LookUpsService.GetAudioCodec();
            model.AudioBitDepthList = LookUpsService.GetAudioBitDepth();
            model.GOPStructureList = LookUpsService.GetGOPStructure();
            model.GamutList = LookUpsService.GetGamut();
            model.ColourEncodingList = LookUpsService.GetColourEncoding();
            model.YesNoList = LookUpsService.GetYesNo();
            model.YesNoNAList = LookUpsService.GetYesNoNA();

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Measurements QC [Id: {0}]; Rev No; {1} was viewed.",
                                             qcnum,
                                            revnum),
                                        Constants.ActivityType.MeasurementsViewed);

            /*******************************************************************************************/
            return PartialView("_ESIMeasurements", model);
        }

        [HttpPost]
        public ActionResult SaveESIMeasurements(HomeVM model)
        {
                        
            model.ChecklistBanijayRights.IsMeasurements = true;// Should be modified and replace IsFile to FileToSpec across all the checklists
            model.ChecklistBanijayRights.IsFile = model.ChecklistBanijayRights.FileToSpec;
            bool result = _checklistService.SaveChecklistBanijayRights(model.ChecklistBanijayRights);
            
            string resultMsg = "Measurements saved successfully.";

            if (!result)
            {
                resultMsg = "Measurements saving failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Measurements for QC with Id {0} and Rev No {1} was updated.",
                                                 model.OverallSpecs_VM.Qcnum,
                                                model.OverallSpecs_VM.subQcnum),
                                                Constants.ActivityType.UpdatedMeasurements);

                /*******************************************************************************************/

            }

            return Json(new { success = result, msg = resultMsg });
        }



        

        //[HttpPost]
        //public ActionResult SaveMeasurementsESI(HomeVM model)
        //{
        //    bool result = _oasSrv.SaveOverallSpecsDetails(model.OverallSpecs_VM);

        //    string resultMsg = "Measurements saved successfully.";

        //    if (!result)
        //    {
        //        resultMsg = "Measurements saving failed !";
        //    }
        //    else
        //    {
        //        /****************Log User Activity******************************************************/

        //        WebSystemUtility.LogUserActivity(
        //                                    string.Format(
        //                                        "Measurements for QC with Id {0} and Rev No {1} was updated.",
        //                                         model.OverallSpecs_VM.Qcnum,
        //                                        model.OverallSpecs_VM.subQcnum),
        //                                        Constants.ActivityType.UpdatedMeasurements);

        //        /*******************************************************************************************/

        //    }

        //    return Json(new { success = result, msg = resultMsg });
        //}


        


       
        public ActionResult FinalDetails(int qcnum, int revnum)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;

            HomeVM model = new HomeVM();
            model.Final_VM = _fSrv.GetFinalDetails(qcnum, revnum);
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            model.EvalStatusList = LookUpsService.GetEvalStatus();
            model.FinalGradesList = LookUpsService.GetFinalGrades(model.Final_VM.GradingScale);
            model.YesNoList = LookUpsService.GetYesNo();

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Final QC [Id: {0}]; Rev No; {1} was viewed.",
                                             qcnum,
                                            revnum),
                                        Constants.ActivityType.FinalViewed);

            /*******************************************************************************************/

            return PartialView("_Final", model);
        }

        [HttpPost]
        public ActionResult ProcessUploadedImage(HttpPostedFileBase file)
        {
            try
            {
                // for (int i = 0; i < Request.Files.Count; i++)
                // {
                //HttpPostedFileBase file = Request.Files[i]; //Uploaded file
                //Use the following properties to get file's name, size and MIMEType
                int fileSize = file.ContentLength;
                string fileName = file.FileName;
                string mimeType = file.ContentType;
                System.IO.Stream fileContent = file.InputStream;
                //To save file, use SaveAs method
                var imagePath = Server.MapPath("~/UploadedImages/") + fileName;
                file.SaveAs(imagePath);
                //  }

                //request.Url.Scheme gives output as https/http 
                //while request.Url.Authority give us Domain name
                var baseUrl = Request.Url.Scheme + "://" + Request.Url.Authority;
                var imageUrl = baseUrl + "/UploadedImages/" + fileName;   //
                return Json(imageUrl);
            }
            catch(Exception ex)
            {
                WebSystemUtility.LogUserActivity(
                                        ex.Message,
                                        Constants.ActivityType.FinalViewed);
                return null;
            }

          
        }


        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SaveFinalDetails(HomeVM model)
        {
            bool result = _fSrv.SaveFinalDetails(model.Final_VM);

            string resultMsg = "Final data saved successfully.";

            if (!result)
            {
                resultMsg = "Final data saving failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Final details for QC with Id {0} and Rev No {1} was updated.",
                                                 model.Final_VM.Qcnum,
                                                model.Final_VM.subQcnum),
                                                Constants.ActivityType.UpdatedFinal);

                /*******************************************************************************************/
            }


            return Json(new { success = result, msg = resultMsg });
        }


      
        public ActionResult LogDetails(int qcnum, int revnum, int? timeid)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;

            HomeVM model = new HomeVM();
            model.Log_VM = _logSrv.GetLogDetails(qcnum, revnum);
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            model.QCTypeList = LookUpsService.GetQCType();
            model.ScrtList = LookUpsService.GetScrt();
            model.FinalGradesList = LookUpsService.GetFinalGrades(model.Log_VM.GradingScale);

            var qcType = _headSrv.GetHeaderDetails(qcnum, revnum).QCType;

            model.QCType = qcType;

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                           $"Log QC [Id: {qcnum}]; Rev No; {revnum} was viewed.",
                                            Constants.ActivityType.LogViewed);

            /*******************************************************************************************/


            if (timeid.HasValue)
            {
                model.Log_VM.CurrentQCTimes = model.Log_VM.QCTimes.FirstOrDefault(i => i.TimeID == timeid.Value);
            }
            else
            {
                model.Log_VM.CurrentQCTimes = new QCTime();
            }

            return PartialView("_Log", model);
        }

        [HttpPost]
        public ActionResult PopulateLogItemDetails(int qcnum, int revnum, int timeid)
        {
           var logVM = _logSrv.GetLogDetails(qcnum, revnum);
           var qcTimes = logVM.QCTimes.FirstOrDefault(i => i.TimeID == timeid);

            if(qcTimes != null && !string.IsNullOrWhiteSpace(qcTimes.Action))
            {
                var oldChar =  @" / " ;
                var newChar =  @"," ;
                qcTimes.Action = qcTimes.Action.Replace(oldChar, newChar).Trim();
            }

            return Json(qcTimes, JsonRequestBehavior.AllowGet);

        }



        [HttpPost]
        public ActionResult SaveLogDetails(HomeVM model, string sectors)
        {

            //if (!model.Log_VM.CurrentQCTimes.ItemNum.HasValue)
            //{
            //    return Json(new { success = false, msg = "Please add an item number and continue... " });
           // }

            //if (string.IsNullOrWhiteSpace(model.Log_VM.CurrentQCTimes?.TC))
            //{
            //    return Json(new { success = false, msg = "Please add a timecode and continue... " });
            //}

            //if (string.IsNullOrWhiteSpace(model.Log_VM.CurrentQCTimes?.Note))
            //{
            //    return Json(new { success = false, msg = "Please add a fault description and continue..." });
            //}


            if (!string.IsNullOrWhiteSpace(sectors))
            {
                char[] trimChars =  { '/' };
                sectors = sectors.Trim().TrimEnd(trimChars);
                model.Log_VM.CurrentQCTimes.Action = sectors;
            }
            

            bool result = _logSrv.SaveLogDetails(model.Log_VM);

            string resultMsg = "Log data saved successfully.";

            if (!result)
            { 
                resultMsg = "Log data saving failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Log details for QC with Id {0} and Rev No {1} was updated.",
                                                 model.Log_VM.Qcnum,
                                                model.Log_VM.subQcnum),
                                                Constants.ActivityType.UpdatedLog);

                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });
        }

        [HttpPost]
        public ActionResult DeleteLogDetails(HomeVM model)
        {

            bool result = _logSrv.DeleteLogDetails(model.Log_VM);

            string resultMsg = "Log data deleted successfully.";

            if (!result)
            {
                resultMsg = "Log data deletion failed !";
            }
            else
            {

                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Log details for QC with Id {0} and Rev No {1} was deleted.",
                                                 model.Log_VM.Qcnum,
                                                model.Log_VM.subQcnum),
                                                Constants.ActivityType.DeletedLog);

                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });
        }


        [HttpPost]
        public ActionResult SetLogTCOffset(LogVM model)
        {
            bool result = true;
            string resultMsg = "Log data saved successfully.";

            TCTransformService _tcSrv = new TCTransformService(model.SourceFPS);

            if(model.CurrentQCTimes == null)
            {

                resultMsg = "Please select the start timecode";
                return Json(new { success = false, msg = resultMsg });
            }

            int startTC = _tcSrv.TimecodeToFramesNumber(model.CurrentQCTimes.TC);

            List<QCTime> tcToUpdate = new List<QCTime>();

            foreach(var item in model.QCTimes)
            {
                if(startTC <= _tcSrv.TimecodeToFramesNumber(item.TC))
                {
                    QCTime newTC = item;
                    newTC.TC = _tcSrv.AddTimecodes(item.TC, model.TCOffset);

                    tcToUpdate.Add(newTC);
                }
                
            }

            result = _logSrv.LogTCOffsetUpdate(model.Qcnum, model.subQcnum, tcToUpdate);

            if (!result)
            { 
                resultMsg = "Log data saving failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Log details for QC with Id {0} and Rev No {1} was deleted.",
                                                 model.Qcnum,
                                                model.subQcnum),
                                                Constants.ActivityType.AppliedTimecodeOffset);

                /*******************************************************************************************/


            }


            return Json(new { success = result, msg = resultMsg });
        }

      
        public ActionResult CopyQC(string wonum, int? qcnum, int? revnum)
        {
            revnum = 1;


            if (string.IsNullOrWhiteSpace(wonum) && !qcnum.HasValue)
            {
                return Json(new { success = true, msg = "No QC copied. Please supply Work Order number and QC number and continue...", woNum = string.Empty }, JsonRequestBehavior.AllowGet);
            }

            if (!string.IsNullOrWhiteSpace(wonum) && !qcnum.HasValue)
            {
                return Json(new { success = true, msg = "No QC copied. Please supply QC number and continue...", woNum = string.Empty }, JsonRequestBehavior.AllowGet);
            }

            //if (string.IsNullOrWhiteSpace(wonum) && qcnum.HasValue)
            //{
            //    return Json(new { success = true, msg = "No QC copied. Please supply Work Order number and continue...", woNum = string.Empty }, JsonRequestBehavior.AllowGet);
            //}


            if (string.IsNullOrWhiteSpace(wonum) && qcnum.HasValue)
            {
                wonum = _headSrv.GetHeaderDetails(qcnum.Value, revnum.Value).QcWONumber;
            }

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                            $"Copy QC with Id {qcnum.Value} and Rev No {revnum.Value} was copied.",
                                            Constants.ActivityType.CopyQCViewed);

            /*******************************************************************************************/

            var copyQC = new CopyQCVM
            {
                 JobNumber = wonum,
                 QCNumber = qcnum,
                 RevNumber = revnum
            };


            //return PartialView("_CopyQC", new Tuple<string, int, int>(wonum, qcnum.Value, revnum.Value));
            return PartialView("_CopyQC", copyQC);

        }

        [HttpPost]
        public ActionResult SaveCopyQC(string wonum, int qcnum, int revnum)
        {
            string resultMsg = "Copy QC saved successfully.";
            var result = false;
            revnum = 1;
            var qcUserId = GetUserId();

            if (!string.IsNullOrWhiteSpace(wonum))
            {
                result = _qcRSrv.CopyQCReport(wonum, qcnum, revnum, qcUserId);
                
            }
            else
            {
                return Json(
                    new {
                        success = true,
                        msg = "No QC copied. Please supply Work Order number and continue...",
                        woNum = string.Empty },
                    JsonRequestBehavior.AllowGet);
            }
            

            if (!result)
            {
                resultMsg = "Copy QC saving failed !"; 
            }
            else
            {

                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "QC with Job number {0}, Id {1} and Rev No {2} was copied.",
                                                 wonum,
                                                 qcnum,
                                                 revnum),
                                                Constants.ActivityType.CopiedQC);

                /*******************************************************************************************/
            }

            return Json(
                new { 
                    success = result, 
                    msg = resultMsg, woNum = wonum },
                JsonRequestBehavior.AllowGet);
        }

        private int? GetUserId()
        {

            WindowsIdentity userIdentity = (WindowsIdentity)HttpContext.User.Identity;
            UserAccount usr = UserAccountService.GetUserAccount(userIdentity.Name);

            if (usr != null)
            {
                return usr.qcUserId;

            }

            return null;
        }

        //[HttpPost]
        //public ActionResult CopyQC(string wonum, int? qcnum, int? revnum)
        //{
        //    revnum = 1;

        //    if (Session["QCNumber"] != null && !qcnum.HasValue)
        //    {
        //        qcnum = (int)Session["QCNumber"];
        //    }

        //    if (string.IsNullOrWhiteSpace(wonum) && !qcnum.HasValue)
        //    {
        //        return Json(new { success = false, msg = "No QC copied. Please suppply Work Order number and QC number and continue...", woNum = string.Empty });
        //    }

        //    if (!string.IsNullOrWhiteSpace(wonum) && !qcnum.HasValue)
        //    {
        //        return Json(new { success = false, msg = "No QC copied. Please suppply QC number and continue...", woNum = string.Empty });
        //    }

        //    if (string.IsNullOrWhiteSpace(wonum) && qcnum.HasValue)
        //    {
        //        return Json(new { success = false, msg = "No QC copied. Please suppply Work Order and continue...", woNum = string.Empty });
        //    }


        //    if (string.IsNullOrWhiteSpace(wonum) && qcnum.HasValue)
        //    {
        //        wonum = _headSrv.GetHeaderDetails(qcnum.Value, revnum.Value).QcWONumber ;
        //    }

        //    var result = false;
        //    string resultMsg = "Copy QC saved successfully.";

        //    if (!string.IsNullOrWhiteSpace(wonum) && qcnum.HasValue)
        //    {
        //        result = _qcRSrv.CopyQCReport(wonum, qcnum.Value, revnum.Value);
        //    }


        //    if (!result)
        //    {
        //        resultMsg = "Copy QC saving failed !";
        //    }
        //    else
        //    {

        //        /****************Log User Activity******************************************************/

        //        WebSystemUtility.LogUserActivity(
        //                                    string.Format(
        //                                        "QC with Job number {0}, Id {1} and Rev No {2} was copied.",
        //                                         wonum,
        //                                         qcnum,
        //                                         revnum),
        //                                        Constants.ActivityType.CopiedQC);

        //        /*******************************************************************************************/
        //    }

        //    return Json(new { success = result, msg = resultMsg, woNum = wonum });
        //}


        public ActionResult  Checklist(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            var customerDetails = _clientService.GetClientDetails(qcnum, revnum);
            var customerName = customerDetails.CustName;
            var customerId = customerDetails.CustID;
            var checklistPartial = "_NoChecklist";

            Session["QCNumber"] = qcnum;
            
            /******************* Disney **********************************************************************/

            if (customerName.ToLower().Contains("disney"))
            {
                checklistPartial = "_ChecklistDisney";
                model.ChecklistDisney = _checklistService.GetChecklistDisney(qcnum, revnum, customerId);
            }

            /******************* Lionsgate ****************************************************/

            else if (customerName.ToLower().Contains("lionsgate")
                || customerName.ToLower().Contains("lions gate"))
            {
                checklistPartial = "_ChecklistLionsGate";
                model.ChecklistLionsGate = _checklistService.GetChecklistLionsGate(qcnum, revnum, customerId);
                                                                                                 }

            /******************* Warner Bros. ****************************************************/

            else if (customerName.ToLower().Contains("warner"))
            {
                checklistPartial = "_ChecklistWarner";
                model.ChecklistWarner = _checklistService.GetChecklistWarner(qcnum, revnum, customerId);
            }

            /******************* Wild Bunch ****************************************************/

            else if (customerName.ToLower().Contains("wild bunch")
                || (customerName.ToLower().Contains("versatile"))
                || (customerName.ToLower().Contains("elle driver")))
            {
                checklistPartial = "_ChecklistWildBunch";
                model.ChecklistWildBunch = _checklistService.GetChecklistWildBunch(qcnum, revnum, customerId);
            }

            /******************* Banijay Rights ****************************************************/

            //else if (customerName.ToLower().Contains("banijay")
            //    || (customerName.ToLower().Contains("endemol")))
            //{
            //    checklistPartial = "_ChecklistBanijayRights";
            //    model.ChecklistBanijayRights = _checklistService.GetChecklistBanijayRights(qcnum, revnum, customerId);
            //}

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                             $"Checklist with Id {qcnum} and " +
                                             $"Rev No {revnum} for customer {customerName}" +
                                             $" was viewed.",
                                            Constants.ActivityType.ChecklistViewed);

            /*******************************************************************************************/

            return PartialView(checklistPartial, model);
        }

       [HttpPost]
        public ActionResult SaveChecklist(HomeVM model)
        {
            string resultMsg = "Checklist saved successfully.";
            var notSelected = new List<string>();
            Type t ;
            bool result = false;
            int qcnum = 0; 
            int revnum = 0;

            /*************** Disney ***********************************/
            if (model.ChecklistDisney != null)
            {
                qcnum = model.ChecklistDisney.Qcnum;
                revnum = model.ChecklistDisney.subQcnum;
                t = typeof(ChecklistDisney);
                result = SaveChecklistDisney(model, notSelected, t );
            }

            /*************** Lionsgate ***********************************/
            else if (model.ChecklistLionsGate != null)
            {
                qcnum = model.ChecklistLionsGate.Qcnum;
                revnum = model.ChecklistLionsGate.subQcnum;
                t = typeof(ChecklistLionsGate);
                result = SaveChecklistLionsgate(model, notSelected, t);
            }

            /*************** Warner Bros. ***********************************/
            else if (model.ChecklistWarner != null)
            {
                qcnum = model.ChecklistWarner.Qcnum;
                revnum = model.ChecklistWarner.subQcnum;
                t = typeof(ChecklistWarner);
                result = SaveChecklistWarner(model, notSelected, t);

            }

            /*************** Wild Bunch ***********************************/
            else if (model.ChecklistWildBunch != null)
            {
                qcnum = model.ChecklistWildBunch.Qcnum;
                revnum = model.ChecklistWildBunch.subQcnum;
                t = typeof(ChecklistWildBunch);
                result = SaveChecklistWildBunch(model, notSelected, t);
            }

            /*************** Banijay Rights ***********************************/
            //else if (model.ChecklistBanijayRights != null)
            //{
            //    qcnum = model.ChecklistBanijayRights.Qcnum;
            //    revnum = model.ChecklistBanijayRights.subQcnum;
            //    t = typeof(ChecklistBanijayRights);
            //    result = SaveChecklistBanijahRights(model, notSelected, t);
            //}

            /**********************************************/


            if (!result)
            {
                resultMsg = "Checklist saving failed !";
            }
            else
            {

                /****************Log User Activity******************************************************/
                IClient client = _clientService.GetClientDetails(qcnum, revnum);

                WebSystemUtility.LogUserActivity(
                                                $"Checklist with QCNum {qcnum} and Rev No {revnum} for customer {client.CustName} was saved.",
                                                Constants.ActivityType.SaveChecklist);

                /*******************************************************************************************/
            }

            return Json(
                new { success = result, 
                    msg = resultMsg }
                );
        }

        private bool SaveChecklistDisney(HomeVM model, List<string> notSelected, Type t )
        {

            object value ;

            foreach (var prop in t.GetProperties())
            {
                if (model.ChecklistDisney.ProgrammeTextlessElementsPresent == false)
                {
                    model.ChecklistDisney.ProgrammeTextlessGaps1Or2s = false;
                    model.ChecklistDisney.ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot = false;
                    model.ChecklistDisney.ProgrammeFullTextlessCoversForTextedShotsPresent = false;
                    model.ChecklistDisney.ProgrammeBlackBetweenProgrammeAndTextlessElements = false;
                }


                value = prop.GetValue(model.ChecklistDisney);

                if (value == null && prop.Name != "CustName")
                {
                    notSelected.Add(prop.Name);
                }

            }

            if (!notSelected.Any())
            {
                model.ChecklistDisney.ChecklistCompleted = true;
            }

            return _checklistService.SaveChecklistDisney(model.ChecklistDisney);
        
        }

        private bool SaveChecklistLionsgate(HomeVM model, List<string> notSelected, Type t)
        {
             object value;

            foreach (var prop in t.GetProperties())
            {
                value = prop.GetValue(model.ChecklistLionsGate);

                if (value == null && prop.Name != "CustName")
                {
                    notSelected.Add(prop.Name);
                }

            }

            if (!notSelected.Any())
            {
                model.ChecklistLionsGate.ChecklistCompleted = true;
            }

            return _checklistService.SaveChecklistLionsGate(model.ChecklistLionsGate);

            
        }

        private bool SaveChecklistWarner(HomeVM model, List<string> notSelected, Type t)
        {
           
            object value;
           
            foreach (var prop in t.GetProperties())
            {
                value = prop.GetValue(model.ChecklistWarner);

                if (value == null && prop.Name != "CustName")
                {
                    notSelected.Add(prop.Name);
                }

            }

            if (!notSelected.Any())
            {
                model.ChecklistWarner.ChecklistCompleted = true;
            }

            return _checklistService.SaveChecklistWarner(model.ChecklistWarner);

        }

        private bool SaveChecklistWildBunch(HomeVM model, List<string> notSelected, Type t)
        {
             object value;

            foreach (var prop in t.GetProperties())
            {
                value = prop.GetValue(model.ChecklistWildBunch);

                if (value == null && prop.Name != "CustName")
                {
                    notSelected.Add(prop.Name);
                }

            }

            if (!notSelected.Any())
            {
                model.ChecklistWildBunch.ChecklistCompleted = true;
            }

           return _checklistService.SaveChecklistWildBunch(model.ChecklistWildBunch);


        }

        private bool SaveChecklistBanijahRights(HomeVM model, List<string> notSelected, Type t)
        {

            object value;

            // Should be modified and replace IsFile to FileToSpec across all the checklists
            model.ChecklistBanijayRights.IsFile = model.ChecklistBanijayRights.FileToSpec;

            foreach (var prop in t.GetProperties())
            {
                value = prop.GetValue(model.ChecklistBanijayRights);

                if (value == null && prop.Name != "CustName")
                {
                    notSelected.Add(prop.Name);
                }

            }

            if (!notSelected.Any())
            {
                model.ChecklistBanijayRights.ChecklistCompleted = true;
            }



            return _checklistService.SaveChecklistBanijayRights(model.ChecklistBanijayRights);

        }

        public ActionResult ClientSpecs(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            model.Specifications = new List<string>();
           // model.Header_VM = _headSrv.GetHeaderDetails(qcnum, revnum);
            var customerName = _clientService.GetClientDetails(qcnum, revnum).CustName; //model.Header_VM.CustName;
            var specs = "NoSpecs.html";
            FileInfo[] clientSpecFiles = null;

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                            $"Client specs for QC with  Id {0} and Rev No {1} for customer {customerName} was viewed.",
                                            Constants.ActivityType.ClientSpecsViewed);

            /*********************** Disney ************************************************************/

            if (customerName.ToLower().Contains("disney"))
            {
                customerName = "Disney";
                clientSpecFiles = GetClientSpecFiles(customerName); 
            }
            
            /*********************** Warner Bros. ************************************************************/
            else if (customerName.ToLower().Contains("warner"))
            {
                customerName = "Warner";
                clientSpecFiles = GetClientSpecFiles(customerName);
            }

            /*********************** Lionsgate ************************************************************/
            else if (customerName.ToLower().Contains("lionsgate")
                || (customerName.ToLower().Contains("lions gate")))
            {
                customerName = "Lionsgate";
                clientSpecFiles = GetClientSpecFiles(customerName);
            }

            /*********************** Wild Bunch ************************************************************/
            else if (customerName.ToLower().Contains("wild bunch")
                || (customerName.ToLower().Contains("versatile"))
                || (customerName.ToLower().Contains("elle driver")))
            {
                customerName = "WildBunch";
                clientSpecFiles = GetClientSpecFiles(customerName);
            }

            /*********************** Banijay Rights ************************************************************/
            else if (customerName.ToLower().Contains("banijay")
                || customerName.ToLower().Contains("endemol"))
            {
                customerName = "BanijayRights";
                clientSpecFiles = GetClientSpecFiles(customerName);
            }

            /*********************** DPP Eyeball ************************************************************/
            else if (customerName.ToLower().Contains("dpp eyeball"))
            {
                customerName = "DPPEyeball";
                clientSpecFiles = GetClientSpecFiles(customerName);
            }


            if (clientSpecFiles != null && clientSpecFiles.Any())
            {
                foreach(var clientSpecFile in clientSpecFiles)
                {
                    model.Specifications.Add(customerName  + "/" + clientSpecFile.Name);
                }
            }
            else
            {
                model.Specifications.Add(specs);
            }
                       

            return PartialView("_ClientSpecifications", model);
        }

        private FileInfo[] GetClientSpecFiles(string customerName)
        {
            var specsLocation = Server.MapPath("~/Specifications/" + customerName);
            DirectoryInfo clientSpecsDir = new DirectoryInfo(specsLocation);
            //return clientSpecsDir.GetFiles().Where(
            //f => f.Name.ToLower().Contains(customerName))
            ///.OrderByDescending(f => f.LastWriteTime).ToArray(); // retruns just the latest spec
            return clientSpecsDir.GetFiles().ToArray();  // returns all the specs
        }

        public ActionResult ESISpecifics(int qcnum, int revnum)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;

            var customerDetails = _clientService.GetClientDetails(qcnum, revnum);
            var customerId = customerDetails.CustID;

            HomeVM model = new HomeVM();
            model.ESISpecificsVM = _esiSpecificsService.GetESISpecifics(qcnum, revnum) as ESISpecifics;
            model.ChecklistBanijayRights = _checklistService.GetChecklistBanijayRights(qcnum, revnum, customerId);

            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            model.YesNoList = LookUpsService.GetYesNo();
            model.YesNoNAList = LookUpsService.GetYesNoNA();
            model.YesNoNotAllList = LookUpsService.GetYesNoNotAll();
            model.SeamlessOrPartedList = LookUpsService.GetSeamlessOrParted();

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "ESI Specifics for QC with  Id {0} and Rev No {1} was viewed.",
                                             qcnum,
                                             revnum),
                                             Constants.ActivityType.ESISpecificsViewed);

            /*******************************************************************************************/

            //Type t = typeof(ESISpecifics);

            //foreach (var prop in t.GetProperties())
            //{
            //    var value = prop.GetValue(model.ESISpecificsVM);

            //    if (value != null)
            //    {
            //        if (value.ToString() == "Y")
            //        {
            //            value = "Yes";
            //            prop.SetValue(model.ESISpecificsVM, value);
            //        }
            //        else if (value.ToString() == "N")
            //        {
            //            value = "No";
            //            prop.SetValue(model.ESISpecificsVM, value);
            //        }
            //    }

                
            //}

            return PartialView("_ESISpecifics", model);
        }

        [HttpPost]
        public ActionResult SaveESISpecifics(HomeVM model)
        {
            bool result1 = _esiSpecificsService.SaveESISpecifics(model.ESISpecificsVM);
            model.ChecklistBanijayRights.IsMeasurements = false;
            bool result2 = _checklistService.SaveChecklistBanijayRights(model.ChecklistBanijayRights);
            var result = (result1 && result2);
            string resultMsg = "ESI Specifics saved successfully.";
           
            if (!result)
            {
                resultMsg = "ESI Specifics saving failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "ESI Specifics for QC with Id {0} and Rev No {1} was updated.",
                                                 model.ESISpecificsVM.Qcnum,
                                                model.ESISpecificsVM.subQcnum),
                                                Constants.ActivityType.UpdateESISpecifics);

                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });

        }

       
        public ActionResult ESIFinal(int qcnum, int revnum)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;

            HomeVM model = new HomeVM();
            model.ESIFinalVM = _esiFinalService.GetESIFinal(qcnum, revnum) as ESIFinal;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            model.EvalStatusList = LookUpsService.GetEvalStatus();
            model.PassOrFailList = LookUpsService.GetPassOrFail();

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "ESI Final for QC with Id {0} and Rev No {1}.",
                                            qcnum,
                                            qcnum),
                                            Constants.ActivityType.ESIFinalViewed);

            /*******************************************************************************************/


            return PartialView("_ESIFinal", model);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SaveESIFinal(HomeVM model)
        {
            bool result = _esiFinalService.SaveESIFinal(model.ESIFinalVM);

            string resultMsg = "ESI Final saved successfully.";

            if (!result)
            {
                resultMsg = "ESI Final saving failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "ESI Final for QC with Id {0} and Rev No {1} was updated.",
                                                 model.ESIFinalVM.Qcnum,
                                                model.ESIFinalVM.subQcnum),
                                                Constants.ActivityType.UpdateESIFinal);

                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });

        }

        #region DPP Eyeballs


        #endregion

        [HttpPost]
        public ActionResult CalculateTCOffset(int qcnum, int revnum, string oldProgstartTC, string newProgStartTC, string timecodeType)
        {
            string resultMsg = "Timecode offset calculated successfully.";
            var timecodeOffsetResult = CalculateTimecodeOffset(qcnum, revnum, oldProgstartTC, newProgStartTC, timecodeType);
            var timecodeOffset = timecodeOffsetResult.Item1;
            var result = timecodeOffsetResult.Item2;

            if (!result)
            {
                resultMsg = "Failed to calculate timecode offset.";
            }
            else
            {

                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "TC offset with  Id {0} and Rev No {1} was calculated.",
                                                  qcnum,
                                                 revnum),
                                                Constants.ActivityType.CalculatedTimecodeOffset);

                /*******************************************************************************************/
            }
                        
            return Json(new { success = result, msg = resultMsg, timecodeOffsset = timecodeOffset });
        }

        private Tuple<string, bool> CalculateTimecodeOffset(int qcnum, int revnum, string oldProgstartTC, string newProgStartTC, string timecodeType)
        {
            var timecodeOffset = string.Empty;
            var result = true;

            var tcType = TimecodeUtil.TimecodeType._24;  //default

            if (!string.IsNullOrWhiteSpace(timecodeType))
            {
                if (timecodeType.Contains("23"))
                {
                    tcType = TimecodeUtil.TimecodeType._23_976;
                }
                else if (timecodeType.Contains("25"))
                {
                    tcType = TimecodeUtil.TimecodeType._25;
                }
            }

            var oldTCToFrames = TimecodeUtil.TimecodeToFrames(oldProgstartTC, tcType);
            var newTCToFrames = TimecodeUtil.TimecodeToFrames(newProgStartTC, tcType);
            char[] delimiter = { ':' };
            string[] aNewTimecode = newProgStartTC.Trim().Split(delimiter);
            var framesAdded = 0;
            var frameSubtracted = 0;
           
            var hours = Convert.ToInt32(aNewTimecode[0]);
            //var minutes = Convert.ToInt32(aTimecode[1]);
            //var seconds = Convert.ToInt32(aTimecode[2]);
            //var frames = Convert.ToInt32(aTimecode[3]);

            try
            {
                if (hours == 0)
                {
                    framesAdded = newTCToFrames;
                    timecodeOffset = TimecodeUtil.FramesToTimecode(framesAdded, tcType);
                }
                else
                {
                    if (oldTCToFrames > newTCToFrames)
                    {
                        frameSubtracted = oldTCToFrames - newTCToFrames;
                    }
                    else
                    {
                        frameSubtracted = newTCToFrames - oldTCToFrames;
                    }

                    timecodeOffset = TimecodeUtil.FramesToTimecode(frameSubtracted, tcType);

                }

                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "TC offset with  Id {0} and Rev No {1} was calculated.",
                                                  qcnum,
                                                 revnum),
                                                Constants.ActivityType.CalculatedTimecodeOffset);

                /*******************************************************************************************/
            }
            catch
            {
                result = false;

            }


            return new Tuple<string, bool>(timecodeOffset, result);

        }

        [HttpPost]
        public ActionResult ApplyTCOffset(int qcnum, int revnum, string oldProgstartTC, string newProgStartTC, string timecodeType)
        {
            string resultMsg = "Timecode offset saved successfully.";
            var timecodeOffsetResult = CalculateTimecodeOffset(qcnum, revnum, oldProgstartTC, newProgStartTC, timecodeType);
            var timecodeOffset = timecodeOffsetResult.Item1;
            var result = timecodeOffsetResult.Item2;

            try
            {
              
                var tcType = TimecodeUtil.TimecodeType._24;  //default

                if (!string.IsNullOrWhiteSpace(timecodeType))
                {
                    if (timecodeType.Contains("23"))
                    {
                        tcType = TimecodeUtil.TimecodeType._23_976;
                    }
                    else if (timecodeType.Contains("25"))
                    {
                        tcType = TimecodeUtil.TimecodeType._25;
                    }
                }

                char[] delimiter = { ':' };
                string[] aNewTimecode = newProgStartTC.Trim().Split(delimiter);
                var hours = Convert.ToInt32(aNewTimecode[0]);

                var oldTCStartToFrames = TimecodeUtil.TimecodeToFrames(oldProgstartTC, tcType);
                var newTCStartToFrames = TimecodeUtil.TimecodeToFrames(newProgStartTC, tcType);
                var TCOffetFrames = TimecodeUtil.TimecodeToFrames(timecodeOffset, tcType);

                //Update
                // Layout
                // Text Info
                // Log

                var textInfoVM = _tiSrv.GetTextInfoDetails(qcnum, revnum);
                var layoutVM  = _tlSrv.GetTapeLayoutTCDetails(qcnum, revnum);
                var logVM = _logSrv.GetLogDetails(qcnum, revnum);
                var newFrame = 0;

                if (hours == 0) // Starts e.g 00:00:01:00
                {
                    //Add TC offset and subract the old TC
                    // Layout
                    if (layoutVM?.Timecodes != null && layoutVM.Timecodes.Any())
                    {
                        foreach (var timecode in layoutVM.Timecodes)
                        {
                            var currentTCFrames = TimecodeUtil.TimecodeToFrames(timecode.Time_Code, tcType);

                            if (string.IsNullOrWhiteSpace(timecode.Time_Code))
                            {
                                timecode.Time_Code = timecodeOffset;
                            }
                            else
                            {
                                newFrame = currentTCFrames + TCOffetFrames - oldTCStartToFrames;

                                if (newFrame > 0)
                                {
                                    if (oldTCStartToFrames <= currentTCFrames)
                                    {
                                        timecode.Time_Code = TimecodeUtil.FramesToTimecode(newFrame, tcType);
                                    }
                                    else
                                    {
                                        timecode.Time_Code = "00:00:00:00";
                                    }
                                }
                                else
                                {
                                    timecode.Time_Code = "00:00:00:00";
                                }
                            }

                        }

                        /// Update Batch Layout TC 
                        result = _tlSrv.BatchUpdateTapeLayoutTCDetails(layoutVM);

                    }

                    // Text Info
                    if (textInfoVM?.Timecodes != null && textInfoVM.Timecodes.Any())
                    {
                        foreach (var timecode in textInfoVM.Timecodes)
                        {
                            var currentTCInFrames = TimecodeUtil.TimecodeToFrames(timecode.TimecodeIn, tcType);
                            var currentTCOutFrames = TimecodeUtil.TimecodeToFrames(timecode.TimecodeOut, tcType);

                            if (string.IsNullOrWhiteSpace(timecode.TimecodeIn))
                            {
                                timecode.TimecodeIn = timecodeOffset;
                            }
                            else
                            {
                                newFrame = currentTCInFrames + TCOffetFrames - oldTCStartToFrames;

                                if (newFrame > 0)
                                {
                                    if (oldTCStartToFrames <= currentTCInFrames)
                                    {
                                        timecode.TimecodeIn = TimecodeUtil.FramesToTimecode(newFrame, tcType);
                                    }
                                    else
                                    {
                                        timecode.TimecodeIn = "00:00:00:00";
                                    }
                                }
                                else
                                {
                                    timecode.TimecodeIn = "00:00:00:00";
                                }
                            }

                            if (string.IsNullOrWhiteSpace(timecode.TimecodeOut))
                            {
                                timecode.TimecodeOut = timecodeOffset;
                            }
                            else
                            {
                                newFrame = currentTCOutFrames + TCOffetFrames - oldTCStartToFrames;

                                if (newFrame > 0)
                                {
                                    if (oldTCStartToFrames <= currentTCOutFrames)
                                    {
                                        timecode.TimecodeOut = TimecodeUtil.FramesToTimecode(newFrame, tcType);
                                    }
                                    else
                                    {
                                        timecode.TimecodeOut = "00:00:00:00";
                                    }

                                }
                                else
                                {
                                    timecode.TimecodeOut = "00:00:00:00";
                                }
                            }

                        }

                        /// Update Text Info TC 
                        result = _tiSrv.BatchUpdateTextInfoDetails(textInfoVM);
                    }


                    //Log
                    if (logVM?.QCTimes != null && logVM.QCTimes.Any())
                    {
                        foreach (var timecode in logVM.QCTimes)
                        {
                            var currentTCFrames = TimecodeUtil.TimecodeToFrames(timecode.TC, tcType);

                            if (string.IsNullOrWhiteSpace(timecode.TC))
                            {
                                timecode.TC = timecodeOffset;
                            }
                            else
                            {
                                newFrame = currentTCFrames + TimecodeUtil.TimecodeToFrames(timecodeOffset, tcType) - oldTCStartToFrames;

                                if (newFrame > 0)
                                {
                                    if (oldTCStartToFrames <= currentTCFrames)
                                    {
                                        timecode.TC = TimecodeUtil.FramesToTimecode(newFrame, tcType);
                                    }
                                    else
                                    {
                                        timecode.TC = "00:00:00:00";
                                    }

                                }
                                else
                                {
                                    timecode.TC = "00:00:00:00";
                                }
                            }

                        }

                        /// Update Log TC 
                        result = _logSrv.BatchUpdateLogDetails(logVM);

                    }
                }
                else
                {
                    // Layout
                    if (oldTCStartToFrames > newTCStartToFrames) //Going backward in frames
                    {
                        //Current TC subtract Offset
                        if (layoutVM?.Timecodes != null && layoutVM.Timecodes.Any())
                        {
                            foreach (var timecode in layoutVM.Timecodes)
                            {

                                var currentTCFrames = TimecodeUtil.TimecodeToFrames(timecode.Time_Code, tcType);

                                if (string.IsNullOrWhiteSpace(timecode.Time_Code))
                                {
                                    timecode.Time_Code = timecodeOffset;
                                }
                                else
                                {
                                                                     
                                    newFrame = currentTCFrames - TCOffetFrames ;
                                                                       

                                    if (newFrame > 0)
                                    {
                                        if (newTCStartToFrames <= currentTCFrames)
                                        {
                                            timecode.Time_Code = TimecodeUtil.FramesToTimecode(newFrame, tcType);
                                        }
                                        else
                                        {
                                            timecode.Time_Code = "00:00:00:00";
                                        }

                                    }
                                    else
                                    {
                                        timecode.Time_Code = "00:00:00:00";
                                    }
                                }

                            }

                            /// Update batch Layout TC 
                            result = _tlSrv.BatchUpdateTapeLayoutTCDetails(layoutVM);

                        }


                    }
                    else  //going forward in frames
                    {
                        //currrent TC + Offet
                        if (layoutVM?.Timecodes != null && layoutVM.Timecodes.Any())
                        {
                            foreach (var timecode in layoutVM.Timecodes)
                            {
                                var currentTCFrames = TimecodeUtil.TimecodeToFrames(timecode.Time_Code, tcType);

                                if (string.IsNullOrWhiteSpace(timecode.Time_Code))
                                {
                                    timecode.Time_Code = timecodeOffset;
                                }
                                else
                                {

                                    newFrame = currentTCFrames + TCOffetFrames;

                                    if (newFrame > 0)
                                    {
                                        if (newTCStartToFrames >= currentTCFrames)
                                        {
                                            timecode.Time_Code = TimecodeUtil.FramesToTimecode(newFrame, tcType);
                                        }
                                        else
                                        {
                                            timecode.Time_Code = "00:00:00:00";
                                        }

                                    }
                                    else
                                    {
                                        timecode.Time_Code = "00:00:00:00";
                                    }
                                }

                            }

                            /// Update Layout TC 
                            result = _tlSrv.BatchUpdateTapeLayoutTCDetails(layoutVM);

                        }


                    }


                    //Text Info
                    if (oldTCStartToFrames > newTCStartToFrames)  //Going backward in frames
                    {
                        //Current TC subtract Offset
                        if (textInfoVM?.Timecodes != null && textInfoVM.Timecodes.Any())
                        {
                            foreach (var timecode in textInfoVM.Timecodes)
                            {
                                var currentTCInFrames = TimecodeUtil.TimecodeToFrames(timecode.TimecodeIn, tcType);
                                var currentTCOutFrames = TimecodeUtil.TimecodeToFrames(timecode.TimecodeOut, tcType);

                                if (string.IsNullOrWhiteSpace(timecode.TimecodeIn))
                                {
                                    timecode.TimecodeIn = timecodeOffset;
                                }
                                else
                                {
                                    newFrame = currentTCInFrames - TCOffetFrames;

                                    if (newFrame > 0)
                                    {
                                        if (newTCStartToFrames <= currentTCInFrames)
                                        {
                                            timecode.TimecodeIn = TimecodeUtil.FramesToTimecode(newFrame, tcType);
                                        }
                                        else
                                        {
                                            timecode.TimecodeIn = "00:00:00:00";
                                        }
                                    }
                                    else
                                    {
                                        timecode.TimecodeIn = "00:00:00:00";
                                    }
                                }

                                if (string.IsNullOrWhiteSpace(timecode.TimecodeOut))
                                {
                                    timecode.TimecodeOut = timecodeOffset;
                                }
                                else
                                {
                                    newFrame = currentTCOutFrames - TCOffetFrames;

                                    if (newFrame > 0)
                                    {
                                        if (newTCStartToFrames <= currentTCOutFrames)
                                        {
                                            timecode.TimecodeOut = TimecodeUtil.FramesToTimecode(newFrame, tcType);
                                        }
                                        else
                                        {
                                            timecode.TimecodeOut = "00:00:00:00";
                                        }

                                    }
                                    else
                                    {
                                        timecode.TimecodeOut = "00:00:00:00";
                                    }
                                }

                            }

                            /// Update Text Info TC 
                            result = _tiSrv.BatchUpdateTextInfoDetails(textInfoVM);
                        }

                    }
                    else   //going forward in frames
                    {
                        //currrent TC + Offet
                        if (textInfoVM?.Timecodes != null && textInfoVM.Timecodes.Any())
                        {
                            foreach (var timecode in textInfoVM.Timecodes)
                            {
                                var currentTCInFrames = TimecodeUtil.TimecodeToFrames(timecode.TimecodeIn, tcType);
                                var currentTCOutFrames = TimecodeUtil.TimecodeToFrames(timecode.TimecodeOut, tcType);

                                if (string.IsNullOrWhiteSpace(timecode.TimecodeIn))
                                {
                                    timecode.TimecodeIn = timecodeOffset;
                                }
                                else
                                {
                                    newFrame = currentTCInFrames + TCOffetFrames;

                                    if (newFrame > 0)
                                    {
                                        if (newTCStartToFrames >= currentTCInFrames)
                                        {
                                            timecode.TimecodeIn = TimecodeUtil.FramesToTimecode(newFrame, tcType);
                                        }
                                        else
                                        {
                                            timecode.TimecodeIn = "00:00:00:00";
                                        }
                                    }
                                    else
                                    {
                                        timecode.TimecodeIn = "00:00:00:00";
                                    }
                                }

                                if (string.IsNullOrWhiteSpace(timecode.TimecodeOut))
                                {
                                    timecode.TimecodeOut = timecodeOffset;
                                }
                                else
                                {
                                    newFrame = currentTCOutFrames + TCOffetFrames;

                                    if (newFrame > 0)
                                    {
                                        if (newTCStartToFrames >= currentTCOutFrames)
                                        {
                                            timecode.TimecodeOut = TimecodeUtil.FramesToTimecode(newFrame, tcType);
                                        }
                                        else
                                        {
                                            timecode.TimecodeOut = "00:00:00:00";
                                        }

                                    }
                                    else
                                    {
                                        timecode.TimecodeOut = "00:00:00:00";
                                    }
                                }

                            }

                            /// Update Text Info TC 
                            result = _tiSrv.BatchUpdateTextInfoDetails(textInfoVM);
                        }

                    }

                    //Log
                    if (oldTCStartToFrames > newTCStartToFrames)  //Going backward in frames
                    {
                        //Current TC subtract Offset
                        if (logVM?.QCTimes != null && logVM.QCTimes.Any())
                        {
                            foreach (var timecode in logVM.QCTimes)
                            {
                                var currentTCFrames = TimecodeUtil.TimecodeToFrames(timecode.TC, tcType);

                                if (string.IsNullOrWhiteSpace(timecode.TC))
                                {
                                    timecode.TC = timecodeOffset;
                                }
                                else
                                {
                                    newFrame = currentTCFrames - TCOffetFrames;

                                    if (newFrame > 0)
                                    {
                                        if (newTCStartToFrames <= currentTCFrames)
                                        {
                                            timecode.TC = TimecodeUtil.FramesToTimecode(newFrame, tcType);
                                        }
                                        else
                                        {
                                            timecode.TC = "00:00:00:00";
                                        }

                                    }
                                    else
                                    {
                                        timecode.TC = "00:00:00:00";
                                    }
                                }

                            }

                            /// Update Log TC 
                            result = _logSrv.BatchUpdateLogDetails(logVM);

                        }



                    }
                    else   //going forward in frames
                    {
                        //currrent TC + Offet
                        if (logVM?.QCTimes != null && logVM.QCTimes.Any())
                        {
                            foreach (var timecode in logVM.QCTimes)
                            {
                                var currentTCFrames = TimecodeUtil.TimecodeToFrames(timecode.TC, tcType);

                                if (string.IsNullOrWhiteSpace(timecode.TC))
                                {
                                    timecode.TC = timecodeOffset;
                                }
                                else
                                {
                                    newFrame = currentTCFrames + TCOffetFrames;

                                    if (newFrame > 0)
                                    {
                                        if (newTCStartToFrames >= currentTCFrames)
                                        {
                                            timecode.TC = TimecodeUtil.FramesToTimecode(newFrame, tcType);
                                        }
                                        else
                                        {
                                            timecode.TC = "00:00:00:00";
                                        }

                                    }
                                    else
                                    {
                                        timecode.TC = "00:00:00:00";
                                    }
                                }

                            }

                            /// Update Log TC 
                            result = _logSrv.BatchUpdateLogDetails(logVM);

                        }

                    }


                }  //End Main if (hours == 0)




            }  //End Try
            catch
            {


            }   ///End Catch


            if (!result)
            {
                resultMsg = "Failed to save timecode offset.";
            }
            else
            {

                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "TC offset with  Id {0} and Rev No {1} was saved.",
                                                  qcnum,
                                                 revnum),
                                                Constants.ActivityType.AppliedTimecodeOffset);

                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });

        }

       
    }
}