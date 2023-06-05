using System;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class BanijayRightsNotes : IBanijayRightsNotes
    {
        public int QCNum { get; set; }
        public int SubQCNum { get; set; }
        public  DateTime? QCDate { get; set; }
        public string QCActionType { get; set; }
        public string QCVendor { get; set; }
        public int QCOperator { get; set; }
        public string QCKit { get; set; }
        public string WorkOrderNumber { get; set; }
        public string Comments { get; set; }
    }
}
