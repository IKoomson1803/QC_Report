using Deluxe.QCReport.Common.Abstractions.DisneyTWDC;
using System;


namespace Deluxe.QCReport.Common.Models.DisneyTWDC
{
    public class DisneyTWDCElementInformation : IDisneyTWDCElementInformation
    {
        public int QCNum { get; set; }
        public int SubQCNum { get; set; }
        public string AssetType { get; set; }
        public string AssetTypeNotes { get; set; }
        public string CreatedFrom { get; set; }
        public string CreatedFromNotes { get; set; }
        public DateTime? AssetCreationDate { get; set; }
        public string CanvasImageAspectRatio { get; set; }
        public string FrameRate { get; set; }
        public string ResolutionStandard { get; set; }
        public long? FileSize { get; set; }
        public string TwoPopAtHead { get; set; }
        public string TwoPopAtTail { get; set; }
        public string CommercialBreaks { get; set; }
        public string HeadLogos { get; set; }
        public string TailLogos { get; set; }
        public string TotalRuntime { get; set; }
        public string ForensicWatermark { get; set; }
        public string AudioConformedLanguage { get; set; }
        public string AudioBitDepth { get; set; }
        public string AudioSampleRate { get; set; }
        public string ClosedCaptions { get; set; }
        public string ClosedCaptionType { get; set; }
        public string ValidAssetNaming { get; set; }
        public string TextlessAtTail { get; set; }
        public string LocalizedInserts { get; set; }
        public string LocalizedSubtitles { get; set; }
        public string SuperimposedText { get; set; }
        public string ForcedNarratives { get; set; }
        public string TextInTitleSafe { get; set; }
        public string Censored { get; set; }
        public string EDLProvided { get; set; }
    }
}
