

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IBanijayRightsNotesRepository
    {
        bool SaveBanijayRightsNotes(IBanijayRightsNotes banijayRightsNotes);
        IBanijayRightsNotes GetBanijayRightsNotes(int QCNum, int SubQCNum);
    }
}
