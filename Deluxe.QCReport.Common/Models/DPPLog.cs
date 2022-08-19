using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class DPPLog  : IDPPLog
    {
        public int Id { get; set; }
        public int QCNum { get; set; }
        public int SubQCNum { get; set; }
        public string TimeCode { get; set; }
        public string Issue { get; set; }
        public string ActionOrResolution { get; set; }
        public string Initials { get; set; }
    }

}
