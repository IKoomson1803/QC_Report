using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Services
{
    public class HeaderService
    {
        HeaderRepository _repSql = new HeaderRepository();


        public HeaderVM GetHeaderDetails(int QCNum, int SubQCNum)
        {

            return _repSql.GetHeaderDetails(QCNum, SubQCNum);
        }

        public bool UpdateHeaderDetails(HeaderVM headerDetails)
        {

            return _repSql.UpdateHeaderDetails(headerDetails);
        }
    }
}
