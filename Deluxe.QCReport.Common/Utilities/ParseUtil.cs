using System;
using System.Text.RegularExpressions;

namespace Deluxe.QCReport.Common.Utilities
{
    public static class ParseUtil
    {
        public static string EnsureEndsInSlash(string val)
        {
            if (val.EndsWith("\\"))
                return val;
            else
                return val + "\\";
        }

        public static int ParseNumeric(string text)
        {
            
            try
            {
                return Convert.ToInt32(text);
            }
            catch
            {
                //Not a valid int
                return 0;
            }

        }


        public static bool IsNumeric(string text)
        {
            int number = 0;

            try
            {
                number = Convert.ToInt32(text);
                return true;
            }
            catch
            {
                //Not a valid int
                return false;
            }

        }
        public static bool IsNumeric(object text)
        {
            return IsNumeric(text.ToString());

        }

        public static bool IsValidDateTime(string dateTime, out DateTime tempDateTime)
        {

            if (string.IsNullOrWhiteSpace(dateTime))
            {
                tempDateTime = DateTime.MinValue;
                return false;
            }

            try
            {
                return DateTime.TryParse(dateTime, out tempDateTime);
            }
            catch
            {
                tempDateTime = DateTime.MinValue;
                return false;
            }

        }

        public static int CalculateTotalPages(long numberOfRecords, Int32 pageSize)
        {
            long result;
            int totalPages;

            Math.DivRem(numberOfRecords, pageSize, out result);

            if (result > 0)
                totalPages = (int)((numberOfRecords / pageSize)) + 1;
            else
                totalPages = (int)(numberOfRecords / pageSize);

            return totalPages;

        }

        /// <summary>
        /// Generate Random Number
        /// </summary>
        /// <returns></returns>
        public static int GenerateRandomNumber(int max)
        {
            Random rnd = new Random();
            int randomNumber = rnd.Next(max);
            return randomNumber;
        }

        public static bool GuidTryParse(string x, out Guid g)
        {

            g = Guid.Empty;

            if (String.IsNullOrEmpty(x))
                return false;

            x = x.Replace("-", "").Replace("{", "").Replace("}", "");

            Regex r = new Regex("[0-9A-Fa-f]{32}");

            if (!r.IsMatch(x))
                return false;

            g = new Guid(x);

            return true;

        }
    }
}
