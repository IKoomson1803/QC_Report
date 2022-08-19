using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Services
{
    public class IndividualSpecsService
    {
        IndividualSpecsRepository _repSql = new IndividualSpecsRepository();

        public IndividualSpecsVM GetIndividualSpecsDetails(int QCNum, int SubQCNum)
        {

            return _repSql.GetIndividualSpecsDetails(QCNum, SubQCNum);
        }

        public bool SaveIndividualSpecsDetails(IndividualSpecsVM isDetails)
        {

            return _repSql.UpdateIndividualSpecsDetails(isDetails);
        }

    }
}
