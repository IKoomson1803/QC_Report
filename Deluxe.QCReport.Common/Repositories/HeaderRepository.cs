using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Repositories
{
    public class HeaderRepository : BaseRepository
    {

       
        public HeaderVM GetHeaderDetails(int QCNum, int SubQCNum)
        {
            HeaderVM result = new HeaderVM();
            result.Qcnum = QCNum;
            result.subQcnum = SubQCNum;
            result.AssetType = "Tape";

            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_SelectHeaderDetails]";
                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", QCNum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_Rev", SubQCNum));

                    _cmd.Connection.Open();

                    using (SqlDataReader DR = _cmd.ExecuteReader())
                    {
                       
                        while (DR.Read())
                        {

                            DateTime? dTqc = null;
                            if (DR["QC_date"] != DBNull.Value)
                            {
                                dTqc = Convert.ToDateTime(DR["QC_date"]);
                            }

                            string astType = "Tape";
                            if (DR["AssetType"] != DBNull.Value &&
                                !string.IsNullOrEmpty(DR["AssetType"].ToString().Trim()))
                            {
                                astType = DR["AssetType"].ToString().Trim();
                            }
                            result.QcWONumber = DR["Wonum"].ToString().Trim();
                            result.Pono = DR["Pono"].ToString().Trim();
                            result.This_part = Convert.ToInt32(DR["This_part"]);
                            result.Tot_Part = Convert.ToInt32(DR["Tot_Part"]);
                            result.QC_date = dTqc;
                            result.Aspect = DR["Aspect"].ToString().Trim();
                            result.CustId = Convert.ToInt32(DR["CstId"]);
                            result.CustName = DR["CstName"].ToString().Trim();
                            result.Show = DR["Show"].ToString().Trim();
                            result.Epis_no = DR["Epis_no"].ToString().Trim();
                            result.Epis_name = DR["Epis_Name"].ToString().Trim();
                            result.Version = DR["Version"].ToString().Trim();
                            result.TapeDesc1 = DR["TapeDesc1"].ToString().Trim();
                            result.Format = DR["Format"].ToString().Trim();
                            result.Standard = DR["Standard"].ToString().Trim();
                            result.TRT = DR["TRT"].ToString().Trim();
                            result.TapeNumber = DR["TapeNumber"].ToString().Trim();
                            result.Subtitle = DR["Subtitle"].ToString().Trim();
                            result.HLanguage = DR["HLanguage"].ToString().Trim();
                            result.Status = DR["Status"].ToString().Trim();
                            result.HeadLogo = DR["HeadLogo"].ToString().Trim();
                            result.TailLogo = DR["TailLogo"].ToString().Trim();
                            result.AssetType = astType;
                            result.Filename = DR["Filename"].ToString().Trim();
                            result.QCType = DR["QC_Type"].ToString().Trim();
                            result.Timecode = DR["Timecode"].ToString().Trim();

                            //if (string.IsNullOrWhiteSpace(result.Timecode))
                            //{
                            //    var audioTCRepository = new AudioTCRepository();
                            //    result.Timecode = audioTCRepository.GetAudioTCDetails(QCNum, SubQCNum)?.TimeCode;

                            //}



                        }

                    }

                    _cmd.Connection.Close();
                }

            }
            catch (Exception ex )
            {

                throw;
            }

            return result;
        }

        public bool UpdateHeaderDetails(HeaderVM headerDetails)
        {
            bool result = true;


            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_UpdateHeaderDetails]";

                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", headerDetails.Qcnum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_rev", headerDetails.subQcnum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_thisPart", headerDetails.This_part));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_totPart", headerDetails.Tot_Part));
                    _cmd.Parameters.Add(GetSqlParameterString("@_pono", headerDetails.Pono));
                    _cmd.Parameters.Add(GetSqlParameterString("@_aspect", headerDetails.Aspect));

                    _cmd.Parameters.Add(GetSqlParameterInt("@_custID", headerDetails.CustId));

                    _cmd.Parameters.Add(GetSqlParameterString("@_show", headerDetails.Show));
                    _cmd.Parameters.Add(GetSqlParameterString("@_epNo", headerDetails.Epis_no));
                    _cmd.Parameters.Add(GetSqlParameterString("@_epName", headerDetails.Epis_name));
                    _cmd.Parameters.Add(GetSqlParameterString("@_standard", headerDetails.Standard));
                    _cmd.Parameters.Add(GetSqlParameterString("@_format", headerDetails.Format));
                    _cmd.Parameters.Add(GetSqlParameterString("@_version", headerDetails.Version));
                    _cmd.Parameters.Add(GetSqlParameterString("@_trt", headerDetails.TRT));
                    _cmd.Parameters.Add(GetSqlParameterString("@_tapeDesc", headerDetails.TapeDesc1));
                    _cmd.Parameters.Add(GetSqlParameterString("@_tapeNumber", headerDetails.TapeNumber));
                    _cmd.Parameters.Add(GetSqlParameterString("@_filename", headerDetails.Filename));
                    _cmd.Parameters.Add(GetSqlParameterString("@_subtitle", headerDetails.Subtitle));
                    _cmd.Parameters.Add(GetSqlParameterString("@_hLang", headerDetails.HLanguage));
                    _cmd.Parameters.Add(GetSqlParameterString("@_status", headerDetails.Status));
                    _cmd.Parameters.Add(GetSqlParameterString("@_headLogo", headerDetails.HeadLogo));
                    _cmd.Parameters.Add(GetSqlParameterString("@_tailLogo", headerDetails.TailLogo)); 
                    _cmd.Parameters.Add(GetSqlParameterString("@_timecode", headerDetails.Timecode));
                     _cmd.Parameters.Add(GetSqlParameteNullablerDateTime("@_qcDate", headerDetails.QC_date.Value)); 

            
                    _cmd.Connection.Open();

                    if(_cmd.ExecuteNonQuery() != 1)
                    {
                        result = false;
                        // TODO : add loggig error here
                        
                    }

                    _cmd.Connection.Close();
                }

            }
            catch (Exception ex)
            {
                result = false;
                var errorMesage = ex.Message;
                throw;
            }

            return result;
        }

       
    }

}
