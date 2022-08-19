using System;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Services
{
    public class ESISpecificsService : IESISpecificsService
    {
        private readonly IESISpecificsRepository _rep;

        public ESISpecificsService(IESISpecificsRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"ESISpecificsService expects ctor injection: {nameof(IESISpecificsRepository)}");

        }

        public IESISpecifics GetESISpecifics(int QCNum, int SubQCNum)
        {
            return _rep.GetESISpecifics(QCNum, SubQCNum);
        }

        public bool SaveESISpecifics(IESISpecifics esiSpecifics)
        {
            return _rep.SaveESISpecifics(esiSpecifics);
        }
    }
}
