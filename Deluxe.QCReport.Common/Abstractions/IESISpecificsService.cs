using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IESISpecificsService
    {
        IESISpecifics GetESISpecifics(int QCNum, int SubQCNum);

        bool SaveESISpecifics(IESISpecifics esiSpecifics);
    }
}
