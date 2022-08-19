
namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IDPPLog
    {
        int Id { get; set; }
        int QCNum { get; set; }
        int SubQCNum { get; set; }
        string TimeCode { get; set; }
        string Issue { get; set; }
        string ActionOrResolution { get; set; }
        string Initials { get; set; }

    }
}
