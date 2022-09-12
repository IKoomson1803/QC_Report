using Deluxe.QCReport.Common.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Repositories
{
    public class FinalRepository : BaseRepository
    {
        public FinalVM GetFinalDetails(int qcNum, int SubQCNum)
        {
            FinalVM result = new FinalVM();
            result.Qcnum = qcNum;
            result.subQcnum = SubQCNum;

            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_SelectFinal]";
                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", qcNum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_Rev", SubQCNum));

                    _cmd.Connection.Open();

                    using (SqlDataReader DR = _cmd.ExecuteReader())
                    {

                        while (DR.Read())
                        {


                            if (DBNull.Value != DR["GradingScale"]) { result.GradingScale = Convert.ToInt32(DR["GradingScale"]); }
                            result.EvalStatus = DR["Eval_Stat"].ToString().Trim();
                            result.QCType = DR["qc_type"].ToString().Trim();

                            if (DBNull.Value != DR["grdVideo"]) { result.GradeVideo = Convert.ToInt32(DR["grdVideo"]); }
                            if (DBNull.Value != DR["grdAudio"]) { result.GradeAudio = Convert.ToInt32(DR["grdAudio"]); }
                            if (DBNull.Value != DR["grdOverall"]) { result.GradeOverall = Convert.ToInt32(DR["grdOverall"]); }

                            result.VideoComments = DR["VideoComments"].ToString().Trim();
                            result.AudioComments = DR["RecommendationComments"].ToString().Trim();
                            result.OverallComments = DR["Comments"].ToString().Trim();

                            result.OTPercent = DR["OTPercent"].ToString().Trim();
                            result.OTVersion = DR["OTVer"].ToString().Trim();
                            result.CTPercent = DR["CTPercent"].ToString().Trim();
                            result.CTVersion = DR["CTVer"].ToString().Trim();
                            result.CapPercent = DR["CapPercent"].ToString().Trim();
                            result.CapVersion = DR["CapVer"].ToString().Trim();

                            result.BroadcastSuitable = DR["Broadcast_Suitable"].ToString().Trim();
                            result.BroadcastSuitableReason = DR["Broadcast_Suitable_Reason"].ToString().Trim();
                            result.DVDBluRaySuitable = DR["DVD_Blu_Ray_Suitable"].ToString().Trim();
                            result.DVDBluRaySuitableReason = DR["DVD_Blu_Ray_Suitable_Reason"].ToString().Trim();
                            result.VODSuitable = DR["VOD_Suitable"].ToString().Trim();
                            result.VODSuitableReason = DR["VOD_Suitable_Reason"].ToString().Trim();

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


        public bool UpdateFinalDetails(FinalVM fDetails)
        {
            bool result = false;

            try
            {

                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_UpdateFinal]";

                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", fDetails.Qcnum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_rev", fDetails.subQcnum));
                    _cmd.Parameters.Add(GetSqlParameterString("@_evalStatus", fDetails.EvalStatus));
                    _cmd.Parameters.Add(GetSqlParameterString("@_oComments", fDetails.OverallComments));
                    _cmd.Parameters.Add(GetSqlParameterString("@_aComments", fDetails.AudioComments));
                    _cmd.Parameters.Add(GetSqlParameterString("@_vComments", fDetails.VideoComments));

                    if (fDetails.GradeOverall.HasValue && fDetails.GradeOverall.Value > 0) { _cmd.Parameters.Add(GetSqlParameterInt("@_gOverall", fDetails.GradeOverall.Value)); }
                    if (fDetails.GradeAudio.HasValue && fDetails.GradeAudio.Value > 0) { _cmd.Parameters.Add(GetSqlParameterInt("@_gAudio", fDetails.GradeAudio.Value)); }
                    if (fDetails.GradeVideo.HasValue && fDetails.GradeVideo.Value > 0) { _cmd.Parameters.Add(GetSqlParameterInt("@_gVideo", fDetails.GradeVideo.Value)); }

                    _cmd.Parameters.Add(GetSqlParameterString("@_otp", fDetails.OTPercent));
                    _cmd.Parameters.Add(GetSqlParameterString("@_otv", fDetails.OTPercent + " Safe"));
                    _cmd.Parameters.Add(GetSqlParameterString("@_ctp", fDetails.CTPercent));
                    _cmd.Parameters.Add(GetSqlParameterString("@_ctv", fDetails.CTPercent + " Safe"));
                    _cmd.Parameters.Add(GetSqlParameterString("@_capp", fDetails.CapPercent));
                    _cmd.Parameters.Add(GetSqlParameterString("@_capv", fDetails.CapPercent + " Safe"));
                    _cmd.Parameters.Add(GetSqlParameterString("@_bcSuit", fDetails.BroadcastSuitable));
                    _cmd.Parameters.Add(GetSqlParameterString("@_bcSuitReason", fDetails.BroadcastSuitableReason));
                    _cmd.Parameters.Add(GetSqlParameterString("@_dvdSuit", fDetails.DVDBluRaySuitable));
                    _cmd.Parameters.Add(GetSqlParameterString("@_dvdSuitReason", fDetails.DVDBluRaySuitableReason));
                    _cmd.Parameters.Add(GetSqlParameterString("@_vodSuit", fDetails.VODSuitable));
                    _cmd.Parameters.Add(GetSqlParameterString("@_vodSuitReason", fDetails.VODSuitableReason));


                    _cmd.Connection.Open();

                    if (_cmd.ExecuteNonQuery() != 1)
                    {
                        result = false;
                        // TODO  : add loggig error here

                    }
                    else { result = true; }

                    _cmd.Connection.Close();
                }

            }
            catch (Exception)
            {
                result = false;
                throw;
            }
            

            return result;
        }

    }
}
