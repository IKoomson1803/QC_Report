using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Deluxe.QCReport.Common;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface ILoggerItem
    {
        Constants.LogCategory Category { get; set; }
        Constants.ActivityType ActivityType { get; set; }
        string Source { get; set; }
        int? UserId { get; set; }
        string Details { get; set; }
        string IPAddress { get; set; }
    }


}
