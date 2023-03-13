using Deluxe.QCReport.Common.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Repositories
{
    public class OverallSpecsRepository : BaseRepository
    {
        public OverallSpecsVM GetOverallSpecsDetails(int QCNum, int SubQCNum)
        {
            OverallSpecsVM result = new OverallSpecsVM();
            result.Qcnum = QCNum;
            result.subQcnum = SubQCNum;
            result.AssetType = "Tape";

            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_SelectOverallSpecs]";
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

                            result.VideoGain = DR["Bar_Vid"].ToString().Trim();
                            result.ChromaGain = DR["Bar_Chr"].ToString().Trim();
                            result.SetUp = DR["Bar_Set"].ToString().Trim();

                            result.LuminancePeak = DR["Lum_Peak"].ToString().Trim();
                            result.LuminanceAvg = DR["Lum_Avg"].ToString().Trim();
                            result.BlackLevel = DR["Black"].ToString().Trim();
                            result.ChromaPeak = DR["Chroma_Peak"].ToString().Trim();
                            result.ChromaAvg = DR["chroma_Avg"].ToString().Trim();

                            result.VideoCodec = DR["Video_Codec"].ToString().Trim();
                            result.VideoBitRate = DR["Video_Bit_Rate"].ToString().Trim();
                            result.VideoBitDepth = DR["Video_Bit_Depth"].ToString().Trim();
                            result.BitRateMode = DR["Bit_Rate_Mode"].ToString().Trim();
                            result.AudioCodec = DR["Audio_Codec"].ToString().Trim();
                            result.AudioBitRate = DR["Audio_Bit_Rate"].ToString().Trim();
                            result.AudioBitDepth = DR["Audio_Bit_Depth"].ToString().Trim();
                            result.SampleRate = DR["Sample_Rate"].ToString().Trim();
                            result.GOPStructure = DR["GOP_Structure"].ToString().Trim();
                            result.Gamut = DR["Gamut"].ToString().Trim();
                            result.ColourEncoding = DR["Colour_Encoding"].ToString().Trim();
                            result.Filesize = DR["File_Size"].ToString().Trim();

                            result.ActivePicture = DR["Active_Picture"].ToString().Trim();
                            result.FrameSize = DR["Frame_Size"].ToString().Trim();
                            result.IreMv = DR["IRE_MV"].ToString().Trim();

                            result.HBlanking = DR["HBlanking"].ToString().Trim();
                            result.VBlanking = DR["VBlanking"].ToString().Trim();

                            result.PSEResult = DR["PSEResult"].ToString().Trim();
                            result.DecodeCheck = DR["DecodeCheck"].ToString().Trim();
                            result.MaxCLL = DR["MaxCLL"].ToString().Trim();
                            result.MaxFALL = DR["MaxFALL"].ToString().Trim();

                            var individualSpecsRepository = new IndividualSpecsRepository();
                            var individualSpecsVM = individualSpecsRepository.GetIndividualSpecsDetails(QCNum, SubQCNum);

                            if (string.IsNullOrWhiteSpace(result.HBlanking))
                            {
                                result.HBlanking = individualSpecsVM?.HBlanking;
                            }

                            if (string.IsNullOrWhiteSpace(result.VBlanking))
                            {
                                result.VBlanking = individualSpecsVM?.VBlanking;
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


        public bool UpdateOverallSpecsDetails(OverallSpecsVM oasDetails)
        {
            bool result = false;

            try
            {

                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_UpdateOverallSpecs]";

                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", oasDetails.Qcnum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_rev", oasDetails.subQcnum));
                    _cmd.Parameters.Add(GetSqlParameterString("@_lumPeak", oasDetails.LuminancePeak));
                    _cmd.Parameters.Add(GetSqlParameterString("@_chPeak", oasDetails.ChromaPeak));
                    _cmd.Parameters.Add(GetSqlParameterString("@_barVid", oasDetails.VideoGain));
                    _cmd.Parameters.Add(GetSqlParameterString("@_lumAvg", oasDetails.LuminanceAvg));
                    _cmd.Parameters.Add(GetSqlParameterString("@_chAvg", oasDetails.ChromaAvg));
                    _cmd.Parameters.Add(GetSqlParameterString("@_barChr", oasDetails.ChromaGain));
                    _cmd.Parameters.Add(GetSqlParameterString("@_black", oasDetails.BlackLevel));
                    _cmd.Parameters.Add(GetSqlParameterString("@_ireMv", oasDetails.IreMv));
                    _cmd.Parameters.Add(GetSqlParameterString("@_barSet", oasDetails.SetUp));
                    _cmd.Parameters.Add(GetSqlParameterString("@_vidCodec", oasDetails.VideoCodec));
                   _cmd.Parameters.Add(GetSqlParameterString("@_vidRate", oasDetails.VideoBitRate));
                    _cmd.Parameters.Add(GetSqlParameterString("@_vidDepth", oasDetails.VideoBitDepth));
                    _cmd.Parameters.Add(GetSqlParameterString("@_bitRateMode", oasDetails.BitRateMode));
                    _cmd.Parameters.Add(GetSqlParameterString("@_auCodec", oasDetails.AudioCodec));
                    _cmd.Parameters.Add(GetSqlParameterString("@_auRate", oasDetails.AudioBitRate));
                    _cmd.Parameters.Add(GetSqlParameterString("@_auDepth", oasDetails.AudioBitDepth));
                    _cmd.Parameters.Add(GetSqlParameterString("@_sampleRate", oasDetails.SampleRate));
                    _cmd.Parameters.Add(GetSqlParameterString("@_gop", oasDetails.GOPStructure));
                    _cmd.Parameters.Add(GetSqlParameterString("@_gamut", oasDetails.Gamut));
                    _cmd.Parameters.Add(GetSqlParameterString("@_colEnc", oasDetails.ColourEncoding));
                    _cmd.Parameters.Add(GetSqlParameterString("@_fileSize", oasDetails.Filesize));
                    _cmd.Parameters.Add(GetSqlParameterString("@_actPic", oasDetails.ActivePicture));
                    _cmd.Parameters.Add(GetSqlParameterString("@_frSize", oasDetails.FrameSize));

                    _cmd.Parameters.Add(GetSqlParameterString("@_hblanking", oasDetails.HBlanking));
                    _cmd.Parameters.Add(GetSqlParameterString("@_vblanking", oasDetails.VBlanking));

                    _cmd.Parameters.Add(GetSqlParameterString("@_pseresult", oasDetails.PSEResult));
                    _cmd.Parameters.Add(GetSqlParameterString("@_decodecheck", oasDetails.DecodeCheck));
                    _cmd.Parameters.Add(GetSqlParameterString("@_maxcll", oasDetails.MaxCLL));
                    _cmd.Parameters.Add(GetSqlParameterString("@_maxfall", oasDetails.MaxFALL));

                    _cmd.Connection.Open();

                    if (_cmd.ExecuteNonQuery() != 1)
                    {
                        result = false;
                        // TO DO : add loggig error here

                    }
                    else { result = true; }

                    _cmd.Connection.Close();
                }

            }
            catch (Exception ex)
            {
                var erorMessage = ex.Message;
                result = false;
                throw;
            }
            

            return result;
        }

    }
}
