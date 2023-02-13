using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;
using Dapper;

namespace Deluxe.QCReport.Common.Repositories
{
    public class BanijahRightsProgrammeLayoutRepository : BaseRepository, IBanijahRightsProgrammeLayoutRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public BanijahRightsProgrammeLayoutRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"BanijahRightsProgrammeLayoutRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"BanijahRightsProgrammeLayoutRepository expects ctor injection: {nameof(ILoggerService)}");


        }

        public IBanijahRightsProgrammeLayout GetProgrammeLayout(int qcNum, int subQCNum)
        {
            var result = new BanijahRightsProgrammeLayout();

            try
            {
                /// https://dapper-tutorial.net/
                ///  https://www.aspdotnet-suresh.com/2015/02/dapper-get-multiple-results-from-stored-procedure-in-csharp-vbnet.html
                ///https://www.abhith.net/blog/dapper-execute-multiple-stored-procedures/
                using (var multi = OpenConnection(this._conn.ConnectionString).QueryMultiple(
                      StoredProcedure.BanijayRights.sel_GetBanijayRightsProgrammeLayout.ToString(),
                      new { QCNum = qcNum, SubQCNum = subQCNum },
                      null,
                      commandTimeout: 120,
                      commandType: CommandType.StoredProcedure))
                {
                    result = multi.Read<BanijahRightsProgrammeLayout>().FirstOrDefault();
                    
                    if(result != null)
                    {
                        result.TapeLayouts = multi.Read<BanijahRightsTapeLayout>().ToList();
                    }
                    else
                    {
                        result = new BanijahRightsProgrammeLayout() { QCNum = qcNum, SubQCNum = subQCNum };
                    }
                }

            }
            catch(Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
            }

            return result;
        }

        public bool SaveProgrammeLayout(IBanijahRightsProgrammeLayout programmeLayout)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.BanijayRights.ins_up_InsertOrUpdateBanijayRightsProgrammeLayout.ToString(),
                                   programmeLayout,
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

        public bool SaveTapeLayout(IBanijahRightsTapeLayout tapeLayout)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.BanijayRights.ins_up_InsertOrUpdateBanijayRightsTapeLayout.ToString(),
                                   tapeLayout,
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
