
namespace Deluxe.QCReport.Common.Abstractions.DisneyTWDC
{
    public  interface IDisneyTWDCElementInformationService
    {
        IDisneyTWDCElementInformation GetElementInformation(int qcNum, int subQCNum);

        bool SaveElementInformation(IDisneyTWDCElementInformation elementInformation);

    }
}
