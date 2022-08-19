using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Services;
using Deluxe.QCReport.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;
using Deluxe.QCReport.Common;
using Deluxe.QCReport.Web.Utilities;
using Deluxe.QCReport.Web.Fillter;

namespace Deluxe.QCReport.Web.Controllers3
{
    //[Authorize]
    [CustomAuthorize]
    public class HomeController : Controller
    {
        QCReportService _qcRSrv = new QCReportService();
        HeaderService _headerSrv = new HeaderService();

        [HttpGet]
        public ActionResult Index(string woNumber, int? qcNumber)
        {
            SetViewBag();

            HomeVM model = new HomeVM();
            model.ClientNameList = LookUpsService.GetCustName();

            if(!string.IsNullOrWhiteSpace(woNumber) && qcNumber.HasValue)
            {
                 ViewBag.SearchWONumber = woNumber;
                 ViewBag.SearchQCNumber = qcNumber;
            }

            return View(model);
        }


        [HttpPost]
        public ActionResult Index(HomeVM model)
        {
            SetViewBag();

            model.ClientNameList = LookUpsService.GetCustName();
            model.JobTVVM = _qcRSrv.GetJobTree(model.SearchWONumber, model.SearchQCNumber);

            return View(model);
        }

      

        public ActionResult GetTopNavigation(int qcnum, int revnum, string wonum)
        {
            var header = _headerSrv.GetHeaderDetails(qcnum, revnum);
            SetViewBag();

            /***********TO DO: Include Customer name to toggle between navs for DPP ******************************************************/

            var topNav = new TopSubNavigationVM()
            {
                WONumber = wonum,
                QCNumber = qcnum,
                RevNumber = revnum,
                QCType = header.QCType,
                CustomerName = header.CustName
            };  


            return PartialView("_TopSubNavigation", topNav);
            // return PartialView("_TopSubNavigation", new Tuple<int, int,string, string>(qcnum, revnum, wonum, qcType));
        }


       
        public ActionResult JobDetails(string wonum)
        {
            JobDetailsVM model =  _qcRSrv.GetJobDetails(wonum);
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Job details with WO number '{0}' was viewed.",
                                            wonum),
                                           Constants.ActivityType.JobDetailsViewed);

            /************************************************************************************/


