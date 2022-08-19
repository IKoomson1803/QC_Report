using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IClient
    {
        int CustID { get; set; }
        string CustCode { get; set; }
        string CustName { get; set; }
        
        string CustAddress { get; set; }
        string CustPhone { get; set; }
        int? GradingScale { get; set; }

    }
}
