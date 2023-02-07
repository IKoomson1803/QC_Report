using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class TextInfoVM
    {
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public TimeCodeVM CurrentTimecodes { get; set; }
        public List<TimeCodeVM> Timecodes { get; set; }

        public TextInfoVM()
        {
            Timecodes = new List<TimeCodeVM>();
        }
    }

    public class TimeCodeVM
    {
        public int? TextInfoId { get; set; }
        public string TimecodeIn { get; set; }
        public string TimecodeOut { get; set; }
        public string TextInfo { get; set; }

    }
}
