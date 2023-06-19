
namespace Deluxe.QCReport.Common.Abstractions.DisneyTWDC
{
    public interface IDisneyTWDCElementInformationRepository
    {
        IDisneyTWDCElementInformation GetElementInformation(int qcNum, int subQCNum);

        bool SaveElementInformation(IDisneyTWDCElementInformation elementInformation);

    }
}
