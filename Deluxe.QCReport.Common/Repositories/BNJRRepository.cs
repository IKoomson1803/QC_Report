using System;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;
using Dapper;


namespace Deluxe.QCReport.Common.Repositories
{
    public class BNJRRepository :  BaseRepository, IBNJRRepository
    {

        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public BNJRRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"BNJRPRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"BNJRRepository expects ctor injection: {nameof(ILoggerService)}");


        }


        public IBNJRProgrammeDetails GetProgrammeDetails(int qcNum, int subQCNum)
        {

            IBNJRProgrammeDetails programmeDetails   = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    programmeDetails = new BNJRProgrammeDetails();

                     var parameters = new
                    {
                        QCNum = qcNum,
                        SubQCNum = subQCNum
                    };

                    programmeDetails = connection.Query<BNJRProgrammeDetails>(
                                     StoredProcedure.BanijayRights.sel_GetBanijayRightsProgrammeDetails.ToString(),
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

            }

            return programmeDetails;
        }

        public bool SaveProgrammeDetails(IBNJRProgrammeDetails programmeDetails)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.BanijayRights.ins_up_InsertOrUpdateBanijayRightsProgrammeDetails.ToString(),
                                   programmeDetails,
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
            }

            return saved;
        }
    }
}
