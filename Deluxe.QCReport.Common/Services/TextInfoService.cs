using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Services
{
    public class TextInfoService
    {
        private readonly TextInfoRepository _repSql ;

        public TextInfoService(TextInfoRepository rep)
        {
            this._repSql = rep ?? throw new ArgumentNullException(
                      $"AccountController expects ctor injection: {nameof(TextInfoRepository)}");

        }

        public TextInfoVM GetTextInfoDetails(int QCNum, int SubQCNum)
        {

            return _repSql.GetTextInfoDetails(QCNum, SubQCNum);
        }

        public bool SaveTextInfoDetails(TextInfoVM tiDetails)
        {
            // check if tape format id is supplied, create a new one if not
            if (tiDetails.CurrentTimecodes.TextInfoId.HasValue)
            {

                return _repSql.UpdateTextInfoDetails(tiDetails);
            }
            else
            {

                return _repSql.AddTextInfoDetails(tiDetails);
            }
        }

        public bool BatchUpdateTextInfoDetails(TextInfoVM tiDetails)
        {
            return _repSql.BatchUpdateTextInfoDetails(tiDetails);
        }

        public bool DeleteTextInfoDetails(TextInfoVM tiDetails)
        {

            return _repSql.DeleteTextInfoDetails(tiDetails);
        }
    }
}
