using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IHDRMetadata
    {
        int Id { get; set; }
        int QCNum { get; set; }
        int SubQCNum { get; set; }
        bool NotRequired { get; set; }
        string HDRMetadataSupplied { get; set; }
        string HDRMetadataType { get; set; }
        string XmlAndBaseFileMetadataMatch { get; set; }
        string MaxCLL { get; set; }
        string MaxFALL { get; set; }
        string ColorPrimariesMastering { get; set; }
        string ColorPrimariesDolbyVision { get; set; }
        string WhitePointMastering { get; set; }
        string WhitePointDolbyVision { get; set; }
        string PeakBrightnessMastering { get; set; }
        string PeakBrightnessDolbyVision { get; set; }
        string MinimumBrightnessMastering { get; set; }
        string MinimumBrightnessDolbyVision { get; set; }
        string Encoding { get; set; }
        string ColourSpace { get; set; }
        string ColourRange { get; set; }
        string ColourPrimariesMatchVideoFile { get; set; }
        string FrameRateMatchVideoFile { get; set; }
        string CanvasAspectRatioMatchVideoFile { get; set; }
        string ImageAspectRatioMatchVideoFile { get; set; }
        string ColourRangeMatchVideoFile { get; set; }
    }
}
