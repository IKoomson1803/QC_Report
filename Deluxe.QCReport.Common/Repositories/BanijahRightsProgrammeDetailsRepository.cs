using System;
using System.Linq;
using System.Data;
using System.Configuration;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;
using Dapper;


namespace Deluxe.QCReport.Common.Repositories
{
    public class BanijahRightsProgrammeDetailsRepository :  BaseRepository, IBanijahRightsProgrammeDetailsRepository
    {

        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public BanijahRightsProgrammeDetailsRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"BanijahRightsProgrammeDetailsRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"BanijahRightsProgrammeDetailsRepository expects ctor injection: {nameof(ILoggerService)}");


        }


        public IBanijahRightsProgrammeDetails GetProgrammeDetails(int qcNum, int subQCNum)
        {

            IBanijahRightsProgrammeDetails programmeDetails   = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    programmeDetails = new BanijahRightsProgrammeDetails();

                     var parameters = new
                    {
                        QCNum = qcNum,
                        SubQCNum = subQCNum
                    };

                    programmeDetails = connection.Query<BanijahRightsProgrammeDetails>(
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

        public bool SaveProgrammeDetails(IBanijahRightsProgrammeDetails programmeDetails)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.BanijayRights.up_UpdateBanijayRightsProgrammeDetails.ToString(),
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
