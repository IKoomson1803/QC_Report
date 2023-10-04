using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IUserAccountRepository
    {
        IUserAccount GetUserDetails(string username);
        bool Save(IUserAccount user);
        List<string> GetUsers();
        List<string> GetRevisedByUsers();
        IList<UserAccount> GetUsersList();
    }
}
