using System;
using System.ComponentModel;


namespace Deluxe.QCReport.Common.Models
{
    public class ExportToExcel
    {
        [DisplayName("Customer")]
        public string CustName { get; set; }

        [DisplayName("Title")]
        public string Show { get; set; }

        [DisplayName("Episode No.")]
        public string Epis_no { get; set; }

        [DisplayName("Episode Name")]
        public string Epis_Name { get; set; }

        [DisplayName("Status")]
        public string Eval_Stat { get; set; }

        public string Filename { get; set; }

        [DisplayName("QC No.")]
        public int Qcnum { get; set; }

        [DisplayName("Revision No.")]
        public int subQcnum { get; set; }

        [DisplayName("Work Order No.")]
        public string Wonum { get; set; }

        [DisplayName("QC Operator #1")]
        public string FullName { get; set; }

        [DisplayName("QC Date #1")]
        public DateTime QC_date { get; set; }

        [DisplayName("QC Operator #2")]
        public string FullName2 { get; set; }

        [DisplayName("QC Date #2")]
        public DateTime? QC_Date_2 { get; set; }

        [DisplayName("Revised By #1")]
        public string Revised_By { get; set; }

        //[DisplayName("Revised Date #1")]
        //public DateTime revised_date { get; set; }

        [DisplayName("Revised By #2")]
        public string Revised_By_2 { get; set; }

        //[DisplayName("Revised Date #2")]
        //public DateTime revised_date_2 { get; set; }
      
        public string Version { get; set; }
      
    }
}
