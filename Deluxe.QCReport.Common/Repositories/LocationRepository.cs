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
    public class LocationRepository : BaseRepository, ILocationRepository
    {
        private readonly ConnectionStringSettings _conn;
        private readonly ILoggerService _logger;

        public LocationRepository(ConnectionStringSettings connString, ILoggerService logger)
        {
            this._conn = connString ?? throw new ArgumentNullException(
                       $"LocationRepository expects ctor injection: {nameof(ConnectionStringSettings)}");

            this._logger = logger ?? throw new ArgumentNullException(
                        $"LocationRepository expects ctor injection: {nameof(ILoggerService)}");


        }

        public List<string> GetLocations()
        {
            List<string> list = null;

            try
            {


                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {


                    list = connection.Query<string>(
                                     StoredProcedure.Location.sel_GetLocations.ToString(),
                                     null,
                                     null,
                                     false,
                                     null,
                                     commandType: CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception ex)
            {
                ILoggerItem loggerItem = PopulateLoggerItem(ex);
                _logger.LogSystemActivity(loggerItem);
                //throw;
            }


            return list;
        }


        public ILocation GetLocationDetails(string location)
        {
            ILocation deluxeLocation = null;

            try
            {
                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {
                    deluxeLocation = new LocationVM();

                    var parameters = new
                    {
                        Location = location
                    };

                    deluxeLocation = connection.Query<LocationVM>(
                                     StoredProcedure.Location.sel_GetLocationDetails.ToString(),
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
                //throw;
            }

            return deluxeLocation;
        }

        public bool SaveLocation(ILocation location)
        {
            bool saved = false;

            try
            {
                using (DataClassesDataContext DC = new DataClassesDataContext())
                {
                    try
                    {
                        // Check for duplicates
                        var resultSql = (from l in DC.qcLocations
                                         where l.pkey == location.pkey
                                         select l).FirstOrDefault();


                        if (resultSql != null)
                        {
                            location.pkey = resultSql.pkey;
                        }
                    }
                    catch (Exception)
                    {
                        throw;
                    }

                }

                using (IDbConnection connection = OpenConnection(this._conn.ConnectionString))
                {

                    connection.Execute(
                                   StoredProcedure.Location.ins_up_InsertOrUpdateLocation.ToString(),
                                   location,
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
                throw;
            }

            return saved;

        }

    }
}
