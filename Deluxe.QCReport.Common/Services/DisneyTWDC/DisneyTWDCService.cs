using System;
using Deluxe.QCReport.Common.Abstractions.DisneyTWDC;

namespace Deluxe.QCReport.Common.Services.DisneyTWDC
{
    public class DisneyTWDCService : IDisneyTWDCService
    {
        private readonly IDisneyTWDCRepository _rep;

        public DisneyTWDCService(IDisneyTWDCRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                       $"DisneyTWDCService expects ctor injection: {nameof(IDisneyTWDCRepository)}");
        }

        public IDisneyTWDCProgrammeDetails GetProgrammeDetails(int qcNum, int subQCNum)
        {
          return   _rep.GetProgrammeDetails(qcNum, subQCNum);
        }

        public bool SaveProgrammeDetails(IDisneyTWDCProgrammeDetails programmeDetails)
        {
            return _rep.SaveProgrammeDetails(programmeDetails);
        }
    }
}
