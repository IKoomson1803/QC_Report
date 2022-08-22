﻿using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class DPPCommBroadcasters : DPPBase, IDPPCommBroadcasters
    {
        public string ProductPlacementLogoPresentAndInSafeArea { get; set; }
        public string SponsorshipHeadAndTailPresent { get; set; }
        public string TAndCsWithinSafeArea { get; set; }

    }
}
