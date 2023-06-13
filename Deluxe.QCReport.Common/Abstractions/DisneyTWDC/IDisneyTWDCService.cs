using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions.DisneyTWDC
{
    public interface IDisneyTWDCService
    {
        IDisneyTWDCProgrammeDetails GetProgrammeDetails(int qcNum, int subQCNum);

        bool SaveProgrammeDetails(IDisneyTWDCProgrammeDetails programmeDetails);
    }
}
