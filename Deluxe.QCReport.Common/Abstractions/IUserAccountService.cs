﻿using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IUserAccountService
    {
        IUserAccount GetUserDetails(string username);
        bool InsertOrUpdateUser(IUserAccount user);
        List<string> GetUsers();
        List<string> GetRevisedByUsers();
        IList<UserAccount> GetUsersList();
    }
}
