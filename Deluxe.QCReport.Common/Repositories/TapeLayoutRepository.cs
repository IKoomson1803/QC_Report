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
    public class TapeLayoutRepository : BaseRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public TapeLayoutRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"TapeLayoutRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"TapeLayoutRepository expects ctor injection: {nameof(ILoggerService)}");


        }


        public TapeLayoutVM GetTapeLayoutTCDetails(int QCNum, int SubQCNum)
        {
            TapeLayoutVM result = new TapeLayoutVM();
            result.Qcnum = QCNum;
            result.subQcnum = SubQCNum;
            result.Timecodes = new List<TLTimeCodeVM>();

            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandTimeout = 600;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_SelectTapeLayoutTC]";
                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", QCNum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_Rev", SubQCNum));

                    _cmd.Connection.Open();

                    using (SqlDataReader DR = _cmd.ExecuteReader())
                    {
                        if (DR.HasRows)
                        {

                            while (DR.Read())
                            {
                                TLTimeCodeVM tcItem = new TLTimeCodeVM();

                                tcItem.TapeFormatId = Convert.ToInt32(DR["TapeFormatID"]);
                                tcItem.ItemNum = Convert.ToInt32(DR["item_num"]);
                                tcItem.Description = DR["Description"].ToString().Trim();
                                tcItem.Time_Code = DR["Time_Code"].ToString().Trim();
                                tcItem.Length = DR["Length"].ToString().Trim();

                                if (!string.IsNullOrWhiteSpace(tcItem.Description))
                                {
                                    tcItem.Description = tcItem.Description.Replace(Environment.NewLine, "");
                                }

                                result.Timecodes.Add(tcItem);
                            }
                        }
                    }

                    _cmd.Connection.Close();
                }

            }
            catch (Exception)
            {

                throw;
            }

            return result;
        }

        public bool AddTapeLayoutTCDetails(TapeLayoutVM tltcDetails)
        {
            bool result = false;

            TLTimeCodeVM tcItem = tltcDetails.CurrentTimecodes;

            if (tcItem != null)
            {
                try
                {

                    if (!string.IsNullOrWhiteSpace(tcItem.Description))
                    {
                        tcItem.Description = tcItem.Description.Replace(Environment.NewLine, "");
                    }


                    using (SqlCommand _cmd = new SqlCommand())
                    {
                        _cmd.Connection = _connection;
                        _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        _cmd.CommandText = "[bward].[sp_AddTapeLayoutTC]";

                        _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", tltcDetails.Qcnum));
                        _cmd.Parameters.Add(GetSqlParameterInt("@_rev", tltcDetails.subQcnum));
                        _cmd.Parameters.Add(GetSqlParameterInt("@_itemNum", tcItem.ItemNum));
                        _cmd.Parameters.Add(GetSqlParameterString("@_desc", tcItem.Description));
                        _cmd.Parameters.Add(GetSqlParameterString("@_length", tcItem.Length));
                        _cmd.Parameters.Add(GetSqlParameterString("@_timecode", tcItem.Time_Code));


                        _cmd.Connection.Open();
                        _cmd.ExecuteNonQuery();
                        result = true;

                        //if (_cmd.ExecuteNonQuery() != 1)
                        //{
                        //    result = false;
                        //    // TO DO :: add loggig error here

                        //}
                        //else { result = true; }

                        _cmd.Connection.Close();
                    }

                }
                catch (Exception)
                {
                   
                    throw;
                }
            }


            return result;
        }

        public bool UpdateTapeLayoutTCDetails(TapeLayoutVM tltcDetails)
        {
            bool result = false;

            TLTimeCodeVM tcItem = tltcDetails.CurrentTimecodes;

            if (tcItem != null)
            {
                try
                {

                    if (!string.IsNullOrWhiteSpace(tcItem.Description))
                    {
                        tcItem.Description = tcItem.Description.Replace(Environment.NewLine, "");
                    }

                    using (SqlCommand _cmd = new SqlCommand())
                    {
                        _cmd.Connection = _connection;
                        _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        _cmd.CommandText = "[bward].[sp_UpdateTapeLayoutTC]";

                        _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", tltcDetails.Qcnum));
                        _cmd.Parameters.Add(GetSqlParameterInt("@_rev", tltcDetails.subQcnum));
                        _cmd.Parameters.Add(GetSqlParameterInt("@_tapeid", tcItem.TapeFormatId.Value));
                        _cmd.Parameters.Add(GetSqlParameterInt("@_itemNum", tcItem.ItemNum));
                        _cmd.Parameters.Add(GetSqlParameterString("@_desc", tcItem.Description));
                        _cmd.Parameters.Add(GetSqlParameterString("@_length", tcItem.Length));
                        _cmd.Parameters.Add(GetSqlParameterString("@_timecode", tcItem.Time_Code));


                        _cmd.Connection.Open();
                        _cmd.ExecuteNonQuery();
                        result = true;

                        //if (_cmd.ExecuteNonQuery() != 1)
                        //{
                        //    result = false;
                        //    // TO DO :: add loggig error here

                        //}
                        //else { result = true; }

                        _cmd.Connection.Close();
                    }

                }
                catch (Exception)
                {
                       throw;
                }
            }


            return result;
        }

        public bool BatchUpdateTapeLayoutTCDetails(TapeLayoutVM tltcDetails)
        {
            bool result = false;

            try
            {
                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    var timecodes = tltcDetails.Timecodes;

                    //Build Dynamic list to hold the parameters for the batch update.
                    var parameters = new List<dynamic>();

                    if (timecodes != null && timecodes.Any())
                    {
                        foreach (var tcItem in timecodes)
                        {

                            parameters.Add(new
                            {
                                _tapeid = tcItem.TapeFormatId,
                                _QCNum = tltcDetails.Qcnum,
                                _rev = tltcDetails.subQcnum,
                                _itemNum = tcItem.ItemNum,
                                _desc = tcItem.Description,
                                _length = tcItem.Description,
                                _timecode = tcItem.Time_Code,
                             });

                        };

                        connection.Execute(
                            "[bward].[sp_UpdateTapeLayoutTC]",
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

        public bool DeleteTapeLayoutTCDetails(TapeLayoutVM tltcDetails)
        {
            bool result = false;

            TLTimeCodeVM tcItem = tltcDetails.CurrentTimecodes;

            if (tcItem != null)
            {
                try
                {

                    using (SqlCommand _cmd = new SqlCommand())
                    {
                        _cmd.Connection = _connection;
                        _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        _cmd.CommandText = "[bward].[sp_DeleteTapeLayoutTC]";

                        _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", tltcDetails.Qcnum));
                        _cmd.Parameters.Add(GetSqlParameterInt("@_rev", tltcDetails.subQcnum));
                        _cmd.Parameters.Add(GetSqlParameterInt("@_tapeid", tcItem.TapeFormatId.Value));


                        _cmd.Connection.Open();
                        _cmd.ExecuteNonQuery();
                        result = true;

                        //if (_cmd.ExecuteNonQuery() != 1)
                        //{
                        //    result = false;
                        //    // TO DO :: add loggig error here

                        //}
                        //else { result = true; }

                        _cmd.Connection.Close();
                    }

                }
                catch (Exception)
                {
                   throw;
                }
            }


            return result;
        }
    }
}
