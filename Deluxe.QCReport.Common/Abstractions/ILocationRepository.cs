﻿using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface ILocationRepository
    {
        List<string> GetLocations();
        bool SaveLocation(ILocation deluxeLocation);

        ILocation GetLocationDetails(string location);
        ILocation GetLocationDetails(int id);

        IList<DeluxeLocation> GetLocationsList();
    }
}
