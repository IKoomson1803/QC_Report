using System;
using Deluxe.QCReport.Common.Abstractions;


namespace Deluxe.QCReport.Common.Services
{
    public class BanijayRightsTextDetailsService : IBanijayRightsTextDetailsService
    {
        private readonly IBanijayRightsTextDetailsRepository _rep;

        public BanijayRightsTextDetailsService(IBanijayRightsTextDetailsRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"BanijayRightsTextDetailsService expects ctor injection: {nameof(IBanijayRightsTextDetailsRepository)}");

        }

        public IBanijayRightsTextDetails Get(int qcNum, int subQCNum)
        {
            return _rep.Get(qcNum, subQCNum);
        }

        public bool Save(IBanijayRightsTextDetails textDetails)
        {
            return _rep.Save(textDetails);
        }
    }
}
