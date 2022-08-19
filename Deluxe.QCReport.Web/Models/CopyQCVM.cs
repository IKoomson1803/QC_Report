using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Deluxe.QCReport.Web.Models
{
    public class CopyQCVM
    {
        public string JobNumber { get; set; }
        public int? QCNumber { get; set; }
        public int? RevNumber { get; set; }
    }
}