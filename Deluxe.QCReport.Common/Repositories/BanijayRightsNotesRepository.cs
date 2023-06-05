using System;
using System.Linq;
using System.Data;
using System.Configuration;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;
using Dapper;

namespace Deluxe.QCReport.Common.Repositories 
{
    public class BanijayRightsNotesRepository : BaseRepository, IBanijayRightsNotesRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public BanijayRightsNotesRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"BanijayRightsNotesRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"BanijayRightsNotesRepository expects ctor injection: {nameof(ILoggerService)}");


        }

        public bool SaveBanijayRightsNotes(IBanijayRightsNotes banijayRightsNotes)
        {
            bool saved = false;

            try
            {
                var parameters = new
                {
                    QCNum = banijayRightsNotes.QCNum,
                    SubQCNum = banijayRightsNotes.SubQCNum,
                    Comments = banijayRightsNotes.Comments,
                    QCDate = banijayRightsNotes.QCDate,
                    QCActionType = banijayRightsNotes.QCActionType,
                    QCVendor = banijayRightsNotes.QCVendor,
                    QCOperator = banijayRightsNotes.QCOperator,
                    QCKit = banijayRightsNotes.QCKit
                };



                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.BanijayRights.up_UpdateBanijayRightsNotes.ToString(),
                                   parameters,
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
                //throw;
            }

            return saved;

        }

        public IBanijayRightsNotes GetBanijayRightsNotes(int QCNum, int SubQCNum)
        {

            IBanijayRightsNotes banijayRightsNotes = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    banijayRightsNotes = new BanijayRightsNotes();

                    var parameters = new
                    {
                        Qcnum = QCNum,
                        subQcnum = SubQCNum
                    };

                    banijayRightsNotes = connection.Query<BanijayRightsNotes>(
                                     StoredProcedure.BanijayRights.sel_GetBanijayRightsNotes.ToString(),
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

            if (banijayRightsNotes == null)
            {
                banijayRightsNotes = new BanijayRightsNotes()
                {
                    QCNum= QCNum,
                    SubQCNum = SubQCNum
                };
            }

            return banijayRightsNotes;
        }
    }
}
