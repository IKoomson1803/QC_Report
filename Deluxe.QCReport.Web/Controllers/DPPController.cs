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
    //[Authorize]
    [CustomAuthorize]
    public class DPPController : BaseController
    {
        private readonly ILoggerService _loggerService = null;
        private readonly IDPPService  _dppService = null;

        public DPPController()
        {
            var conn = ConfigManager.DatabaseConnection;

            var loggerRepository = new LoggerRepository(conn);
            _loggerService = new LoggerService(loggerRepository);

            _dppService = new DPPService(
                                  new DPPRepository(
                                      conn,
                                      _loggerService));


        }


        // GET: DPP
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult DPPProgDetails(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            model.DPPProgDetails = _dppService.GetProgDetails(qcnum, revnum) as  DPPProgDetails;

            /****************Log User Activity******************************************************/
            WebSystemUtility.LogUserActivity(
                                            $"DPP Programme  Details for QC # {qcnum} and Rev# {revnum} was viewed.",
                                            Constants.ActivityType.DPPProgDetailsViewed);
            /*******************************************************************************************/


            return PartialView("_DPPProgDetails", model);
        }

        [HttpPost]
        public ActionResult SaveDPPProgDetails(HomeVM model)
        {
            
            bool result = _dppService.SaveProgDetails(model.DPPProgDetails);
            string resultMsg = "DPP Programme Details saved successfully.";

            if (!result)
            {
                resultMsg = "DPP Programme Details failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                          $"DPP Programme Details for QC # {model.DPPProgDetails.QCNum}" +
                                          $" and Rev # {model.DPPProgDetails.SubQCNum} was updated.",
                                          Constants.ActivityType.DPPProgDetailsUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }

        public ActionResult DPPProdDetails(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.DPPProdDetails = _dppService.GetProdDetails(qcnum, revnum) as DPPProdDetails;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                             $"DPP Production Details for QC # {qcnum} and Rev# {revnum} was viewed.",
                                             Constants.ActivityType.DPPProdDetailsViewed);

            /*******************************************************************************************/


            return PartialView("_DPPProdDetails", model);
        }

        [HttpPost]
        public ActionResult SaveDPPProdDetails(HomeVM model)
        {

            bool result = _dppService.SaveProdDetails(model.DPPProdDetails);
            string resultMsg = "DPP Production Details saved successfully.";

            if (!result)
            {
                resultMsg = "DPP Production Details failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                          $"DPP Programme Details for QC # {model.DPPProdDetails.QCNum}" +
                                          $" and Rev # {model.DPPProdDetails.SubQCNum} was updated.",
                                          Constants.ActivityType.DPPProdDetailsUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }

        public ActionResult DPPCkecklist(int qcnum, int revnum)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            HomeVM model = new HomeVM();
            model.ChecklistDPP = _dppService.GetChecklist(qcnum, revnum) as ChecklistDPP;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            Session["QCNumber"] = qcnum;

            if (model.ChecklistDPP == null)
            {
                model.ChecklistDPP = new ChecklistDPP()
                {
                    QCNum = qcnum,
                    SubQCNum = revnum,
                };
            }

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                            $"DPP Checklist for QC # {qcnum} and Rev # {revnum} was viewed.",
                                            Constants.ActivityType.DPPChecklistViewed);

            /*******************************************************************************************/


            return PartialView("_DPPCkecklist", model);
        }

        [HttpPost]
        public ActionResult SaveChecklist(HomeVM model)
        {
            string resultMsg = "DPP Checklist saved successfully.";
            var notSelected = new List<string>();
            Type t = null;
            object value = null;
            bool result = false;
            int qcnum = 0;
            int revnum = 0;
                                  
           if (model.ChecklistDPP != null)
            {
                qcnum = model.ChecklistDPP.QCNum;
                revnum = model.ChecklistDPP.SubQCNum;

                t = typeof(ChecklistDPP);

                foreach (var prop in t.GetProperties())
                {
                    value = prop.GetValue(model.ChecklistDPP);

                    if (value == null)
                    {
                        notSelected.Add(prop.Name);
                    }
                }

                if (!notSelected.Any())
                {
                    model.ChecklistDPP.ChecklistCompleted = true;
                }

                result = _dppService.SaveChecklist(model.ChecklistDPP);
            }
         
            if (!result)
            {
                resultMsg = "DPP Checklist saving failed !";
            }
            else
            {

                /****************Log User Activity******************************************************/
              
                WebSystemUtility.LogUserActivity(
                                                $"DPP Checklist with QCNum {qcnum} and Rev No {revnum} was saved.",
                                                Constants.ActivityType.DPPChecklistUpdated);

                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });
        }



        public ActionResult DPPCommBroadcasters(int qcnum, int revnum)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            HomeVM model = new HomeVM();
            model.DPPCommBroadcasters = _dppService.GetCommBroadcasters(qcnum, revnum) as DPPCommBroadcasters;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            /****************Log User Activity******************************************************/
            WebSystemUtility.LogUserActivity(
                                  $"DPP Commercial Broadcasters Only for QC # {qcnum} and Rev# {revnum} was viewed.",
                                  Constants.ActivityType.DPPCommBroadcastersViewed);

            /*******************************************************************************************/


            return PartialView("_DPPCommBroadcasters", model);
        }

        [HttpPost]
        public ActionResult SaveDPPCommBroadcasters(HomeVM model)
        {

            bool result = _dppService.SaveCommBroadcasters(model.DPPCommBroadcasters);
            string resultMsg = "DPP Commercial Broadcasters Only saved successfully.";

            if (!result)
            {
                resultMsg = "DPP Commercial Broadcasters Only failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                          $"DPP Commercial Broadcasters for QC # {model.DPPCommBroadcasters.QCNum}" +
                                          $" and Rev # {model.DPPCommBroadcasters.SubQCNum} was updated.",
                                          Constants.ActivityType.DPPCommBroadcastersUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }


        public ActionResult DPPProdAndTechLog(int qcnum, int revnum, int? id)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;

            HomeVM model = new HomeVM();
            model.DPPLog = new DPPLog();
            model.DPPLog.QCNum = qcnum;
            model.DPPLog.SubQCNum = revnum;
            model.DPPLogs = _dppService.GetLogs(qcnum, revnum)?.ToList();
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                 $"DPP Production and Technical Warnings for QC # {qcnum} and Rev# {revnum} was viewed.",
                                 Constants.ActivityType.DPPLogViewed);

            /*******************************************************************************************/

            if(model.DPPLogs == null && !model.DPPLogs.Any())
            {
                model.DPPLogs = new List<DPPLog>();
            }

            if (id.HasValue)
            {
                model.DPPLog = model.DPPLogs.FirstOrDefault(i => i.Id == id.Value);
            }


            return PartialView("_DPPProdAndTechLog", model);
        }

        [HttpPost]
        public ActionResult SaveLog(HomeVM model)
        {

            bool result = _dppService.SaveLog(model.DPPLog);
            string resultMsg = "DPP Production and Technical Warnings saved successfully.";

            if (!result)
            {
                resultMsg = "DPP Production and Technical Warnings failed to save!";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                          $"DPP Production and Technical Warnings " +
                                          $" for QC # {model.DPPLog.QCNum} and Rev # {model.DPPLog.SubQCNum} was updated.",
                                          Constants.ActivityType.DPPLogUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }

        [HttpPost]
        public ActionResult DeleteLog(HomeVM model)
        {

            bool result = _dppService.DeleteLog(model.DPPLog.Id);

            string resultMsg = "DPP Log data deleted successfully.";

            if (!result)
            {
                resultMsg = "DPP Log data deletion failed !";
            }
            else
            {

                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                        $"DPP Production and Technical Warnings " +
                                        $" for QC # {model.DPPLog.QCNum} and Rev # {model.DPPLog.SubQCNum} was deleted.",
                                        Constants.ActivityType.DPPLogDeleted);


                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });
        }

       public ActionResult PopulateLogItemDetails(int qcnum, int revnum, int id)
        {
            var logs =  _dppService.GetLogs(qcnum, revnum)?.ToList();
            var logItem = logs.FirstOrDefault(i => i.Id == id);
            return Json(logItem, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DPPProdSignOff(int qcnum, int revnum)
        {
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            HomeVM model = new HomeVM();
            model.DPPProdSignOff = _dppService.GetProdSignOff(qcnum, revnum) as DPPProdSignOff;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                   $"DPP Production sign off as acceptable for transmission for QC # {qcnum} and Rev# {revnum} was viewed.",
                                   Constants.ActivityType.DPPProdSignOffViewed);


            /*******************************************************************************************/


            return PartialView("_DPPProdSignOff", model);
        }

        public ActionResult SaveDPPProdSignOff(HomeVM model)
        {

            bool result = _dppService.SaveProdSignOffs(model.DPPProdSignOff);
            string resultMsg = "DPP Production sign off as acceptable for transmission saved successfully.";

            if (!result)
            {
                resultMsg = "DPP Production sign off as acceptable for transmission failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                          $"DPP Production sign off as acceptable for transmission " +
                                          $" for QC # {model.DPPProdSignOff.QCNum} and Rev # {model.DPPProdSignOff.SubQCNum} was updated.",
                                          Constants.ActivityType.DPPProgDetailsUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }
    }
}