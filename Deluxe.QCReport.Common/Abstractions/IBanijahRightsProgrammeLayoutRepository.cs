using System;


namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IBanijahRightsProgrammeLayoutRepository
    {
        IBanijahRightsProgrammeLayout GetProgrammeLayout(int qcNum, int subQCNum);
        bool SaveProgrammeLayout(IBanijahRightsProgrammeLayout programmeLayout);
        bool SaveTapeLayout(IBanijahRightsTapeLayout tapeLayout);
        IBanijahRightsTapeLayout GetBanijahRightsTapeLayoutById(int id);
        bool DeleteBanijahRightsTapeLayout(int id);
    }
}
