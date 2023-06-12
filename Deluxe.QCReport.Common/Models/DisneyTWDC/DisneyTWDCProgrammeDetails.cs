using System;
using Deluxe.QCReport.Common.Abstractions.DisneyTWDC;

namespace Deluxe.QCReport.Common.Models.DisneyTWDC
{
    public class DisneyTWDCProgrammeDetails : IDisneyTWDCProgrammeDetails
    {
        public int QCNum { get; set; }
        public int SubQCNum { get; set; }
        public string WonderlandShortID { get; set; }
        public string QCType { get; set; }
        public string QCScope { get; set; }
        public string QCProcess { get; set; }
        public string ProcessNotes { get; set; }
        public string QCVendor { get; set; }
        public string CSRManager { get; set; }
        public string FileCreationFacility { get; set; }
        public string QCManager { get; set; }

        //From the Header Table
        public string WorkOrderNumber { get; set; }
        public string Title { get; set; }
        public string AssetName { get; set; }
        public string QCOperator { get; set; }
        public DateTime QCDate { get; set; }
        public string QCPlaybackDevice { get; set; }
        public string QCRoom { get; set; } // Bay_Num
    }
}
