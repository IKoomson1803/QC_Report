using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface ILocationService
    {
        List<string> GetLocations();
        bool SaveLocation(ILocation deluxeLocation);

        ILocation GetLocationDetails(string location);
        IList<LocationVM> GetLocationsList();


    }
}
