using System;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Services
{
    public class BanijahRightsProgrammeLayoutService : IBanijahRightsProgrammeLayoutService
    {
        private readonly IBanijahRightsProgrammeLayoutRepository _rep;

        public BanijahRightsProgrammeLayoutService(IBanijahRightsProgrammeLayoutRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"BanijahRightsProgrammeLayoutService expects ctor injection: {nameof(IBanijahRightsProgrammeLayoutRepository)}");

        }

        public IBanijahRightsProgrammeLayout GetProgrammeLayout(int qcNum, int subQCNum)
        {
            return _rep.GetProgrammeLayout(qcNum, subQCNum);
        }

        public bool SaveProgrammeLayout(IBanijahRightsProgrammeLayout programmeLayout)
        {
            return _rep.SaveProgrammeLayout(programmeLayout);
        }

        public bool SaveTapeLayout(IBanijahRightsTapeLayout tapeLayout)
        {
            return _rep.SaveTapeLayout(tapeLayout);
        }

        public bool DeleteBanijahRightsTapeLayout(int id)
        {
            return _rep.DeleteBanijahRightsTapeLayout(id);
        }

        public IBanijahRightsTapeLayout GetBanijahRightsTapeLayoutById(int id)
        {
            return _rep.GetBanijahRightsTapeLayoutById(id);
        }
    }
}
