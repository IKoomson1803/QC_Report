using System;
using System.Configuration;
using System.Data;
//using Deluxe.QCReport.Common;
using Deluxe.QCReport.Common.Abstractions;
using Dapper;

namespace Deluxe.QCReport.Common.Repositories
{
           public class LoggerRepository : BaseRepository, ILoggerRepository
        {
            private readonly ConnectionStringSettings _conn;

            public LoggerRepository(ConnectionStringSettings connString)
            {

                if (connString == null)
                {
                    throw new ArgumentNullException(
                        "LoggerRepository expects ctor injection");
                }

                _conn = connString;
            }


            public void LogUserActivity(ILoggerItem loggerItem)
            {

                try
                {
                    using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                    {

                        var parameters = new
                        {
                            Category = loggerItem.Category.ToString(),
                            ActivityType = loggerItem.ActivityType.ToString(),
                            Source = loggerItem.Source,
                            Details = loggerItem.Details,
                            UserId = loggerItem.UserId,
                            IPAddress = loggerItem.IPAddress
                        };

                        connection.Execute(
                                       StoredProcedure.Logger.ins_LogUserActivity.ToString(),
                                       parameters,
                                       null,
                                       null,
                                       commandType: CommandType.StoredProcedure);
                    }


                }
                catch (Exception ex)
                {
                    string errorMessage = ex.Message;
                }

            }
            public void LogSystemActivity(ILoggerItem loggerItem)
            {
                try
                {
                    using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                    {

                        var parameters = new
                        {
                            Category = loggerItem.Category.ToString(),
                            Source = loggerItem.Source,
                            Details = loggerItem.Details,
                            UserId = loggerItem.UserId,
                            IPAddress = loggerItem.IPAddress
                        };

                        connection.Execute(
                                       StoredProcedure.Logger.ins_LogSystemActivity.ToString(),
                                       parameters,
                                       null,
                                       null,
                                       commandType: CommandType.StoredProcedure);
                    }


                }
                catch (Exception ex)
                {
                    string errorMessage = ex.Message;
                }
            }

            public void LogMessage(ILoggerItem loggerItem)
            {
                try
                {
                    using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                    {

                        var parameters = new
                        {
                            Category = loggerItem.Category,
                            Source = loggerItem.Source,
                            Details = loggerItem.Details,
                            UserId = loggerItem.UserId,
                            IPAddress = loggerItem.IPAddress
                        };

                        connection.Execute(
                                       StoredProcedure.Logger.ins_LogSystemActivity.ToString(),
                                       parameters,
                                       null,
                                       null,
                                       commandType: CommandType.StoredProcedure);
                    }


                }
                catch (Exception ex)
                {
                    string errorMessage = ex.Message;
                }
            }

        }
    
}
