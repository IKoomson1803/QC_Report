using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class ESISpecifics : IESISpecifics
    {
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public string QCType { get; set; }
        public string CustName { get; set; }

        public string ESIEndCreditOrLogo { get; set; }
        public string SeamlessOrParted { get; set; }
        public string IsTextlessPresent { get; set; }
        public string ContentCensoredBleepedOrBlurred { get; set; }
        public string FlashingLightsOrEpilepsyWarningPresent { get; set; }
        public string TimeSpecificTextOrAudioPresent { get; set; }
        public string ExtremeLanguagePresent { get; set; }
        public string NudityPresent { get; set; }
        public string IsMandEComplete { get; set; }  // Yes, No, N/A  // Renamed on UI as  Is M&E Present and Complete 
        /// <summary>
        /// New
        /// </summary>
        public string IsMixMinusNarrationPresentandComplete { get; set; }  // Yes, No, N/A

    }
}
