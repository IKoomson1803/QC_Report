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
    public class AspectRatioRepository : BaseRepository, IAspectRatioRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public AspectRatioRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"AspectRatioRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"AspectRatioRepository expects ctor injection: {nameof(ILoggerService)}");


        }

        public List<string> GetAll()
        {
            List<string> list = null;

            try
            {


                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {


                    list = connection.Query<string>(
                                     StoredProcedure.AspectRatio.sel_GetAspectRatios.ToString(),
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

        public IAspectRatio GetByName(string aspectRatio)
        {
            IAspectRatio ar   = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                   ar = new AspectRatioVM();

                    var parameters = new
                    {
                        AspectRatio = aspectRatio
                    };

                    ar = connection.Query<AspectRatioVM>(
                                     StoredProcedure.AspectRatio.sel_GetAspectRatioDetails.ToString(),
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

            return ar;
        }

        public bool Save(IAspectRatio aspectRatio)
        {
            bool saved = false;

            try
            {
                using (DataClassesDataContext DC = new DataClassesDataContext())
                {
                    try
                    {
                        // Check for duplicates
                        var resultSql = (from l in DC.optAspectRatios
                                         where l.AspectID == aspectRatio.AspectID
                                         select l).FirstOrDefault();


                        if (resultSql != null)
                        {
                            aspectRatio.AspectID = resultSql.AspectID;
                        }
                    }
                    catch (Exception)
                    {

                    }

                }

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.AspectRatio.ins_up_InsertOrUpdateAspectRatio.ToString(),
                                   aspectRatio,
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
