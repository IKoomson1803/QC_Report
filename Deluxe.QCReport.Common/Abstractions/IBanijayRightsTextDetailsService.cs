using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IBanijayRightsTextDetailsService
    {
        IBanijayRightsTextDetails Get(int qcNum, int subQCNum);

        bool Save(IBanijayRightsTextDetails textDetails);
           


    }
}
