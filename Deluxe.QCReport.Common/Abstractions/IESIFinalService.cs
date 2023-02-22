

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IESIFinalService
    {
        IESIFinal GetESIFinal(int QCNum, int SubQCNum);
        bool SaveESIFinal(IESIFinal esiFinal);
        bool SaveBanijayRightsNotes(IESIFinal esiFinal);
        IESIFinal GetBanijayRightsNotes(int QCNum, int SubQCNum);
    }
}
