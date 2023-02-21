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
using Deluxe.QCReport.Common.Utilities;
using Dapper;

namespace Deluxe.QCReport.Common.Repositories
{
    public class LogRepository : BaseRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public LogRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $" LogRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $" LogRepository expects ctor injection: {nameof(ILoggerService)}");


        }

        public LogVM GetLogDetails(int QCNum, int SubQCNum)
        {
            LogVM result = new LogVM();
            result.Qcnum = QCNum;
            result.subQcnum = SubQCNum;
            result.QCTimes = new List<QCTime>();

            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_SelectLog]";
                    _cmd.Parameters.AddWithValue("@_QCNum", QCNum);
                    _cmd.Parameters.AddWithValue("@_Rev", SubQCNum);

                    _cmd.Connection.Open();

                    using (SqlDataReader DR = _cmd.ExecuteReader())
                    {
                        if (DR.HasRows)
                        {

                            while (DR.Read())
                            {
                                if (DBNull.Value != DR["GradingScale"]) 
                                { 
                                    result.GradingScale = Convert.ToInt32(DR["GradingScale"]); 
                                }

                                if (DBNull.Value != DR["Eval_Stat"])
                                {
                                    result.QCStatus = DR["Eval_Stat"].ToString().Trim();
                                }

                                
                            }
                        

                          if(DR.NextResult())
                           {

                            while (DR.Read())
                            {
                                QCTime qct = new QCTime();
                                
                                qct.TimeID = Convert.ToInt32(DR["TimeID"]);
                                qct.TC = DR["Time_Code"].ToString().Trim();
                                qct.QCCode = DR["QC_Code"].ToString().Trim();
                                qct.Note = DR["Note"].ToString().Trim();
                                qct.QCGrade = DR["QC_Grade"].ToString().Trim();
                                qct.Action = DR["Action"].ToString().Trim();
                                qct.Duration = DR["item_duratn"].ToString().Trim();
                                qct.ActionsForDisplay = DR["ActionsForDisplay"].ToString().Trim();
                                qct.QCCodename = DR["QC_Codename"].ToString().Trim();


                                    // qct.InMaster = Convert.ToBoolean(DR["in_master"]);

                                    int colIndex = DR.GetOrdinal("in_master");
                                qct.InMaster = DR.IsDBNull(colIndex) ? false : (bool)DR["in_master"];

                                if (DR["item_num"] != DBNull.Value)
                                {
                                  qct.ItemNum = Convert.ToInt32(DR["item_num"]);
                                }


                                if (!string.IsNullOrWhiteSpace(qct.Note))
                                {
                                    qct.Note = qct.Note.Replace(Environment.NewLine, "");
                                }

                                result.QCTimes.Add(qct);
                            }

                        }

                       }
                    }

                    _cmd.Connection.Close();
                }

            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

            //if (result.QCTimes != null) // Last item number if it's NULL && !result.QCTimes[result.QCTimes.Count-1].ItemNum.HasValue
            //{
            //    var itemNumbersCheck = result.QCTimes.Where(i => !i.ItemNum.HasValue);

            //    if (!itemNumbersCheck.Any())
            //    {
            //        //UpdateItemNumbers(result);
            //    }

            //}

            return result;
        }

        private void UpdateItemNumbers(LogVM logVM)
        {

            var result = BatchUpdateItemNumbers(logVM);
        }

        public bool AddLogDetails(LogVM logDetails)
        {
            bool result = false;

            QCTime qcItem = logDetails.CurrentQCTimes;

            if (qcItem != null)
            {
                try
                {

                    if (!string.IsNullOrWhiteSpace(qcItem.Note))
                    {
                        qcItem.Note = qcItem.Note.Replace(Environment.NewLine, "");
                    }

                    string actions = OrderActions(qcItem.Action);

                    using (SqlCommand _cmd = new SqlCommand())
                    {
                        _cmd.Connection = _connection;
                        _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        _cmd.CommandText = "[bward].[sp_AddLog]";

                        _cmd.Parameters.AddWithValue("@_QCNum", logDetails.Qcnum);
                        _cmd.Parameters.AddWithValue("@_rev", logDetails.subQcnum);
                        _cmd.Parameters.AddWithValue("@_tc", qcItem.TC);
                        _cmd.Parameters.AddWithValue("@_qcCode", qcItem.QCCode);
                        _cmd.Parameters.AddWithValue("@_note", qcItem.Note);
                        _cmd.Parameters.AddWithValue("@_qcGrade", qcItem.QCGrade);
                        _cmd.Parameters.AddWithValue("@_action", actions);
                        _cmd.Parameters.AddWithValue("@_duration", qcItem.Duration);
                       
                        if (qcItem.InMaster == false)
                        {
                            _cmd.Parameters.AddWithValue("@_inMaster", null);
                        }
                        else
                        {
                            _cmd.Parameters.AddWithValue("@_inMaster", true);
                        }

                        _cmd.Parameters.AddWithValue("@_itemNum", qcItem.ItemNum);
                        var actionsFoDisplay = ActionForDisplay(actions);
                        _cmd.Parameters.AddWithValue("@_actionsForDisplay", actionsFoDisplay);
                        _cmd.Parameters.AddWithValue("@_qcCodename", qcItem.QCCodename);

                        _cmd.Connection.Open();

                        if (_cmd.ExecuteNonQuery() != 1)
                        {
                            result = false;
                            // TO DO :: add logging error here

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

                }
            }


            return result;
        }

        public bool SaveFaultsStatus(LogVM logVM)
        {
            bool result = false;

            try
            {
                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[up_UpdateQCStatus]";

                    _cmd.Parameters.AddWithValue("@Qcnum", logVM.Qcnum);
                    _cmd.Parameters.AddWithValue("@subQcnum", logVM.subQcnum);
                    _cmd.Parameters.AddWithValue("@Status", logVM.QCStatus);

                    _cmd.Connection.Open();

                    _cmd.ExecuteNonQuery();

                     result = true;
                   
                    _cmd.Connection.Close();

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

        private string OrderActions(string actions)
        {
            if (string.IsNullOrWhiteSpace(actions))
            {
                return null;
            }

            if (actions.ToUpper().Contains("ALL"))
            {
                return "ALL";
            }

            
            var aActions = actions.Split('/').Select(a => a.Trim()).ToList();
            //List<String> orderBy = new List<String> { "U-L", "U-C", "U-R", "M-L", "M-C", "M-R", "L-L", "L-C", "L-R" };

            var orderBy = new Dictionary<string, string> {
                        { "U-L", "01" },
                        { "U-C", "02" },
                        { "U-R", "03" },
                        { "M-L", "04" },
                        { "M-C", "05" },
                        { "M-R", "06" },
                        { "L-L", "07" },
                        { "L-C", "08" },
                        { "L-R", "09" }
                    };

            //IEnumerable<String> orderedActions = aActions.OrderBy( a => orderBy.IndexOf(a));
            // IEnumerable<String> orderedActions = aActions.OrderBy(a => orderBy.Concat(aActions).ToList().IndexOf(a));
            //IEnumerable<String> orderedActions = aActions.OrderByDescending(a => Enumerable.Reverse(orderBy).ToList().IndexOf(a));

            //IEnumerable<String> orderedActions = aActions.OrderBy(a =>
            //{
            //    var index = orderBy.IndexOf(a.Trim());
            //    return index == -1 ? int.MaxValue : index;
            //});
             
            string key;
            IEnumerable<String> orderedActions = aActions.OrderBy(
                a => orderBy.TryGetValue(a, out key) ? key : a
            );

            actions = StringUtil.ArrayToDelimitedString(orderedActions.ToArray(), " / ");
            //ActionForDisplay(actions);
            
            return actions;

        }

        private string ActionForDisplay(string actions)
        {
            var upperAction = string.Empty;
            var midAction = string.Empty;
            var lowerAction = string.Empty;
            var actionsForDisplay = string.Empty;
            var lastIndexOfU = -1;
            var lastIndexOfM = -1;
            var lastIndexOfL = -1;

            if (string.IsNullOrWhiteSpace(actions))
            {
                return null;
            }

            if (actions.ToUpper().Contains("ALL"))
            {
                return "ALL";
            }

            try
            {

                if (actions.Contains("U-"))
                {
                    lastIndexOfU = actions.LastIndexOf("U-") + 3;
                    upperAction = actions.Substring(0, lastIndexOfU).TrimEnd('/');
                    actionsForDisplay = upperAction;
                }
               

                if (actions.Contains("M-"))
                {
                    lastIndexOfM = actions.LastIndexOf("M-") + 3;

                    if (lastIndexOfU > -1)
                    {
                       midAction = actions.Substring(actions.IndexOf("M"), lastIndexOfM - actions.IndexOf("M") ).TrimEnd('/');
                    }
                    else
                    {
                        midAction = actions.Substring(0, lastIndexOfM).TrimEnd('/');
                    }

                    actionsForDisplay = actionsForDisplay + "\n" + midAction ;
                }
              

                if (actions.Contains("L-"))
                {
                    lastIndexOfL = actions.LastIndexOf("L-") + 2;

                    if (lastIndexOfU > -1 || lastIndexOfM > - 1)
                    {
                        lowerAction = actions.Substring(actions.IndexOf("L-") - 1, lastIndexOfL - actions.IndexOf("L-") + 2).TrimEnd('/');
                    }
                    else
                    {
                        lowerAction = actions.Substring(0, lastIndexOfL + 1).TrimEnd('/');
                    }

                    actionsForDisplay = actionsForDisplay + "\n" + lowerAction;
                }
                
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                       ex);
                _logger.LogSystemActivity(
                    loggerItem);
            }


            return actionsForDisplay;

        }

        public bool UpdateLogDetails(LogVM logDetails)
        {
            bool result = false;

            QCTime qcItem = logDetails.CurrentQCTimes;

            if (qcItem != null)
            {
                try
                {

                    if (!string.IsNullOrWhiteSpace(qcItem.Note))
                    {
                        qcItem.Note = qcItem.Note.Replace(Environment.NewLine, "");
                    }

                    string actions = OrderActions(qcItem.Action);

                    using (SqlCommand _cmd = new SqlCommand())
                    {
                        _cmd.Connection = _connection;
                        _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        _cmd.CommandText = "[bward].[sp_UpdateLog]";

                        _cmd.Parameters.AddWithValue("@_QCNum", logDetails.Qcnum);
                        _cmd.Parameters.AddWithValue("@_rev", logDetails.subQcnum);
                        _cmd.Parameters.AddWithValue("@_timeID", qcItem.TimeID.Value);
                        _cmd.Parameters.AddWithValue("@_tc", qcItem.TC);
                        _cmd.Parameters.AddWithValue("@_qcCode", qcItem.QCCode);
                        _cmd.Parameters.AddWithValue("@_note", qcItem.Note);
                        _cmd.Parameters.AddWithValue("@_qcGrade", qcItem.QCGrade);
                        _cmd.Parameters.AddWithValue("@_action", actions);
                        _cmd.Parameters.AddWithValue("@_duration", qcItem.Duration);
                       
                        if (qcItem.InMaster == false )
                        {
                            _cmd.Parameters.AddWithValue("@_inMaster", null);
                        }
                        else
                        {
                            _cmd.Parameters.AddWithValue("@_inMaster",true);
                        }

                        _cmd.Parameters.AddWithValue("@_itemNum", qcItem.ItemNum);
                        _cmd.Parameters.AddWithValue("@_actionsForDisplay", ActionForDisplay(actions));
                        _cmd.Parameters.AddWithValue("@_qcCodename", qcItem.QCCodename);


                        _cmd.Connection.Open();

                        if (_cmd.ExecuteNonQuery() != 1)
                        {
                            result = false;
                            // TO DO :: add logging error here

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

                }
            }


            return result;
        }

     
        public bool DeleteLogDetails(LogVM logDetails)
        {
            bool result = false;

            QCTime qcItem = logDetails.CurrentQCTimes;

            if (qcItem != null)
            {
                try
                {

                    using (SqlCommand _cmd = new SqlCommand())
                    {
                        _cmd.Connection = _connection;
                        _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        _cmd.CommandText = "[bward].[sp_DeleteLog]";

                        _cmd.Parameters.AddWithValue("@_QCNum", logDetails.Qcnum);
                        _cmd.Parameters.AddWithValue("@_rev", logDetails.subQcnum);
                        _cmd.Parameters.AddWithValue("@_tid", qcItem.TimeID.Value);


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

                }
            }


            return result;
        }

        public bool BatchUpdateItemNumbers(LogVM logDetails)
        {
            bool result = false;

            try
            {
                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    var timecodes = logDetails.QCTimes;

                    //Build Dynamic list to hold the parameters for the batch update.
                    var parameters = new List<dynamic>();

                    if (timecodes != null && timecodes.Any())
                    {
                        var itemNumber = 1;
                        foreach (var tcItem in timecodes)
                        {
                            tcItem.ItemNum = itemNumber;

                            parameters.Add(new
                            {
                                _QCNum = logDetails.Qcnum,
                                _rev = logDetails.subQcnum,
                                _timeID = tcItem.TimeID,
                                _tc = tcItem.TC,
                                _qcCode = tcItem.QCCode,
                                _note = tcItem.Note,
                                _qcGrade = tcItem.QCGrade,
                                _action = tcItem.Action,
                                _duration = tcItem.Duration,
                                _inMaster = tcItem.InMaster,
                                _itemNum = itemNumber
                           });

                            itemNumber++;
                        };

                        connection.Execute(
                            "[bward].[sp_UpdateLog]",
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

        public bool BatchUpdateLogDetails(LogVM logDetails)
        {
            bool result = false;

            try
            {
                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    var timecodes = logDetails.QCTimes;

                    //Build Dynamic list to hold the parameters for the batch update.
                    var parameters = new List<dynamic>();

                    if (timecodes != null && timecodes.Any())
                    {
                        foreach (var tcItem in timecodes)
                        {

                            parameters.Add(new
                            {
                                _QCNum = logDetails.Qcnum,
                                _rev = logDetails.subQcnum,
                                _timeID = tcItem.TimeID,
                                _tc = tcItem.TC,
                                _qcCode = tcItem.QCCode,
                                _note = tcItem.Note,
                                _qcGrade = tcItem.QCGrade,
                                _action = tcItem.Action,
                                _duration = tcItem.Duration,
                                _inMaster = tcItem.InMaster
                            });

                        };

                        connection.Execute(
                            "[bward].[sp_UpdateLog]",
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


        public bool LogTCOffsetUpdate(int qcNum, int subQcNum, List<QCTime> tcToUpdate)
        {
            bool result = false;


            foreach (QCTime item in tcToUpdate)
            {

                try
                {

                    using (SqlCommand _cmd = new SqlCommand())
                    {
                        _cmd.Connection = _connection;
                        _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        _cmd.CommandText = "[bward].[sp_UpdateLog]";

                        _cmd.Parameters.AddWithValue("@_QCNum", qcNum);
                        _cmd.Parameters.AddWithValue("@_rev", subQcNum);
                        _cmd.Parameters.AddWithValue("@_timeID", item.TimeID.Value);
                        _cmd.Parameters.AddWithValue("@_tc", item.TC);
                        _cmd.Parameters.AddWithValue("@_qcCode", item.QCCode);
                        _cmd.Parameters.AddWithValue("@_note", item.Note);
                        _cmd.Parameters.AddWithValue("@_qcGrade", item.QCGrade);
                        _cmd.Parameters.AddWithValue("@_action", item.Action);
                        _cmd.Parameters.AddWithValue("@_duration", item.Duration);
                        _cmd.Parameters.AddWithValue("@_inMaster", item.InMaster);


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

                }
            }


            return result;
        }
    }
}
