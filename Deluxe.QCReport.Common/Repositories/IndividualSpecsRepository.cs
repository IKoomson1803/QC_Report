using Deluxe.QCReport.Common.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Repositories
{
    public class IndividualSpecsRepository : BaseRepository
    {
        public IndividualSpecsVM GetIndividualSpecsDetails(int QCNum, int SubQCNum)
        {
            IndividualSpecsVM result = new IndividualSpecsVM();
            result.Qcnum = QCNum;
            result.subQcnum = SubQCNum;
            result.AssetType = "Tape";

            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_SelectIndividualSpecs]";
                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", QCNum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_Rev", SubQCNum));

                    _cmd.Connection.Open();

                    using (SqlDataReader DR = _cmd.ExecuteReader())
                    {
                        while (DR.Read())
                        {
                            
                            string astType = "Tape";
                            if (DR["AssetType"] != DBNull.Value &&
                                !string.IsNullOrEmpty(DR["AssetType"].ToString().Trim()))
                            {
                                astType = DR["AssetType"].ToString().Trim();
                            }
                            result.AssetType = astType;
                                
                            result.HBlanking = DR["HBlank"].ToString().Trim();
                            result.VBlanking = DR["VBlank"].ToString().Trim();
                            result.ClosedCaps = DR["CloseCap"].ToString().Trim();

                            result.VideoRF = DR["RF"].ToString().Trim();
                            result.SourceTape = DR["Src_Barcode"].ToString().Trim();
                            result.BurstLevel = DR["Burst_Levl"].ToString().Trim();
                            result.SyncLevel = DR["Sync_Levl"].ToString().Trim();
                            result.FrontPorch = DR["Front_Por"].ToString().Trim();
                            result.ChannelConditions = DR["Channel_Cond"].ToString().Trim();
                            result.Slate = DR["Slate_QC"].ToString().Trim();

                            result.VITS = DR["VITS"].ToString().Trim();
                            result.VIRS = DR["VIRS"].ToString().Trim();
                            result.VITC = DR["VITC"].ToString().Trim();
                            result.Tracking = DR["Tracking_QC"].ToString().Trim();
                            result.Label = DR["Labels_QC"].ToString().Trim();
                            result.ControlTrack = DR["ctl_Track"].ToString().Trim();
                            result.Shipper = DR["Shipper_QC"].ToString().Trim();
                            result.TapeWrap = DR["Tape_Wrap_QC"].ToString().Trim();
                            result.Subtitles = DR["SubTitle_QC"].ToString().Trim();
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


        public bool UpdateIndividualSpecsDetails(IndividualSpecsVM isDetails)
        {
            bool result = false;

            try
            {

                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_UpdateIndividualSpecs]";

                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", isDetails.Qcnum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_rev", isDetails.subQcnum));
                    _cmd.Parameters.Add(GetSqlParameterString("@_hBlank", isDetails.HBlanking));
                    _cmd.Parameters.Add(GetSqlParameterString("@_vBlank", isDetails.VBlanking));
                    _cmd.Parameters.Add(GetSqlParameterString("@_cc", isDetails.ClosedCaps));
                    _cmd.Parameters.Add(GetSqlParameterString("@_vRF", isDetails.VideoRF));
                    _cmd.Parameters.Add(GetSqlParameterString("@_srcBarcode", isDetails.SourceTape));
                    _cmd.Parameters.Add(GetSqlParameterString("@_burstLvl", isDetails.BurstLevel));
                    _cmd.Parameters.Add(GetSqlParameterString("@_syncLvl", isDetails.SyncLevel));
                    _cmd.Parameters.Add(GetSqlParameterString("@_frontPorch", isDetails.FrontPorch));
                    _cmd.Parameters.Add(GetSqlParameterString("@_chConditions", isDetails.ChannelConditions));
                    _cmd.Parameters.Add(GetSqlParameterString("@_slate", isDetails.Slate));
                    _cmd.Parameters.Add(GetSqlParameterString("@_vits", isDetails.VITS));
                    _cmd.Parameters.Add(GetSqlParameterString("@_virs", isDetails.VIRS));
                    _cmd.Parameters.Add(GetSqlParameterString("@_vitc", isDetails.VITC));
                    _cmd.Parameters.Add(GetSqlParameterString("@_tracking", isDetails.Tracking));
                    _cmd.Parameters.Add(GetSqlParameterString("@_label", isDetails.Label));
                    _cmd.Parameters.Add(GetSqlParameterString("@_controlTrack", isDetails.ControlTrack));
                    _cmd.Parameters.Add(GetSqlParameterString("@_shipper", isDetails.Shipper));
                    _cmd.Parameters.Add(GetSqlParameterString("@_tapeWrap", isDetails.TapeWrap));
                    _cmd.Parameters.Add(GetSqlParameterString("@_subtitle", isDetails.Subtitles));


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
            catch (Exception)
            {
                result = false;
                throw;
            }
            

            return result;
        }

    }
}
