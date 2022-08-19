using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class VideoChecklist
    {
        public bool JesExtensifier { get; set; }
        public bool ContinerOrWrapper { get; set; }
        public bool Timecode { get; set; }
        public bool Codec { get; set; }
        public bool Resolution { get; set; }
        public bool FrameRateOrStandard { get; set; }
        public bool DisplayAspectRatio { get; set; }
        public bool Progressive { get; set; }
        public bool CLAP { get; set; }
        public bool ColourPrimaries { get; set; }
        public bool TransferCharacteristics { get; set; }
        public bool MatrixCoefficients { get; set; }


    }
}
