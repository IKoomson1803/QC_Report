using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Deluxe.QCReport.Common.Models
{
    public class HeaderVM
    {
        public string QcWONumber { get; set; }
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public int This_part { get; set; }
        public int Tot_Part { get; set; }
        public string Pono { get; set; }
        public DateTime? QC_date { get; set; }
        public string AssetType { get; set; }
        public string Aspect { get; set; }
        public int CustId { get; set; }
        public string CustName { get; set; }
        public string Show { get; set; }
        public string Epis_no { get; set; }
        public string Epis_name { get; set; }
        public string Version { get; set; }
        public string Format { get; set; }
        public string Standard { get; set; }
        public string TRT { get; set; }
        public string TapeDesc1 { get; set; }
        public string TapeNumber { get; set; }
        public string Filename { get; set; }
        public string Subtitle { get; set; }
        public string HLanguage { get; set; }
        public string Status { get; set; }
        public string HeadLogo { get; set; }
        public string TailLogo { get; set; }
        public string QCType { get; set; }
        public string Timecode { get; set; }

    }
}