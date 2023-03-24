using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Collections.Generic;
using System.Security.Principal;
using Deluxe.QCReport.Common;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Services;
using Deluxe.QCReport.Common.Utilities;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Web.Utilities;
using Deluxe.QCReport.Web.Models;
using Deluxe.QCReport.Web.Fillter;

namespace Deluxe.QCReport.Web.Controllers
{
    [CustomAuthorize]
    public class BanijayRightsController : BaseController
    {
        private readonly ILoggerService _loggerService = null;
        private readonly IBanijahRightsProgrammeDetailsService _progDetailsService = null;
        private readonly IBanijahRightsProgrammeLayoutService _progLayoutService = null;
        private readonly IBanijayRightsTextDetailsService _textDetailsService = null;
        private readonly ILookupsService _lookupsService = null;
        private readonly IESIFinalService _esiFinalService = null;
        private readonly LogService _logSrv = null;
        AudioTCService _atcSrv = new AudioTCService();
        OverallSpecsService _oasSrv = new OverallSpecsService();
        HeaderService _headSrv = new HeaderService();

        public BanijayRightsController()
        {
            var conn = ConfigManager.DatabaseConnection;

            var loggerRepository = new LoggerRepository(conn);
            _loggerService = new LoggerService(loggerRepository);

            _progDetailsService = new BanijahRightsProgrammeDetailsService(
                                  new BanijahRightsProgrammeDetailsRepository(
                                      conn,
                                      _loggerService));

            _lookupsService = new LookUpsService(
                                 new LookUpsRepository(
                                     conn,
                                     _loggerService));



            _progLayoutService = new BanijahRightsProgrammeLayoutService(
                                  new BanijahRightsProgrammeLayoutRepository(
                                      conn,
                                      _loggerService));

            _textDetailsService = new BanijayRightsTextDetailsService(
                                 new BanijayRightsTextDetailsRepository(
                                     conn,
                                     _loggerService));

            _logSrv = new LogService(
                               new LogRepository(
                                   conn,
                                   _loggerService));

            _esiFinalService = new ESIFinalService(
                                 new ESIFinalRepository(
                                     conn,
                                     _loggerService));


        }

