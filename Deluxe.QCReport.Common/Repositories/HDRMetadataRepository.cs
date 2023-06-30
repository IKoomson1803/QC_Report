using System;
using System.Linq;
using System.Data;
using System.Configuration;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;
using Dapper;

namespace Deluxe.QCReport.Common.Repositories
{
    public class HDRMetadataRepository : BaseRepository, IHDRMetadataRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public HDRMetadataRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"HDRMetadataRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"HDRMetadataRepository expects ctor injection: {nameof(ILoggerService)}");


        }

        public IHDRMetadata Get(int qcNum, int subQCNum)
        {
            IHDRMetadata metadata = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    metadata = new HDRMetadata();

                    var parameters = new
                    {
                        QCNum = qcNum,
                        SubQCNum = subQCNum
                    };

                    metadata = connection.Query<HDRMetadata>(
                                     StoredProcedure.HDRMMetadata.sel_GetHDRMMetadata.ToString(),
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

            if(metadata == null)
            {
                metadata = new HDRMetadata() 
                { 
                 QCNum = qcNum,
                 SubQCNum = subQCNum
                };
            }


            return metadata;
        }

        public bool Save(IHDRMetadata metadata)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.HDRMMetadata.ins_up_InsertOrUpdateHDRMMetadata.ToString(),
                                   metadata,
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
