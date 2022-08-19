using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IESISpecifics
    {
         int Qcnum { get; set; }
        int subQcnum { get; set; }
        //string QCType { get; set; }

        string ESIEndCreditOrLogo { get; set; }
        string SeamlessOrParted { get; set; }
        string IsTextlessPresent { get; set; }
        string ContentCensoredBleepedOrBlurred { get; set; }
        string FlashingLightsOrEpilepsyWarningPresent { get; set; }
        string TimeSpecificTextOrAudioPresent { get; set; }
        string ExtremeLanguagePresent { get; set; }
         string NudityPresent { get; set; }
         string IsMandEComplete { get; set; }  // Yes, No, N/A
        /// <summary>
        /// New
        /// </summary>
        string IsMixMinusNarrationPresentandComplete { get; set; }  // Yes, No, N/A


    }
}
