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
    public class ReportRepository :  BaseRepository, IReportRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public ReportRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                      $"ReportRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"ReportRepository expects ctor injection: {nameof(ILoggerService)}");

        }

        public IList<Header> Filter(ISearchParams searchParams) 
        {
            List<Header> list = null;

            try
            {

                //var parameters = new
                //{
                //    TapeNumber = searchParams.TapeNumber,
                //    QCOperator = searchParams.QCOperator,
                //    ClientIds = searchParams.ClientIds,
                //    SupplierIds = searchParams.SupplierIds,
                //    AssetTypes = searchParams.AssetTypes,
                //    DateMasterReceivedFrom = searchParams.DateMasterReceivedFrom,
                //    DateMasterReceivedTo = searchParams.DateMasterReceivedTo
                 
                //};


                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    list = connection.Query<Header>(
                        "[bward].[sel_Search]",
                        searchParams,
                        null,
                        false,
                        commandTimeout: 120,
                        commandType: CommandType.StoredProcedure).ToList();

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

            return list;


        }

    }
}
