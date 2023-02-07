using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class BanijahRightsTapeLayout : IBanijahRightsTapeLayout
    {
        public int Id { get; set; }
        public int QCNum { get; set; }
        public int SubQCNum { get; set; }
        public string Type { get; set; }
        public string TimecodeIn { get; set; }
        public string TimecodeOut { get; set; }
        public string PartDurationExcludingHolds { get; set; }
        public string CountAsShow { get; set; }
    }

}
