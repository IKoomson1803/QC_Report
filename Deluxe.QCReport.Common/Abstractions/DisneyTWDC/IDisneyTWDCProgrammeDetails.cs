using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions.DisneyTWDC
{
    public interface IDisneyTWDCProgrammeDetails
    {
        int QCNum { get; set; }
        int SubQCNum { get; set; }
        string WonderlandShortID { get; set; }
        string QCType { get; set; }
        string QCScope { get; set; }
        string QCProcess { get; set; }
        string ProcessNotes { get; set; }
        string CSRManager { get; set; }
        string FileCreationFacility { get; set; }
        string QCManager { get; set; }

        //From the Header Table
        string QCVendor { get; set; }
        string WorkOrderNumber { get; set; }
        string Title { get; set; }
        string AssetName { get; set; }
       // string QCOperator { get; set; }
        int? QCOperatorId { get; set; }
        DateTime? QCDate { get; set; }
        string QCPlaybackDevice { get; set; }
        string QCRoom { get; set; } // Bay_Num
    }
}
