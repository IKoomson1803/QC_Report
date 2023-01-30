using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using Deluxe.QCReport.Common.LINQ;
using Deluxe.QCReport.Common.Abstractions;
using Dapper;

namespace Deluxe.QCReport.Common.Repositories
{
    public class LookUpsRepository : BaseRepository, ILookupsRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public LookUpsRepository()
        {

        }

        public LookUpsRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"LookupsRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                       $"LookupsRepository expects ctor injection: {nameof(ILoggerService)}");
        }

        public IList<string> GetLookups(StoredProcedure.Lookup lookup)
        {
            var result = new List<string>();
            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    result = connection.Query<string>(
                    StoredProcedure.Lookup.sel_GetLookup.ToString(),
                    new { TableName = lookup.ToString() },
                    null,
                    false,
                    commandTimeout: 120,
                    commandType: CommandType.StoredProcedure).ToList();

                }


            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
            }

            return result;
        }


        public static Dictionary<int, string> GetLookupList(Constants.LookupType type)
        {
            Dictionary<int, string> result = null;

            using(DataClassesDataContext DC = new DataClassesDataContext())
            {
                switch (type)
                {
                    case Constants.LookupType.AspectRatio:
                        result = GetAspectRatio(DC);
                        break;
                    case Constants.LookupType.CustName:
                        result = GetCustName(DC);
                        break;
                    case Constants.LookupType.Version:
                        result = GetVersion(DC);
                        break;
                    case Constants.LookupType.Format:
                        result = GetFormat(DC);
                        break;
                    case Constants.LookupType.TapeDesc:
                        result = GetTapeDesc(DC);
                        break;
                    case Constants.LookupType.Operator:
                        result = GetOperator(DC);
                        break;
                    case Constants.LookupType.QCRoom:
                        result = GetQCRoom(DC);
                        break;
                    case Constants.LookupType.AudioTC:
                        result = GetAudioTC(DC);
                        break;
                    case Constants.LookupType.Language:
                        result = GetLanguage(DC);
                        break;
                    case Constants.LookupType.AudioDesc:
                        result = GetAudioDesc(DC);
                        break;
                    case Constants.LookupType.TCIntegrity:
                        result = GetTCIntegrity(DC);
                        break;
                    case Constants.LookupType.ColourEncoding:
                        result = GetColourEncoding(DC);
                        break;
                    case Constants.LookupType.Gamut:
                        result = GetGamut(DC);
                        break;
                    case Constants.LookupType.GOPStructure:
                        result = GetGOPStructure(DC);
                        break;
                    case Constants.LookupType.AudioBitDepth:
                        result = GetAudioBitDepth(DC);
                        break;
                    case Constants.LookupType.AudioCodec:
                        result = GetAudioCodec(DC);
                        break;
                    case Constants.LookupType.BitRateMode:
                        result = GetBitRateMode(DC);
                        break;
                    case Constants.LookupType.VideoBitDepth:
                        result = GetVideoBitDepth(DC);
                        break;
                    case Constants.LookupType.VideoCodec:
                        result = GetVideoCodec(DC);
                        break;
                    case Constants.LookupType.Standard:
                        result = GetStandard(DC);
                        break;
                    case Constants.LookupType.Status:
                        result = GetStatus(DC);
                        break;
                    default:
                        break;
                }
                
            }
            
            return result;
        }

        private static Dictionary<int, string> GetAspectRatio(DataClassesDataContext DC)
        {
            var result = from r in DC.optAspectRatios
                         orderby r.AspectRatio
                         where r.AspectRatio.Trim() != ""
                         select r;

            return result.ToDictionary(dic => dic.AspectID, dic => dic.AspectRatio.Trim());
        }

        private static Dictionary<int, string> GetCustName(DataClassesDataContext DC)
        {
            var result = from r in DC.qcClients
                         orderby r.CustName
                         where r.CustName.Trim() != ""
                         select r;

            return result.ToDictionary(dic => dic.CustID, dic => dic.CustName.Trim());
        }

        private static Dictionary<int, string> GetVersion(DataClassesDataContext DC)
        {
            var result = from r in DC.optVersions
                         orderby r.Version
                         where r.Version.Trim() != ""
                         select r;

            return result.ToDictionary(dic => dic.VersionID, dic => dic.Version.Trim());
        }

        private static Dictionary<int, string> GetFormat(DataClassesDataContext DC)
        {
            var result = from r in DC.optFormats
                         orderby r.Format
                         where r.Format.Trim() != ""
                         select r;

            return result.ToDictionary(dic => dic.FormatID, dic => dic.Format.Trim());
        }

        private static Dictionary<int, string> GetTapeDesc(DataClassesDataContext DC)
        {
            var result = from r in DC.optTapeDescs
                         orderby r.TapeDesc
                         where r.TapeDesc.Trim() != ""
                         select r;

            return result.ToDictionary(dic => dic.TapeDescID, dic => dic.TapeDesc.Trim());
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="DC"></param>
        /// <returns></returns>
        private static Dictionary<int, string> GetOperator(DataClassesDataContext DC)
        {
            // Select distinct and active operators
            //var result = (from u in DC.qcUsers
            //             orderby u.FullName
            //             where u.FullName.Trim() != ""
            //             && (!u.Deleted.HasValue || u.Deleted != 1)
            //              select u).GroupBy(u => u.FullName).Select(u => u.First()); 

            var result = from u in DC.qcUsers
                          orderby u.FullName
                          where u.FullName.Trim() != ""
                          select u;

            return result.ToDictionary(dic => dic.qcUserID, dic => dic.FullName.Trim());
        }

        private static Dictionary<int, string> GetQCRoom(DataClassesDataContext DC)
        {
            var result = from r in DC.optQCRooms
                         orderby r.QCRoomID
                         where r.BayNumber.Trim() != ""
                         select r;

            return result.ToDictionary(dic => dic.QCRoomID, dic => dic.BayNumber.Trim());
        }

        private static Dictionary<int, string> GetAudioTC(DataClassesDataContext DC)
        {
            var result = from a in DC.optAudioTCs
                         orderby a.AudioTC
                         where a.AudioTC.Trim() != ""
                         select a;

            return result.ToDictionary(dic => dic.AudTCID, dic => dic.AudioTC.Trim());
        }

        private static Dictionary<int, string> GetAudioDesc(DataClassesDataContext DC)
        {
            var result = from a in DC.optAudios
                         orderby a.AudioDesc
                         where a.AudioDesc.Trim() != ""
                          select a;

            return result.ToDictionary(dic => dic.AudioID, dic => dic.AudioDesc.Trim());
        }

        private static Dictionary<int, string> GetLanguage(DataClassesDataContext DC)
        {
            var result = from l in DC.optLanguages
                         orderby l.Language
                         where l.Language.Trim() != ""
                         select l;

            return result.ToDictionary(dic => dic.LangID, dic => dic.Language.Trim());
        }
        
        private static Dictionary<int, string> GetTCIntegrity(DataClassesDataContext DC)
        {
            var result = from t in DC.optTCIntegs
                         orderby t.TCInteg
                         where t.TCInteg.Trim() != ""
                         select t;

            return result.ToDictionary(dic => dic.TCIntegID, dic => dic.TCInteg.Trim());
        }

        private static Dictionary<int, string> GetColourEncoding(DataClassesDataContext DC)
        {
            var result = from c in DC.optColourEncodings
                         orderby c.ColourEncoding
                         where c.ColourEncoding.Trim() != ""
                         select c;

            return result.ToDictionary(dic => dic.ColourEncodingID, dic => dic.ColourEncoding.Trim());
        }

        private static Dictionary<int, string> GetGamut(DataClassesDataContext DC)
        {
            var result = from c in DC.optGamuts
                         orderby c.Gamut
                         where c.Gamut.Trim() != ""
                         select c;

            return result.ToDictionary(dic => dic.GamutID, dic => dic.Gamut.Trim());
        }

        private static Dictionary<int, string> GetGOPStructure(DataClassesDataContext DC)
        {
            var result = from c in DC.optGOPStructures
                         orderby c.GOPStructure
                         where c.GOPStructure.Trim() != ""
                         select c;

            return result.ToDictionary(dic => dic.GOPStructureID, dic => dic.GOPStructure.Trim());
        }

        private static Dictionary<int, string> GetAudioBitDepth(DataClassesDataContext DC)
        {
            var result = from c in DC.optAudioBitDepths
                         orderby c.AudioBitDepth
                         where c.AudioBitDepth.HasValue
                         select c;

            return result.ToDictionary(dic => dic.AudioBitDepthID, dic => dic.AudioBitDepth.Value.ToString());
        }

        private static Dictionary<int, string> GetAudioCodec(DataClassesDataContext DC)
        {
            var result = from c in DC.optAudioCodecs
                         orderby c.AudioCodec
                         where c.AudioCodec.Trim() != ""
                         select c;

            return result.ToDictionary(dic => dic.AudioCodecID, dic => dic.AudioCodec.Trim());
        }

        private static Dictionary<int, string> GetBitRateMode(DataClassesDataContext DC)
        {
            var result = from c in DC.optBitRateModes
                         orderby c.BitRateMode
                         where c.BitRateMode.Trim() != ""
                         select c;

            return result.ToDictionary(dic => dic.BitRateModeID, dic => dic.BitRateMode.Trim());
        }

        private static Dictionary<int, string> GetVideoBitDepth(DataClassesDataContext DC)
        {
            var result = from c in DC.optVideoBitDepths
                         orderby c.VideoBitDepth
                         where c.VideoBitDepth.HasValue
                         select c;

            return result.ToDictionary(dic => dic.VideoBitDepthID, dic => dic.VideoBitDepth.Value.ToString());
        }

        private static Dictionary<int, string> GetVideoCodec(DataClassesDataContext DC)
        {
            var result = from c in DC.optVideoCodecs
                         orderby c.VideoCodec
                         where c.VideoCodec.Trim() != ""
                         select c;

            return result.ToDictionary(dic => dic.VideoCodecID, dic => dic.VideoCodec.Trim());
        }

        private static Dictionary<int, string> GetStatus(DataClassesDataContext DC)
        {
            var result = from c in DC.optStatus
                         orderby c.StatusId
                         where c.Status.Trim() != ""
                         select c;

            return result.ToDictionary(dic => dic.StatusId, dic => dic.Status.Trim());
        }

        private static Dictionary<int, string> GetStandard(DataClassesDataContext DC)
        {
            var result = from c in DC.optStandards
                         orderby c.Standard
                         where c.Standard.Trim() != ""
                         select c;

            return result.ToDictionary(dic => dic.StandardID, dic => dic.Standard.Trim());
        }

        
    }
}
