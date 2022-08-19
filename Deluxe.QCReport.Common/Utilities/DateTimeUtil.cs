using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Utilities
{
    public class DateTimeUtil
    {

        public static DateTime? ParseStringToDate(string stringToParse)
        {


            try
            {
                DateTime result = DateTime.MinValue;
                DateTime.TryParse(stringToParse, out result);

                if (result > DateTime.MinValue)
                {
                    return result;
                }

                return null;

            }
            catch
            {


            }

            return null;
        }

        public static void SetStartAndEndDatesForSearch(ref DateTime? startDate, ref DateTime? endDate)
        {
            DateTime tempDate = new DateTime();

            //DateTime interval search should be between "StartDate 00:00:00" and "EndDate 23:59:59"
            if (startDate.HasValue && !endDate.HasValue)
            {
                tempDate = startDate.Value;
                startDate = AddHoursMinutesAndSecondsToDate(startDate.Value, 0, 0, 0);
                endDate = AddHoursMinutesAndSecondsToDate(tempDate, 23, 59, 59);
            }
            else if (!startDate.HasValue && endDate.HasValue)
            {
                startDate = AddHoursMinutesAndSecondsToDate(endDate.Value, 0, 0, 0);
                endDate = AddHoursMinutesAndSecondsToDate(endDate.Value, 23, 59, 59);
            }
            else if (startDate.HasValue && endDate.HasValue && startDate.Value <= endDate.Value)
            {
                startDate = AddHoursMinutesAndSecondsToDate(startDate.Value, 0, 0, 0);
                endDate = AddHoursMinutesAndSecondsToDate(endDate.Value, 23, 59, 59);
            }
            else if (startDate.HasValue && endDate.HasValue && startDate.Value > endDate.Value)
            {
                //Swap the Start Date and End Date
                tempDate = endDate.Value;
                endDate = startDate.Value;
                startDate = AddHoursMinutesAndSecondsToDate(tempDate, 0, 0, 0);
                endDate = AddHoursMinutesAndSecondsToDate(endDate.Value, 23, 59, 59);
            }
        }

        private static DateTime AddHoursMinutesAndSecondsToDate(DateTime tempDate, double hours, double minutes, double seconds)
        {
            tempDate = tempDate.AddHours(hours);
            tempDate = tempDate.AddMinutes(minutes);
            tempDate = tempDate.AddSeconds(seconds);

            return tempDate;
        }
    }
}
