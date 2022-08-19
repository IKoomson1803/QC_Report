using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Deluxe.QCReport.Common.Services;
using Deluxe.QCReport.Common.Models;
using System.Collections.Generic;

namespace Deluxe.QCReport.Test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void LookupsTest()
        {
            Dictionary<int, string> arList = LookUpsService.GetAspectRatio();
            Dictionary<int, string> cList = LookUpsService.GetCustName();
            Dictionary<int, string> vList = LookUpsService.GetVersion();
            Dictionary<int, string> fList = LookUpsService.GetFormat();
            Dictionary<int, string> tdList = LookUpsService.GetTapeDesc();


        }

        [TestMethod]
        public void HeaderServiceGetHeaderDetailsTest()
        {
            HeaderService _srv = new HeaderService();

            HeaderVM result = _srv.GetHeaderDetails(10003, 1);
        }

        [TestMethod]
        public void HeaderServiceUpdateHeaderDetailsTest()
        {
            HeaderService _srv = new HeaderService();

            HeaderVM resultHVM = _srv.GetHeaderDetails(10003, 1);
            resultHVM.Epis_name = "testtttt";

            bool result = _srv.UpdateHeaderDetails(resultHVM);
        }


        [TestMethod]
        public void AudioTCServiceGetAudioTCDetailsTest()
        {
            AudioTCService _srv = new AudioTCService();

            AudioTCVM result = _srv.GetAudioTCDetails(20215, 1);
        }

        [TestMethod]
        public void AudioTCServiceUpdateAudioTCDetailsTest()
        {
            HistoryService _srv = new HistoryService();

            HistoryVM resultHVM = _srv.GetHistoryDetails(20215, 1);
            resultHVM.Duration = "not too long";

            bool result = _srv.UpdateHistoryDetails(resultHVM);
        }



        [TestMethod]
        public void HeaderServiceGetHistoryDetailsTest()
        {
            HistoryService _srv = new HistoryService();

            HistoryVM result = _srv.GetHistoryDetails(20215, 1);
        }

        [TestMethod]
        public void HeaderServiceUpdateHistoryDetailsTest()
        {
            HistoryService _srv = new HistoryService();

            HistoryVM resultHVM = _srv.GetHistoryDetails(20215, 1);
            resultHVM.Duration = "not too long";

            bool result = _srv.UpdateHistoryDetails(resultHVM);
        }



        [TestMethod]
        public void QCReportServiceCreateNewQCReportTest()
        {
            QCReportService _srv = new QCReportService();

            NewQCReport qcReport = new NewQCReport()
            {
                UserId = 1,
                AssetType = "File",
                Customer = "Lip Sync Post LTD",
                QCFullname = "",
                QCWONumber = "112",
                QCType = "B"
            };


            int result = _srv.CreateNewQCReport(qcReport);
        }

        [TestMethod]
        public void QCReportServiceCopyQCReportTest()
        {
            QCReportService _srv = new QCReportService();

            bool result = _srv.CopyQCReport("25041904", 44153, 1,null);
        }

        [TestMethod]
        public void QCReportServiceGetJobTreeTest()
        {
            QCReportService _srv = new QCReportService();

            JobTreeViewVM result1 = _srv.GetJobTree("939773", 44153);
            JobTreeViewVM result2 = _srv.GetJobTree("939773", null);
            JobTreeViewVM result3 = _srv.GetJobTree("37188", null);
            JobTreeViewVM result4 = _srv.GetJobTree("943963", null);
            JobTreeViewVM result5 = _srv.GetJobTree("1197028-1", null);
            JobTreeViewVM result6 = _srv.GetJobTree("339886", null);
        }
        
        [TestMethod]
        public void QCReportServiceGetJob_QC_RevDetailsTest()
        {
            QCReportService _srv = new QCReportService();

            JobDetailsVM result1 = _srv.GetJobDetails("939773");
            QCDetailsVM result2 = _srv.GetQCDetails("939773", 34929);
            RevDetailsVM result3 = _srv.GetRevDetails("939773", 34929, 1);
            RevDetailsVM result4 = _srv.GetRevDetails("939773", 34929, 2);

        }

    }
}
