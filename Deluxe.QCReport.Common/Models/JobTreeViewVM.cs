using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class JobTreeViewVM
    {
        public string WONumber { get; set; }
        public string CustomerName { get; set; }
        public List<QC> QCs { get; set; }
    }

    public class QC
    {
        public int QCNumber { get; set; }
        public string QCType { get; set; }
        public Dictionary<int, DateTime?> Review { get; set; }
    }
}
