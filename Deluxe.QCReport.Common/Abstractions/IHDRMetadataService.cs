using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IHDRMetadataService
    {
        IHDRMetadata Get(int qcNum, int subQCNum);

        bool Save(IHDRMetadata metadata);
    }
}
