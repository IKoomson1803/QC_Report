using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Services
{
    /// <summary>
    /// It's now called MEASUREMENTS
    /// </summary>
    public class OverallSpecsService
    {
        OverallSpecsRepository _repSql = new OverallSpecsRepository();

        public OverallSpecsVM GetOverallSpecsDetails(int QCNum, int SubQCNum)
        {

            return _repSql.GetOverallSpecsDetails(QCNum, SubQCNum);
        }

        public bool SaveOverallSpecsDetails(OverallSpecsVM oasDetails)
        {

            return _repSql.UpdateOverallSpecsDetails(oasDetails);
        }

    }
}
