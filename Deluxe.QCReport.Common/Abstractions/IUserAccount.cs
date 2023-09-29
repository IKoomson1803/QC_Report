using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IUserAccount
    {
       
        int qcUserId { get; set; }
        int? Location { get; set; }
        int? SecurityLevel { get; set; }
        string UserName { get; set; }
        string UserNameText { get; set; }
        string FullName { get; set; }
        string Phone { get; set; }
        byte? Deleted { get; set; }
        string LocationName { get; set; }
        string Role { get; set; }
    }
}
