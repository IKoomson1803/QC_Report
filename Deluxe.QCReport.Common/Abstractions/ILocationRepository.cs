using System.Collections.Generic;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface ILocationRepository
    {
        List<string> GetLocations();
        bool SaveLocation(ILocation deluxeLocation);

        ILocation GetLocationDetails(string location);
    }
}
