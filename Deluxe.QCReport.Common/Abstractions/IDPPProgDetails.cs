using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IDPPProgDetails
    {
        string ProgrammeDetails { get; set; }
        string Duration { get; set; }
        string ProductionNumber { get; set; }
        string Filename { get; set; }
        string SeriesTitle { get; set; }
        string ProgrammeTitleAndNumber { get; set; }
        string EpisodeTitleAndNumber { get; set; }
    }
}
