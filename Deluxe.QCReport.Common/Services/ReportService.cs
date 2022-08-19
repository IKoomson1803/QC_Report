using System;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Services
{
    public class ReportService : IReportService
    {
        private readonly IReportRepository _rep;

        public ReportService(IReportRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                     $"ReportService expects ctor injection: {nameof(IUserAccountRepository)}");

        }

        public IList<Header> Filter(ISearchParams searchParams)
        {
            return _rep.Filter(searchParams);
        }

    }
}
