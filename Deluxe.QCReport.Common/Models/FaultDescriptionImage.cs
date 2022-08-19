using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class FaultDescriptionImage : IFaultDescriptionImage
    {
        public int Id { get; set; }
        public int QCNum { get; set; }
        public int SubQCNum { set; get; }
        public string Description { set; get; }
        public string ImageName { set; get; }
        public string ImagePath { get; set; }
       
    }
}
