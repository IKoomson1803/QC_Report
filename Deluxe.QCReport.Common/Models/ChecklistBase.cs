using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class ChecklistBase
    {
        public int ChecklistId { set; get; }
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public int CustId { get; set; }
        //public string CustName { get; set; }
        public bool ChecklistCompleted { get; set; }
       /// <summary>
       /// File To Spec
       /// </summary>
        public bool? IsFile { get; set; }  
    }
}
