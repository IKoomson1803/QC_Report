using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Services
{
    public class LogService
    {
        private readonly LogRepository _repSql;
             

        public LogService(LogRepository rep)
        {
            this._repSql = rep ?? throw new ArgumentNullException(
                      $"AccountController expects ctor injection: {nameof(LogRepository)}");

        }

        public LogVM GetLogDetails(int QCNum, int SubQCNum)
        {

            return _repSql.GetLogDetails(QCNum, SubQCNum);
        }

        public bool SaveLogDetails(LogVM logDetails)
        {
            // check if tape format id is supplied, create a new one if not
            if (logDetails.CurrentQCTimes.TimeID.HasValue)
            {

                return _repSql.UpdateLogDetails(logDetails);
            }
            else
            {

                return _repSql.AddLogDetails(logDetails);
            }
        }

        public bool BatchUpdateLogDetails(LogVM logDetails)
        {
            return _repSql.BatchUpdateLogDetails(logDetails);
        }

        public bool LogTCOffsetUpdate(int qcNum, int subQcNum, List<QCTime> tcToUpdate)
        {

            return _repSql.LogTCOffsetUpdate(qcNum, subQcNum, tcToUpdate);
        }


        public bool DeleteLogDetails(LogVM logDetails)
        {

            return _repSql.DeleteLogDetails(logDetails);
        }
    }
}
