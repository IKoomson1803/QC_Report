using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IFinalService
    {
        IFinal GetFinalDetails(int qcNum, int subQCNum);
        bool UpdateFinalDetails(IFinal final);

    }
}
