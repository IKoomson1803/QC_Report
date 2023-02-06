using Deluxe.QCReport.Common.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Repositories
{
    public class AudioTCRepository : BaseRepository
    {

        public AudioTCVM GetAudioTCDetails(int QCNum, int SubQCNum)
        {
            AudioTCVM result = new AudioTCVM();
            result.Qcnum = QCNum;
            result.subQcnum = SubQCNum;
            result.ChannelsList = new List<AudioTCChannel>();

            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_SelectAudioTC]";
                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", QCNum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_Rev", SubQCNum));

                    _cmd.Connection.Open();

                    using (SqlDataReader DR = _cmd.ExecuteReader())
                    {
                        if (DR.HasRows)
                        {

                            while (DR.Read())
                            {
                                int channelNo = 1;
                                bool hasMoreChannels = false;
                                var channelCount = 0;

                                if (channelCount == 0)
                                {
                                    if (!string.IsNullOrEmpty(DR["ChannelCount"].ToString().Trim()))
                                    {
                                        channelCount = Convert.ToInt32(DR["ChannelCount"].ToString().Replace("Channels", "").Trim());

                                        if (channelCount > 0)
                                        {
                                            hasMoreChannels = true;
                                        }

                                    }
                                    else
                                    {
                                        channelCount = GetChannelCount(DR);

                                        if (channelCount > 0)
                                        {
                                            hasMoreChannels = true;
                                        }

                                    }

                                }


                                //result.NoiseReduction = DR["NR"].ToString().Trim();
                                result.TimeCode = DR["time_code"].ToString().Trim();
                                result.AudioQCdInUnity = DR["QCinUnity"].ToString().Trim();
                                //result.CH1and2Phase = DR["CH12_Phase"].ToString().Trim();
                                //result.CH3and4Phase = DR["CH34_Phase"].ToString().Trim();
                                //result.TCIntegrity = DR["TCInteg"].ToString().Trim();
                                result.SurroundSound = DR["SurroundSound"].ToString().Trim();
                                //result.CompMESync = DR["Comp_Sync"].ToString().Trim();
                                //result.LTCVITCMatch = DR["LTC_VITC_Match"].ToString().Trim();
                                //result.AudioPhaseTone = DR["Tone_Phase"].ToString().Trim();
                                result.BitRate = DR["BitRate"].ToString().Trim();


                                while (hasMoreChannels)
                                {
                                    string thisLang = string.Format("Language{0}", channelNo);
                                    string thisDesc = string.Format("ch{0}_desc", channelNo);
                                    string thisLKFS = string.Format("ch{0}_LKFS", channelNo);
                                    string thisTone = string.Format("ch{0}_tone", channelNo);
                                    string thisAvg = string.Format("ch{0}_avg", channelNo);
                                    string thisPeak = string.Format("ch{0}_peak", channelNo);
                                    string thisTruePeak = string.Format("ch{0}_TruePeak", channelNo);
                                    string thisFQC = string.Format("FullQC_ch{0}", channelNo);
                                    string thisSQC = string.Format("SpotQC_ch{0}", channelNo);

                                    string thisInPhase = string.Format("InPhase{0}", channelNo);
                                    string thisDiscreate = string.Format("Discreate{0}", channelNo);

                                    string thisTrackContent = string.Format("TrackContent{0}", channelNo); // Banijay Rights new template


                                    if (channelNo > channelCount)
                                    {
                                        hasMoreChannels = false;
                                    }
                                    else
                                    {
                                            AudioTCChannel tcItem = new AudioTCChannel();
                                            string _tone = DR[thisTone].ToString().Trim();
                                            if (_tone == "-18" || _tone == "-20") { _tone += "dbFS"; }

                                            tcItem.ChannelNo = channelNo;
                                            tcItem.Language = DR[thisLang].ToString().Trim();
                                            tcItem.Description = DR[thisDesc].ToString().Trim();
                                            tcItem.LKFS = DR[thisLKFS].ToString().Trim();
                                            tcItem.Tone = _tone;
                                            tcItem.Average = DR[thisAvg].ToString().Trim();
                                            tcItem.Peak = DR[thisPeak].ToString().Trim();
                                            tcItem.TruePeak = DR[thisTruePeak].ToString().Trim();
                                            tcItem.FullQC = Convert.ToBoolean(DR[thisFQC]);
                                            tcItem.SpotQC = Convert.ToBoolean(DR[thisSQC]);

                                            tcItem.InPhase = DR[thisInPhase].ToString().Trim();
                                            tcItem.Discreate =  DR[thisDiscreate].ToString().Trim();

                                            tcItem.TrackContent = DR[thisTrackContent].ToString().Trim(); // Banijay Rights new template

                                        string _fsQC = string.Empty;
                                            if (tcItem.FullQC) { _fsQC = "Full"; }
                                            if (tcItem.SpotQC) { _fsQC = "Spot"; }

                                            tcItem.FullSpotQC = _fsQC;

                                            result.ChannelsList.Add(tcItem);

                                            channelNo++;
                                        
                                    }


                                }

                                result.Cue = new AudioTCChannel();
                                string _cuetone = DR["cue_tone"].ToString().Trim();
                                if (_cuetone == "-18" || _cuetone == "-20") { _cuetone += "dbFS"; }

                                result.Cue.ChannelNo = 0;
                                result.Cue.Description = DR["cue_desc"].ToString().Trim();
                                result.Cue.LKFS = DR["cue_LKFS"].ToString().Trim();
                                result.Cue.Tone = _cuetone;
                                result.Cue.Average = DR["cue_avg"].ToString().Trim();
                                result.Cue.Peak = DR["cue_peak"].ToString().Trim();
                                result.Cue.TruePeak = DR["cue_TruePeak"].ToString().Trim();
                                result.Cue.FullQC = Convert.ToBoolean(DR["FullQC_cue"]);
                                result.Cue.SpotQC = Convert.ToBoolean(DR["SpotQC_cue"]);

                                string _cuefsQC = string.Empty;
                                if (result.Cue.FullQC) { _cuefsQC = "Full"; }
                                if (result.Cue.SpotQC) { _cuefsQC = "Spot"; }

                                result.Cue.FullSpotQC = _cuefsQC;


                                string chCnt = string.Format("{0} Channels", (channelNo - 1).ToString());

                                if (!string.IsNullOrEmpty(DR["ChannelCount"].ToString().Trim()))
                                {
                                    chCnt = DR["ChannelCount"].ToString().Trim();
                                }
                                else 
                                {
                                    chCnt = channelCount.ToString() + " Channels";
                                }


                                result.ChannelCount = chCnt.ToString();
                            }
                        }
                    }

                    _cmd.Connection.Close();
                }

            }
            catch (Exception ex)
            {
               
                var errorMessage = ex.Message;
                //throw;
            }

            return result;
        }

        private int GetChannelCount(SqlDataReader dr)
        {
            int chCount = 0;

            for(int channelCount = 1; channelCount <=24; channelCount++)
            {
                //    if (dr.HasRows(channelCount).Equals(columnName, StringComparison.InvariantCultureIgnoreCase))
                //        return true;

                // var columnIndex =  dr.GetOrdinal("Language" + channelCount);  // This works for old reports without Description associated to Language
                 var columnIndex =  dr.GetOrdinal("Ch" + channelCount + "_Desc");

                if (dr.IsDBNull(columnIndex))
                {
                    chCount = channelCount-1;
                    break;
                    
                }

                if(channelCount == 24)
                {
                    chCount = channelCount;
                }
            }

            if(chCount > 0)
            {
                return chCount;
            }


            return 0;
        }

        public bool UpdateAudioTCDetails(AudioTCVM audioTCDetails)
        {
            bool result = true;


            try
            {


                using (SqlCommand _cmd = new SqlCommand())
                {
                    _cmd.Connection = _connection;
                    _cmd.CommandTimeout = 600;
                    _cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    _cmd.CommandText = "[bward].[sp_UpdateAudioTC]";

                    _cmd.Parameters.Add(GetSqlParameterInt("@_QCNum", audioTCDetails.Qcnum));
                    _cmd.Parameters.Add(GetSqlParameterInt("@_rev", audioTCDetails.subQcnum));
                    _cmd.Parameters.Add(GetSqlParameterString("@_chCount", audioTCDetails.ChannelCount));
                                      

                    if(audioTCDetails.Cue != null)
                    {
                        bool _fqc_cue = false;
                        bool _sqc_cue = false;
                        if (audioTCDetails.Cue.FullSpotQC == "Full") { _fqc_cue = true; }
                        if (audioTCDetails.Cue.FullSpotQC == "Spot") { _sqc_cue = true; }

                        _cmd.Parameters.Add(GetSqlParameterString("@_cue_Desc", audioTCDetails.Cue.Description));
                        _cmd.Parameters.Add(GetSqlParameterString("@_cue_LKFS", audioTCDetails.Cue.LKFS));
                        _cmd.Parameters.Add(GetSqlParameterString("@_cue_Tone", audioTCDetails.Cue.Tone));
                        _cmd.Parameters.Add(GetSqlParameterString("@_cue_Avg", audioTCDetails.Cue.Average));
                        _cmd.Parameters.Add(GetSqlParameterString("@_cue_Peak", audioTCDetails.Cue.Peak));
                        _cmd.Parameters.Add(GetSqlParameterString("@_cue_TruePeak", audioTCDetails.Cue.TruePeak));
                        _cmd.Parameters.Add(GetSqlParameterBool("@_fullQC_cue", _fqc_cue));
                        _cmd.Parameters.Add(GetSqlParameterBool("@_spotQC_cue", _sqc_cue));
                    }
                                       

                    _cmd.Parameters.Add(GetSqlParameterString("@_nr", audioTCDetails.NoiseReduction));
                    _cmd.Parameters.Add(GetSqlParameterString("@_ch12Phase", audioTCDetails.CH1and2Phase));
                    _cmd.Parameters.Add(GetSqlParameterString("@_ch34Phase", audioTCDetails.CH3and4Phase));
                    _cmd.Parameters.Add(GetSqlParameterString("@_tonePhase", audioTCDetails.AudioPhaseTone));
                    _cmd.Parameters.Add(GetSqlParameterString("@_timeCode", audioTCDetails.TimeCode));
                    _cmd.Parameters.Add(GetSqlParameterString("@_tcInteg", audioTCDetails.TCIntegrity));
                    _cmd.Parameters.Add(GetSqlParameterString("@_compSync", audioTCDetails.CompMESync));
                    _cmd.Parameters.Add(GetSqlParameterString("@_qcInUnity", audioTCDetails.AudioQCdInUnity));
                    _cmd.Parameters.Add(GetSqlParameterString("@_surroundSound", audioTCDetails.SurroundSound));
                    _cmd.Parameters.Add(GetSqlParameterString("@_ltcMatch", audioTCDetails.LTCVITCMatch));

                    _cmd.Parameters.Add(GetSqlParameterString("@BitRate", audioTCDetails.BitRate));


                    int index = 1;
                    if(audioTCDetails.ChannelsList != null && audioTCDetails.ChannelsList.Any())
                    {
                        foreach (AudioTCChannel item in audioTCDetails.ChannelsList)
                        {
                            string thisLang = string.Format("@_language{0}", index);
                            string thisDesc = string.Format("@_ch{0}_Desc", index);
                            string thisLKFS = string.Format("@_ch{0}_LKFS", index);
                            string thisTone = string.Format("@_ch{0}_Tone", index);
                            string thisAvg = string.Format("@_ch{0}_Avg", index);
                            string thisPeak = string.Format("@_ch{0}_Peak", index);
                            string thisTruePeak = string.Format("@_ch{0}_TruePeak", index);
                            string thisFQC = string.Format("@_fullQC_ch{0}", index);
                            string thisSQC = string.Format("@_spotQC_ch{0}", index);

                            string thisInPhase = string.Format("@_ch{0}_InPhase", index);
                            string thisDiscreate = string.Format("@_ch{0}_Discreate", index);

                            string thisTrackContent = string.Format("@_ch{0}_TrackContent", index); // Banijay Rights new template

                            bool _fqc = false;
                            bool _sqc = false;
                            if (item.FullSpotQC == "Full") { _fqc = true; }
                            if (item.FullSpotQC == "Spot") { _sqc = true; }

                            _cmd.Parameters.Add(GetSqlParameterString(thisLang, item.Language));
                            _cmd.Parameters.Add(GetSqlParameterString(thisDesc, item.Description));
                            _cmd.Parameters.Add(GetSqlParameterString(thisLKFS, item.LKFS));
                            _cmd.Parameters.Add(GetSqlParameterString(thisTone, item.Tone));
                            _cmd.Parameters.Add(GetSqlParameterString(thisAvg, item.Average));
                            _cmd.Parameters.Add(GetSqlParameterString(thisPeak, item.Peak));
                            _cmd.Parameters.Add(GetSqlParameterString(thisTruePeak, item.TruePeak));

                            _cmd.Parameters.Add(GetSqlParameterString(thisInPhase, item.InPhase));
                            _cmd.Parameters.Add(GetSqlParameterString(thisDiscreate, item.Discreate));

                            _cmd.Parameters.Add(GetSqlParameterString(thisTrackContent, item.TrackContent)); // Banijay Rights new template

                            _cmd.Parameters.Add(GetSqlParameterBool(thisFQC, _fqc));
                            _cmd.Parameters.Add(GetSqlParameterBool(thisSQC, _sqc));

                            index++;

                        }


                    }


                    _cmd.Connection.Open();

                    _cmd.ExecuteNonQuery();

                    _cmd.Connection.Close();
                }

            }
            catch (Exception ex)
            {
                result = false;
                var errorMessage = ex.Message;
               // throw;
            }

            return result;
        }

    }
}
