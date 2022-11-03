using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class ChecklistBanijayRights : ChecklistBase
    {
        public bool IsMeasurements { get; set; }

       /************* MEASUREMENTS *****************************************/
       //  File Details
        public bool? FileToSpec { get; set; }
        public bool? DecodeCheckPass { get; set; }

        // Video Codec
        public string VideoCodec { get; set; }
        public string ConfirmVideoFormat { get; set; }
        public string Format { get; set; }
        public string Standard { get; set; }
        public string FrameRate { get; set; }
        public string VideoBitRate { get; set; }
        public string FrameSizeOrResolution { get; set; }
        public string AspectRatio { get; set; }

        // Audio Codec
        public string AudioCodec { get; set; }
        public string BitDepth { get; set; }
        public string AudioBitRate { get; set; }
        public string SampleRate { get; set; }
        public string Discrete { get; set; }

        //Metadata
        public string IsTheFileMetadataCorrect { get; set; }
        public string InterlacedOrProgressiveCorrectlyFlagged { get; set; }
        public string InterlacedOrProgressiveCorrectlyNotFlaggedReason { get; set; }
        public string CLAPPresent { get; set; }
        public string ColourPrimariesPresent { get; set; }
        public string TransferCharacteristicsPresent { get; set; }
        public string MatrixCoefficientsPresent { get; set; }


        /************** SPECIFICS **************************************************/
        // Video
        public string DisplayAspectRatioCorrect { get; set; }
        public string InterlacedVsProgressiveCheckedAndCorrect { get; set; }
        public string DoesTheFileContainLineup { get; set; }
        public string SlatePresent { get; set; }
        public string SlateInformationCorrect { get; set; }

        public string DoesTheProgrammeStartOnTheHour { get; set; }
        public string IsTheProgrammeSeamlessOrParted { get; set; }
        public string PartedBreaksLogged { get; set; }
        public string IfPartedSpecifyIfOneSecondBlackBetweenParts { get; set; }
        public string BumpersPresentAndLogged { get; set; }
        public string InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments { get; set; }
        public string DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram { get; set; }
        public string AllEndLogos { get; set; }  //New 

        // Textless
        public string AreTextlessElementsPresent { get; set; }
        public string AreThereTextlessCoversForAllTextedShots { get; set; }
        public string AreTheTextlessCoversTheSameTimingAsTextedShots { get; set; }
        public string IsTheGradeAndAspectRatioTheSameAsTextedShots { get; set; }
        public string IsThere10SecondsOfBlackBetweenProgrammeAndTextless { get; set; }
        public string IsThere10SecondsOfBlackBeforeEndOfFile { get; set; }

        //  Audio
        public bool? IsAudioLlayoutCorrect { get; set; }
        public bool? IsLineupToneCorrect { get; set; }
        public bool? IsLoudnessR128APass { get; set; }
        public string IsMAndEPresentAndComplete { get; set; }
        public string IsMixMinusNarrationPresentAndComplete { get; set; }
        public bool? MonoVsStereoChecked { get; set; }
        public bool? AudioInSync { get; set; }

        // WAV
        public bool? WAVSSupplied { get; set; }
        public string AllAssociatedWAVSPresent { get; set; }
        public string AllAssociatedWAVSNotPresentReason { get; set; }

        // Compliance Video 
        public bool? VideoComplianceCheckedAndLogged { get; set; }
        public bool? FlashingLightsOrEpilepsyWarningPresent { get; set; }
        public string VideoContentCensoredBleepedOrBlurred { get; set; }
        public bool? NudityPresent { get; set; }
        public bool? RudeGestures { get; set; }  // New
        public bool? HarmOrOffencePresentIncludingDrugAndAlcholAbuse { get; set; }  // New
        public bool? TimeSpecificTextPresent { get; set; }
        public bool? ProductPlacementPresent { get; set; }
        public bool? CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags { get; set; }

        // Compliance Audio 
        public bool? AudioComplianceCheckedAndLogged { get; set; }
        public string AudioContentCensoredBleepedOrBlurred { get; set; }
        public bool? ExtremeLanguagePresent { get; set; }
        public bool? TimeSpecificAudioPresent { get; set; }
    }

}
