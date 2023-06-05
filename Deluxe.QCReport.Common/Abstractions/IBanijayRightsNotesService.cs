

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IBanijayRightsNotesService
    {
        bool SaveBanijayRightsNotes(IBanijayRightsNotes banijayRightsNotes);
        IBanijayRightsNotes GetBanijayRightsNotes(int QCNum, int SubQCNum);
    }
}
