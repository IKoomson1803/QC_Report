using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Utilities
{
    public sealed class StringUtil
    {

       public static string GetCurrentTimeStamp()
        {
            return DateTime.Now.ToString("ddMMyyyyhhmmss");
        }

        public static string ListToCommaDelimitedString(List<string> list)
        {
            string[] resultArray = list.ToArray();
            return string.Join(",", resultArray);
        }

        public static string ListToDelimitedString(List<string> list, string delimiter)
        {
            string[] resultArray = list.ToArray();
            return string.Join(delimiter, resultArray);
        }

        public static string ArrayToDelimitedString(string[] resultArray, string delimiter)
        {
            return string.Join(delimiter, resultArray);
        }

        public static string EnsureIsNull(string value)
        {
            return string.IsNullOrWhiteSpace(value) ? null : value;
        }
    }
}
