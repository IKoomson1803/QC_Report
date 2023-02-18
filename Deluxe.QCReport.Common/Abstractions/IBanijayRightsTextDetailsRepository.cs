

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IBanijayRightsTextDetailsRepository
    {
       IBanijayRightsTextDetails Get(int qcNum, int subQCNum);

        bool Save(IBanijayRightsTextDetails textDetails);
    }
}
