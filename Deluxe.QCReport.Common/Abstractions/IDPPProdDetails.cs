using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IDPPProdDetails
    {
        string ProductionCompany { get; set; }
        string ContactPhoneNumber { get; set; }
        string PostCompany { get; set; }
    }
}
