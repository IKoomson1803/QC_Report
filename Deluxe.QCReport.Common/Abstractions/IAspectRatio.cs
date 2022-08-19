using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IAspectRatio
    {
        int AspectID { get; set; }
        string AspectRatio { get; set; }
    }
}
