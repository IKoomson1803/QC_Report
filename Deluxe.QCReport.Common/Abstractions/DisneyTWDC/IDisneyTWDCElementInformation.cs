using System;


namespace Deluxe.QCReport.Common.Abstractions.DisneyTWDC
{
    public interface IDisneyTWDCElementInformation
    {
        int QCNum { get; set; }
        int SubQCNum { get; set; }
        string AssetType { get; set; }
        string AssetTypeNotes { get; set; }
        string CreatedFrom { get; set; }
        string CreatedFromNotes { get; set; }
        DateTime? AssetCreationDate { get; set; }
        string CanvasImageAspectRatio { get; set; }
        string FrameRate { get; set; }
        string ResolutionStandard { get; set; }
        long? FileSize { get; set; }
        string TwoPopAtHead { get; set; }
        string TwoPopAtTail { get; set; }
        string CommercialBreaks { get; set; }
        string HeadLogos { get; set; }
        string TailLogos { get; set; }
        string TotalRuntime { get; set; }
        string ForensicWatermark { get; set; }
        string AudioConformedLanguage { get; set; }
        string AudioBitDepth { get; set; }
        string AudioSampleRate { get; set; }
        string ClosedCaptions { get; set; }
        string ClosedCaptionType { get; set; }
        string ValidAssetNaming { get; set; }
        string TextlessAtTail { get; set; }
        string LocalizedInserts { get; set; }
        string LocalizedSubtitles { get; set; }
        string SuperimposedText { get; set; }
        string ForcedNarratives { get; set; }
        string TextInTitleSafe { get; set; }
        string Censored { get; set; }
        string EDLProvided { get; set; }










    }
}
