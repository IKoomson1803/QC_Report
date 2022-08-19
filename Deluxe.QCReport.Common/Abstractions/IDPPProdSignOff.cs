using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IDPPProdSignOff
    {
        string AuthorisedBy { get; set; }
        DateTime? AuthorisedDate { get; set; }
        string JobTitle { get; set; }

    }
}
