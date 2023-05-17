using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.LINQ;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Utilities;
using Dapper;


namespace Deluxe.QCReport.Common.Repositories
{
    public class QCReportRepository : BaseRepository
    {
        private readonly ILoggerRepository _logger = new LoggerRepository(ConfigManager.DatabaseConnection);

        public int CreateNewQCReport(NewQCReport newQCR)
        {
            int result = -1;


            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_NewQCReport]";

                    _cmd.Parameters.Add(GetSqlParameterInt("@qcUserId", newQCR.UserId));
                    _cmd.Parameters.Add(GetSqlParameterString("@qcWONumber", newQCR.QCWONumber));
                    _cmd.Parameters.Add(GetSqlParameterString("@customer", newQCR.Customer));
                    _cmd.Parameters.Add(GetSqlParameterString("@qcType", newQCR.QCType));
                    _cmd.Parameters.Add(GetSqlParameterString("@qcFullName", newQCR.QCFullname));
                    _cmd.Parameters.Add(GetSqlParameterString("@assetType", newQCR.AssetType));

                    // output parameters
                    SqlParameter outResult = new SqlParameter("@result", System.Data.SqlDbType.Int);
                    outResult.Direction = System.Data.ParameterDirection.Output;
                    _cmd.Parameters.Add(outResult);

                    _cmd.Connection.Open();
                    _cmd.ExecuteNonQuery();
                    _cmd.Connection.Close();

