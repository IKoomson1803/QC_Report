using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class IndividualSpecsVM
    {
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public string AssetType { get; set; }

        public string HBlanking { get; set; }
        public string VBlanking { get; set; }
        public string ClosedCaps { get; set; }
        public string SourceTape { get; set; }
        public string VideoRF { get; set; }
        public string BurstLevel { get; set; }
        public string SyncLevel { get; set; }
        public string FrontPorch { get; set; }
        public string ChannelConditions { get; set; }
        public string Slate { get; set; }
        public string VITS { get; set; }
        public string VIRS { get; set; }
        public string VITC { get; set; }
        public string Tracking { get; set; }
        public string Label { get; set; }
        public string ControlTrack { get; set; }
        public string Shipper { get; set; }
        public string TapeWrap { get; set; }
        public string Subtitles { get; set; }


    }
}
