using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IBanijahRightsTapeLayout
    {
        int Id { get; set; }
        int QCNum { get; set; }
        int SubQCNum { get; set; }
        string Type { get; set; }
        string TimecodeIn { get; set; }
        string TimecodeOut { get; set; }
        string PartDurationExcludingHolds { get; set; }
        string CountAsShow { get; set; }

    }
}
