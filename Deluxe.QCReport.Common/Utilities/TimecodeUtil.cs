using System;


namespace Deluxe.QCReport.Common.Utilities
{
    public class TimecodeUtil
    {
        #region Constants

        private const int _secondLow = 0;
        private const int _secondHigh = 59;
        private const int _minuteLow = 0;
        private const int _minuteHigh = 59;
        private const int _hourLow = 0;
        private const int _hourHigh = 23;
        private const int _frameLow = 0;
     
        private const int _framesPerHour_23_976 = (int)86313.6; //23.976 frames/s/m/h  23.976x60x60x1h
        private const int _framesPerMinute_23_976 = (int)1438.56; //23.976 frames/s/m 23.976x60x1m
        private const int _framesPerSecond_23_976 = (int)23.976; //23.976 frames/s 23.976x1s

        private const int _framesPerHour24 = 86400; //24 frames/s/m/h  24x60x60x1h
        private const int _framesPerMinute24 = 1440; //24 frames/s/m 24x60x1m
        private const int _framesPerSecond24 = 24; //24 frames/s 24x1s

        private const int _framesPerHour25 = 90000; //25 frames/s/m/h  25x60x60x1h
        private const int _framesPerMinute25 = 1500; //25 frames/s/m 25x60x1m
        private const int _framesPerSecond25 = 25; //25 frames/s 25x1s

        public enum TimecodeReturnType
        {
            AsTimecode,
            AsFrames
        }


        public enum TimecodeType
        {
            _23_976,
            _24,
            _25
        }

        #endregion


        public static bool IsTimecodeValid(string timecode, TimecodeType timecodeType)
        {

            try
            {

                if (string.IsNullOrEmpty(timecode)) return false;

                string timeCodeNumericChecker = timecode.Trim().Replace(":", "");

                //Is the length of timecode = 11 ?
                if (timecode.Trim().Length != 11) return false;

                //Is timecode numeric
                if (!ParseUtil.IsNumeric(timeCodeNumericChecker)) return false;

                // split into array
                char[] delimiter = { ':' };
                string[] aTimecode = timecode.Trim().Split(delimiter);

                if (aTimecode.Length != 4) return false;

                int hours = Convert.ToInt32(aTimecode[0]);
                int minutes = Convert.ToInt32(aTimecode[1]);
                int seconds = Convert.ToInt32(aTimecode[2]);
                int frames = Convert.ToInt32(aTimecode[3]);

                if (hours == 0 && minutes == 0 && seconds == 0 && frames == 0) return false;
                if (hours < _hourLow || hours > _hourHigh) return false;
                if (minutes < _minuteLow || minutes > _minuteHigh) return false;
                if (seconds < _secondLow || seconds > _secondHigh) return false;

                switch (timecodeType)
                {
                    case TimecodeType._23_976:
                        if (frames < _frameLow || frames > _framesPerSecond_23_976) return false;
                        break;

                    case TimecodeType._24:
                        if (frames < _frameLow || frames > _framesPerSecond24) return false;
                        break;

                    case TimecodeType._25:
                        if (frames < _frameLow || frames > _framesPerSecond25) return false;
                        break;
                }

                // use PAL max frames

            }
            catch
            {
                return false;
            }

            return true;

        }

        /// <summary>
        /// Checks if Start Timecode is less than End Timecode - Format hh:mm:ss:ff
        /// This applies to Films only because some tapes end timecode overruns 23:59:59:23
        /// </summary>
        /// <param name="timcodeStart"></param>
        /// <param name="timecodeEnd"></param>
        /// <returns></returns>
        public static bool IsTimecodeStartLessThanTimecodeEnd(string startTimcode, string endTimecode, TimecodeType timecodeType)
        {
            return (TimecodeToFrames(startTimcode, timecodeType) < TimecodeToFrames(endTimecode, timecodeType)) ? true : false;
            //return true;
        }

        /// <summary>
        /// Calculates Timecodes duration.
        /// Returns int if TimecodeReturnType is 'AsFrames' else returns a Timecode string(hh:mm:ss:ff)
        /// </summary>
        /// <param name="timecodeStart"></param>
        /// <param name="timecodeEnd"></param>
        /// <param name="delimited"></param>
        /// <param name="timecodeReturnType"></param>
        /// <returns></returns>
        public static object CalculateDuration(string timecodeStart, string timecodeEnd, TimecodeReturnType timecodeReturnType, TimecodeType timecodeType)
        {
            int framesStart, framesEnd, diff;
            object duration = null;

