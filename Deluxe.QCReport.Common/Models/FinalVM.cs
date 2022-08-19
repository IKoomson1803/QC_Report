using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Deluxe.QCReport.Common.Models
{
    
    public class FinalVM
    {
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public int? GradingScale { get; set; }
        public string EvalStatus { get; set; }
        public int? GradeVideo { get; set; }
        public int? GradeAudio { get; set; }
        public int? GradeOverall { get; set; }

       
        public string OverallComments { get; set; }

        public string AudioComments { get; set; }

        public string VideoComments { get; set; }

        public string OTPercent { get; set; }
        public string OTVersion { get; set; }
        public string CTPercent { get; set; }
        public string CTVersion { get; set; }
        public string CapPercent { get; set; }
        public string CapVersion { get; set; }
        public string BroadcastSuitable { get; set; }
        public string BroadcastSuitableReason { get; set; }
        public string DVDBluRaySuitable { get; set; }
        public string DVDBluRaySuitableReason { get; set; }
        public string VODSuitable { get; set; }
        public string VODSuitableReason { get; set; }
        public string QCType { get; set; }


    }
}
