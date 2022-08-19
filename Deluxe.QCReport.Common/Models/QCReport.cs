using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class NewQCReport
    {
        public string QCWONumber { get; set; }
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public int CustId { get; set; }
        public string Customer { get; set; }
        public string QCType{ get; set; }
        public int UserId { get; set; }
        public string QCFullname { get; set; }
        public string AssetType { get; set; }
        
        public Dictionary<int, string> ClientNameList { get; set; }

    }
}
