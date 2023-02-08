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
        private readonly ILookupsService _lookupsService = null;
        AudioTCService _atcSrv = new AudioTCService();
        OverallSpecsService _oasSrv = new OverallSpecsService();

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
            model.BanijayRightsLanguageList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsLanguage).ToList();
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
            model.BanijayRightsLanguageList = _lookupsService.GetLookups(StoredProcedure.Lookup.BanijayRightsLanguage).ToList();
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

            bool result = false;
            string resultMsg = "Banijay Rights Programme Layout saved successfully.";

            if (!result)
            {
                resultMsg = "Banijay Rights Programme Layout failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                          $"Banijay Rights Programme Details for QC # {model.BanijahRightsProgrammeDetails.QCNum}" +
                                          $" and Rev # {model.BanijahRightsProgrammeDetails.SubQCNum} was updated.",
                                          Constants.ActivityType.BanijayRightsProgrammeLayoutUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }


        public ActionResult GetTextDetails(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);


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

            bool result = false;
            string resultMsg = "Banijay Rights Text Details saved successfully.";

            if (!result)
            {
                resultMsg = "Banijay Rights Text Details failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                //WebSystemUtility.LogUserActivity(
                //                          $"Banijay Rights Programme Details for QC # {model.}" +
                //                          $" and Rev # {model.} was updated.",
                //                          Constants.ActivityType.BanijayRightsTextDetailsUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }


        public ActionResult GetFaults(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);


            /****************Log User Activity******************************************************/
            WebSystemUtility.LogUserActivity(
                                            $"Banijay Rights Faults for QC # {qcnum} and Rev # {revnum} was viewed.",
                                            Constants.ActivityType.BanijayRightsFaultsViewed);
            /*******************************************************************************************/


            return PartialView("_Faults", model);
        }

        [HttpPost]
        public ActionResult SaveFaults(HomeVM model)
        {

            bool result = false;
            string resultMsg = "Banijay Rights Faults saved successfully.";

            if (!result)
            {
                resultMsg = "Banijay Rights Faults failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                //WebSystemUtility.LogUserActivity(
                //                          $"Banijay Rights Programme Details for QC # {model.}" +
                //                          $" and Rev # {model.} was updated.",
                //                          Constants.ActivityType.BanijayRightsFaultsUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }


        public ActionResult GetNotes(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);


            /****************Log User Activity******************************************************/
            WebSystemUtility.LogUserActivity(
                                            $"Banijay Rights Notes for QC # {qcnum} and Rev # {revnum} was viewed.",
                                            Constants.ActivityType.BanijayRightsNotesViewed);
            /*******************************************************************************************/


            return PartialView("_Notes", model);
        }

        [HttpPost]
        public ActionResult SaveNotes(HomeVM model)
        {

            bool result = false;
            string resultMsg = "Banijay Rights Notes saved successfully.";

            if (!result)
            {
                resultMsg = "Banijay Rights Notes failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                //WebSystemUtility.LogUserActivity(
                //                          $"Banijay Rights Programme Details for QC # {model.}" +
                //                          $" and Rev # {model.} was updated.",
                //                          Constants.ActivityType.BanijayRightsNotesUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }



    }
}