            return PartialView("_JobDetails", model);
        }

       
        public ActionResult QCDetails(string wonum, int qcnum)
        {
            QCDetailsVM model = _qcRSrv.GetQCDetails(wonum, qcnum);
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            ViewBag.SearchWONumber = wonum;
            ViewBag.SearchQCNumber = qcnum;

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "QC details with ID ={0} was viewed.",
                                            qcnum),
                                           Constants.ActivityType.QCDetailsViewed);

            /************************************************************************************/

            return PartialView("_QCDetails", model);
        }

       
        public ActionResult RevDetails(string wonum, int qcnum, int revnum)
        {
            RevDetailsVM model = _qcRSrv.GetRevDetails(wonum, qcnum, revnum);
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "QC details with ID={0} and Rev number={1} was viewed.",
                                            qcnum,
                                            revnum),
                                           Constants.ActivityType.QCDetailsViewed);

            /************************************************************************************/

            return PartialView("_RevDetails", model);
        }

        [HttpPost]
        public ActionResult SaveNewQCReport(NewQCReport model)
        {
            bool result = false;
            string resultMsg = "Job creation failed.";
            
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            UserAccount usr = UserAccountService.GetUserAccount(clientId.Name);
            model.UserId = usr.qcUserId;
            model.QCFullname = usr.FullName;

            Dictionary<int, string> custList = LookUpsService.GetCustName();
            KeyValuePair<int, string> selCustomer = custList.FirstOrDefault(c => c.Value == model.Customer);
            if (selCustomer.Key == 0 && string.IsNullOrEmpty(selCustomer.Value))
            {
                return Json(new { success = false, msg = "Data not saved! Customer name not found." });
            }
            else
            {
                model.CustId = selCustomer.Key;
            }

            if (string.IsNullOrWhiteSpace(model.QCWONumber))
            {
                return Json(new { success = false, msg = "Data not saved! Please supply  Work Order number and continue..." });
            }

            if (string.IsNullOrWhiteSpace(model.QCType))
            {
                return Json(new { success = false, msg = "Data not saved! Please supply QC Type and continue..." });
            }


            if (string.IsNullOrWhiteSpace(model.AssetType))
            {
                return Json(new { success = false, msg = "Data not saved! Please supply Asset Type and continue..." });
            }

            if (model.Qcnum > 0)
            {
                // update QC Report

                if (_qcRSrv.UpdateQCReport(model))
                {
                    result = true;
                    resultMsg = "Job updated successfully.";

                    /****************Log User Activity******************************************************/

                    WebSystemUtility.LogUserActivity(
                                                string.Format(
                                                    "QC updated [Id: {0}]; Rev No: {1}",
                                                     model.Qcnum,
                                                    model.subQcnum),
                                                Constants.ActivityType.UpdatedQC);

                    /*******************************************************************************************/
                }
            }
            else
            {
                // create a new QC Report

                int newQCNum = _qcRSrv.CreateNewQCReport(model);

                if (newQCNum > 0)
                {
                    result = true;
                    resultMsg = "Job created successfully.";

                    /****************Log User Activity******************************************************/

                    WebSystemUtility.LogUserActivity(
                                                string.Format(
                                                    "New QC created [Id: {0}]; Rev No: {1}",
                                                     newQCNum,
                                                    model.subQcnum),
                                                Constants.ActivityType.CreatedNewQC);

                    /*******************************************************************************************/
                }
            }


            return Json(new { success = result, msg = resultMsg, woNum = model.QCWONumber });
        }

        [HttpPost]
        public ActionResult NewEditQCReport(string qcWONo, int? qcNo, int? qcRev)
        {
            NewQCReport model = new NewQCReport();

            if (qcNo.HasValue && qcRev.HasValue)            
            {
                model = _qcRSrv.GetQCReport(qcNo.Value, qcRev.Value);

                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "QC Editor was viewed [Id: {0}]; Rev No: {1}",
                                                 qcNo.Value,
                                                qcRev.Value),
                                            Constants.ActivityType.CreatedNewQC);

                /*******************************************************************************************/

            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "New QC Editor was viewed for WO number '{0}'",
                                                       qcWONo),
                                            Constants.ActivityType.CreatedNewQC);

                /*******************************************************************************************/

            }

            model.QCWONumber = qcWONo;
           
            model.ClientNameList = LookUpsService.GetCustName();

          


            return PartialView("_NewQCReport", model);
        }


        [HttpPost]
        public ActionResult CopyQCReport(string wonum, int qcnum, int revnum)
        {
            return PartialView("_CopyQCReport", new Tuple<string, int, int>(wonum, qcnum, revnum));

        }

        [HttpPost]
        public ActionResult DeleteJob(string jobnum)
        {

            bool result = _qcRSrv.DeleteJob(jobnum);

            string resultMsg = "Job " + jobnum + " deleted successfully.";

            if (!result)
            { 
                resultMsg = "Job " + jobnum + " deletion failed !"; 
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "QC with Job number {0} was deleted.",
                                                jobnum),
                                            Constants.ActivityType.DeletedJob);

                /*******************************************************************************************/
            }

            return Json(new { success = result, msg = resultMsg });
        }

        [HttpPost]
        public ActionResult DeleteQC(int qcnum)
        {

            bool result = _qcRSrv.DeleteQC(qcnum);

            string resultMsg = "QC " + qcnum + " deleted successfully.";

            if (!result) 
            {
                resultMsg = "QC " + qcnum + " deletion failed !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "QC with Id {0} was deleted.",
                                                qcnum),
                                            Constants.ActivityType.DeletedQC);

                /*******************************************************************************************/
            }


            return Json(new { success = result, msg = resultMsg });
        }


        [HttpPost]
        public ActionResult DeleteRev(int qcnum, int revnum)
        {

            bool result = _qcRSrv.DeleteRev(qcnum, revnum);

            string resultMsg = "Revision " + revnum + " QC# " + qcnum + " deleted successfully.";

            if (!result) 
            { 
                resultMsg = "Revision " + revnum + " QC# " + qcnum + " deletion failed !"; 
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                            string.Format(
                                                "QC with Id {0} and Rev No {1} was deleted.",
                                                 qcnum,
                                                revnum),
                                            Constants.ActivityType.DeletedQCRevisionNumber);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }

        private void SetViewBag()
        {
            
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            string vbUsername = clientId.Name;
            int vbSecLevel = 0;


            UserAccount usr = UserAccountService.GetUserAccount(clientId.Name);

            if (usr != null)
            {
                vbUsername = usr.UserName;
                vbSecLevel = usr.SecurityLevel.Value;
            }

            ViewBag.Username = vbUsername;
            ViewBag.SecLevel = vbSecLevel;
            
        }
    }
}