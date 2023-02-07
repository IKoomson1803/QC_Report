using System;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Services
{
    public class BanijahRightsProgrammeDetailsService : IBanijahRightsProgrammeDetailsService
    {
        private readonly IBanijahRightsProgrammeDetailsRepository _rep;

        public BanijahRightsProgrammeDetailsService(IBanijahRightsProgrammeDetailsRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"BNJRService expects ctor injection: {nameof(IBanijahRightsProgrammeDetailsRepository)}");

        }


        public IBanijahRightsProgrammeDetails GetProgrammeDetails(int qcNum, int subQCNum)
        {
            return _rep.GetProgrammeDetails(qcNum, subQCNum);
        }

        public bool SaveProgrammeDetails(IBanijahRightsProgrammeDetails programmeDetails)
        {
            return _rep.SaveProgrammeDetails(programmeDetails);
        }
    }
}
