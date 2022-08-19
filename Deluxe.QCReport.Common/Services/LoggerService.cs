using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Services
{
    public class LoggerService : ILoggerService
    {

        private readonly ILoggerRepository _rep;

        public LoggerService(ILoggerRepository rep)
        {
            if (rep == null)
                throw new ArgumentNullException(
                    "LoggerService expects ctor injection");

            _rep = rep;
        }

        public void LogUserActivity(ILoggerItem loggerItem)
        {
            _rep.LogUserActivity(loggerItem);
        }
        public void LogSystemActivity(ILoggerItem loggerItem)
        {
            _rep.LogSystemActivity(loggerItem);
        }

        public void LogMessage(ILoggerItem loggerItem)
        {
            _rep.LogMessage(loggerItem);
        }
    }
}
