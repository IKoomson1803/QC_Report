using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Configuration;
using Deluxe.QCReport.Common.Abstractions.DisneyTWDC;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Models.DisneyTWDC;
using Dapper;

namespace Deluxe.QCReport.Common.Repositories.DisneyTWDC
{
    public class DisneyTWDCRepository : BaseRepository, IDisneyTWDCRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public DisneyTWDCRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"DisneyTWDCRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"DisneyTWDCRepository expects ctor injection: {nameof(ILoggerService)}");
        }




        public IDisneyTWDCProgrammeDetails GetProgrammeDetails(int qcNum, int subQCNum)
        {
            IDisneyTWDCProgrammeDetails progDetails = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    progDetails = new DisneyTWDCProgrammeDetails();

                    var parameters = new
                    {
                        QCNum = qcNum,
                        SubQCNum = subQCNum
                    };

                    progDetails = connection.Query<DisneyTWDCProgrammeDetails>(
                                     StoredProcedure.DisneyTWDC.sel_GetDisneyTWDCProgrammeDetails.ToString(),
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

            if (progDetails == null)
            {
                progDetails = new DisneyTWDCProgrammeDetails()
                {
                    QCNum = qcNum,
                    SubQCNum = subQCNum
                };
            }

            return progDetails;
        }

        public bool SaveProgrammeDetails(IDisneyTWDCProgrammeDetails programmeDetails)
        {
            bool saved = false;

            try
            {
                

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.DisneyTWDC.up_SaveDisneyTWDCProgrammeDetails.ToString(),
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
                //throw;
            }

            return saved;

        }
    }
}
