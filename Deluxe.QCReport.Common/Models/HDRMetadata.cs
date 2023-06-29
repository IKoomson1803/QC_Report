using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class HDRMetadata : IHDRMetadata
    {
        public int Id { get; set; }
        public int QCNum { get; set; }
        public int SubQCNum { get; set; }
        public bool NotRequred { get; set; }
        public string HDRMetadataSupplied { get; set; }
        public string HDRMetadataType { get; set; }
        public string XmlAndBaseFileMetadataMatch { get; set; }
        public string MaxCLL { get; set; }
        public string MaxFALL { get; set; }
        public string ColorPrimariesMastering { get; set; }
        public string ColorPrimariesDolbyVision { get; set; }
        public string WhitePointMastering { get; set; }
        public string WhitePointDolbyVision { get; set; }
        public string PeakBrightnessMastering { get; set; }
        public string PeakBrightnessDolbyVision { get; set; }
        public string MinimumBrightnessMastering { get; set; }
        public string MinimumBrightnessDolbyVision { get; set; }
        public string Encoding { get; set; }
        public string ColourSpace { get; set; }
        public string ColourRange { get; set; }
        public string ColourPrimariesMatchVideoFile { get; set; }
        public string FrameRateMatchVideoFile { get; set; }
        public string CanvasAspectRatioMatchVideoFile { get; set; }
        public string ImageAspectRatioMatchVideoFile { get; set; }
        public string ColourRangeMatchVideoFile { get; set; }
    }
}
