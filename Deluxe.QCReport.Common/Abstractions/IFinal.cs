using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IFinal
    {
        int Qcnum { get; set; }
        int subQcnum { get; set; }
        int? GradingScale { get; set; }
        string EvalStatus { get; set; }
        int? GradeVideo { get; set; }
        int? GradeAudio { get; set; }
        int? GradeOverall { get; set; }


        string OverallComments { get; set; }

        string AudioComments { get; set; }

        string VideoComments { get; set; }

        string OTPercent { get; set; }
        string OTVersion { get; set; }
        string CTPercent { get; set; }
        string CTVersion { get; set; }
        string CapPercent { get; set; }
        string CapVersion { get; set; }
        string BroadcastSuitable { get; set; }
        string BroadcastSuitableReason { get; set; }
        string DVDBluRaySuitable { get; set; }
        string DVDBluRaySuitableReason { get; set; }
        string VODSuitable { get; set; }
        string VODSuitableReason { get; set; }
        string QCType { get; set; }

    }
}
