using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface ILocation
    {
        int pkey { get; set; }
        string Location { get; set; }
        string Address { get; set; }
        string ReportName { get; set; }



    }
}
