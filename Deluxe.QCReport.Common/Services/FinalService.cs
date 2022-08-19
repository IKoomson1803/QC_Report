using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Services
{
    public class FinalService
    {
        FinalRepository _repSql = new FinalRepository();


        public FinalVM GetFinalDetails(int QCNum, int SubQCNum)
        {

            return _repSql.GetFinalDetails(QCNum, SubQCNum);
        }

        public bool SaveFinalDetails(FinalVM fDetails)
        {

            return _repSql.UpdateFinalDetails(fDetails);
        }

    }
}
