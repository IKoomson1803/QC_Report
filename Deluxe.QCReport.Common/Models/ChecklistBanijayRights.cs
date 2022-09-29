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
        public bool? FileToSpec { get; set; }
        public bool? DecodeCheckPass { get; set; }
        public string Format { get; set; }
        public string Standard { get; set; }
        public string FrameRate { get; set; }
        public string VideoBitRate { get; set; }
        public string FrameSizeOrResolution { get; set; }
        public string AspectRatio { get; set; }
        public string BitDepth { get; set; }
        public string AudioBitRate { get; set; }
        public string SampleRate { get; set; }
        public bool? Discrete { get; set; }
        public bool? IsTheFileMetadataCorrect { get; set; }
        public bool? InterlacedOrProgressiveCorrectlyFlagged { get; set; }
        public string InterlacedOrProgressiveCorrectlyNotFlaggedReason { get; set; }
        public bool? CLAPPresent { get; set; }
        public string ColourPrimariesPresent { get; set; }
        public string TransferCharacteristicsPresent { get; set; }
        public string MatrixCoefficientsPresent { get; set; }


        /************** SPECIFICS **************************************************/
        public string DisplayAspectRatioCorrect { get; set; }
        public string InterlacedVsProgressiveCheckedAndCorrect { get; set; }
        public bool? DoesTheFileContainLineup { get; set; }
        public bool? IsTheSlatePresentAndInformationCorrect { get; set; }
        public bool? DoesTheProgrammeStartOnTheHour { get; set; }
        public bool? IsTheProgrammeSeamlessOrParted { get; set; }
        public bool? PartedBreaksLogged { get; set; }
        public bool? IfPartedSpecifyIfOneSecondBlackBetweenParts { get; set; }
        public bool? BumpersPresentAndLogged { get; set; }
        public bool? InternationalSalesAndDistributionBanijayRightsORESICreditPresentOrNotPresentWithinTheEndCreditRollerCheckedAndAddedToComments { get; set; }
        public bool? DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram { get; set; }
        public bool? AreTextlessElementsPresent { get; set; }
        public bool? AreThereTextlessCoversForAllTextedShots { get; set; }
        public bool? AreTheTextlessCoversTheSameTimingAsTextedShots { get; set; }
        public bool? IsTheGradeAndAspectRatioTheSameAsTextedShots { get; set; }
        public bool? IsThere10SecondsOfBlackBetweenProgrammeAndTextless { get; set; }
        public bool? IsThere10SecondsOfBlackBeforeEndOfFile { get; set; }
        public bool? IsAudioLlayoutCorrect { get; set; }
        public bool? IsLineupToneCorrect { get; set; }
        public bool? IsLoudnessR128APass { get; set; }
        public bool? IsMAndEPresentAndComplete { get; set; }
        public bool? IsMixMinusNarrationPresentAndComplete { get; set; }
        public bool? MonoVsStereoChecked { get; set; }
        public bool? AudioInSync { get; set; }
        public bool? WAVSSupplied { get; set; }
        public bool? AllAssociatedWAVSPresent { get; set; }
        public string AllAssociatedWAVSNotPresentReason { get; set; }
        public bool? VideoComplianceCheckedAndLogged { get; set; }
        public bool? FlashingLightsOrEpilepsyWarningPresent { get; set; }
        public bool? VideoContentCensoredBleepedOrBlurred { get; set; }
        public bool? NudityPresent { get; set; }
        public bool? TimeSpecificTextPresent { get; set; }
        public bool? ProductPlacementPresent { get; set; }
        public bool? CountrySpecificPhoneNumbersCompetitionsWebsitesHashtags { get; set; }
        public bool? AudioComplianceCheckedAndLogged { get; set; }
        public bool? AudioContentCensoredBleepedOrBlurred { get; set; }
        public bool? ExtremeLanguagePresent { get; set; }
        public bool? TimeSpecificAudioPresent { get; set; }
    }

}
