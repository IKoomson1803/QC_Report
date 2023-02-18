using Deluxe.QCReport.Common.Abstractions;

public class BanijayRightsTextDetails : IBanijayRightsTextDetails
{
    public int Id { get; set; }
    public int QCNum { get; set; }
    public int SubQCNum { get; set; }
    public string TitleBoardInShow { get; set; }
    public string TitleBoardAfterProg { get; set; }
    public string InAndOutOfPartInShow { get; set; }
    public string InAndOutOfPartAfterProg { get; set; }
    public string EndCreditsInShow { get; set; }
    public string EndCreditsAfterProg { get; set; }
    public string AstonsNamestrapsEtcInShow { get; set; }
    public string AstonsNamestrapsEtcAfterProg { get; set; }
    public string SubtitlesOrClosedCaptionsInShow { get; set; }
    public string SubtitlesOrClosedCaptionsAfterProg { get; set; }
    public string IsThereASecondTextedOrTextlessVersionInShow { get; set; }
    public string IsThereASecondTextedOrTextlessVersionAfterProg { get; set; }
    public string BurntInSubtitlesOrCC { get; set; }
    public string Violence { get; set; }
    public string Nudity { get; set; }
    public string Swearing { get; set; }
    public string BleepedOrUnBleeped { get; set; }
    public string UnbleepedSplitTrackAvailable { get; set; }
    public string SponsorshipOrProductPlacement { get; set; }
}
