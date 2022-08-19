using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IUserAccountService
    {
        IUserAccount GetUserDetails(string username);
        bool InsertOrUpdateUser(IUserAccount user);
        List<string> GetUsers();
        List<string> GetRevisedByUsers();
    }
}
