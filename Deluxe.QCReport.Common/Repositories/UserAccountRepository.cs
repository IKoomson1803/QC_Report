using System;
using System.Data;
using System.Linq;
using System.Configuration;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.LINQ;
using Deluxe.QCReport.Common.Models;
using Dapper;

namespace Deluxe.QCReport.Common.Repositories
{
    public class UserAccountRepository : BaseRepository, IUserAccountRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public UserAccountRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"UserAccountRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"UserAccountRepository expects ctor injection: {nameof(ILoggerService)}");


        }

        public static UserAccount GetUserAccount(string username)
        {

            using (DataClassesDataContext DC = new DataClassesDataContext())
            {
                try
                {
                    var rUser = (from u in DC.qcUsers
                                    where u.UserName == username && !u.Deleted.HasValue
                                    select u).FirstOrDefault();

                   // var rUser = resultSql.Where(u => u.UserName == username && !u.Deleted.HasValue).FirstOrDefault();

                    if (rUser != null )
                    {
                        int secLvl = 0;

                        if (rUser.SecurityLevel.HasValue) { secLvl = rUser.SecurityLevel.Value; }

                        if (rUser.Location == 1)
                        {
                            rUser.Location = 9;
                        }

                        return new UserAccount(){
                            qcUserId = rUser.qcUserID,
                            UserName = rUser.UserName.Trim(), 
                            UserNameText =  rUser.UserName.Trim(),
                            SecurityLevel = secLvl,
                            FullName = rUser.FullName.Trim(),
                            Phone = rUser.Phone,
                            Deleted = rUser.Deleted,
                            Location = rUser.Location
                        };
                    }
                    else { return null; }
                }
                catch (Exception ex )
                {

                    return null;
                }

            }

        }

        public static UserAccount GetUserAccountDetails(string username)
        {
            if (string.IsNullOrEmpty(username))
            {
                return null;
            }

            using (DataClassesDataContext DC = new DataClassesDataContext())
            {
                try
                {
                    var rUser = (from u in DC.qcUsers
                                 where u.FullName.ToLower().Trim() == username.ToLower().Trim() && (!u.Deleted.HasValue || (u.Deleted.HasValue && u.Deleted == 0))
                                 select u).FirstOrDefault();

                    // var rUser = resultSql.Where(u => u.UserName == username && !u.Deleted.HasValue).FirstOrDefault();

                    if (rUser != null)
                    {
                        int secLvl = 0;

                        if (rUser.SecurityLevel.HasValue) { secLvl = rUser.SecurityLevel.Value; }

                        if (rUser.Location == 1)
                        {
                            rUser.Location = 9;
                        }

                        return new UserAccount()
                        {
                            qcUserId = rUser.qcUserID,
                            UserName = rUser.UserName.Trim(),
                            UserNameText = rUser.UserName.Trim(),
                            SecurityLevel = secLvl,
                            FullName = rUser.FullName.Trim(),
                            Phone = rUser.Phone,
                            Deleted = rUser.Deleted,
                            Location = rUser.Location
                        };
                    }
                    else { return null; }
                }
                catch (Exception ex)
                {

                    return null;
                }

            }

        }

        public static UserAccount GetUserAccountDetailsById(int id)
        {
            if (id == 0)
            {
                return null;
            }

            using (DataClassesDataContext DC = new DataClassesDataContext())
            {
                try
                {
                    var rUser = (from u in DC.qcUsers
                                 where u.qcUserID == id && (!u.Deleted.HasValue || (u.Deleted.HasValue && u.Deleted == 0))
                                 select u).FirstOrDefault();

                    // var rUser = resultSql.Where(u => u.UserName == username && !u.Deleted.HasValue).FirstOrDefault();

                    if (rUser != null)
                    {
                        int secLvl = 0;

                        if (rUser.SecurityLevel.HasValue) { secLvl = rUser.SecurityLevel.Value; }

                        if (rUser.Location == 1)
                        {
                            rUser.Location = 9;
                        }

                        return new UserAccount()
                        {
                            qcUserId = rUser.qcUserID,
                            UserName = rUser.UserName.Trim(),
                            UserNameText = rUser.UserName.Trim(),
                            SecurityLevel = secLvl,
                            FullName = rUser.FullName.Trim(),
                            Phone = rUser.Phone,
                            Deleted = rUser.Deleted,
                            Location = rUser.Location
                        };
                    }
                    else { return null; }
                }
                catch (Exception ex)
                {

                    return null;
                }

            }

        }

        public static int GetSecurityLevel(string username)
        {

            int result = 0;

            using (DataClassesDataContext DC = new DataClassesDataContext())
            {
                try
                {
                    var resultSql = (from u in DC.qcUsers
                                     where u.UserName == username && !u.Deleted.HasValue
                                    select u).FirstOrDefault();

                    //var rUser = resultSql.Single(u => u.UserName == username && !u.Deleted.HasValue);

                    if (resultSql != null && resultSql.SecurityLevel.HasValue)
                    {
                        result = resultSql.SecurityLevel.Value; 
                    }
                }
                catch (Exception)
                {
                    
                }

            }

            return result;
        }


        public IUserAccount GetUserDetails(string username)
        {
            IUserAccount user = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    user = new UserAccount();

                    var parameters = new
                    {
                        UserName = username
                    };

                    user = connection.Query<UserAccount>(
                                     StoredProcedure.User.sel_GetUserByUsername.ToString(),
                                     parameters, 
                                     null,
                                     false,
                                     null,
                                     commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
                //throw;
            }

            return user;


        }

        public bool Insert(IUserAccount user)
        {
            bool inserted = false;

            try
            {
                using (DataClassesDataContext DC = new DataClassesDataContext())
                {
                    try
                    {
                        // Check for deleted user
                        var resultSql = (from u in DC.qcUsers
                                         where u.UserName == user.UserNameText
                                         select u).FirstOrDefault();

                        //var rUser = resultSql.Single(u => u.UserName == username && !u.Deleted.HasValue);

                        if (resultSql != null)
                        {
                            user.qcUserId = resultSql.qcUserID;
                        }
                    }
                    catch (Exception)
                    {

                    }

                }

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                   // var parameters = PopulateParametersForInsert(user);

                    connection.Execute(
                                   StoredProcedure.User.ins_up_InsertOrUpdateUser.ToString(),
                                   user,
                                   null,
                                   null,
                                   commandType: CommandType.StoredProcedure);

                    inserted = true;

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
                throw;
            }

            return inserted;
        }

        public bool Update(IUserAccount user)
        {
            bool updated = false;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                   // var parameters = PopulateParametersForUpdate(user);

                    connection.Execute(
                                   StoredProcedure.User.ins_up_InsertOrUpdateUser.ToString(),
                                   user,
                                   null,
                                   null,
                                   commandType: CommandType.StoredProcedure);

                    updated = true;

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
                throw;
            }

            return updated;
        }

        public List<string> GetUsers()
        {
           List<string> users = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                   

                    users = connection.Query<string>(
                                     StoredProcedure.User.sel_GetUsers.ToString(),
                                     null,
                                     null,
                                     false,
                                     null,
                                     commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
                //throw;
            }


            return users;
        }

        public List<string> GetRevisedByUsers()
        {
            List<string> users = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {


                    users = connection.Query<string>(
                                     StoredProcedure.User.sel_GetRevisedByUsers.ToString(),
                                     null,
                                     null,
                                     false,
                                     null,
                                     commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
                //throw;
            }


            return users;
        }

        public IList<UserAccount> GetUsersList()
        {
            List<UserAccount> users = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {


                    users = connection.Query<UserAccount>(
                                     StoredProcedure.User.sel_GetUsersList.ToString(),
                                     null,
                                     null,
                                     false,
                                     null,
                                     commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
                //throw;
            }


            return users;
        }
    }
}
