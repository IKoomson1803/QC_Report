

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IESIFinalService
    {
        IESIFinal GetESIFinal(int QCNum, int SubQCNum);

        bool SaveESIFinal(IESIFinal esiFinal);
    }
}
