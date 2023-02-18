using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IBanijayRightsTextDetails
    {
        int Id { get; set; }
        int QCNum { get; set; }
        int SubQCNum { get; set; }
        string TitleBoardInShow { get; set; }
        string TitleBoardAfterProg { get; set; }
        string InAndOutOfPartInShow { get; set; }
        string InAndOutOfPartAfterProg { get; set; }
        string EndCreditsInShow { get; set; }
        string EndCreditsAfterProg { get; set; }
        string AstonsNamestrapsEtcInShow { get; set; }
        string AstonsNamestrapsEtcAfterProg { get; set; }
        string SubtitlesOrClosedCaptionsInShow { get; set; }
        string SubtitlesOrClosedCaptionsAfterProg { get; set; }
        string IsThereASecondTextedOrTextlessVersionInShow { get; set; }
        string IsThereASecondTextedOrTextlessVersionAfterProg { get; set; }
        string BurntInSubtitlesOrCC { get; set; }
        string Violence { get; set; }
        string Nudity { get; set; }
        string Swearing { get; set; }
        string BleepedOrUnBleeped { get; set; }
        string UnbleepedSplitTrackAvailable { get; set; }


    }
}
