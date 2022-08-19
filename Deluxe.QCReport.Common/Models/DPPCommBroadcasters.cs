using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class DPPCommBroadcasters : DPPBase, IDPPCommBroadcasters
    {
        public bool? ProductPlacementLogoPresentAndInSafeArea { get; set; }
        public bool? SponsorshipHeadAndTailPresent { get; set; }
        public bool? TAndCsWithinSafeArea { get; set; }

    }
}
