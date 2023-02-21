using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class LogVM
    {
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public int GradingScale { get; set; }
        public int SourceFPS { get; set; }
        public string TCOffset { get; set; }
        public string QCStatus { get; set; } // Banijay Rights new template
        public QCTime CurrentQCTimes { get; set; }
        public List<QCTime> QCTimes { get; set; }
    }


    public class QCTime
    {
        public int? TimeID { get; set; }
        public string TC { get; set; }
        public string QCCode { get; set; }
        public string Note { get; set; }
        public string QCGrade { get; set; }
        public string Action { get; set; }
        public string Duration { get; set; }
        public bool InMaster { get; set; }
        public int? ItemNum { get; set; }
        public string ActionsForDisplay { get; set; }
        public string QCCodename { get; set; }

    }
}
