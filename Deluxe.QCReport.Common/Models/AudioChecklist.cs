using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public  class AudioChecklist
    {
        public bool _24TracksPresent { get; set; }
        public bool TrackLayout { get; set; }
        public bool Codec { get; set; }
        public bool SampleRate { get; set; }
        public bool BitRate { get; set; }
        public bool BitDepth { get; set; }
        public bool ChannelsDiscrete { get; set; }
        public bool AudioTracksLabelledOrtTaggedInQT { get; set; }



    }
}
