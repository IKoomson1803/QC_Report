using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public  interface ILoggerRepository
    {
        void LogUserActivity(ILoggerItem loggerItem);
        void LogSystemActivity(ILoggerItem loggerItem);
        void LogMessage(ILoggerItem loggerItem);
    }
}
