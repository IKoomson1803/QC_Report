using System;
using System.Linq;
using System.Data;
using System.Configuration;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;
using Dapper;


namespace Deluxe.QCReport.Common.Repositories
{
    public class BanijayRightsTextDetailsRepository : BaseRepository, IBanijayRightsTextDetailsRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public BanijayRightsTextDetailsRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"BanijayRightsTextDetailsRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"BanijayRightsTextDetailsRepository expects ctor injection: {nameof(ILoggerService)}");


        }



        public IBanijayRightsTextDetails Get(int qcNum, int subQCNum)
        {
            IBanijayRightsTextDetails textDetails = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    textDetails = new BanijayRightsTextDetails();

                    var parameters = new
                    {
                        QCNum = qcNum,
                        SubQCNum = subQCNum
                    };

                    textDetails = connection.Query<BanijayRightsTextDetails>(
                                     StoredProcedure.BanijayRights.sel_GetBanijayRightsTextDetails.ToString(),
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

            return textDetails;
        }

        public bool Save(IBanijayRightsTextDetails textDetails)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.BanijayRights.ins_up_InsertOrUpdateBanijayRightsTextDetails.ToString(),
                                   textDetails,
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
