using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class JobDetailsVM
    {
        public string WONumber { get; set; }
        public int SecurityLevel { get; set; }
        
        // tuple: t1 - qc number # t2 - qc operator # t3 - qc date
        public List<Tuple<int, int, string, DateTime?>> QCList { get; set; }
    }

    public class QCDetailsVM
    {
        public string WONumber { get; set; }
        public int QCNumber { get; set; }
        public int SecurityLevel { get; set; }

        // tuple: t1 - qc number # t2 - rev number # t3 - qc operator # t4 - revision date
        public List<Tuple<int, int, string, DateTime?>> RevList { get; set; }
    }

    public class RevDetailsVM
    {
        public string WONumber { get; set; }
        public int QCNumber { get; set; }
        public int RevNumber { get; set; }
        public int SecurityLevel { get; set; }
        public DateTime? RevDate { get; set; }
        public string RevBy { get; set; }
        public string QCOperator { get; set; }
        public string Status { get; set; }
    }
}
