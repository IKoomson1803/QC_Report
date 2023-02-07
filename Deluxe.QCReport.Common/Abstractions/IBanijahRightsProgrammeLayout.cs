using System;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IBanijahRightsProgrammeLayout
    {
        int Id { get; set; }
        int QCNum { get; set; }
        int SubQCNum { get; set; }
        string ProgrammeIn { get; set; }
        string ProgrammeOut { get; set; }
        string TotalLengthIncludingBreaks { get; set; }
        string ProgrammeDuration { get; set; }
        int? NumberOfParts { get; set; }
        IList<BanijahRightsTapeLayout> TapeLayouts { get; set; }
    }
}
