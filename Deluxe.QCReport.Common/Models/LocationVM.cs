using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class LocationVM : ILocation
    {
        public int pkey { get; set; }
        public string Location { get; set; }
        public string Address { get; set; }
        public string ReportName { get; set; }
    }
}
