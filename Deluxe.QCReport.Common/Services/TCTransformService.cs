using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Services
{
    public class TCTransformService
    {
        private int _fps = 0;
        private int _framesPerHour = 0;     // s/m/h  60x60x1h x fps
        private int _framesPerMinute = 0;   // s/m 60x1m x fps

        public TCTransformService(int fps)
        {
            _fps = fps;
            _framesPerHour = 60 * 60 * fps;
            _framesPerMinute = 60 * fps;
        }


        public int TimecodeToFramesNumber(string timecode)
        {
            int result = 0;

            if (string.IsNullOrEmpty(timecode)) { return 0; }
            if (!timecode.Contains(':')) { return 0; }


            char[] separator = new char[]{':'};
            string[] timecodePices = timecode.Split(separator, StringSplitOptions.RemoveEmptyEntries);

            if (timecodePices.Length != 4) { return 0; }
            else
            {
                try
                {

                    result = int.Parse(timecodePices[3])                   // frames
                        + (int.Parse(timecodePices[2]) * _fps)               // seconds to frames
                        + (int.Parse(timecodePices[1]) * _framesPerMinute)          // minutes to frames
                        + (int.Parse(timecodePices[0]) * _framesPerHour);    // hours to frames
                }
                catch(Exception ex)
                {

                    return 0;

                }

            }


            return result;
        }

        public string FramesNumberToTimecode(int framesTotal)
        {
            string result = "00:00:00:00";

            try
            {
                int hours = 0, minutes = 0, seconds = 0, frames = 0;

                hours = Convert.ToInt32(framesTotal / _framesPerHour);
                minutes = Convert.ToInt32((framesTotal - (hours * _framesPerHour)) / _framesPerMinute);
                seconds = Convert.ToInt32((framesTotal - ((hours * _framesPerHour) + (minutes * _framesPerMinute))) / _fps);
                frames = framesTotal - (hours * _framesPerHour) - (minutes * _framesPerMinute) - (seconds * _fps);

                result = hours.ToString("00") + ":" + minutes.ToString("00") + ":" + seconds.ToString("00") + ":" + frames.ToString("00");
            }
            catch (Exception ex)
            {

            }


            return result;
        }


        public string AddTimecodes(string timecode1, string timecode2)
        {
            int tcLength1 = TimecodeToFramesNumber(timecode1);
            int tcLength2 = TimecodeToFramesNumber(timecode2);


            return FramesNumberToTimecode(tcLength1 + tcLength2);
        }


    }
}
