using System;
using System.Collections.Generic;
using System.Web;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class FaultDescriptionImageVM
    {
        public List<FaultDescriptionImage> FaultDescriptionImages { get; set; }
        public FaultDescriptionImage FaultDescriptionImage { get; set; }
        public string Message { get; set; }
        

        public FaultDescriptionImageVM()
        {
            FaultDescriptionImages = new List<FaultDescriptionImage>();
            FaultDescriptionImage = new FaultDescriptionImage();
        }

    }
}
