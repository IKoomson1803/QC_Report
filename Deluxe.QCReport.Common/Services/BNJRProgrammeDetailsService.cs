using System;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Services
{
    public class BNJRProgrammeDetailsService : IBNJRProgrammeDetailsService
    {
        private readonly IBNJRProgrammeDetailsRepository _rep;

        public BNJRProgrammeDetailsService(IBNJRProgrammeDetailsRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"BNJRService expects ctor injection: {nameof(IBNJRProgrammeDetailsRepository)}");

        }


        public IBNJRProgrammeDetails GetProgrammeDetails(int qcNum, int subQCNum)
        {
            return _rep.GetProgrammeDetails(qcNum, subQCNum);
        }

        public bool SaveProgrammeDetails(IBNJRProgrammeDetails programmeDetails)
        {
            return _rep.SaveProgrammeDetails(programmeDetails);
        }
    }
}
