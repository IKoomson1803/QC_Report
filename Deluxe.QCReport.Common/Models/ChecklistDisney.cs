using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    /// <summary>
    /// Original Chekclist is for Disney
    /// </summary>
    public class ChecklistDisney : ChecklistBase
    {
       

       public bool? Audio24TracksPresent { get; set; }
        public bool? AudioTrackLayout { get; set; }
        public string AudioCodec { get; set; }
        public string AudioSampleRate { get; set; }
        public string AudioBitRate { get; set; }
        public string AudioBitDepth { get; set; }
        public bool? AudioChannelsDiscrete { get; set; }
        public bool? AudioTracksLabelledOrtTaggedInQT { get; set; }

       
       
        public string FileType { get; set; }
        public bool? FileName { get; set; }
        public string StandardDefinition { get; set; }


        public bool? ProgrammeHeadBuild { get; set; }
        public bool? ProgrammeSlatePresent { get; set; }
        public bool? ProgrammeStart1stBlackVideoAndAudio { get; set; }
        public bool? ProgrammeBlackBetweenProgrammeAndTextlessElements { get; set; }
        public bool? ProgrammeTextlessElementsPresent { get; set; }
        public bool? ProgrammeFullTextlessCoversForTextedShotsPresent { get; set; }
        public bool? ProgrammeDoesTextlessMatchTheFramingAndAspectRatioOfItsCorrespondingTextedShot { get; set; }
        public bool? ProgrammeTextlessGaps1Or2s { get; set; }
        public bool? ProgrammeEnd1stBlackVideoAndAudio { get; set; }


        public bool? VideoJesExtensifier { get; set; }
        public string VideoContainerOrWrapper { get; set; }
        public bool? VideoTimecode { get; set; }
        public string VideoCodec { get; set; }
        public string VideoResolution { get; set; }
        public string VideoFrameRateOrStandard { get; set; }
        public string VideoDisplayAspectRatio { get; set; }
        public bool? VideoProgressive { get; set; }
        public bool? VideoCLAP { get; set; }
        public string VideoColourPrimaries { get; set; }
        public string VideoTransferCharacteristics { get; set; }
        public string VideoMatrixCoefficients { get; set; }


    }
}
