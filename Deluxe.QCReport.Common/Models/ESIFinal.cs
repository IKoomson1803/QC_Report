using System;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class ESIFinal : IESIFinal
    {

        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public string Status { get; set; }
        public string LuminanceLevelsRating { get; set; }
        public string LuminanceLevelsDetails { get; set; }
        public string BlackLevelsRating { get; set; }
        public string BlackLevelsDetails { get; set; }
        public string ChrominanceLevelsRating { get; set; }
        public string ChrominanceLevelsDetails { get; set; }
        public string AudioPeaksAndLoudnessRating { get; set; }
        public string AudioPeaksAndLoudnessDetails { get; set; }
        public string TitleSafeRating { get; set; }
        public string TitleSafeDetails { get; set; }
        public string Comments { get; set; }


        /******* Banijay Rights new template ***********************/
        public DateTime? QCDate { get; set; }
        public string QCActionType { get; set; }
        public string QCVendor { get; set; }
        public int QCOperator { get; set; }
        public string QCKit { get; set; }
        public string WorkOrderNumber { get; set; }

    }
}
