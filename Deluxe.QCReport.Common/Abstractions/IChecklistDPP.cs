using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IChecklistDPP
    {
        int Id { get; set; }
        int QCNum { get; set; }
        int SubQCNum { get; set; }
        bool ChecklistCompleted { get; set; }
        bool? AQCWarningsReviewed { get; set; }
        bool? PSEReportReviewed { get; set; }
        bool? AS11DPPMetadataChecked { get; set; }
        bool? AudioChannelLayoutMatchesMetadata { get; set; }
        bool? MultichannelAudioMetadataMatches { get; set; }
        bool? MultichannelDownMixSoundPhaseChecked { get; set; }
        bool? ClockOrSlateInformationMatchesMetadata { get; set; }
        bool? AFDCorrect { get; set; }
        bool? StillsAreDeinterlacedCorrectly { get; set; }
        bool? LineUpStartsAt_09_59_30_00 { get; set; }
        bool? FirstPartClockOrSlateStartsAt_09_59_50_00 { get; set; }
        bool? FirstPartProgrammeStartsAt_10_00_00_00 { get; set; }
        bool? CaptionsInsideSafeArea { get; set; }
        bool? EndCreditsMeetBroadcasterBranding { get; set; }
        bool? RollersAndMotionGFXAreInterlacedAndSmooth { get; set; }
        bool? FreezeOrlivingHoldPresentAtEnd { get; set; }

    }
}
