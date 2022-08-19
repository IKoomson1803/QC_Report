using Deluxe.QCReport.Common.Models;
using System;
using System.Linq;
using System.Data;
using System.Configuration;
using Deluxe.QCReport.Common.Abstractions;
using Dapper;


namespace Deluxe.QCReport.Common.Repositories
{
    public class ESISpecificsRepository : BaseRepository, IESISpecificsRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public ESISpecificsRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"ESISpecificsRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"ESISpecificsRepository expects ctor injection: {nameof(ILoggerService)}");


        }

        public IESISpecifics GetESISpecifics(int QCNum, int SubQCNum)
        {
            IESISpecifics esiSpecifics = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    esiSpecifics = new ESISpecifics();

                    var parameters = new
                    {
                        Qcnum = QCNum,
                        subQcnum = SubQCNum
                    };

                    esiSpecifics = connection.Query<ESISpecifics>(
                                     StoredProcedure.ESISpecifics.sel_GetESISpecifics.ToString(),
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

            if (esiSpecifics == null)
            {
                esiSpecifics = new ESISpecifics()
                {
                    Qcnum = QCNum,
                    subQcnum = SubQCNum
                };
            }

            return esiSpecifics;
        }

        public bool SaveESISpecifics(IESISpecifics esiSpecifics)
        {
            bool saved = false;

            try
            {
              
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                   
                    connection.Execute(
                                   StoredProcedure.ESISpecifics.up_UpdateESISpecifics.ToString(),
                                   esiSpecifics,
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
    }
}
