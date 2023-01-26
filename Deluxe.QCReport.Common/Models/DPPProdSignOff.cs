using System;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Models
{
    public class DPPProdSignOff : QCBase, IDPPProdSignOff
    {

        public string AuthorisedBy { get; set; }
        public DateTime? AuthorisedDate { get; set; }
        public string JobTitle { get; set; }
    }
}
