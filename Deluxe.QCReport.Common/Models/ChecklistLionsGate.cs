using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class ChecklistLionsGate : ChecklistBase
    {
        /*****************Video and Content*********************************/
        public bool? IsTheFileFullRangeVideo { get; set; }

        ///// <summary>
        ///// No longer required
        ///// </summary>
        //public bool? IsTheFrameRateOfTheContenCorrect { get; set; }

        ///// <summary>
        ///// No longer required
        ///// </summary>
        //public bool? IsTheHeadBuildCorrect { get; set; }


        public bool? AreTheVideoLevelsCorrectOnTheHeadBuild { get; set; }
        public bool? AreTheVideoLevelsCorrectOnTheContent { get; set; }
        public bool? HasTheAspectRatioBeenCheckedOTheSlateAndProgramme { get; set; }
        public bool? IsTheInfoOnTheSlateCcorrect { get; set; }
        public bool? IsTheLionsgateCeletiallLogoAddedOrPresent { get; set; }
        public bool? IsAllAddedTextWithin16_9NinetyPercentTitleSafe { get; set; }
        public bool? HasAllAddedTextBeenListedIncludingPlotSignificantFeaturedText { get; set; }
        public bool? AreThereTextlessAndCleanGraphicCoversAfterFeatureForAllTextedShots { get; set; }
        public bool? FlashingImagesPpresentImagesLikelyToCauseASeizure { get; set; }

        ///// <summary>
        ///// No longer required
        ///// </summary>
        //public bool? FirstAndLastCutBeenCheckedOrLoggedAsReference { get; set; }

        ///*****************AUDIO*********************************/
        ///// <summary>
        ///// No longer required
        ///// </summary>
        //public bool? IsTheAudioToneOnHeadBuildCorrect { get; set; }


        public bool? Is_2_0_StereoTVFullMixPresentAndQCeD { get; set; }
        public bool? HasThe_5_1_MixBeenSpotChecked { get; set; }

        ///// <summary>
        ///// No longer required
        ///// </summary>
        //public bool? AudioOrVideoSyncCheckedOrLogged { get; set; }
               

        /*****************FILE*********************************/
        public bool? HasAllFileMetadataBeenChecked { get; set; }
        public string FileFormatOrCodec { get; set; }
        public string StandardOrFrameRate { get; set; }
        public string Resolution { get; set; }
        public bool? Progressive { get; set; }
        public bool? CLAPPresent { get; set; }
        public string ColourPrimaries { get; set; }
        public string TransferCharacteristics { get; set; }
        public string MatrixCoefficients { get; set; }
        public string AudioBitDepthOrRate { get; set; }
        public string IsAudioDiscreate { get; set; }



    }
}
