using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IDPPCommBroadcasters
    {
        string ProductPlacementLogoPresentAndInSafeArea { get; set; }
        string SponsorshipHeadAndTailPresent { get; set; }
        string TAndCsWithinSafeArea { get; set; }

    }
}
