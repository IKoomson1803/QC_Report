using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Services
{
    public class QCReportService
    {
        QCReportRepository _repSql = new QCReportRepository();

        public int CreateNewQCReport(NewQCReport newQCR)
        {

            return _repSql.CreateNewQCReport(newQCR);
        }

        public bool UpdateQCReport(NewQCReport newQCR)
        {

            return _repSql.UpdateQCReport(newQCR);
        }

        public NewQCReport GetQCReport(int qcNo, int qcRev)
        {

            return _repSql.GetQCReport(qcNo, qcRev);
        }

        public bool CopyQCReport(string qcWONo, int qcNo, int qcRev, int? qcUserId)
        {

            return _repSql.CopyQCReport(qcWONo, qcNo, qcRev, qcUserId);
        }

        public JobTreeViewVM GetJobTree(string qcWONo, int? qcNo)
        {

            return _repSql.GetJobTree(qcWONo, qcNo);
        }

        public JobDetailsVM GetJobDetails(string qcWONo)
        {

            return _repSql.GetJobDetails(qcWONo);
        }
        public bool DeleteJob(string qcWONo)
        {

            return _repSql.DeleteJob(qcWONo);
        }

        public QCDetailsVM GetQCDetails(string qcWONo, int qcNo)
        {

            return _repSql.GetQCDetails(qcWONo, qcNo);
        }
        public bool DeleteQC(int qcNo)
        {

            return _repSql.DeleteQC(qcNo);
        }

        public RevDetailsVM GetRevDetails(string qcWONo, int qcNo, int qcRevNo)
        {

            return _repSql.GetRevDetails(qcWONo, qcNo, qcRevNo);
        }
        public bool DeleteRev(int qcNo, int revNo)
        {

            return _repSql.DeleteRev(qcNo, revNo);
        }
        
    }
}