                    if (outResult.Value != null) { result = (int)outResult.Value; }
                }

            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
            }

            return result;
        }

        public bool UpdateQCReport(NewQCReport newQCR)
        {
            bool result = true;


            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_UpdateQCReport]";

                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", newQCR.Qcnum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_rev", newQCR.subQcnum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@qcUserId", newQCR.UserId));
                    _cmd.Parameters.Add(GetSqlParameterInt("@qcCustId", newQCR.CustId));
                    _cmd.Parameters.Add(GetSqlParameterString("@qcWONumber", newQCR.QCWONumber));
                    _cmd.Parameters.Add(GetSqlParameterString("@customer", newQCR.Customer));
                    _cmd.Parameters.Add(GetSqlParameterString("@qcType", newQCR.QCType));
                    _cmd.Parameters.Add(GetSqlParameterString("@qcFullName", newQCR.QCFullname));
                    _cmd.Parameters.Add(GetSqlParameterString("@assetType", newQCR.AssetType));


                    _cmd.Connection.Open();

                    if (_cmd.ExecuteNonQuery() != 1)
                    {
                        result = false;
                        // TO DO :: add loggig error here

                    }

                    _cmd.Connection.Close();
                }

            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
            }

            return result;
        }

        public NewQCReport GetQCReport(int qcNo, int qcRev)
        {
            NewQCReport result = new NewQCReport();


            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_GetQCDetails]";

                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", qcNo));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_Rev", qcRev));


                    _cmd.Connection.Open();

                    using (SqlDataReader DR = _cmd.ExecuteReader())
                    {
                        if (DR.HasRows)
                        {
                            while (DR.Read())
                            {

                                result.QCWONumber = DR["woNum"].ToString();
                                result.Qcnum = Convert.ToInt32(DR["QCNum"]);
                                result.subQcnum = Convert.ToInt32(DR["subQCNum"]);
                                result.Customer = DR["CstName"].ToString();
                                result.QCType = DR["qc_type"].ToString();
                                result.AssetType = DR["AssetType"].ToString();

                            }
                        }
                    }

                    _cmd.Connection.Close();

                }

            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
            }

            return result;
        }


        public bool CopyQCReport(string qcWONo, int qcNo, int qcRev, int? qcUserId)
        {
            bool result = false;


            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_CopyQCReport]";

                    _cmd.Parameters.AddWithValue("@qcWONumber", qcWONo);
                    _cmd.Parameters.AddWithValue("@qcNumber", qcNo);
                    _cmd.Parameters.AddWithValue("@subQCNumber", qcRev);
                    _cmd.Parameters.AddWithValue("@operator", qcUserId);

                    _cmd.Connection.Open();
                    _cmd.ExecuteNonQuery();
                    _cmd.Connection.Close();
                    result = true;
                }

            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
            }

            return result;
        }

        public JobTreeViewVM GetJobTree(string qcWONo, int? qcNo)
        {
            JobTreeViewVM result = null;

            try
            {

                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_GetJobTree]";

                    if (!string.IsNullOrEmpty(qcWONo)) { _cmd.Parameters.Add(GetSqlParameterString("@qcWONumber", qcWONo)); }
                    if (qcNo.HasValue) { _cmd.Parameters.Add(GetSqlParameterInt("@qcNumber", qcNo.Value)); }

                    _cmd.Connection.Open();

                    List<JobSQL> sqlRes = new List<JobSQL>();

                    using (SqlDataReader DR = _cmd.ExecuteReader())
                    {
                        if (DR.HasRows)
                        {
                            result = new JobTreeViewVM();
                            result.QCs = new List<QC>();
                            
                            while (DR.Read())
                            {
                                result.WONumber = DR["woNum"].ToString();
                                result.CustomerName = DR["CustName"].ToString();

                                QC qc = new QC();
                                qc.QCNumber = Convert.ToInt32(DR["QCNum"]);
                                qc.QCType = DR["qc_type"].ToString();
                                qc.Review = new Dictionary<int, DateTime?>();

                                if (DR["revised_date"] != DBNull.Value)
                                {
                                    qc.Review.Add(Convert.ToInt32(DR["subQCNum"]), Convert.ToDateTime(DR["revised_date"]));
                                }
                                else
                                {
                                    qc.Review.Add(Convert.ToInt32(DR["subQCNum"]), null);
                                }

                                   

                                result.QCs.Add(qc);

                                //JobSQL sqlItem = new JobSQL();
                                //sqlItem.WoNum = DR["woNum"].ToString();
                                //sqlItem.QcNum = Convert.ToInt32(DR["QCNum"]);
                                //sqlItem.SubQcNum = Convert.ToInt32(DR["subQCNum"]);
                                //sqlItem.QcType = DR["qc_type"].ToString();
                                //sqlItem.RevDate = Convert.ToDateTime(DR["revised_date"]);

                                //sqlRes.Add(sqlItem);
                            }
                        }
                    }

                     _cmd.Connection.Close();

                    //if (sqlRes.Count > 0)
                    //{
                    //    result = new JobTreeViewVM();
                    //    result.WONumber = sqlRes.First().WoNum;
                    //    result.QCs = new List<QC>();

                    //    var grp = sqlRes.GroupBy(g => g.QcNum, (key, r) => new { qcn = key, revs = r });

                    //    foreach (var item in grp)
                    //    {
                    //        QC qc = new QC();
                    //        qc.QCNumber = item.qcn;
                    //        qc.Review = new Dictionary<int, DateTime>();

                    //        foreach (var revItem in item.revs)
                    //        {
                    //            qc.QCType = revItem.QcType;
                    //            qc.Review.Add(revItem.SubQcNum, revItem.RevDate);
                    //        }
                    //        result.QCs.Add(qc);
                    //    }
                    //}
                }

            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);

                result = null; 

            }

            return result;
        }


        public JobDetailsVM GetJobDetails(string qcWONo)
        {
            JobDetailsVM result = null;

            using (DataClassesDataContext DC = new DataClassesDataContext())
            {
                var resultSql = from h in DC.qcHeaders
                                join u in DC.qcUsers
                                on h.Operator equals u.qcUserID
                                where h.Wonum == qcWONo && h.Deleted == 0
                               select new { h.Wonum, h.Qcnum, u.FullName, h.QC_date, h.Deleted, h.subQcnum };

                if (resultSql.Count() > 0)
                {
                    var rSqlGroup = resultSql.GroupBy(g => new { g.QC_date, g.FullName, g.Qcnum, g.Wonum, g.Deleted, g.subQcnum });
                    rSqlGroup = rSqlGroup.OrderBy(qc => qc.First().Qcnum);

                    result = new JobDetailsVM();
                    result.WONumber = qcWONo;
                    result.QCList = new List<Tuple<int, int,  string, DateTime?>>();

                    foreach (var item in rSqlGroup)
                    {
                        result.QCList.Add(new Tuple<int, int,string, DateTime?>(item.Key.Qcnum,item.Key.subQcnum,item.Key.FullName,item.Key.QC_date));
                    }
                }
            }

            return result;
        }

        public bool DeleteJob(string qcWONo)
        {

            bool result = false;

            //using (DataClassesDataContext DC = new DataClassesDataContext())
            //{
            //    var resultSql = from h in DC.qcHeaders
            //                    where h.Wonum == qcWONo
            //                    select h;

            //    foreach (var item in resultSql)
            //    {
            //        item.Deleted = 1;
            //    }

            //    try
            //    {
            //        DC.SubmitChanges();
            //    }
            //    catch (Exception e)
            //    {
            //        result = false;
            //    }
            //}

            try
            {
                /******** Using Parameterized Query to Avoid SQL Injection attack *****************************************************************************/
                var constr = ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
                var sql = "UPDATE [bward].[qcHeader] ";
                sql += "  SET Deleted = 1 ";
                sql += " WHERE Wonum = @workOrderNumder";
                               
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.Add(new SqlParameter("@workOrderNumder", qcWONo));
                        con.Open();
                        cmd.ExecuteNonQuery();
                        result = true;
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


        public QCDetailsVM GetQCDetails(string qcWONo, int qcNo)
        {
            QCDetailsVM result = null;

            using (DataClassesDataContext DC = new DataClassesDataContext())
            {
                var resultSql = from h in DC.qcHeaders
                                join u in DC.qcUsers
                                on h.Operator equals u.qcUserID
                                where h.Wonum == qcWONo && h.Qcnum == qcNo && h.Deleted == 0
                                select new { h.Wonum, h.Qcnum, h.subQcnum, u.FullName, h.revised_date, h.Deleted };

                if (resultSql.Count() > 0)
                {
                    var rSqlGroup = resultSql.GroupBy(g => new { g.revised_date, g.FullName, g.Qcnum, g.Wonum, g.subQcnum, g.Deleted });

                    result = new QCDetailsVM();
                    result.WONumber = qcWONo;
                    result.QCNumber = qcNo;
                    result.RevList = new List<Tuple<int, int, string, DateTime?>>();

                    foreach (var item in rSqlGroup)
                    {
                        result.RevList.Add(new Tuple<int, int, string, DateTime?>(item.Key.Qcnum, item.Key.subQcnum, item.Key.FullName.Trim(), item.Key.revised_date));
                    }
                }
            }

            return result;
        }

        public bool DeleteQC(int qcNo)
        {

            bool result = false;

            //using (DataClassesDataContext DC = new DataClassesDataContext())
            //{
            //    var resultSql = from h in DC.qcHeaders
            //                    where h.Qcnum == qcNo
            //                    select h;

            //    foreach (var item in resultSql)
            //    {
            //        item.Deleted = 1;
            //    }

            //    try
            //    {
            //        DC.SubmitChanges();
            //    }
            //    catch (Exception e)
            //    {
            //        result = false;
            //    }
            //}

            try
            {
                /******** Using Parameterized Query to Avoid SQL Injection attack *****************************************************************************/
                var constr = ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
                var sql = "UPDATE [bward].[qcHeader] ";
                sql += "  SET Deleted = 1 ";
                sql += " WHERE Qcnum = @QCNumber";

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.Add(new SqlParameter("@QCNumber", qcNo));
                        con.Open();
                        cmd.ExecuteNonQuery();
                        result = true;
                    }

                }

            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
            }


            return result;
        }


        public RevDetailsVM GetRevDetails(string qcWONo, int qcNo, int qcRevNo)
        {
            RevDetailsVM result = null;

            using (DataClassesDataContext DC = new DataClassesDataContext())
            {
                var resultSql = from h in DC.qcHeaders
                                join u in DC.qcUsers
                                on h.Operator equals u.qcUserID
                                where h.Wonum == qcWONo && h.Qcnum == qcNo && h.subQcnum == qcRevNo
                                select new { h.Wonum, h.Qcnum, h.subQcnum, u.FullName, h.Revised_By, h.revised_date, h.Eval_Stat };

                if (resultSql.Count() > 0)
                {
                    var revDetail = resultSql.FirstOrDefault();

                    if (revDetail != null)
                    {
                        result = new RevDetailsVM()
                        {
                            WONumber = qcWONo,
                            QCNumber = revDetail.Qcnum,
                            RevNumber = revDetail.subQcnum,
                            QCOperator = revDetail.FullName.Trim(),                            
                            RevBy = string.IsNullOrEmpty(revDetail.Revised_By) ? "" : revDetail.Revised_By.Trim(),
                            RevDate = revDetail.revised_date,
                            Status = string.IsNullOrEmpty(revDetail.Eval_Stat) ? "" : revDetail.Eval_Stat.Trim()
                        };
                    }
                    
                }
            }

            return result;
        }

        public bool        DeleteRev(int qcNo, int revNo)
        {

            bool result = false;

            //using (DataClassesDataContext DC = new DataClassesDataContext())
            //{
            //    var resultSql = from h in DC.qcHeaders
            //                    where h.Qcnum == qcNo && h.subQcnum == revNo
            //                    select h;

            //    foreach (var item in resultSql)
            //    {
            //        item.Deleted = 1;
            //    }

            //    try
            //    {
            //        DC.SubmitChanges();
            //    }
            //    catch (Exception e)
            //    {
            //        result = false;
            //    }
            //}

            try
            {
                /******** Using Parameterized Query to Avoid SQL Injection attack *****************************************************************************/
                var constr = ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
                var sql = "UPDATE [bward].[qcHeader] ";
                sql += "  SET Deleted = 1 ";
                sql += " WHERE Qcnum = @QCNumber AND subQcnum = @SubQCNumber";

                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.Add(new SqlParameter("@QCNumber", qcNo));
                        cmd.Parameters.Add(new SqlParameter("@SubQCNumber", revNo));
                        con.Open();
                        cmd.ExecuteNonQuery();
                        result = true;
                    }

                }

            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
            }

            return result;
        }

    }

    class JobSQL
    {
        public string WoNum { get; set; }
        public int QcNum { get; set; }
        public int SubQcNum { get; set; }
        public string QcType { get; set; }
        public DateTime RevDate { get; set; }

    }
}
