using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IBanijayRightsNotes
    {
        int QCNum { get; set; }
        int SubQCNum { get; set; }
        DateTime? QCDate { get; set; }
        string QCActionType { get; set; }
        string QCVendor { get; set; }
        int QCOperator { get; set; }
        string QCKit { get; set; }
        string WorkOrderNumber { get; set; }
        string Comments { get; set; }
    }



}
