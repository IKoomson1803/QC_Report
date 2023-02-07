using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class TapeLayoutVM
    {
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public List<TLTimeCodeVM> Timecodes { get; set; }
        public TLTimeCodeVM CurrentTimecodes { get; set; }

        public TapeLayoutVM()
        {
            Timecodes = new List<TLTimeCodeVM>();
        }

    }

    public class TLTimeCodeVM
    {
        public int? TapeFormatId { get; set; }
        public int ItemNum { get; set; }
        public string Description { get; set; }
        public string Time_Code { get; set; }
        public string Length { get; set; }
    }

}
