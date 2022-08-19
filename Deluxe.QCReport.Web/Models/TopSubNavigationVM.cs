using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Deluxe.QCReport.Web.Models
{
    public class TopSubNavigationVM
    {
        public string WONumber { get; set; }
        public int QCNumber { get; set; }
        public int RevNumber { get; set; }
         public string   QCType { get; set; }
        public string CustomerName { get; set; }

    }
}