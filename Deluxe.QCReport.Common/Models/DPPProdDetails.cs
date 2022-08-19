using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class DPPProdDetails : DPPBase, IDPPProdDetails
    {
        public string ProductionCompany { get; set; }
        public string ContactPhoneNumber { get; set; }
        public string PostCompany { get; set; }
    }
}
