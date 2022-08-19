using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class ChecklistDPP : IChecklistDPP
    {
        public int Id { get; set; }
        public int QCNum { get; set; }
        public int SubQCNum { get; set; }
        public bool ChecklistCompleted { get; set; }

        public bool? AQCWarningsReviewed { get; set; }
        public bool? PSEReportReviewed { get; set; }
        public bool? AS11DPPMetadataChecked { get; set; }
        public bool? AudioChannelLayoutMatchesMetadata { get; set; }
        public bool? MultichannelAudioMetadataMatches { get; set; }
        public bool? MultichannelDownMixSoundPhaseChecked { get; set; }
        public bool? ClockOrSlateInformationMatchesMetadata { get; set; }
        public bool? AFDCorrect { get; set; }

        public bool? StillsAreDeinterlacedCorrectly { get; set; }
        public bool? LineUpStartsAt_09_59_30_00 { get; set; }
        public bool? FirstPartClockOrSlateStartsAt_09_59_50_00 { get; set; }
        public bool? FirstPartProgrammeStartsAt_10_00_00_00 { get; set; }
        public bool? CaptionsInsideSafeArea { get; set; }
        public bool? EndCreditsMeetBroadcasterBranding { get; set; }
        public bool? RollersAndMotionGFXAreInterlacedAndSmooth { get; set; }
        public bool? FreezeOrlivingHoldPresentAtEnd { get; set; }
    }

}
