using System;
using System.Linq;
using System.Data;
using System.Configuration;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;
using Dapper;

namespace Deluxe.QCReport.Common.Repositories
{
    public class ESIFinalRepository : BaseRepository, IESIFinalRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public ESIFinalRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"ESIFinalRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"ESIFinalRepository expects ctor injection: {nameof(ILoggerService)}");


        }



        public IESIFinal GetESIFinal(int QCNum, int SubQCNum)
        {
            IESIFinal esiFinal = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    esiFinal = new ESIFinal();

                    var parameters = new
                    {
                        Qcnum = QCNum,
                        subQcnum = SubQCNum
                    };

                    esiFinal = connection.Query<ESIFinal>(
                                     StoredProcedure.ESIFinal.sel_GetESIFinal.ToString(),
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

            if(esiFinal == null)
            {
                esiFinal = new ESIFinal()
                {
                    Qcnum = QCNum,
                    subQcnum = SubQCNum
                };
            }

            return esiFinal;
        }

        public bool SaveESIFinal(IESIFinal esiFinal)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.ESIFinal.up_UpdateESIFinal.ToString(),
                                   esiFinal,
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

        public bool SaveBanijayRightsNotes(IESIFinal esiFinal)
        {
            bool saved = false;

            try
            {
                var parameters = new
                {
                    QCNum = esiFinal.Qcnum,
                    SubQCNum = esiFinal.subQcnum,
                    Comments = esiFinal.Comments,
                    QCDate = esiFinal.QCDate,
                    QCActionType = esiFinal.QCActionType,
                    QCVendor = esiFinal.QCVendor,
                    QCOperator = esiFinal.QCOperator,
                    QCKit = esiFinal.QCKit
                };



                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.ESIFinal.up_UpdateBanijayRightsNotes.ToString(),
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

        public IESIFinal GetBanijayRightsNotes(int QCNum, int SubQCNum)
        {

            IESIFinal esiFinal = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    esiFinal = new ESIFinal();

                    var parameters = new
                    {
                        Qcnum = QCNum,
                        subQcnum = SubQCNum
                    };

                    esiFinal = connection.Query<ESIFinal>(
                                     StoredProcedure.ESIFinal.sel_GetBanijayRightsNotes.ToString(),
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

            if (esiFinal == null)
            {
                esiFinal = new ESIFinal()
                {
                    Qcnum = QCNum,
                    subQcnum = SubQCNum
                };
            }

            return esiFinal;
        }
    }
}
