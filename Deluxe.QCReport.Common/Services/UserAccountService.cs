using System;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Services
{
    public  class UserAccountService : IUserAccountService
    {
        private readonly IUserAccountRepository _rep;

        public UserAccountService(IUserAccountRepository rep) 
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"UserAccountService expects ctor injection: {nameof(IUserAccountRepository)}");

        }

               
        public bool InsertOrUpdateUser(IUserAccount user)
        {
            if (user.qcUserId == 0)
            {
                return _rep.Insert(user);
            }
            else 
            {
                return _rep.Update(user);
            }
           
        }

        public IUserAccount GetUserDetails(string username)
        {
            return _rep.GetUserDetails(username);
        }

        public List<string> GetUsers()
        {
            return _rep.GetUsers();
        }

        public List<string> GetRevisedByUsers()
        {
            return _rep.GetRevisedByUsers();
        }


        public static UserAccount GetUserAccount(string username)
        {
            int idx = username.IndexOf("\\");

            if (idx > 0)
            { username = username.Substring(idx).Replace("\\", ""); }

            return UserAccountRepository.GetUserAccount(username);
        }

        public static UserAccount GetUserAccountDetails(string username)
        {
            return UserAccountRepository.GetUserAccountDetails(username);
        }

        public static UserAccount GetUserAccountDetailsById(int id)
        {
            return UserAccountRepository.GetUserAccountDetailsById(id);
        }

        public static int GetSecurityLevel(string username)
        {
            int idx = username.IndexOf("\\");

            if (idx > 0)
            { username = username.Substring(idx).Replace("\\", ""); }


            return UserAccountRepository.GetSecurityLevel(username);
        }

        public IList<UserAccount> GetUsersList()
        {
            return _rep.GetUsersList();
        }
    }
}
