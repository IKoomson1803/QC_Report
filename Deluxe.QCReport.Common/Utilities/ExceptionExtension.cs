using System;
using System.Text;

namespace Deluxe.QCReport.Common.Utilities
{
    public static class ExceptionExtension
    {
        /// <summary>
        /// Returns Exception Message, Stack Trace and Inner Exception Message
        /// </summary>
        /// <param name="e"></param>
        /// <returns></returns>
        public static string GetDescription(this Exception e)
        {
            var builder = new StringBuilder();
            AddException(builder, e);

            return builder.ToString();
        }

        private static void AddException(StringBuilder builder, Exception e)
        {
            builder.AppendLine($"Message: {e.Message}");
            builder.AppendLine($"Stack Trace: {e.StackTrace}");
            if (e.InnerException != null)
            {
                builder.AppendLine("Inner Exception");
                AddException(builder, e.InnerException);
            }
        }


    }
}
