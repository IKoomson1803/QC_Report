using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface ILoggerService
    {
        void LogUserActivity(ILoggerItem loggerItem);
        void LogSystemActivity(ILoggerItem loggerItem);
        void LogMessage(ILoggerItem loggerItem);
    }
}
