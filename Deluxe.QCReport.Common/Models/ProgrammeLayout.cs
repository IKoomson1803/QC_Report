using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class ProgrammeLayout
    {
        public bool HeadBuild { get; set; }
        public bool SlatePresent { get; set; }
        public bool ProgrammeStart1stBlackVideoAndAudio { get; set; }
        public bool BlackBetweenProgrammeAndTextlessElements { get; set; }
        public bool TextlessElementsPresent { get; set; }
        public bool FullTextlessCoversForTextedShotsPresent { get; set; }
        public bool DoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot { get; set; }
        public bool TextlessGaps1Or2s { get; set; }
        public bool ProgrammeEnd1stBlackVideoAndAudio { get; set; }

    }
}
