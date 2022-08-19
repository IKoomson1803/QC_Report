using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class ChecklistWildBunch : ChecklistBase
    {
        /*****************Video and Content*********************************/
        ///// <summary>
        ///// No longer required
        ///// </summary>
        //public string _4_4_4_FullScaleFilesAreAcceptableMentionedAndLogged { get; set; }

        ///// <summary>
        ///// No longer required
        ///// </summary>
        //public string _4_4_4_ScaledOR_4_2_2_Above_700MVOrBelow_0MVAreAFail { get; set; }

        ///// <summary>
        ///// No longer required
        ///// </summary>
        //public string HeadBuildPresentAndCorrect { get; set; }

        ///// <summary>
        ///// No longer required
        ///// </summary>
        //public string TimecodesCcorrectCheckedAndMatched { get; set; }

       /// <summary>
       /// New
       /// </summary>
        public string FullScaleFilesAreAcceptableIsThisMentionedAndLogged { get; set; }

        /// <summary>
        /// New
        /// </summary>
        public string AreNormalVideoRangeLevelsLegalAndWithinSpec { get; set; }

        public bool? AspectRatioCheckedOnAllContent { get; set; }
        public bool? AllHAndVBlankingChecked { get; set; }
        public bool? AllLogosAndAddedTextLoggedIncludePlotRelatedFeaturedText { get; set; }
        public bool? LoggedIfTitleOrCaptionsOrEndcreditstextIsPresentOverBlackPictureOrCard { get; set; }
        public bool? LoggedWildbunchLogoPresent { get; set; }
        public bool? BrandingOrCopyrightwithinContentLogged { get; set; }
        public bool? AllTextTitlesCaptionsAndEndCredits_90_Percent_CaptionSafe {get;set;}
        public bool? AllTextedshotsAddedTextMustHaveCorrespondingTextlessCovers { get; set; }
        public bool? AllTtextlessMustMatchTheGradeFramingAndAspectRatioOfItsCorrespondingTextedShot { get; set; }
        public bool? AllTextlessCoversMustBeTheSameTimingAsTheCorrespondingTextedShot { get; set; }


        /*****************AUDIO*********************************/
        ///// <summary>
        ///// No longer required
        ///// </summary>
        //public bool? AreAllAudioChannelsPresent { get; set; }

        ///// <summary>
        ///// No longer Reqiured
        ///// </summary>
        //public bool? AudioOrVideoSyncCheckedOrLogged { get; set; }


        public string MonoAudioListTracks { get; set; }
        public string SplitTrackAudio { get; set; }
        public bool? IsMAndECleanOfDialogues { get; set; }
        public bool? AreMAndETracksFullyFilled { get; set; }

        ///// <summary>
        ///// No longer required
        ///// </summary>
        //public bool? AnyUnclearDialogueOrBuriedInTheMix { get; set; }
           

        /*****************FILE*********************************/
        public bool? HasAllFileMetadataBeenChecked { get; set; }
        public string FileFormatOrCodec { get; set; }
        public string StandardOrFrameRate { get; set; }
        public string Resolution { get; set; }
        public bool? Progressive { get; set; }

        ///// <summary>
        ///// Not Required
        ///// </summary>
        //public bool? CLAPPresent { get; set; }


        public string ColourPrimaries { get; set; }
        public string TransferCharacteristics { get; set; }
        public string MatrixCoefficients { get; set; }
        public bool? TaggedOrLabelledAudioWBTVOnly { get; set; }
        public string AudioBitDepthOrRate { get; set; }
        public string IsAudioDiscreate { get; set; }

    }
}
