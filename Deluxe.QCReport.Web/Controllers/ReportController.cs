using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Deluxe.QCReport.Common;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Services;
using Deluxe.QCReport.Common.Utilities;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Web.Utilities;
using Deluxe.QCReport.Web.Fillter;

namespace Deluxe.QCReport.Web.Controllers
{
    [CustomAuthorize]
    public class ReportController : Controller
    {
        HeaderService _headerSrv = new HeaderService();
        HistoryService _histSrv = new HistoryService();
        AudioTCService _atcSrv = new AudioTCService();
        FinalService _fSrv = new FinalService();
        IndividualSpecsService _isSrv = new IndividualSpecsService();
        OverallSpecsService _oasSrv = new OverallSpecsService();
        private readonly TapeLayoutService _tlSrv = null;
        private readonly ChecklistService _checklistService = null;
        private readonly ILoggerService _loggerService = null;
        private readonly IDPPService _dppService = null;
        private readonly IClientService _clientService = null;

        public ReportController()
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


            _dppService = new DPPService(
                                 new DPPRepository(
                                     conn,
                                     _loggerService));


            _clientService = new ClientService(
                              new ClientRepository(
                                  conn,
                                  _loggerService));
        }




        // GET: Report
        public ActionResult Index()
        {

            ReportVM model = new ReportVM();
            //model.Qcnum = qcnum.Value;
            //model.subQcnum = revnum.Value;
            
                        
   
            //model.AudioTC_VM = _atcSrv.GetAudioTCDetails(qcnum, revnum);
            //model.Header_VM = _headerSrv.GetHeaderDetails(qcnum, revnum);
            //model.History_VM = _histSrv.GetHistoryDetails(qcnum, revnum);
            //model.Final_VM = _fSrv.GetFinalDetails(qcnum, revnum);
            //model.IndividualSpecs_VM = _isSrv.GetIndividualSpecsDetails(qcnum, revnum);
            //model.OverallSpecs_VM = _oasSrv.GetOverallSpecsDetails(qcnum, revnum);
            //model.TapeLayout_VM = _tlSrv.GetTapeLayoutTCDetails(qcnum, revnum);

            return View(model);
        }


        public ActionResult LoadReportTypes(int qcnum, int revnum)
        {
            ReportVM model = new ReportVM();
            model.Qcnum = qcnum;
            model.subQcnum = revnum;
            ChecklistBase checklist = null;

            // var customerName = _headerSrv.GetHeaderDetails(qcnum, revnum)?.CustName;
            var customerDetails = _clientService.GetClientDetails(qcnum, revnum);
            var customerName = customerDetails.CustName;
            var customerId = customerDetails.CustID;
            var checklistRequired = false;

            /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                        string.Format(
                                            "Report Types page for  Id {0} and Rev No {1} was displayed.",
                                              qcnum,
                                             revnum),
                                            Constants.ActivityType.ReportTypesViewed);

            /*******************************************************************************************/

            if (!string.IsNullOrEmpty(customerName))
            {
                /******************** Disney ***************************************************************/
                if (customerName.ToLower().Contains("disney"))
                {
                    checklist = _checklistService.GetChecklistDisney(qcnum, revnum, customerId);
                    checklistRequired = true; 
                }

                /************************* Lionsgate ************************************************************/
                else if (customerName.ToLower().Contains("lionsgate")
                   || customerName.ToLower().Contains("lions gate"))
                {
                    checklist = _checklistService.GetChecklistLionsGate(qcnum, revnum, customerId);
                    checklistRequired = true;
                }

                /**************************** Warner Bros.*******************************************************/
                else if (customerName.ToLower().Contains("warner"))
                {
                    checklist = _checklistService.GetChecklistWarner(qcnum, revnum, customerId);
                    checklistRequired = true;
                }

                /************************** Wild Bunch*******************************************************/
                else if (customerName.ToLower().Contains("wild bunch"))
                {
                    checklist = _checklistService.GetChecklistWildBunch(qcnum, revnum, customerId);
                    checklistRequired = true;
                }

                /************************** DPP Eyeball *******************************************************/
                else if (customerName.ToLower().Contains("dpp eyeball"))
                {
                    checklistRequired = true;
                }

                /************************** Banijay Rights - Checklist no longer reqiured *******************************************************/
                //else if (customerName.ToLower().Contains("banijay")
                //   || customerName.ToLower().Contains("endemol"))
                //{
                //    checklist = _checklistService.GetChecklistBanijayRights(qcnum, revnum, customerId);
                //    checklistRequired = true;
                //}


                if (checklistRequired)
                {
                    if (customerName.ToLower().Contains("dpp eyeball"))
                    {
                        var dppChecklist = _dppService.GetChecklist(qcnum, revnum);

                        if (dppChecklist == null )
                        {
                            model.IsChecklistCompleted = false;
                        }
                        else
                        {
                            if (!dppChecklist.ChecklistCompleted)
                            {
                                model.IsChecklistCompleted = false;
                            }
                            else 
                            {
                                model.IsChecklistCompleted = true;
                            }
                        }
                       
                    }
                    else if (checklist == null || (checklist != null && !checklist.ChecklistCompleted))
                    {
                        return PartialView("_UncompletedChecklist", model);
                    }

                }

            }

            model.QCTtype =  _headerSrv.GetHeaderDetails(qcnum, revnum)?.QCType;

            if (string.IsNullOrWhiteSpace(model.QCTtype))
            {
                model.QCTtype = "B";
            }

            model.CustName = customerName;

             /****************Log User Activity******************************************************/

            WebSystemUtility.LogUserActivity(
                                             $"Report Types page for  Id {qcnum} and Rev No {revnum} was displayed.",
                                            Constants.ActivityType.ReportTypesViewed);

            /*******************************************************************************************/

            return PartialView("_ReportTypes", model);

        }

        public ActionResult BypassChecklist(int qcnum, int revnum)
        {
            ReportVM model = new ReportVM();
            model.Qcnum = qcnum;
            model.subQcnum = revnum;
            model.QCTtype = _headerSrv.GetHeaderDetails(qcnum, revnum)?.QCType;

            if (string.IsNullOrWhiteSpace(model.QCTtype))
            {
                model.QCTtype = "B";
            }

            WebSystemUtility.LogUserActivity(
                                     string.Format(
                                         "Checklist was by passed for  Id {0} and Rev No {1} was displayed.",
                                           qcnum,
                                          revnum),
                                         Constants.ActivityType.ByPassChecklist);


            return PartialView("_ReportTypes", model);

        }


       




    }


}