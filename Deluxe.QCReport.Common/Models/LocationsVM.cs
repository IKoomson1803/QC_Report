using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Models
{
    public class LocationsVM
    {
        public DeluxeLocation Location { get; set; }
        public List<DeluxeLocation> Locations { get; set; }
    }
}
