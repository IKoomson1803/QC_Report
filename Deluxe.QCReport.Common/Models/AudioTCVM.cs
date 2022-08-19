using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class AudioTCVM
    {
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public string ChannelCount { get; set; }
        public string NoiseReduction { get; set; }
        public string TimeCode { get; set; }
        public string AudioQCdInUnity { get; set; }
        public string CH1and2Phase { get; set; }
        public string CH3and4Phase { get; set; }
        public string TCIntegrity { get; set; }
        public string SurroundSound { get; set; }
        public string CompMESync { get; set; }
        public string LTCVITCMatch { get; set; }
        public string AudioPhaseTone { get; set; }

        public AudioTCChannel Cue { get; set; }

        public List<AudioTCChannel> ChannelsList { get; set; }
    }

    public class AudioTCChannel
    {
        public int ChannelNo { get; set; }
        public string Language { get; set; }

        public string InPhase { get; set; }
        public string Discreate { get; set; }

        public string Description { get; set; }
        public string LKFS { get; set; }
        public string Tone { get; set; }
        public string Average { get; set; }
        public string Peak { get; set; }
        public string TruePeak { get; set; }
        public bool FullQC { get; set; }
        public bool SpotQC { get; set; }
        public string FullSpotQC { get; set; }
        
    }
}
