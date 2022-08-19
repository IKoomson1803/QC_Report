

namespace Deluxe.QCReport.Common.Abstractions
{
   public interface IESISpecificsRepository
    {
        IESISpecifics GetESISpecifics(int QCNum, int SubQCNum);

        bool SaveESISpecifics(IESISpecifics esiSpecifics);
        
    }
}
