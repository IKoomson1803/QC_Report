using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class ReportVM
    {
        public string WONum { get; set; }
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public string QCTtype { get; set; }
        public string CustName { get; set; }

        public string Address { get; set; }
        public bool IsChecklistCompleted { get; set; }

        public HeaderVM Header_VM { get; set; }
        public HistoryVM History_VM { get; set; }
        public FinalVM Final_VM { get; set; }
        public AudioTCVM AudioTC_VM { get; set; }
        public IndividualSpecsVM IndividualSpecs_VM { get; set; }
        public OverallSpecsVM OverallSpecs_VM { get; set; }
        public TapeLayoutVM TapeLayout_VM { get; set; }

    }
}
