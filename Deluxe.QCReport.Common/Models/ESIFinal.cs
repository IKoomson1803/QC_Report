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
    }
}
