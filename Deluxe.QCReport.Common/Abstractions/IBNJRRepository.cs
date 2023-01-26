using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Abstractions
{
    /// <summary>
    ///  Banijay Rights Programme Details repository interface
    /// </summary>
    public interface IBNJRRepository
    {
        IBNJRProgrammeDetails GetProgrammeDetails(int qcNum, int subQCNum);

        bool SaveProgrammeDetails(IBNJRProgrammeDetails programmeDetails);
    }
}
