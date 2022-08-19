using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Services
{
    public class FaultDescriptionImageService : IFaultDescriptionImageService
    {
        private readonly IFaultDescriptionImageRepository _rep;

        public FaultDescriptionImageService(IFaultDescriptionImageRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"FaultDescriptionImageService expects ctor injection: {nameof(IFaultDescriptionImageRepository)}");
        }

        public  bool Delete(int id)
        {
            return _rep.Delete(id);
        }

       public  List<FaultDescriptionImage> GetAll(int qcNum, int subQcNum)
        {
            return _rep.GetAll(qcNum, subQcNum);
        }

        public IFaultDescriptionImage GetById(int id)
        {
            return _rep.GetById(id);
        }

        public bool Save(IFaultDescriptionImage faultDescriptionImage)
        {
            return _rep.Save(faultDescriptionImage);
        }
    }
}
