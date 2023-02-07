

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IBanijahRightsProgrammeLayoutService
    {
        IBanijahRightsProgrammeLayout GetProgrammeLayout(int qcNum, int subQCNum);

        bool SaveProgrammeLayout(IBanijahRightsProgrammeLayout programmeLayout);

    }
}
