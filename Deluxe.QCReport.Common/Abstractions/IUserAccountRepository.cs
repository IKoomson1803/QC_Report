using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IUserAccountRepository
    {
        IUserAccount GetUserDetails(string username);
        bool Insert(IUserAccount user);
        bool Update(IUserAccount user);
        List<string> GetUsers();
        List<string> GetRevisedByUsers();
    }
}
