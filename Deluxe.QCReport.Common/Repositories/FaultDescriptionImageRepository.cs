using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.LINQ;
using Deluxe.QCReport.Common.Models;
using Dapper;

namespace Deluxe.QCReport.Common.Repositories
{
    public class FaultDescriptionImageRepository : BaseRepository, IFaultDescriptionImageRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public FaultDescriptionImageRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                      $"FaultDescriptionImageRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"FaultDescriptionImageRepository expects ctor injection: {nameof(ILoggerService)}");


        }


        public bool Delete(int id)
        {
            bool deleted = false;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.FaultDescriptionImage.del_DeleteFaultDescriptionImage.ToString(),
                                    new { Id = id },
                                   null,
                                   null,
                                   commandType: CommandType.StoredProcedure);

                    deleted = true;

                }

            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
                //throw;
            }

            return deleted;
        }

        public List<FaultDescriptionImage> GetAll(int qcNum, int subQCNum)
        {
            List<FaultDescriptionImage> list = null;

            try
            {


                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    list = connection.Query<FaultDescriptionImage>(
                                     StoredProcedure.FaultDescriptionImage.sel_FaultDescriptionImages.ToString(),
                                     new { QCNum = qcNum, subQCNum = subQCNum },
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

        public IFaultDescriptionImage GetById(int id)
        {
            IFaultDescriptionImage item = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    item = connection.Query<FaultDescriptionImage>(
                                     StoredProcedure.FaultDescriptionImage.sel_GetFaultDescriptionImageById.ToString(),
                                     new { Id = id },
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

            return item;
        }

        public bool Save(IFaultDescriptionImage faultDescriptionImage)
        {
            bool saved = false;

            try
            {
                var parameters = new
                {
                    Id = faultDescriptionImage.Id,
                    QCNum = faultDescriptionImage.QCNum,
                    SubQCNum = faultDescriptionImage.SubQCNum,
                    Description = faultDescriptionImage.Description,
                    ImageName = faultDescriptionImage.ImageName,
                    ImagePath = faultDescriptionImage.ImagePath
                };


                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.FaultDescriptionImage.ins_up_InsertOrUpdateFaultDescriptionImage.ToString(),
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
    }

}
