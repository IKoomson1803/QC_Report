using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IAspectRatioService
    {
        List<string> GetAll();
        bool Save(IAspectRatio aspectRatio);
        IAspectRatio GetByName(string aspectRatio);
    }
}
