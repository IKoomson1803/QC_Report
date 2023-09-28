using System;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Abstractions;


namespace Deluxe.QCReport.Common.Services
{
    public class LocationService : ILocationService
    {
        private readonly ILocationRepository _rep;

        public LocationService(ILocationRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"LocationService expects ctor injection: {nameof(ILocationRepository)}");

        }

        public List<string> GetLocations()
        {
            return _rep.GetLocations();
        }


        public ILocation GetLocationDetails(string location)
        {
            return _rep.GetLocationDetails(location);
        }

        public bool SaveLocation(ILocation deluxeLocation)
        {
            return _rep.SaveLocation(deluxeLocation);
        }

        public IList<LocationVM> GetLocationsList()
        {
            return _rep.GetLocationsList();
        }

        
     }
   }
