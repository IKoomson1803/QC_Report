
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class AspectRatioVM : IAspectRatio
    {
        public int AspectID { get; set ; }
        public string AspectRatio { get; set ; }
    }
}
