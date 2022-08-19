using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IDPPCommBroadcasters
    {
        bool? ProductPlacementLogoPresentAndInSafeArea { get; set; }
        bool? SponsorshipHeadAndTailPresent { get; set; }
        bool? TAndCsWithinSafeArea { get; set; }

    }
}