        // GET: BanijayRights
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult GetProgrammeDetails(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            model.BanijahRightsProgrammeDetails = _progDetailsService.GetProgrammeDetails(qcnum, revnum) as BanijahRightsProgrammeDetails;
            model.YesNoNAList = LookUpsService.GetYesNoNA();
            model.BanijayRightsAspectRatioList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsAspectRatio).ToList();
            model.BanijayRightsCaptionSafeList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsCaptionSafe).ToList();
            model.BanijayRightsCodecList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsCodec).ToList();
            model.BanijayRightsFileWrapperList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsFileWrapper).ToList();
            model.BanijayRightsFrameRateList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsFrameRate).ToList();
            model.BanijayRightsInShowAndAfterProgList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsInShowAndAfterProg).ToList();
            model.BanijayRightsSDROrHDRList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsSDROrHDR).ToList();
            model.BanijayRightsTimecodeList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsTimecode).ToList();
            model.BanijayRightsTypeOfHDRList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsTypeOfHDR).ToList();
            model.BanijayRightsVideoLinesList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsVideoLines).ToList();

            /****************Log User Activity******************************************************/
            WebSystemUtility.LogUserActivity(
                                            $"Banijay Rights Programme  Details for QC # {qcnum} and Rev # {revnum} was viewed.",
                                            Constants.ActivityType.BanijayRightsProgrammeDetailsViewed);
            /*******************************************************************************************/


            return PartialView("_ProgrammeDetails", model);
        }

        [HttpPost]
        public ActionResult SaveProgrammeDetails(HomeVM model)
        {

            bool result = _progDetailsService.SaveProgrammeDetails(model.BanijahRightsProgrammeDetails);
            string resultMsg = "Banijay Rights Programme Details saved successfully.";

            if (!result)
            {
                resultMsg = "Banijay Rights Programme Details failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                          $"Banijay Rights Programme Details for QC # {model.BanijahRightsProgrammeDetails.QCNum}" +
                                          $" and Rev # {model.BanijahRightsProgrammeDetails.SubQCNum} was updated.",
                                          Constants.ActivityType.BanijayRightsProgrammeDetailsUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }

        /// <summary>
        /// Use the code in Job Controller
        /// </summary>
        /// <param name="qcnum"></param>
        /// <param name="revnum"></param>
        /// <returns></returns>
        public ActionResult GetAudio(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
           
            model.AudioTC_VM = _atcSrv.GetAudioTCDetails(qcnum, revnum);

            model.ChannelCountList = LookUpsService.GetChannelCount();
            model.BanijayRightsBitRateList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsBitRate).ToList(); // new
            model.BanijayRightsTrackContentList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsTrackContent).ToList(); // new 
           // model.BanijayRightsLanguageList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsLanguage).ToList();
            model.LanguageList = LookUpsService.GetLanguage();
            model.BanijayRightsPositionList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsPosition).ToList(); // Description
            model.BanijayRightsToneList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsTone).ToList();


           


            /****************Log User Activity******************************************************/
            WebSystemUtility.LogUserActivity(
                                            $"Banijay Rights Audio for QC # {qcnum} and Rev # {revnum} was viewed.",
                                            Constants.ActivityType.BanijayRightsAudioViewed);
            /*******************************************************************************************/


            return PartialView("_Audio", model);
        }

        [HttpPost]
        public ActionResult AudioTCChannelCountChanged(HomeVM model)
        {

            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            model.ChannelCountList = LookUpsService.GetChannelCount();
            model.BanijayRightsBitRateList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsBitRate).ToList(); // new
            model.BanijayRightsTrackContentList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsTrackContent).ToList(); // new 
            //model.BanijayRightsLanguageList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsLanguage).ToList();
            model.LanguageList = LookUpsService.GetLanguage();
            model.BanijayRightsPositionList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsPosition).ToList(); // Description
            model.BanijayRightsToneList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsTone).ToList();



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


            return PartialView("_Audio", model);
        }

        [HttpPost]
        public ActionResult SaveAudio(HomeVM model, string modelAsJSONString)
        {

            var audioChannelEnumerable = modelAsJSONString.Replace(@"""", "").Split(',').Where(c => c.Contains("AudioTC_VM.ChannelsList"));
            var audioChannelArrayList = audioChannelEnumerable.ToArray();


            if (model.AudioTC_VM?.ChannelsList == null)
            {

                int rowCnt = Convert.ToInt32(model.AudioTC_VM.ChannelCount.Replace("Channels", "").Trim());
                var channelList = new List<AudioTCChannel>();
                int i = 0;
                var channelsFields = 9; 
                var channelsFieldNo = 0;

                //Fields
                var channelNo = 0;
                var trackContent = string.Empty;
                var description = string.Empty;
                var LKFS = string.Empty;
                var tone = string.Empty;
                var language = string.Empty;
                var average = string.Empty;
                var peak = string.Empty;
                var truePeak = string.Empty;

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
                    else if (audioChanneItem.Contains("[" + i + "].TrackContent"))
                    {
                        trackContent = audioChannelArray[1];
                        channelsFieldNo++;
                    }

                    if (channelsFieldNo == channelsFields)
                    {
                        AudioTCChannel channel = new AudioTCChannel()
                        {
                            ChannelNo = channelNo,
                            Description = description,
                            LKFS = LKFS,
                            Tone = tone,
                            Language = language,
                            Average = average,
                            Peak = peak,
                            TruePeak = truePeak,
                            TrackContent = trackContent
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
                                                "Audio for QC with Id {0} and Rev No {1} was updated.",
                                                 model.AudioTC_VM?.Qcnum,
                                                model.AudioTC_VM?.subQcnum),
                                                Constants.ActivityType.UpdatedAudioTC);

                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });

        }

        public ActionResult GetVideo(int qcnum, int revnum)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;

            HomeVM model = new HomeVM();
            model.OverallSpecs_VM = _oasSrv.GetOverallSpecsDetails(qcnum, revnum);
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            model.PassedOrFailedList = LookUpsService.GetPassedOrFailed();
            model.DecodeCheckList = LookUpsService.GetDecodeCheck();
            model.ColourEncodingList = LookUpsService.GetColourEncoding();
            model.ColourSpaceList = LookUpsService.GetColourSpace();


            /****************Log User Activity******************************************************/
            WebSystemUtility.LogUserActivity(
                                            $"Banijay Rights Video for QC # {qcnum} and Rev # {revnum} was viewed.",
                                            Constants.ActivityType.BanijayRightsVideoViewed);
            /*******************************************************************************************/


            return PartialView("_Video", model);
        }

        [HttpPost]
        public ActionResult SaveVideo(HomeVM model)
        {

            bool result = _oasSrv.SaveOverallSpecsDetails(model.OverallSpecs_VM);

            string resultMsg = "Banijay Rights Video saved successfully.";

            if (!result)
            {
                resultMsg = "Banijay Rights Video failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                          $"Banijay Rights Programme Details for QC # {model.OverallSpecs_VM.Qcnum}" +
                                          $" and Rev # {model.OverallSpecs_VM.subQcnum} was updated.",
                                          Constants.ActivityType.BanijayRightsVideoUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }


        public ActionResult GetProgrammeLayout(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            model.BanijahRightsProgrammeLayout = _progLayoutService.GetProgrammeLayout(qcnum, revnum) as BanijahRightsProgrammeLayout;
            model.BanijahRightsTapeLayouts = model.BanijahRightsProgrammeLayout.TapeLayouts.ToList();
            model.BanijahRightsTapeLayout = new BanijahRightsTapeLayout() {  QCNum = qcnum, SubQCNum = revnum };
            model.CountAsShowList = LookUpsService.GetCountAsShow();
            model.YesNoNAList = LookUpsService.GetYesNoNA();
            model.NextWeekOrTrailerPresentList = LookUpsService.GetNextWeekOrTrailerPresent();


            /****************Log User Activity******************************************************/
            WebSystemUtility.LogUserActivity(
                                            $"Banijay Rights Programme Layout for QC # {qcnum} and Rev # {revnum} was viewed.",
                                            Constants.ActivityType.BanijayRightsProgrammeLayoutViewed);
            /*******************************************************************************************/

            return PartialView("_ProgrammeLayout", model);
        }

        [HttpPost]
        public ActionResult SaveProgrammeLayout(HomeVM model)
        {      
            
            bool result = _progLayoutService.SaveProgrammeLayout(model.BanijahRightsProgrammeLayout);
            string resultMsg = "Banijay Rights Programme Layout saved successfully.";

            if (!result)
            {
                resultMsg = "Banijay Rights Programme Layout failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                          $"Banijay Rights Programme Layout for QC # {model.BanijahRightsProgrammeLayout.QCNum}" +
                                          $" and Rev # {model.BanijahRightsProgrammeLayout.SubQCNum} was updated.",
                                          Constants.ActivityType.BanijayRightsProgrammeLayoutUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }

        [HttpPost]
        public ActionResult SaveTapeLayout(HomeVM model)
        {

            bool result = _progLayoutService.SaveTapeLayout(model.BanijahRightsTapeLayout);
            string resultMsg = "Banijay Rights Tape Layout saved successfully.";

            if (!result)
            {
                resultMsg = "Banijay Rights Tape Layout failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                        $"Banijay Rights Programme Layout for QC # {model.BanijahRightsProgrammeLayout.QCNum}" +
                                        $" and Rev # {model.BanijahRightsProgrammeLayout.SubQCNum} was updated.",
                                        Constants.ActivityType.BanijayRightsTapeLayoutUpdated);

                /*******************************************************************************************/
                    
            }


            return Json(new { success = result, msg = resultMsg });
        }

        [HttpPost]
        public ActionResult LoadTapeLayouts(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            model.BanijahRightsProgrammeLayout = _progLayoutService.GetProgrammeLayout(qcnum, revnum) as BanijahRightsProgrammeLayout;
            model.BanijahRightsTapeLayouts = model.BanijahRightsProgrammeLayout.TapeLayouts.ToList();

            return PartialView("_TapeLayoutGrid", model);
        }

        [HttpPost]
        public ActionResult PopulateTapeLayout(int id)
        {
            HomeVM model = new HomeVM();
            var tapeLayout = _progLayoutService.GetBanijahRightsTapeLayoutById(id) as BanijahRightsTapeLayout;
            return Json(tapeLayout, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public ActionResult DeleteTapeLayout(int id)
        {

            bool result = _progLayoutService.DeleteBanijahRightsTapeLayout(id);

            string resultMsg = "Banijah Rights tape layout deleted successfully.";

            if (!result)
            {
                resultMsg = "Banijah Rights tape layout deletion failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                                $"Banijay Rights tape layout TC details for Id {id}  was deleted.",
                                                 Constants.ActivityType.BanijayRightsTapeLayoutDeleted);

                /*******************************************************************************************/
            }


            return Json(new { success = result, msg = resultMsg });
        }


        public ActionResult GetTextDetails(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            model.BanijayRightsTextDetails = _textDetailsService.Get(qcnum, revnum) as BanijayRightsTextDetails;
            model.YesNoNAList = LookUpsService.GetYesNoNA();
            model.YesNoNAList2 = LookUpsService.GetYesNoNotAll2();
            model.BanijayRightsInShowAndAfterProgList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsInShowAndAfterProg).ToList();


            /****************Log User Activity******************************************************/
            WebSystemUtility.LogUserActivity(
                                            $"Banijay Rights Text Details for QC # {qcnum} and Rev # {revnum} was viewed.",
                                            Constants.ActivityType.BanijayRightsTextDetailsViewed);
            /*******************************************************************************************/


            return PartialView("_TextDetails", model);
        }

        [HttpPost]
        public ActionResult SaveTextDetails(HomeVM model)
        {

            bool result = _textDetailsService.Save(model.BanijayRightsTextDetails);
            string resultMsg = "Banijay Rights Text Details saved successfully.";

            if (!result)
            {
                resultMsg = "Banijay Rights Text Details failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                          $"Banijay Rights Programme Details for QC # {model.BanijayRightsTextDetails.QCNum}" +
                                          $" and Rev # {model.BanijayRightsTextDetails.SubQCNum} was updated.",
                                          Constants.ActivityType.BanijayRightsTextDetailsUpdated);

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
            model.FinalGradesList = LookUpsService.GetSeverityGrades();
            model.QCStatusList = LookUpsService.GetQCStatus();
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

            return PartialView("_Faults", model);
        }

        [HttpPost]
        public ActionResult PopulateLogItemDetails(int qcnum, int revnum, int timeid)
        {
            var logVM = _logSrv.GetLogDetails(qcnum, revnum);
            var qcTimes = logVM.QCTimes.FirstOrDefault(i => i.TimeID == timeid);

            if (qcTimes != null && !string.IsNullOrWhiteSpace(qcTimes.Action))
            {
                var oldChar = @" / ";
                var newChar = @",";
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
                char[] trimChars = { '/' };
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
        public ActionResult SaveFaultsStatus(HomeVM model)
        {
            bool result = _logSrv.SaveFaultsStatus(model.Log_VM);

            string resultMsg = "QC status saved successfully.";

            if (!result)
            {
                resultMsg = "QC Status saving failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "Status for QC with Id {0} and Rev No {1} was updated.",
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


        public ActionResult GetNotes(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            model.ESIFinalVM = _esiFinalService.GetBanijayRightsNotes(qcnum, revnum) as ESIFinal;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            model.QCActionTypeList = LookUpsService.GetQCActionType();
            model.OperatorList = LookUpsService.GetOperator();


            /****************Log User Activity******************************************************/
            WebSystemUtility.LogUserActivity(
                                            $"Banijay Rights Notes for QC # {qcnum} and Rev # {revnum} was viewed.",
                                            Constants.ActivityType.BanijayRightsNotesViewed);
            /*******************************************************************************************/


            return PartialView("_Notes", model);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SaveNotes(HomeVM model)
        {

            bool result = _esiFinalService.SaveBanijayRightsNotes(model.ESIFinalVM);
            string resultMsg = "Banijay Rights Notes saved successfully.";

            if (!result)
            {
                resultMsg = "Banijay Rights Notes failed to save !";
            }
            else
            {
                /***************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                          $"Banijay Rights Programme Details for QC # {model.ESIFinalVM.Qcnum}" +
                                          $" and Rev # {model.ESIFinalVM.subQcnum} was updated.",
                                          Constants.ActivityType.BanijayRightsNotesUpdated);

          /******************************************************************************************/

             }

           return Json(new { success = result, msg = resultMsg });
        }



    }
}