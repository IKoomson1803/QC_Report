using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    /// <summary>
    ///  Banijay Rights Programme Details service interface
    /// </summary>
    public interface IBNJRService
    {
        IBNJRProgrammeDetails GetProgrammeDetails(int qcNum, int subQCNum);

        bool SaveProgrammeDetails(IBNJRProgrammeDetails programmeDetails);
    }
}
