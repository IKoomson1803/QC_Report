using System;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;
using Dapper;

namespace Deluxe.QCReport.Common.Repositories
{
    public class DPPRepository : BaseRepository, IDPPRepository
    {

        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public DPPRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"DPPRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"DPPRepository expects ctor injection: {nameof(ILoggerService)}");


        }

        public IDPPProgDetails GetProgDetails(int qcNum, int subQCNum)
        {
            IDPPProgDetails dppProg = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    dppProg = new DPPProgDetails(); 

                    var parameters = new
                    {
                        QCNum = qcNum,
                        SubQCNum = subQCNum
                    };

                    dppProg = connection.Query<DPPProgDetails>(
                                     StoredProcedure.DPP.sel_GetDPPProgDetails.ToString(),
                                     parameters,
                                     null,
                                     false,
                                     null,
                                     commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
                
            }

            return dppProg;
        }

        public bool SaveProgDetails(IDPPProgDetails dPPProgDetails)
        {
            bool saved = false;

            try
            {
               
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.DPP.up_UpdateDPPProgDetails.ToString(),
                                   dPPProgDetails,
                                   null,
                                   null,
                                   commandType: CommandType.StoredProcedure);

                    saved = true;

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
            }

            return saved;

        }

        public IDPPProdDetails GetProdDetails(int qcNum, int subQCNum)
        {
            IDPPProdDetails dppProd = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    dppProd = new DPPProdDetails();

                    var parameters = new
                    {
                        QCNum = qcNum,
                        SubQCNum = subQCNum
                    };

                    dppProd = connection.Query<DPPProdDetails>(
                                     StoredProcedure.DPP.sel_GetDPPProdDetails.ToString(),
                                     parameters,
                                     null,
                                     false,
                                     null,
                                     commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);

            }

            return dppProd;
        }

        public bool SaveProdDetails(IDPPProdDetails dPPProdDetails)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.DPP.up_UpdateDPPProdDetails.ToString(),
                                   dPPProdDetails,
                                   null,
                                   null,
                                   commandType: CommandType.StoredProcedure);

                    saved = true;

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
            }

            return saved;

        }

        public IDPPCommBroadcasters GetCommBroadcasters(int qcNum, int subQCNum)
        {
            IDPPCommBroadcasters item = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    item = new DPPCommBroadcasters();

                    var parameters = new
                    {
                        QCNum = qcNum,
                        SubQCNum = subQCNum
                    };

                    item = connection.Query<DPPCommBroadcasters>(
                                     StoredProcedure.DPP.sel_GetDPPCommBroadcasters.ToString(),
                                     parameters,
                                     null,
                                     false,
                                     null,
                                     commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);

            }

            return item;
        }

        public bool SaveCommBroadcasters(IDPPCommBroadcasters dPPCommBroadcasters)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.DPP.up_UpdateDPPCommBroadcasters.ToString(),
                                   dPPCommBroadcasters,
                                   null,
                                   null,
                                   commandType: CommandType.StoredProcedure);

                    saved = true;

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
            }

            return saved;
        }

        public IDPPProdSignOff GetProdSignOff(int qcNum, int subQCNum)
        {
            IDPPProdSignOff item = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    item = new DPPProdSignOff();

                    var parameters = new
                    {
                        QCNum = qcNum,
                        SubQCNum = subQCNum
                    };

                    item = connection.Query<DPPProdSignOff>(
                                     StoredProcedure.DPP.sel_GetDPPProdSignOff.ToString(),
                                     parameters,
                                     null,
                                     false,
                                     null,
                                     commandType: CommandType.StoredProcedure).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);

            }

            return item;
        }

        public bool SaveProdSignOffs(IDPPProdSignOff dPPProdSignOff)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.DPP.up_UpdateDPPProdSignOff.ToString(),
                                   dPPProdSignOff,
                                   null,
                                   null,
                                   commandType: CommandType.StoredProcedure);

                    saved = true;

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
            }

            return saved;
        }

        public IChecklistDPP GetChecklist(int QCNum, int subQCNum)
        {
            ChecklistDPP result = new ChecklistDPP();
            result.QCNum = QCNum;
            result.SubQCNum = subQCNum;

            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    result = connection.Query<ChecklistDPP>(
                        StoredProcedure.DPP.sel_GetChecklistDPP.ToString(),
                        new { QCNum, subQCNum },
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

            //if(result == null)
            //{
            //    result = new Checklist();
            //    result.Qcnum = QCNum;
            //    result.subQcnum = subQCNum;
            //}

            return result;
        }

        public bool SaveChecklist(IChecklistDPP checklist)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.DPP.ins_up_InsertOrUpdateChecklistDPP.ToString(),
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

        public IList<DPPLog> GetLogs(int QCNum, int subQCNum)
        {
            var result = new List<DPPLog>();
            //result.QCNum = QCNum;
            //result.SubQCNum = subQCNum;

            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    result = connection.Query<DPPLog>(
                        StoredProcedure.DPP.sel_GetDPPLog.ToString(),
                        new { QCNum, subQCNum },
                        null,
                        false,
                        commandTimeout: 120,
                        commandType: CommandType.StoredProcedure).ToList();

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

            //if(result == null)
            //{
            //    result = new Checklist();
            //    result.Qcnum = QCNum;
            //    result.subQcnum = subQCNum;
            //}

            return result;
        }

        public bool SaveLog(IDPPLog dppLog)
        {
            bool saved = false;

            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.DPP.ins_up_InsertOrUpdateDPPLog.ToString(),
                                   dppLog,
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

        public bool DeleteLog(int id)
        {
            bool deleted = false;

            try
            {

                using (IDbConnection connection = OpenConnection(_conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.DPP.del_DeleteDPPLog.ToString(),
                                   new { Id = id },
                                   null,
                                   commandTimeout: 120,
                                   commandType: CommandType.StoredProcedure);

                    deleted = true;

                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(
                    ex);
                _logger.LogSystemActivity(
                    loggerItem);

            }

            return deleted;
        }

    }
}
