

namespace Deluxe.QCReport.Common.Abstractions.DisneyTWDC
{
    public interface IDisneyTWDCRepository
    {
        IDisneyTWDCProgrammeDetails GetProgrammeDetails(int qcNum, int subQCNum);

        bool SaveProgrammeDetails(IDisneyTWDCProgrammeDetails programmeDetails);
    }
}
