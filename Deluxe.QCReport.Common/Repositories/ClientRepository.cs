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
    public class ClientRepository : BaseRepository, IClientRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public ClientRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"ClientRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"ClientRepository expects ctor injection: {nameof(ILoggerService)}");


        }


        public List<string> GetClients()
        {
            List<string> list = null;

            try
            {


                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {


                    list = connection.Query<string>(
                                     StoredProcedure.Client.sel_GetClients.ToString(),
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


            return list;

        }

        public bool SaveClient(IClient client)
        {
            bool saved = false;

            if (string.IsNullOrWhiteSpace(client.CustName))
            {
                return false;
            }

            try
            {
                using (DataClassesDataContext DC = new DataClassesDataContext())
                {
                    try
                    {
                        // Check for duplicates
                        var resultSql = (from c in DC.qcClients
                                         where c.CustName == client.CustName
                                         select c).FirstOrDefault();


                        if (resultSql != null)
                        {
                            client.CustID = resultSql.CustID;
                        }
                    }
                    catch (Exception)
                    {
                        throw;
                    }

                }

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    
                    connection.Execute(
                                   StoredProcedure.Client.ins_up_InsertOrUpdateClient.ToString(),
                                   client,
                                   null,
                                   null,
                                   commandType: CommandType.StoredProcedure);

                    saved = true;

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
                 throw;
            }

            return saved;

        }

        public IClient GetClientDetails(string clientName) 
        {

            IClient client = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    client = new Client();

                    var parameters = new
                    {
                        CustName = clientName
                    };

                    client = connection.Query<Client>(
                                     StoredProcedure.Client.sel_GetClientDetails.ToString(),
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

            return client;

        }

        public IClient GetClientDetails(int qcNum, int subQCNum)
        {

            IClient client = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    client = new Client();

                    var parameters = new
                    {
                        QCNum = qcNum,
                        SubQCNum = subQCNum
                    };

                    client = connection.Query<Client>(
                                     StoredProcedure.Client.sel_GetClientDetailsByQCNum.ToString(),
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

            return client;

        }

        public IList<Client> GetClientsList()
        {
            List<Client> list = null;

            try
            {


                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {


                    list = connection.Query<Client>(
                                     StoredProcedure.Client.sel_GetClientsList.ToString(),
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


            return list;
        }

        public IClient GetClientDetails(int id)
        {
            IClient client = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    client = new Client();


                    client = connection.Query<Client>(
                                     StoredProcedure.Client.sel_GetClientById.ToString(),
                                     new { Id =  id},
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

            return client;
        }
    }
}
