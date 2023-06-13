using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Collections.Generic;
using System.Security.Principal;
using Deluxe.QCReport.Common;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Models.DisneyTWDC;
using Deluxe.QCReport.Common.Services;
using Deluxe.QCReport.Common.Services.DisneyTWDC;
using Deluxe.QCReport.Common.Utilities;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Repositories.DisneyTWDC;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Abstractions.DisneyTWDC;
using Deluxe.QCReport.Web.Utilities;
using Deluxe.QCReport.Web.Models;
using Deluxe.QCReport.Web.Fillter;

namespace Deluxe.QCReport.Web.Controllers
{
    public class DisneyTWDCController : BaseController
    {

        private readonly ILoggerService _loggerService = null;
        private readonly ILookupsService _lookupsService = null;
        private readonly IDisneyTWDCService _disneyTWDCService = null;

        public DisneyTWDCController()
        {
            var conn = ConfigManager.DatabaseConnection;

            var loggerRepository = new LoggerRepository(conn);
            _loggerService = new LoggerService(loggerRepository);
                       
            _lookupsService = new LookUpsService(
                                 new LookUpsRepository(
                                     conn,
                                     _loggerService));


            _disneyTWDCService = new DisneyTWDCService(
                                new DisneyTWDCRepository(
                                    conn,
                                    _loggerService));






        }


        // GET: DisneyTWDC
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetProgrammeDetails(int qcnum, int revnum)
        {
            HomeVM model = new HomeVM();
            WindowsIdentity clientId = (WindowsIdentity)HttpContext.User.Identity;
            model.SecurityLevel = UserAccountService.GetSecurityLevel(clientId.Name);
            model.DisneyTWDCProgrammeDetails = _disneyTWDCService.GetProgrammeDetails(qcnum, revnum) as DisneyTWDCProgrammeDetails;

            model.DisneyTWDCQCTypeList = _lookupsService.GetLookup(StoredProcedure.Lookup.DisneyTWDCQCType).ToList();
            model.DisneyTWDCQCScopeList = _lookupsService.GetLookup(StoredProcedure.Lookup.DisneyTWDCQCScope).ToList();
            model.DisneyTWDCQCProcessList = _lookupsService.GetLookup(StoredProcedure.Lookup.DisneyTWDCQCProcess).ToList();
            model.OperatorList = LookUpsService.GetOperator();

            /****************Log User Activity******************************************************/
            WebSystemUtility.LogUserActivity(
                                            $"Disney Plus Originals - TWDC: Programme  Details for QC # {qcnum} and Rev # {revnum} was viewed.",
                                            Constants.ActivityType.DisneyTWDCProgrammeDetailsViewed;
            /*******************************************************************************************/

            return PartialView("_ProgrammeDetails",model);
        }

        [HttpPost]
        public ActionResult SaveProgrammeDetails(HomeVM model)
        {

            bool result = _disneyTWDCService.SaveProgrammeDetails(model.DisneyTWDCProgrammeDetails);
            string resultMsg = "Disney Plus Originals - TWDC: Programme Details saved successfully.";

            if (!result)
            {
                resultMsg = "Disney Plus Originals - TWDC: Programme Details failed to save !";
            }
            else
            {
                /****************Log User Activity******************************************************/

                WebSystemUtility.LogUserActivity(
                                          $"Disney Plus Originals - TWDC: Programme Details for QC # {model.DisneyTWDCProgrammeDetails.QCNum}" +
                                          $" and Rev # {model.DisneyTWDCProgrammeDetails.SubQCNum} was updated.",
                                          Constants.ActivityType.DisneyTWDCProgrammeDetailsUpdated);

                /*******************************************************************************************/

            }


            return Json(new { success = result, msg = resultMsg });
        }


        public ActionResult GetElementInformation(int qcnum, int revnum)
        {


            return PartialView("_ElementInformation");
        }

        public ActionResult GetTechnicalSpecifications(int qcnum, int revnum)
        {


            return PartialView("_TechnicalSpecifications");
        }

        public ActionResult GetAudio(int qcnum, int revnum)
        {


            return PartialView("_Audio");
        }

        public ActionResult GetLog(int qcnum, int revnum)
        {


            return PartialView("_Log");
        }

        public ActionResult GetComments(int qcnum, int revnum)
        {


            return PartialView("_Comments");
        }
    }
}