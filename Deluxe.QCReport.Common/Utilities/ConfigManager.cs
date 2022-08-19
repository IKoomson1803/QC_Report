using System;
using System.Configuration;

namespace Deluxe.QCReport.Common.Utilities
{
    public static class ConfigManager
    {
        public static ConnectionStringSettings DatabaseConnection
        {
            get
            {
                var connStringAttrName = ConfigurationManager.AppSettings["DatabaseConnection"].ToString();
                return ConfigurationManager.ConnectionStrings[connStringAttrName];
            }
        }
        public static string HeartBeatInterval
        {
            get { return ConfigurationManager.AppSettings["Heart-Beat-Interval"]; }
        }
        


        public static string WebsiteUrl
        {
            get { return ConfigurationManager.AppSettings["WebsiteUrl"]; }
        }

       

        public static string WebsiteSupportEmail
        {
            get { return ConfigurationManager.AppSettings["WebsiteSupportEmail"]; }
        }

        public static string SmtpServer
        {
            get { return ConfigurationManager.AppSettings["Smtp.Server"]; }
        }

        public static string MailerFrom
        {
            get { return ConfigurationManager.AppSettings["Mailer.From"]; }
        }

        public static string MailerTo
        {
            get { return ConfigurationManager.AppSettings["Mailer.To"]; }
        }

        public static string MailerCC
        {
            get { return ConfigurationManager.AppSettings["Mailer.CC"]; }
        }

        public static string MailerBCC
        {
            get { return ConfigurationManager.AppSettings["Mailer.BCC"]; }
        }

        public static string MailerSupport
        {
            get { return ConfigurationManager.AppSettings["Mailer.Support"]; }
        }



        public static string NewUserSubject
        {
            get { return ConfigurationManager.AppSettings["NewUser-Subject"]; }
        }

        public static string ForgottenUserDetailsSubject
        {
            get { return ConfigurationManager.AppSettings["ForgottenUserDetails-Subject"]; }
        }

        public static string QCPrintOut
        {
            get { return ConfigurationManager.AppSettings["QC-PrintOut"]; }
        }

        public static string ImageExtensions
        {
            get { return ConfigurationManager.AppSettings["Image-Extensions"]; }
        }
        public static int MaxFilesPerUpload
        {
            get { return Convert.ToInt32(ConfigurationManager.AppSettings["Max-Files-Per-Upload"]); }
        }

    }
}
