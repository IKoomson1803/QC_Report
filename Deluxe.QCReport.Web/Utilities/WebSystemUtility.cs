using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Net;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;
using Deluxe.QCReport.Common;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Services;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Utilities;



namespace Deluxe.QCReport.Web.Utilities
{
    public sealed class WebSystemUtility
    {
        static IUserAccountService _userService = null;
        static ILoggerService _logger = null;

        static WebSystemUtility()
        {
            Initialize();
        }

        static void Initialize()
        {
            var conn = ConfigManager.DatabaseConnection;
            _logger = new LoggerService(
                new LoggerRepository(conn));



            _userService = new UserAccountService(
                new UserAccountRepository(
                    conn,
                    _logger));

        }

        public static void LogUserActivity(string activityDetails, Constants.ActivityType activityType)
        {
            try
            {

                ILoggerItem loggerItem = new LoggerItem()
                {
                    ActivityType = activityType,
                    Category = Constants.LogCategory.UserActivity,
                    Details = activityDetails,
                    IPAddress = GetIPAddress,
                    Source = Constants.LogSource.WebApp.ToString(),
                    UserId = GetLogonUserId
                };

                _logger.LogUserActivity(
                    loggerItem);
            }
            catch (Exception ex)
            {
                LogSystemActivity(
                         ex);
            }
        }

        public static void LogSystemActivity(Exception ex)
        {
            try
            {
                string errorDetails = $"Error Message: {ex.GetDescription()}";

                _logger.LogSystemActivity(
                    new LoggerItem()
                    {
                        Category = Constants.LogCategory.Error,
                        Source = Constants.LogSource.WebApp.ToString(),
                        Details = errorDetails,
                        UserId = GetLogonUserId,
                        IPAddress = GetIPAddress
                    });
            }
            catch (Exception exc)
            {
                LogSystemActivity(
                         exc);
            }

        }

        public static void LogSystemActivity( string errorDetails)
        {
            try
            {
                _logger.LogSystemActivity(
               new LoggerItem()
               {
                   Category = Constants.LogCategory.Error,
                   Source = Constants.LogSource.WebApp.ToString(),
                   Details = errorDetails,
                   UserId = GetLogonUserId,
                   IPAddress = GetIPAddress
               });
            }
            catch (Exception ex)
            {
                LogSystemActivity(
                         ex);
            }


        }
      
        public static string GetIPAddress
        {
            get { return HttpContext.Current?.Request?.UserHostAddress; }
        }

        public static int GetLogonUserId
        {
            get { return UserAccountService.GetUserAccount(HttpContext.Current?.User?.Identity.Name).qcUserId; }
        }


    }


}