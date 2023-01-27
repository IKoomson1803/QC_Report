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
        private readonly IBNJRProgrammeDetailsService _progDetailsService = null;


        public BanijayRightsController()
        {
            var conn = ConfigManager.DatabaseConnection;

            var loggerRepository = new LoggerRepository(conn);
            _loggerService = new LoggerService(loggerRepository);

            _progDetailsService = new BNJRProgrammeDetailsService(
                                  new BNJRProgrammeDetailsRepository(
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
            model.BNJRProgrammeDetails = _progDetailsService.GetProgrammeDetails(qcnum, revnum) as BNJRProgrammeDetails;
            model.YesNoNAList = LookUpsService.GetYesNoNA();

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

            bool result = _progDetailsService.SaveProgrammeDetails(model.BNJRProgrammeDetails);
            string resultMsg = "Banijay Rights Programme Details saved successfully.";

            if (!result)
            {
                resultMsg = "Banijay Rights Programme Details failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                //WebSystemUtility.LogUserActivity(
                //                          $"Banijay Rights Programme Details for QC # {model.}" +
                //                          $" and Rev # {model.} was updated.",
                //                          Constants.ActivityType.BanijayRightsProgrammeDetailsUpdated);

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


            /****************Log User Activity******************************************************/
            WebSystemUtility.LogUserActivity(
                                            $"Banijay Rights Audio for QC # {qcnum} and Rev # {revnum} was viewed.",
                                            Constants.ActivityType.BanijayRightsAudioViewed);
            /*******************************************************************************************/


            return PartialView("_Audio", model);
        }

        [HttpPost]
        public ActionResult SaveAudio(HomeVM model)
        {

            bool result = false;
            string resultMsg = "Banijay Rights Audio saved successfully.";

            if (!result)
            {
                resultMsg = "Banijay Rights Audio failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                //WebSystemUtility.LogUserActivity(
                //                          $"Banijay Rights Programme Details for QC # {model.}" +
                //                          $" and Rev # {model.} was updated.",
                //                          Constants.ActivityType.BanijayRightsAudioUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }

        public ActionResult GetVideo(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);


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

            bool result = false;
            string resultMsg = "Banijay Rights Video saved successfully.";

            if (!result)
            {
                resultMsg = "Banijay Rights Video failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                //WebSystemUtility.LogUserActivity(
                //                          $"Banijay Rights Programme Details for QC # {model.}" +
                //                          $" and Rev # {model.} was updated.",
                //                          Constants.ActivityType.BanijayRightsVideoUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }


        public ActionResult GetProgrammeLayout(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);


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

                //WebSystemUtility.LogUserActivity(
                //                          $"Banijay Rights Programme Details for QC # {model.}" +
                //                          $" and Rev # {model.} was updated.",
                //                          Constants.ActivityType.BanijayRightsProgrammeLayoutUpdated);

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