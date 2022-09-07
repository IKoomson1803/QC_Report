using System;
using System.Data;
using System.Linq;
using System.Configuration;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.LINQ;
using Deluxe.QCReport.Common.Models;
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
                result = new ChecklistBanijayRights()
                {
                    Qcnum = qcNum,
                    subQcnum = subQCNum,
                    CustId = customerId
            };
                
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
