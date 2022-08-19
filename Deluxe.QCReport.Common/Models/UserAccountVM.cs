using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Deluxe.QCReport.Common;

namespace Deluxe.QCReport.Common.Models
{
    public class UserAccountVM
    {

       
        public List<UserAccount> Users { get; set; }
        public UserAccount User { get; set; }
        public bool ResponseSuccess { get; set; }
        public string ResponseText { get; set; }
        public int? SecurityLevel { get; set; }

        public UserAccountVM()
        {
            Users = new List<UserAccount>();
            User = new UserAccount();
        }
    }
}
