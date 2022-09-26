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
    public class AdvancedSearchController : BaseController
    {
        private readonly IReportService _reportService;
        private readonly ILoggerService _loggerService;
        private const string FILTER_ASSETS = "Filter_Assets";

        public AdvancedSearchController()
        {
            var conn = ConfigManager.DatabaseConnection;

            var loggerRepository = new LoggerRepository(conn);
            _loggerService = new LoggerService(loggerRepository);
            _reportService = new ReportService(new ReportRepository(conn, _loggerService));

         }

        // GET: AdvancedSearch
        public ActionResult Index()
        {
            SetViewBag();
            SearchParamsVM model = new SearchParamsVM();
            model.StatusList = LookUpsService.GetEvalStatus();
            return View(model);
        }

        [HttpPost]
        public ActionResult Index(SearchParamsVM model) 
        {
            bool canSearch = CanSearch(model);

            if (!canSearch)
            {
                return View(model);
            }

            model.StatusList = LookUpsService.GetEvalStatus();

            SetViewBag();

            /********:: Populate Search criteria ***********************************/
            SearchParams searchParams = BuildSearchCriteria(model);

            var result = _reportService.Filter(searchParams);

            Session[FILTER_ASSETS] = Serializer.SerializeFromSingle(
                                                           searchParams);


            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                              $"Search criteria: {Serializer.SerializeFromSingle(searchParams)}",
                              Constants.ActivityType.Search);

            /*******************************************************************************************/
                     
            model.Headers = result?.ToList();

            #region Dump

            //var partialView = RenderPartialViewToString(
            //                   "_SearchGrid",
            //                   model);

            //JsonResult jsonResult = Json(new
            //{
            //    success = true,
            //    msg = "Searched successfully.",
            //    partial = partialView
            //}, JsonRequestBehavior.AllowGet);

            ////JsonResult jsonResult = Json(new
            ////{
            ////    success = true,
            ////    msg = "Searched successfully.",
            ////    partial = PartialView("_SearchGrid", model)
            ////}, JsonRequestBehavior.AllowGet);

            ////  The default is 102400 characters: http://msdn.microsoft.com/en-us/library/system.web.configuration.scriptingjsonserializationsection.maxjsonlength(v=vs.110).aspx
            //jsonResult.MaxJsonLength = int.MaxValue;  //The value of this constant is 2,147,483,647
            //return jsonResult;

            //return PartialView("_SearchGrid", model);
            #endregion

            return View(model);

        }

        [HttpPost]
        public ActionResult Search(SearchParamsVM model)
        {
            bool canSearch = CanSearch(model);

            if (!canSearch)
            {
                return View(model);
            }

            model.StatusList = LookUpsService.GetEvalStatus();

            SetViewBag();

            /********:: Populate Search criteria ***********************************/
            SearchParams searchParams = BuildSearchCriteria(model);

            var result = _reportService.Filter(searchParams);


            Session[FILTER_ASSETS] = Serializer.SerializeFromSingle(
                                                          searchParams);

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                              $"Search criteria: {Serializer.SerializeFromSingle(searchParams)}",
                              Constants.ActivityType.Search);

            /*******************************************************************************************/

            model.Headers = result?.ToList();
                                   
            var partialView = RenderPartialViewToString(
                               "_SearchGrid",
                               model);

            JsonResult jsonResult = Json(new
            {
                success = true,
                msg = "Searched successfully.",
                partial = partialView
            }, JsonRequestBehavior.AllowGet);

            //JsonResult jsonResult = Json(new
            //{
            //    success = true,
            //    msg = "Searched successfully.",
            //    partial = PartialView("_SearchGrid", model)
            //}, JsonRequestBehavior.AllowGet);

            //The default is 102400 characters: http://msdn.microsoft.com/en-us/library/system.web.configuration.scriptingjsonserializationsection.maxjsonlength(v=vs.110).aspx
            jsonResult.MaxJsonLength = int.MaxValue;  //The value of this constant is 2,147,483,647
            return jsonResult;
          

            // return PartialView("_SearchGrid", model);


            //return View(model);

        }


        public ActionResult ResetForm(SearchParamsVM model)
        {
            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                         $"Search criteria was reset: { Serializer.SerializeFromSingle(model)}",
                     Constants.ActivityType.Search);

            /*******************************************************************************************/

            return Json(new { success = true });
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
               
        

        private SearchParams BuildSearchCriteria(SearchParamsVM searchParams)
        {
            SearchParams searchCriteria = new SearchParams()
            {
                Statuses = StringUtil.EnsureIsNull(searchParams.Statuses),
                Filename = StringUtil.EnsureIsNull(searchParams.Filename),
                TapeNumber = StringUtil.EnsureIsNull(searchParams.TapeNumber),
                EpisodeName = StringUtil.EnsureIsNull(searchParams.EpisodeName),
                EpisodeNumber = StringUtil.EnsureIsNull(searchParams.EpisodeNumber),
                QCUser = StringUtil.EnsureIsNull(searchParams.QCUser),
                QCUser2 = StringUtil.EnsureIsNull(searchParams.QCUser2),
                RevisedBy = StringUtil.EnsureIsNull(searchParams.RevisedBy),
                RevisedBy2 = StringUtil.EnsureIsNull(searchParams.RevisedBy2),
                ClientName = StringUtil.EnsureIsNull(searchParams.ClientName),
                Title = StringUtil.EnsureIsNull(searchParams.Title),
            };
         
            if (searchParams.AudioGrade1.HasValue)
            {
                searchCriteria.AudioGrade1 = searchParams.AudioGrade1.Value;
            }

            if (searchParams.AudioGrade2.HasValue)
            {
                searchCriteria.AudioGrade2 = searchParams.AudioGrade2.Value;
            }

            if (searchParams.AudioGrade3.HasValue)
            {
                searchCriteria.AudioGrade3 = searchParams.AudioGrade3.Value;
            }

            if (searchParams.AudioGrade4.HasValue)
            {
                searchCriteria.AudioGrade4 = searchParams.AudioGrade4.Value;
            }

            if (searchParams.AudioGrade5.HasValue)
            {
                searchCriteria.AudioGrade5 = searchParams.AudioGrade5.Value;
            }

            if (searchParams.VideoGrade1.HasValue)
            {
                searchCriteria.VideoGrade1 = searchParams.VideoGrade1.Value;
            }

            if (searchParams.VideoGrade2.HasValue)
            {
                searchCriteria.VideoGrade2 = searchParams.VideoGrade2.Value;
            }

            if (searchParams.VideoGrade3.HasValue)
            {
                searchCriteria.VideoGrade3 = searchParams.VideoGrade3.Value;
            }

            if (searchParams.VideoGrade4.HasValue)
            {
                searchCriteria.VideoGrade4 = searchParams.VideoGrade4.Value;
            }

            if (searchParams.VideoGrade5.HasValue)
            {
                searchCriteria.VideoGrade5 = searchParams.VideoGrade5.Value;
            }

                if (searchParams.OverallGrade1.HasValue)
            {
                searchCriteria.OverallGrade1 = searchParams.OverallGrade1.Value;
            }

            if (searchParams.OverallGrade2.HasValue)
            {
                searchCriteria.OverallGrade2 = searchParams.OverallGrade2.Value;
            }

            if (searchParams.OverallGrade3.HasValue)
            {
                searchCriteria.OverallGrade3 = searchParams.OverallGrade3.Value;
            }

            if (searchParams.OverallGrade4.HasValue)
            {
                searchCriteria.OverallGrade4 = searchParams.OverallGrade4.Value;
            }

            if (searchParams.OverallGrade5.HasValue)
            {
                searchCriteria.OverallGrade5 = searchParams.OverallGrade5.Value;
            }


            /************ QC Dates********************************************/

            DateTime? tempFromDate = DateTimeUtil.ParseStringToDate(
                searchParams.From_Date);

            DateTime? tempToDate = DateTimeUtil.ParseStringToDate(
                searchParams.To_Date);

            DateTimeUtil.SetStartAndEndDatesForSearch(
                ref tempFromDate,
                ref tempToDate);

            searchCriteria.FromDate = tempFromDate;
            searchCriteria.ToDate = tempToDate;


            return searchCriteria;



        }

        private bool CanSearch(SearchParamsVM searchParams)
        {
            bool canSearch = true;

           
            if (string.IsNullOrWhiteSpace(searchParams.Filename)
                     && string.IsNullOrWhiteSpace(searchParams.ClientName)
                     && string.IsNullOrWhiteSpace(searchParams.TapeNumber)
                     && string.IsNullOrWhiteSpace(searchParams.QCUser)
                     && string.IsNullOrWhiteSpace(searchParams.QCUser2)
                     && string.IsNullOrWhiteSpace(searchParams.RevisedBy)
                     && string.IsNullOrWhiteSpace(searchParams.RevisedBy2)
                     && string.IsNullOrWhiteSpace(searchParams.Title)
                     && string.IsNullOrWhiteSpace(searchParams.EpisodeName)
                     && string.IsNullOrWhiteSpace(searchParams.EpisodeNumber)
                     && string.IsNullOrWhiteSpace(searchParams.From_Date)
                     && string.IsNullOrWhiteSpace(searchParams.To_Date)
                     && string.IsNullOrWhiteSpace(searchParams.Statuses)

                     && !searchParams.AudioGrade1.HasValue
                     && !searchParams.AudioGrade2.HasValue
                     && !searchParams.AudioGrade3.HasValue
                     && !searchParams.AudioGrade4.HasValue
                     && !searchParams.AudioGrade5.HasValue

                     && !searchParams.VideoGrade1.HasValue
                     && !searchParams.VideoGrade2.HasValue
                     && !searchParams.VideoGrade3.HasValue
                     && !searchParams.VideoGrade4.HasValue
                     && !searchParams.VideoGrade5.HasValue

                     && !searchParams.OverallGrade1.HasValue
                     && !searchParams.OverallGrade2.HasValue
                     && !searchParams.OverallGrade3.HasValue
                     && !searchParams.OverallGrade4.HasValue
                     && !searchParams.OverallGrade5.HasValue
                 )
            {
                canSearch = false;
            }

            return canSearch;
        }

        public void ExportToExcel(string downloadToken)
        {
            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                           "Search criteria was was exported to excel.",
                     Constants.ActivityType.ExportedToExcel);

            /*******************************************************************************************/


            var list = new List<Header>();
            var reportLst = new List<Header>();
            string excelFilename = "QC_Report";
            string workSheetName = "QC Report";

            if (Session[FILTER_ASSETS] != null)
            {
                var searchParams = Serializer.DeserializeAsSingle<SearchParams>(Session[FILTER_ASSETS].ToString());
                list = _reportService.Filter(searchParams)?.ToList();
             }


            //string[] listMembers = {
            //"Work Order #",
            //"QC #",
            //"Revision #",
            //"Full Name #1",
            //"QC Date #1",
            //"Full Name #2",
            //"QC Date #2",
            //"Revised By #1",
            //"Revised By #2",
            //"Customer",
            //"Title",
            //"Episode Name",
            //"Episode #",
            //"Filename",
            //"Version",
            //"Status"
            //};

            string[] listMembers = {
            nameof(Header.Wonum),
            nameof(Header.Qcnum),
            nameof(Header.subQcnum),
            nameof(Header.FullName),
            nameof(Header.QC_date),
            nameof(Header.FullName2),
            nameof(Header.QC_Date_2),
            nameof(Header.Revised_By),
            nameof(Header.Revised_By_2),
            nameof(Header.CustName),
            nameof(Header.Show),
            nameof(Header.Epis_Name),
            nameof(Header.Epis_no),
            nameof(Header.Filename),
            nameof(Header.Version),
            nameof(Header.Eval_Stat)

            };

            //  CreateExcelFile.CreateExcelDocument<Header>(list, "QC Report.xlsx");

            CreateExcelFile.DownloadToExcel<Header>(list, excelFilename, workSheetName, downloadToken, listMembers);

        }
    }
}