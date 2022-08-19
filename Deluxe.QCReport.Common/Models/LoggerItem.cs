using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Deluxe.QCReport.Common;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Repositories;

namespace Deluxe.QCReport.Common.Models
{
    public class LoggerItem : ILoggerItem
    {
        public Constants.LogCategory Category { get; set; }
        public  Constants.ActivityType ActivityType { get; set; }
        public string Source { get; set; }
        public  int? UserId { get; set; }
        public string Details { get; set; }
        public string IPAddress { get; set; }

    }
}
