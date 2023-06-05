using System;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Services
{
    public class BanijayRightsNotesService : IBanijayRightsNotesService
    {
        private readonly IBanijayRightsNotesRepository _rep;

        public BanijayRightsNotesService(IBanijayRightsNotesRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"BanijayRightsNotesService expects ctor injection: {nameof(IBanijayRightsNotesRepository)}");

        }

        public IBanijayRightsNotes GetBanijayRightsNotes(int QCNum, int SubQCNum)
        {
            return _rep.GetBanijayRightsNotes(QCNum, SubQCNum);
        }

        public bool SaveBanijayRightsNotes(IBanijayRightsNotes banijayRightsNotes)
        {
            return _rep.SaveBanijayRightsNotes(banijayRightsNotes);
        }
    }
}
