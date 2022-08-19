using Deluxe.QCReport.Common.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Repositories
{
    public class HistoryRepository : BaseRepository
    {
        public HistoryVM GetHistoryDetails(int QCNum, int SubQCNum)
        {
            HistoryVM result = new HistoryVM();
            result.Qcnum = QCNum;
            result.subQcnum = SubQCNum;
            result.AssetType = "Tape";

            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_SelectHistoryDetails]";
                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", QCNum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_Rev", SubQCNum));

                    _cmd.Connection.Open();

                    using (SqlDataReader DR = _cmd.ExecuteReader())
                    {

                        while (DR.Read())
                        {

                            DateTime? dTRev = null;
                            if (DR["Revised_Date"] != DBNull.Value)
                            {
                                dTRev = Convert.ToDateTime(DR["Revised_Date"]);
                            }

                            DateTime? dTRev2 = null;
                            if (DR["Revised_Date_2"] != DBNull.Value)
                            {
                                dTRev2 = Convert.ToDateTime(DR["Revised_Date_2"]);
                            }

                            DateTime? dTRec = null;
                            if (DR["Rec_Date"] != DBNull.Value)
                            {
                                dTRec = Convert.ToDateTime(DR["Rec_Date"]);
                            }

                            string astType = "Tape";
                            if (DR["AssetType"] != DBNull.Value && 
                                !string.IsNullOrEmpty(DR["AssetType"].ToString().Trim()))
                            {
                                astType = DR["AssetType"].ToString().Trim();
                            }

                            DateTime? dTQC = null;
                            if (DR["QC_Date"] != DBNull.Value)
                            {
                                dTQC = Convert.ToDateTime(DR["QC_Date"]);
                            }

                            DateTime? dTQC_2 = null;
                            if (DR["QC_Date_2"] != DBNull.Value)
                            {
                                dTQC_2 = Convert.ToDateTime(DR["QC_Date_2"]);
                            }


                            result.QC_Date = dTQC;
                            result.Revised_By = DR["Revised_By"].ToString().Trim();
                            result.Revised_By_2 = DR["Revised_By_2"].ToString().Trim();
                            result.Revised_Date = dTRev;
                            result.Revised_Date_2 = dTRev2;
                            result.Rec_Date = dTRec;
                            result.OperatorId = Convert.ToInt32(DR["qcUserID"]);
                            result.FullName = DR["FullName"].ToString().Trim();

                            if (DR["qcUserID2"] != DBNull.Value)
                            {
                                result.OperatorId_2 = Convert.ToInt32(DR["qcUserID2"]);
                            }

                            result.QC_Date_2 = dTQC_2;
                            result.FullName_2 = DR["FullName2"].ToString().Trim();
                            result.Operator_Activity = DR["Operator_Activity"].ToString().Trim();
                            result.Operator_2_Activity = DR["Operator_2_Activity"].ToString().Trim();

                            result.Bay_Num = DR["Bay_Num"].ToString().Trim();
                            result.Bay_Num_2 = DR["Bay_Num_2"].ToString().Trim();
                            result.AssetType = astType;
                            result.QC_VTR = DR["QC_VTR"].ToString().Trim();
                            result.QC_VTR_2 = DR["QC_VTR_2"].ToString().Trim();
                            result.Stock_Mfg = DR["Stock_Mfg"].ToString().Trim();
                            result.Stock_Batch = DR["Stock_Batch"].ToString().Trim();
                            result.Rec_VTR = DR["Rec_VTR"].ToString().Trim();
                            result.Rec_Fac = DR["Rec_Fac"].ToString().Trim();
                            result.Src_Format = DR["Src_Format"].ToString().Trim();
                            result.Src_Standard = DR["Src_Standard"].ToString().Trim();
                            result.Src_Desc = DR["Src_Desc"].ToString().Trim();
                            result.AddInfo = DR["AddInfo"].ToString().Trim();
                            result.textless = DR["textless"].ToString().Trim();
                            result.Duration = DR["Duration"].ToString().Trim();

                            if (string.IsNullOrWhiteSpace(result.Revised_By))
                            {
                                result.Revised_Date = null;
                            }

                            if (string.IsNullOrWhiteSpace(result.Revised_By_2))
                            {
                                result.Revised_Date_2 = null;
                            }
                        }
                       
                    }

                    _cmd.Connection.Close();
                }

            }
            catch (Exception ex)
            {
                var errorMessage = ex.Message;
                throw;
            }

            return result;
        }

        public bool UpdateHistoryDetails(HistoryVM historyDetails)
        {
            bool result = true;


            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_UpdateHistoryDetails]";

                    _cmd.Parameters.AddWithValue("@_QCNum", historyDetails.Qcnum);
                    _cmd.Parameters.AddWithValue("@_rev", historyDetails.subQcnum);
                    _cmd.Parameters.AddWithValue("@_operID", historyDetails.OperatorId);
                    _cmd.Parameters.AddWithValue("@_operID_2", historyDetails.OperatorId_2);

                    //_cmd.Parameters.AddWithValue("@_revised_By", historyDetails.Revised_By);
                    //_cmd.Parameters.AddWithValue("@_revised_By_2", historyDetails.Revised_By_2);

                    //_cmd.Parameters.AddWithValue("@_bay_Num", historyDetails.Bay_Num);
                    //_cmd.Parameters.AddWithValue("@_bay_Num_2", historyDetails.Bay_Num_2);
                    //_cmd.Parameters.AddWithValue("@_qcVTR", historyDetails.QC_VTR);
                    //_cmd.Parameters.AddWithValue("@_qcVTR_2", historyDetails.QC_VTR_2);
                    //_cmd.Parameters.Add(GetSqlParameterDateTime("@_revDate", DateTime.Now));
                    //_cmd.Parameters.Add(GetSqlParameterString("@_oper_Activity", historyDetails.Operator_Activity));
                    //_cmd.Parameters.Add(GetSqlParameterString("@_oper_2_Activity", historyDetails.Operator_2_Activity));

                    _cmd.Parameters.AddWithValue("@_stockMfg", historyDetails.Stock_Mfg);
                    _cmd.Parameters.AddWithValue("@_stockBatch", historyDetails.Stock_Batch);
                    _cmd.Parameters.AddWithValue("@_recVTR", historyDetails.Rec_VTR);
                    _cmd.Parameters.AddWithValue("@_recFac", historyDetails.Rec_Fac);
                    _cmd.Parameters.AddWithValue("@_srcFormat", historyDetails.Src_Format);
                    _cmd.Parameters.AddWithValue("@_srcStandard", historyDetails.Src_Standard);
                    _cmd.Parameters.AddWithValue("@_srcDesc", historyDetails.Src_Desc);
                    _cmd.Parameters.AddWithValue("@_addInfo", historyDetails.AddInfo);
                    _cmd.Parameters.AddWithValue("@_textless", historyDetails.textless);
                    _cmd.Parameters.AddWithValue("@_duration", historyDetails.Duration);

                   

                    /***************************************************************/
                    if (!historyDetails.OperatorId.HasValue)
                    {
                         _cmd.Parameters.AddWithValue("@_qcDate", null);
                        _cmd.Parameters.AddWithValue("@_oper_Activity", null);
                        _cmd.Parameters.AddWithValue("@_bay_Num", null);
                        _cmd.Parameters.AddWithValue("@_qcVTR", null);
                    }
                    else
                    {
                        if (!historyDetails.QC_Date.HasValue)
                        {
                            _cmd.Parameters.AddWithValue("@_qcDate", DateTime.Now);
                        }
                        else
                        {
                            _cmd.Parameters.AddWithValue("@_qcDate", historyDetails.QC_Date.Value);
                        }

                        _cmd.Parameters.AddWithValue("@_oper_Activity", historyDetails.Operator_Activity);
                        _cmd.Parameters.AddWithValue("@_bay_Num", historyDetails.Bay_Num);
                        _cmd.Parameters.AddWithValue("@_qcVTR", historyDetails.QC_VTR);
                    }

                    /***************************************************************/
                    if (!historyDetails.OperatorId_2.HasValue)
                    {
                        _cmd.Parameters.AddWithValue("@_qcDate_2", null);
                        _cmd.Parameters.AddWithValue("@_oper_2_Activity", null);
                        _cmd.Parameters.AddWithValue("@_bay_Num_2", null);
                        _cmd.Parameters.AddWithValue("@_qcVTR_2", null);
                    }
                    else
                    {
                        if (!historyDetails.QC_Date_2.HasValue)
                        {
                            _cmd.Parameters.AddWithValue("@_qcDate_2", DateTime.Now);
                        }
                        else
                        {
                            _cmd.Parameters.AddWithValue("@_qcDate_2", historyDetails.QC_Date_2.Value);
                        }
                        
                        _cmd.Parameters.AddWithValue("@_oper_2_Activity", historyDetails.Operator_2_Activity);
                        _cmd.Parameters.AddWithValue("@_bay_Num_2", historyDetails.Bay_Num_2);
                        _cmd.Parameters.AddWithValue("@_qcVTR_2", historyDetails.QC_VTR_2);
                    }
                   
                    /*****************************************************************************/

                    if (string.IsNullOrWhiteSpace(historyDetails.Revised_By))
                    {
                        _cmd.Parameters.AddWithValue("@_revised_By", null);
                        _cmd.Parameters.AddWithValue("@_revDate", null);
                    }
                   else 
                    {
                        if (!historyDetails.OperatorId.HasValue)
                        {

                            _cmd.Parameters.AddWithValue("@_revised_By", null);
                            _cmd.Parameters.AddWithValue("@_revDate", null);
                        }
                        else
                        {
                            if (!historyDetails.Revised_Date.HasValue)
                            {
                                _cmd.Parameters.AddWithValue("@_revDate", DateTime.Now);
                            }
                            else
                            {
                                _cmd.Parameters.AddWithValue("@_revDate", historyDetails.Revised_Date);
                            }

                            _cmd.Parameters.AddWithValue("@_revised_By", historyDetails.Revised_By);
                        }


                    }
                 

                    /******************************************************************************/

                    if (string.IsNullOrWhiteSpace(historyDetails.Revised_By_2))
                    {
                        _cmd.Parameters.AddWithValue("@_revised_By_2", null);
                        _cmd.Parameters.AddWithValue("@_revDate_2", null);
                    }
                    else 
                    {
                        if(!historyDetails.OperatorId_2.HasValue)
                        {
                            _cmd.Parameters.AddWithValue("@_revised_By_2", null);
                            _cmd.Parameters.AddWithValue("@_revDate_2", null);
                        }
                        else
                        {
                            if (!historyDetails.Revised_Date_2.HasValue)
                            {
                                _cmd.Parameters.AddWithValue("@_revDate_2", DateTime.Now);
                            }
                            else
                            {
                                _cmd.Parameters.AddWithValue("@_revDate_2", historyDetails.Revised_Date_2);
                            }

                            _cmd.Parameters.AddWithValue("@_revised_By_2", historyDetails.Revised_By_2);
                        }
                      
                    }
                 

                    /*************************************************************************************/

                    if (historyDetails.Rec_Date.HasValue) 
                    {
                        _cmd.Parameters.AddWithValue("@_recDate", historyDetails.Rec_Date);
                    }



                    _cmd.Connection.Open();

                    if (_cmd.ExecuteNonQuery() != 1)
                    {
                        result = false;
                        // TO DO :: add logging error here

                    }

                    _cmd.Connection.Close();
                }

            }
            catch (Exception ex)
            {
                var errorMssage = ex.Message;

                result = false;
                throw;
            }

            return result;
        }


    }
}
