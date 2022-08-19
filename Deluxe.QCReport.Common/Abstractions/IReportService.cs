
using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IReportService
    {
        IList<Header> Filter(ISearchParams searchParams);
    }
}
