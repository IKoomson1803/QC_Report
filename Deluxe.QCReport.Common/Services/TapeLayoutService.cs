using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Services
{
    public class TapeLayoutService
    {
        private readonly TapeLayoutRepository _repSql ;

        public TapeLayoutService(TapeLayoutRepository rep)
        {
            this._repSql = rep ?? throw new ArgumentNullException(
                      $"AccountController expects ctor injection: {nameof(TapeLayoutRepository)}");

        }


        public TapeLayoutVM GetTapeLayoutTCDetails(int QCNum, int SubQCNum)
        {

            return _repSql.GetTapeLayoutTCDetails(QCNum, SubQCNum);
        }

        public bool SaveTapeLayoutTCDetails(TapeLayoutVM tlDetails)
        {
            // check if tape format id is supplied, create a new one if not
            if(tlDetails.CurrentTimecodes.TapeFormatId.HasValue)
            {

                return _repSql.UpdateTapeLayoutTCDetails(tlDetails);
            }
            else
            {

                return _repSql.AddTapeLayoutTCDetails(tlDetails);
            }
        }

        public bool BatchUpdateTapeLayoutTCDetails(TapeLayoutVM tltcDetails)
        {
            return _repSql.BatchUpdateTapeLayoutTCDetails(tltcDetails);
        }

        public bool DeleteTapeLayoutTCDetails(TapeLayoutVM tlDetails)
        {

            return _repSql.DeleteTapeLayoutTCDetails(tlDetails);
        }
    }
}