            framesStart = TimecodeToFrames(timecodeStart, timecodeType);
            framesEnd = TimecodeToFrames(timecodeEnd, timecodeType);

            diff = framesEnd - framesStart;

            //If Start Timecode is e.g. 23:59:55:03  and End Time code is e.g. 00:56:27:07, then add 24hours to the End Timecode
            if (diff < 0)
            {

                switch (timecodeType)
                {
                    case TimecodeType._23_976:
                        framesEnd = framesEnd + (_framesPerHour_23_976 * 24);
                        break;

                    case TimecodeType._24:
                        framesEnd = framesEnd + (_framesPerHour24 * 24);
                        break;

                    case TimecodeType._25:
                        framesEnd = framesEnd + (_framesPerHour25 * 24);
                        break;
                }

                diff = framesEnd - framesStart;
            }

            switch (timecodeReturnType)
            {
                case TimecodeReturnType.AsFrames:
                    duration = diff;
                    break;

                case TimecodeReturnType.AsTimecode:
                    duration = FramesToTimecode(diff, timecodeType);
                    break;

            }

            return duration;

        }

        public static int CalculateTotalDurationInHours(string[] timecodes, TimecodeType timecodeType)
        {
            int totalDuration = 0;
            int totalFrames = 0;
            int frames = 0;

            if (timecodes != null)
            {
                foreach (string timecode in timecodes)
                {
                    if (IsTimecodeValid(timecode, timecodeType))
                     {
                        frames = TimecodeToFrames(timecode, timecodeType);
                        totalFrames = totalFrames + frames;
                    }

                }
            }

            switch (timecodeType)
            {
                case TimecodeType._23_976:
                    totalDuration = totalFrames / _framesPerHour_23_976;
                    break;

                case TimecodeType._24:
                    totalDuration = totalFrames / _framesPerHour24;
                    break;

                case TimecodeType._25:
                    totalDuration = totalFrames / _framesPerHour25; 
                    break;
            }

            

            return totalDuration;
        }

        public static int CalculateTotalDurationInMinutes(string[] timecodes, TimecodeType timecodeType)
        {
            int totalDuration = 0;
            int totalFrames = 0;
            int frames = 0;

            if (timecodes != null)
            {
                foreach (string timecode in timecodes)
                {
                    if (IsTimecodeValid(timecode, timecodeType))
                    {
                        frames = TimecodeToFrames(timecode, timecodeType);
                        totalFrames = totalFrames + frames;
                    }
                }
            }

            switch (timecodeType)
            {
                case TimecodeType._23_976:
                    totalDuration = totalFrames / _framesPerMinute_23_976;
                    break;

                case TimecodeType._24:
                    totalDuration = totalFrames / _framesPerMinute24;
                    break;

                case TimecodeType._25:
                    totalDuration = totalFrames / _framesPerMinute25;
                    break;
            }

            return totalDuration;
        }

        public static int CalculateTotalDurationInFrames(string[] timecodes, TimecodeType timecodeType)
        {
            int totalFrames = 0;
            int frames = 0;

            if (timecodes != null)
            {
                foreach (string timecode in timecodes)
                {
                    if (IsTimecodeValid(timecode, timecodeType))
                    {
                        frames = TimecodeToFrames(timecode, timecodeType);
                        totalFrames = totalFrames + frames;
                    }

                }
            }

            return totalFrames;
        }

        public static string CalculateTotalDurationAsTimecode(int totalFrames, TimecodeType timecodeType)
        {
            return FramesToTimecode(totalFrames, timecodeType);
        }

        public static string CalculateTotalDurationAsTimecode(string[] timecodes, TimecodeType timecodeType)
        {
            return FramesToTimecode(CalculateTotalDurationInFrames(timecodes, timecodeType), timecodeType);
        }

        public static decimal GetTimecodeInMinutes(string timecode, TimecodeType timecodeType)
        {
            switch (timecodeType)
            {
                case TimecodeType._23_976:
                    return TimecodeToFrames(timecode, timecodeType) / _framesPerMinute_23_976;

                case TimecodeType._24:
                    return TimecodeToFrames(timecode, timecodeType) / _framesPerMinute24;

                case TimecodeType._25:
                    return TimecodeToFrames(timecode, timecodeType) / _framesPerMinute25;
            }


            return TimecodeToFrames(timecode, timecodeType) / _framesPerMinute24;  //Default
        }

