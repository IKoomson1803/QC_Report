using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IESIFinal
    {

        int Qcnum { get; set; }
        int subQcnum { get; set; }
        string Status { get; set; }
        string LuminanceLevelsRating { get; set; }
        string LuminanceLevelsDetails { get; set; }
        string BlackLevelsRating { get; set; }
        string BlackLevelsDetails { get; set; }
        string ChrominanceLevelsRating { get; set; }
        string ChrominanceLevelsDetails { get; set; }
        string AudioPeaksAndLoudnessRating { get; set; }
        string AudioPeaksAndLoudnessDetails { get; set; }
        string TitleSafeRating { get; set; }
        string TitleSafeDetails { get; set; }
        string Comments { get; set; }

        /******* Banijay Rights new template ***********************/
        DateTime? QCDate { get; set; }
        string QCActionType { get; set; }
        string QCVendor { get; set; }
        int QCOperator { get; set; }
        string QCKit { get; set; }
        string WorkOrderNumber { get; set; }

    }
}
