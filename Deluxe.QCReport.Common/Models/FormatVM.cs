using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class FormatVM : IFormat
    {
        public int FormatID { get; set; }
        public string Format { get; set; }
    }
}
