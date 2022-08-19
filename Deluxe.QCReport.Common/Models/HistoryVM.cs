using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Deluxe.QCReport.Common.Models
{
    public class HistoryVM
    {
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public string Revised_By { get; set; }
        public DateTime? Revised_Date { get; set; }
        public string Revised_By_2 { get; set; }
        public DateTime? Revised_Date_2 { get; set; }
        public int? OperatorId { get; set; }
        public string FullName { get; set; }
        public DateTime? QC_Date { get; set; }

        public int? OperatorId_2 { get; set; }
        public string FullName_2 { get; set; }
        public DateTime? QC_Date_2 { get; set; }
        public string Operator_Activity { get; set; }
        public string Operator_2_Activity { get; set; }

        public string Bay_Num { get; set; }
        public string Bay_Num_2 { get; set; }
        public string AssetType { get; set; }
        public string QC_VTR { get; set; }
        public string QC_VTR_2 { get; set; }
        public string Stock_Mfg { get; set; }
        public string Stock_Batch { get; set; }
        public DateTime? Rec_Date { get; set; }
        public string Rec_VTR { get; set; }
        public string Rec_Fac { get; set; }
        public string Src_Format { get; set; }
        public string Src_Standard { get; set; }
        public string Src_Desc { get; set; }
        public string AddInfo { get; set; }
        public string textless { get; set; }
        public string Duration { get; set; }
    }
}
