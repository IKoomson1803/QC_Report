using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class UserAccount : IUserAccount
    {
        public int qcUserId { get; set; }
        public int? Location { get; set; }
        public int? SecurityLevel { get; set; }
        public string UserName { get; set; }
       public string FullName { get; set; }
        public string Phone { get; set; }
        public byte? Deleted { get; set; }
        public string LocationName { get; set; }
        public string Role { get; set; }
        public bool Active { get; set; }
    }
}
