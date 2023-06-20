using Deluxe.QCReport.Common.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Configuration;
using Deluxe.QCReport.Common.Abstractions;
using Dapper;

namespace Deluxe.QCReport.Common.Repositories
{
    public class TextInfoRepository : BaseRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public TextInfoRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"TextInfoRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"TextInfoRepository expects ctor injection: {nameof(ILoggerService)}");


        }


        public TextInfoVM GetTextInfoDetails(int QCNum, int SubQCNum)
        {
            TextInfoVM result = new TextInfoVM();
            result.Qcnum = QCNum;
            result.subQcnum = SubQCNum;
            result.Timecodes = new List<TimeCodeVM>();

            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandTimeout = 600;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_SelectTextInfo]";
                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", QCNum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_Rev", SubQCNum));

                    _cmd.Connection.Open();

                    using (SqlDataReader DR = _cmd.ExecuteReader())
                    {
                        if (DR.HasRows)
                        {
                            
                            while (DR.Read())
                            {
                                TimeCodeVM tcItem = new TimeCodeVM();

                                tcItem.TextInfoId = Convert.ToInt32(DR["TextInfoID"]);
                                tcItem.TimecodeIn = DR["TimeCodeIn"].ToString().Trim();
                                tcItem.TimecodeOut = DR["TimeCodeOut"].ToString().Trim();
                                tcItem.TextInfo = DR["TextInfo"].ToString().Trim();  
                                
                                if (!string.IsNullOrWhiteSpace(tcItem.TextInfo))
                                {
                                    tcItem.TextInfo = tcItem.TextInfo.Replace(Environment.NewLine, "");
                                }

                                result.Timecodes.Add(tcItem);
                            }
                        }
                    }

                    _cmd.Connection.Close();
                }

            }
            catch (Exception ex )
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                      ex);
                _logger.LogSystemActivity(
                    loggerItem);
            
            // throw;
            }

            return result;
        }

        public bool AddTextInfoDetails(TextInfoVM tiDetails)
        {
            bool result = false;

            TimeCodeVM tcItem = tiDetails?.CurrentTimecodes;

            if (tcItem != null)
            {
                try
                {
                   
                    if(!string.IsNullOrWhiteSpace(tcItem.TextInfo))
                    {
                        tcItem.TextInfo = tcItem.TextInfo.Replace(Environment.NewLine, "");
                    }


                    using (SqlCommand _cmd = new SqlCommand())
                    {
                        _cmd.Connection = _connection;
                        _cmd.CommandTimeout = 600;
                        _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        _cmd.CommandText = "[bward].[sp_AddTextInfo]";

                        _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", tiDetails.Qcnum));
                        _cmd.Parameters.Add(GetSqlParameterInt("@_rev", tiDetails.subQcnum));
                        _cmd.Parameters.Add(GetSqlParameterString("@_tcIn", tcItem.TimecodeIn));
                        _cmd.Parameters.Add(GetSqlParameterString("@_tcOut", tcItem.TimecodeOut));
                        _cmd.Parameters.Add(GetSqlParameterString("@_textinfo", tcItem.TextInfo));


                        _cmd.Connection.Open();

                        if (_cmd.ExecuteNonQuery() != 1)
                        {
                            result = false;
                            // TO DO :: add loggig error here

                        }
                        else { result = true; }

                        _cmd.Connection.Close();
                    }

                }
                catch (Exception ex)
                {
                    ILoggerItem loggerItem = PopulateLoggerItem(
                      ex);
                    _logger.LogSystemActivity(
                        loggerItem);

                    result = false;

                   // throw;


                }
            }


            return result;
        }

        public bool UpdateTextInfoDetails(TextInfoVM tiDetails)
        {
            bool result = false;

            TimeCodeVM tcItem = tiDetails.CurrentTimecodes;

            if (tcItem != null && tcItem.TextInfoId.HasValue)
            {
                try
                {

                    if (!string.IsNullOrWhiteSpace(tcItem.TextInfo))
                    {
                        tcItem.TextInfo = tcItem.TextInfo.Replace(Environment.NewLine, "");
                    }

                    using (SqlCommand _cmd = new SqlCommand())
                    {
                        _cmd.Connection = _connection;
                        _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        _cmd.CommandText = "[bward].[sp_UpdateTextInfo]";

                        _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", tiDetails.Qcnum));
                        _cmd.Parameters.Add(GetSqlParameterInt("@_rev", tiDetails.subQcnum));
                        _cmd.Parameters.Add(GetSqlParameterInt("@_tcid", tcItem.TextInfoId.Value));
                        _cmd.Parameters.Add(GetSqlParameterString("@_tcIn", tcItem.TimecodeIn));
                        _cmd.Parameters.Add(GetSqlParameterString("@_tcOut", tcItem.TimecodeOut));
                        _cmd.Parameters.Add(GetSqlParameterString("@_textinfo", tcItem.TextInfo));


                        _cmd.Connection.Open();

                        if (_cmd.ExecuteNonQuery() != 1)
                        {
                            result = false;
                            // TO DO :: add loggig error here

                        }
                        else { result = true; }

                        _cmd.Connection.Close();
                    }

                }
                catch (Exception ex)
                {
                    ILoggerItem loggerItem = PopulateLoggerItem(
                      ex);
                    _logger.LogSystemActivity(
                        loggerItem);

                    result = false;

                    throw;

                }
            }


            return result;
        }

        public bool BatchUpdateTextInfoDetails(TextInfoVM tiDetails)
        {
            bool result = false;

            try
            {
                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    var timecodes = tiDetails.Timecodes;

                    //Build Dynamic list to hold the parameters for the batch update.
                    var parameters = new List<dynamic>();

                    if (timecodes != null && timecodes.Any())
                    {
                        foreach (var tcItem in timecodes)
                        {

                            parameters.Add(new
                            {
                                _QCNum = tiDetails.Qcnum,
                                _rev = tiDetails.subQcnum,
                                _tcid = tcItem.TextInfoId,
                                _tcIn = tcItem.TimecodeIn,
                                _tcOut = tcItem.TimecodeOut,
                                _textinfo = tcItem.TextInfo,
                            });

                        };

                        connection.Execute(
                            "[bward].[sp_UpdateTextInfo]",
                            parameters,
                            null,
                            commandTimeout: 120,
                            commandType: CommandType.StoredProcedure);

                        result = true;
                    }

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }


            return result;
        }

        public bool DeleteTextInfoDetails(TextInfoVM tiDetails)
        {
            bool result = false;

            TimeCodeVM tcItem = tiDetails.CurrentTimecodes;

            if (tcItem != null)
            {
                try
                {

                    using (SqlCommand _cmd = new SqlCommand())
                    {
                        _cmd.Connection = _connection;
                        _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        _cmd.CommandText = "[bward].[sp_DeleteTextInfo]";

                        _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", tiDetails.Qcnum));
                        _cmd.Parameters.Add(GetSqlParameterInt("@_rev", tiDetails.subQcnum));
                        _cmd.Parameters.Add(GetSqlParameterInt("@_tiid", tcItem.TextInfoId.Value));


                        _cmd.Connection.Open();

                        if (_cmd.ExecuteNonQuery() != 1)
                        {
                            result = false;
                            // TO DO :: add loggig error here

                        }
                        else { result = true; }

                        _cmd.Connection.Close();
                    }

                }
                catch (Exception ex)
                {
                    ILoggerItem loggerItem = PopulateLoggerItem(
                      ex);
                    _logger.LogSystemActivity(
                        loggerItem);

                    result = false;

                    throw;
                }
            }

            return result;
        }
    }
}
