using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Services
{
    public class HistoryService
    {
        HistoryRepository _repSql = new HistoryRepository();


        public HistoryVM GetHistoryDetails(int QCNum, int SubQCNum)
        {

            return _repSql.GetHistoryDetails(QCNum, SubQCNum);
        }

        public bool UpdateHistoryDetails(HistoryVM historyDetails)
        {

            return _repSql.UpdateHistoryDetails(historyDetails);
        }
    }
}
