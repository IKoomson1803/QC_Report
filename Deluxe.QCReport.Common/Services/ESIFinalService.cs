using System;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Services
{
    public class ESIFinalService : IESIFinalService
    {
        private readonly IESIFinalRepository _rep;

        public ESIFinalService(IESIFinalRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"ESIFinalService expects ctor injection: {nameof(IESIFinalRepository)}");

        }

        public IESIFinal GetESIFinal(int QCNum, int SubQCNum)
        {
            return _rep.GetESIFinal(QCNum, SubQCNum);
        }
      

        public bool SaveESIFinal(IESIFinal esiFinal)
        {
            return _rep.SaveESIFinal(esiFinal);
        }

       
    }
}
