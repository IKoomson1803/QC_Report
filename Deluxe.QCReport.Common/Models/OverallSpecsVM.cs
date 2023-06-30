using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    /// <summary>
    /// It's now called MEASUREMENTS
    /// </summary>
    public class OverallSpecsVM
    {
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public string AssetType { get; set; }

        public string VideoGain { get; set; }
        public string ChromaGain { get; set; }
        public string SetUp { get; set; }

        public string LuminancePeak { get; set; }
        public string LuminanceAvg { get; set; }
        public string BlackLevel { get; set; }
        public string ChromaPeak { get; set; }
        public string ChromaAvg { get; set; }

        public string VideoCodec { get; set; }
        public string VideoBitRate { get; set; }
        public string VideoBitDepth { get; set; }
        public string BitRateMode { get; set; }
        public string AudioCodec { get; set; }
        public string AudioBitRate { get; set; }
        public string AudioBitDepth { get; set; }
        public string SampleRate { get; set; }
        public string GOPStructure { get; set; }
        public string Gamut { get; set; }
        public string ColourEncoding { get; set; }
        public string Filesize { get; set; }

        public string ActivePicture { get; set; }
        public string FrameSize { get; set; }
        public string IreMv { get; set; }

        public string HBlanking { get; set; }
        public string VBlanking { get; set; }

        public string PSEResult { get; set; }  // Banijay Rights new template
        public string DecodeCheck { get; set; }  // Banijay Rights new template
        public string MaxCLL { get; set; } 
        public string MaxFALL { get; set; }
        public string ColourSpace { get; set; }
        public string ColourRange { get; set; }
    }
}
