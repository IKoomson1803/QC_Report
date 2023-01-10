using System;
using System.Data;
using System.Linq;
using System.Configuration;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.LINQ;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Services;
using Dapper;


namespace Deluxe.QCReport.Common.Repositories
{
    public class ChecklistRepository : BaseRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;


        public ChecklistRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"ChecklistRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"ChecklistRepository expects ctor injection: {nameof(ILoggerService)}");


        }

        public ChecklistDisney GetChecklistDisney(int qcNum, int subQCNum, int customerId)
        {
            ChecklistDisney result = new ChecklistDisney();
           
            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    result = connection.Query<ChecklistDisney>(
                        StoredProcedure.Checklist.sel_GetChecklist.ToString(),
                        new { QCNum = qcNum, subQCNum  = subQCNum },
                        null,
                        false,
                        commandTimeout: 120,
                        commandType: CommandType.StoredProcedure).FirstOrDefault();

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

            if (result == null)
            {
                result = new ChecklistDisney()
                {
                    Qcnum = qcNum,
                    subQcnum = subQCNum,
                    CustId = customerId
                };
            }

            return result;
        }

        public bool SaveChecklistDisney(ChecklistDisney checklist)
        {
            bool saved = false;

            try
            {
                
                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.Checklist.ins_up_InsertOrUpdateChecklist.ToString(),
                                   checklist,
                                   null,
                                   commandTimeout: 120,
                                   commandType: CommandType.StoredProcedure);

                    saved = true;

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

            return saved;
        }

        public ChecklistLionsGate GetChecklistLionsGate(int qcNum, int subQCNum, int customerId)
        {
            ChecklistLionsGate result = new ChecklistLionsGate();
           
            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    result = connection.Query<ChecklistLionsGate>(
                        StoredProcedure.Checklist.sel_GetChecklistLionsGate.ToString(),
                        new { QCNum = qcNum, subQCNum = subQCNum },
                        null,
                        false,
                        commandTimeout: 120,
                        commandType: CommandType.StoredProcedure).FirstOrDefault();

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

            if (result == null)
            {
                result = new ChecklistLionsGate()
                {
                    Qcnum = qcNum,
                    subQcnum = subQCNum,
                    CustId = customerId
                };

            }

            return result;
        }

        public bool SaveChecklistLionsGate(ChecklistLionsGate checklist)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.Checklist.ins_up_InsertOrUpdateChecklistLionsGate.ToString(),
                                   checklist,
                                   null,
                                   commandTimeout: 120,
                                   commandType: CommandType.StoredProcedure);

                    saved = true;

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

            return saved;
        }


        public ChecklistWarner GetChecklistWarner(int qcNum, int subQCNum, int customerId)
        {
            ChecklistWarner result = new ChecklistWarner();
            
            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    result = connection.Query<ChecklistWarner>(
                        StoredProcedure.Checklist.sel_GetChecklistWarner.ToString(),
                        new { QCNum = qcNum, subQcNum = subQCNum },
                        null,
                        false,
                        commandTimeout: 120,
                        commandType: CommandType.StoredProcedure).FirstOrDefault();

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

                    if (result == null)
                    {
                        result = new ChecklistWarner() {
                        Qcnum = qcNum,
                        subQcnum = subQCNum,
                        CustId = customerId
                    };
               
            }

            return result;
        }

        public bool SaveChecklistWarner(ChecklistWarner checklist)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.Checklist.ins_up_InsertOrUpdateChecklistWarner.ToString(),
                                   checklist,
                                   null,
                                   commandTimeout: 120,
                                   commandType: CommandType.StoredProcedure);

                    saved = true;

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

            return saved;
        }

        public ChecklistWildBunch GetChecklistWildBunch(int qcNum, int subQCNum, int customerId)
        {
            ChecklistWildBunch result = new ChecklistWildBunch();
          
            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    result = connection.Query<ChecklistWildBunch>(
                        StoredProcedure.Checklist.sel_GetChecklistWildBunch.ToString(),
                        new { QCNum = qcNum, subQcNum = subQCNum },
                        null,
                        false,
                        commandTimeout: 120,
                        commandType: CommandType.StoredProcedure).FirstOrDefault();

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

                if (result == null)
                {
                    result = new ChecklistWildBunch() {
                       Qcnum = qcNum,
                       subQcnum = subQCNum,
                       CustId = customerId
                };
              
            }

            return result;
        }

        public bool SaveChecklistWildBunch(ChecklistWildBunch checklist)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.Checklist.ins_up_InsertOrUpdateChecklistWildBunch.ToString(),
                                   checklist,
                                   null,
                                   commandTimeout: 120,
                                   commandType: CommandType.StoredProcedure);

                    saved = true;

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

            return saved;
        }

        public ChecklistBanijayRights GetChecklisBanijayRights(int qcNum, int subQCNum, int customerId)
        {
            ChecklistBanijayRights result = new ChecklistBanijayRights();
        
            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    result = connection.Query<ChecklistBanijayRights>(
                        StoredProcedure.Checklist.sel_GetChecklistBanijayRights.ToString(),
                        new { QCNum = qcNum, subQcNum = subQCNum },
                        null,
                        false,
                        commandTimeout: 120,
                        commandType: CommandType.StoredProcedure).FirstOrDefault();

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

            if (result == null)
            {
                // Map existing Fields here and save 

                OverallSpecsRepository OldESIMeasurementsRepo = new OverallSpecsRepository();
                var oldESIMeasurements = OldESIMeasurementsRepo.GetOverallSpecsDetails(qcNum, subQCNum);

                var loggerRepository = new LoggerRepository(_conn);
                var loggerService = new LoggerService(loggerRepository);
                var oldESISpecificsRepo = new ESISpecificsRepository(_conn, loggerService);
                var oldESISpecifics = oldESISpecificsRepo.GetESISpecifics(qcNum, subQCNum);

                result = new ChecklistBanijayRights()
                {
                    Qcnum = qcNum,
                    subQcnum = subQCNum,
                    CustId = customerId
                };

                if (oldESIMeasurements != null && oldESISpecifics != null)
                {
                    //Old ESI Measurements
                    result.VideoCodec = oldESIMeasurements.VideoCodec;
                    result.SampleRate = oldESIMeasurements.SampleRate;
                    result.FrameSizeOrResolution = oldESIMeasurements.FrameSize;
                    result.AudioCodec = oldESIMeasurements.AudioCodec;
                    result.AudioBitDepth = oldESIMeasurements.AudioBitDepth;

                    //Old ESI Specifics
                    if (!string.IsNullOrWhiteSpace(oldESISpecifics.ESIEndCreditOrLogo))
                    {
                        if (oldESISpecifics.ESIEndCreditOrLogo == "Y")
                        {
                            result.DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram = "Yes";
                        }
                        else if (oldESISpecifics.ESIEndCreditOrLogo == "N")
                        {
                            result.DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram = "No";
                        }
                        else
                        {
                            result.DoesTheFileContainESIOrBanijayLogoAtTheEndOfProgram = oldESISpecifics.ESIEndCreditOrLogo;
                        }
                    }

                    result.IsTheProgrammeSeamlessOrParted = oldESISpecifics.SeamlessOrParted;

                    if (!string.IsNullOrWhiteSpace(oldESISpecifics.IsTextlessPresent))
                    {
                        if (oldESISpecifics.IsTextlessPresent == "Y")
                        {
                            result.AreTextlessElementsPresent = "Yes";
                        }
                        else if (oldESISpecifics.IsTextlessPresent == "N")
                        {
                            result.AreTextlessElementsPresent = "No";
                        }
                        else
                        {
                            result.AreTextlessElementsPresent = oldESISpecifics.IsTextlessPresent;
                        }
                    }

                    if (!string.IsNullOrWhiteSpace(oldESISpecifics.ContentCensoredBleepedOrBlurred))
                    {

                        if (oldESISpecifics.ContentCensoredBleepedOrBlurred == "Y")
                        {
                            result.AudioContentCensoredBleepedOrBlurred =  "Yes" ;
                            result.VideoContentCensoredBleepedOrBlurred = "Yes" ;
                        }
                        else if (oldESISpecifics.ContentCensoredBleepedOrBlurred == "N")
                        {
                            result.AudioContentCensoredBleepedOrBlurred = "No";
                            result.VideoContentCensoredBleepedOrBlurred = "No";
                        }
                        else
                        {
                            result.AudioContentCensoredBleepedOrBlurred = oldESISpecifics.ContentCensoredBleepedOrBlurred;
                            result.VideoContentCensoredBleepedOrBlurred = oldESISpecifics.ContentCensoredBleepedOrBlurred;
                        }
                    }

                    if (!string.IsNullOrWhiteSpace(oldESISpecifics.FlashingLightsOrEpilepsyWarningPresent))
                    {
                        if(oldESISpecifics.FlashingLightsOrEpilepsyWarningPresent == "Y" || oldESISpecifics.FlashingLightsOrEpilepsyWarningPresent == "Yes")
                        {
                            result.FlashingLightsOrEpilepsyWarningPresent = true;
                        }
                        else
                        {
                            result.FlashingLightsOrEpilepsyWarningPresent = false;
                        }
                        
                    }

                    if (!string.IsNullOrWhiteSpace(oldESISpecifics.TimeSpecificTextOrAudioPresent))
                    {
                        if (oldESISpecifics.TimeSpecificTextOrAudioPresent == "Y" || oldESISpecifics.TimeSpecificTextOrAudioPresent == "Yes")
                        {
                            result.TimeSpecificAudioPresent =  true;
                            result.TimeSpecificTextPresent = true ;
                        }
                        else
                        {
                            result.TimeSpecificAudioPresent = false;
                            result.TimeSpecificTextPresent = false;
                        }
                       
                    }

                    if (!string.IsNullOrWhiteSpace(oldESISpecifics.ExtremeLanguagePresent))
                    {
                        if (oldESISpecifics.ExtremeLanguagePresent == "Y" || oldESISpecifics.ExtremeLanguagePresent == "Yes")
                        {
                            result.ExtremeLanguagePresent = true;
                        }
                        else
                        {
                            result.ExtremeLanguagePresent = false;
                        }

                    }

                    if (!string.IsNullOrWhiteSpace(oldESISpecifics.NudityPresent))
                    {
                        if (oldESISpecifics.NudityPresent == "Y" || oldESISpecifics.NudityPresent == "Yes")
                        {
                            result.NudityPresent = true;
                        }
                        else
                        {
                            result.NudityPresent = false;
                        }
                  
                    }

                    if (!string.IsNullOrWhiteSpace(oldESISpecifics.IsMandEComplete))
                    {
                        if (oldESISpecifics.IsMandEComplete == "Y")
                        {
                            result.IsMAndEPresentAndComplete = "Yes";
                        }
                        else if (oldESISpecifics.IsMandEComplete == "N")
                        {
                            result.IsMAndEPresentAndComplete = "No";
                        }
                        else
                        {
                            result.IsMAndEPresentAndComplete = oldESISpecifics.IsMandEComplete;
                        }

                    }


                    if (!string.IsNullOrWhiteSpace(oldESISpecifics.IsMixMinusNarrationPresentandComplete))
                    {
                        if (oldESISpecifics.IsMixMinusNarrationPresentandComplete == "Y")
                        {
                            result.IsMixMinusNarrationPresentAndComplete = "Yes";
                        }
                        else if (oldESISpecifics.IsMixMinusNarrationPresentandComplete == "N")
                        {
                            result.IsMixMinusNarrationPresentAndComplete = "No";
                        }
                        else
                        {
                            result.IsMixMinusNarrationPresentAndComplete = oldESISpecifics.IsMixMinusNarrationPresentandComplete;
                        }

                    }

                    //Save
                    SaveChecklistBanijayRights(result);
                }
               
              
            }

            return result;
        }

        public bool SaveChecklistBanijayRights(ChecklistBanijayRights checklist)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.Checklist.ins_up_InsertOrUpdateChecklistBanijayRights.ToString(),
                                   checklist,
                                   null,
                                   commandTimeout: 120,
                                   commandType: CommandType.StoredProcedure);

                    saved = true;

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

            return saved;
        }

    }
}