        public static int GetTimecodeInHours(string timecode, TimecodeType timecodeType)
        {
            switch (timecodeType)
            {
                case TimecodeType._23_976:
                    return TimecodeToFrames(timecode, timecodeType) / _framesPerHour_23_976;

                case TimecodeType._24:
                    return TimecodeToFrames(timecode, timecodeType) / _framesPerHour24;

                case TimecodeType._25:
                    return TimecodeToFrames(timecode, timecodeType) / _framesPerHour25;
            }


            return TimecodeToFrames(timecode, timecodeType) / _framesPerHour24; // Default
        }


        /// <summary>
        /// Converts Frames to Timecode
        /// </summary>
        /// <param name="TotalFrames"></param>
        /// <param name="delimited"></param>
        /// <returns></returns>
        public static string FramesToTimecode(int totalFrames, TimecodeType timecodeType)
        {
            int hours = 0, minutes = 0, seconds = 0, frames = 0;

            if (totalFrames == 0) return "00:00:00:00";

            switch (timecodeType)
            {
                case TimecodeType._23_976:
                    hours = Convert.ToInt32(totalFrames / _framesPerHour_23_976);
                    minutes = Convert.ToInt32((totalFrames - (hours * _framesPerHour_23_976)) / _framesPerMinute_23_976);
                    seconds = Convert.ToInt32((totalFrames - ((hours * _framesPerHour_23_976) + (minutes * _framesPerMinute_23_976))) / _framesPerSecond_23_976);
                    frames = totalFrames - (hours * _framesPerHour_23_976) - (minutes * _framesPerMinute_23_976) - (seconds * _framesPerSecond_23_976);
                    break;

                case TimecodeType._24:
                    hours = Convert.ToInt32(totalFrames / _framesPerHour24);
                    minutes = Convert.ToInt32((totalFrames - (hours * _framesPerHour24)) / _framesPerMinute24);
                    seconds = Convert.ToInt32((totalFrames - ((hours * _framesPerHour24) + (minutes * _framesPerMinute24))) / _framesPerSecond24);
                    frames = totalFrames - (hours * _framesPerHour24) - (minutes * _framesPerMinute24) - (seconds * _framesPerSecond24);
                    break;

                case TimecodeType._25:
                    hours = Convert.ToInt32(totalFrames / _framesPerHour25);
                    minutes = Convert.ToInt32((totalFrames - (hours * _framesPerHour25)) / _framesPerMinute25);
                    seconds = Convert.ToInt32((totalFrames - ((hours * _framesPerHour25) + (minutes * _framesPerMinute25))) / _framesPerSecond25);
                    frames = totalFrames - (hours * _framesPerHour25) - (minutes * _framesPerMinute25) - (seconds * _framesPerSecond25);
                    break;
            }

           

            return hours.ToString("00") + ":" + minutes.ToString("00") + ":" + seconds.ToString("00") + ":" + frames.ToString("00");


        }

        /// <summary>
        /// Converts Timecode(hh:mm:ss:ff) to frames 
        /// </summary>
        /// <param name="Timecode"></param>
        /// <returns></returns>
        public static int TimecodeToFrames(string timecode, TimecodeType timecodeType )
        {
            int hours, minutes, seconds, frames;

            if (string.IsNullOrWhiteSpace(timecode)) return 0;

            // Timecode format hh:mm:ss:ff
            // if (timecode.Trim().Length != 11) return 0;

            //Check if timecode is numeric
            if (!ParseUtil.IsNumeric(timecode.Replace(":", ""))) return 0;

            // split into array
            char[] delimiter = { ':' };
            string[] aTimecode = timecode.Trim().Split(delimiter);

            hours = Convert.ToInt32(aTimecode[0]);
            minutes = Convert.ToInt32(aTimecode[1]);
            seconds = Convert.ToInt32(aTimecode[2]);
            frames = Convert.ToInt32(aTimecode[3]);

            switch (timecodeType)
            {
                case TimecodeType._23_976:
                    hours = hours * _framesPerHour_23_976;
                    minutes = minutes * _framesPerMinute_23_976;
                    seconds = seconds * _framesPerSecond_23_976;
                    break;

                case TimecodeType._24:
                    hours = hours * _framesPerHour24;
                    minutes = minutes * _framesPerMinute24;
                    seconds = seconds * _framesPerSecond24;
                    break;

                case TimecodeType._25:
                    hours = hours * _framesPerHour25;
                    minutes = minutes * _framesPerMinute25;
                    seconds = seconds * _framesPerSecond25;
                    break;
            }


             return hours  + minutes + seconds + frames;

        }



    }
}
