using System;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Abstractions;


namespace Deluxe.QCReport.Common.Services
{
    public class AspectRatioService : IAspectRatioService
    {


        private readonly IAspectRatioRepository _rep;

        public AspectRatioService(IAspectRatioRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"AspectRatioService expects ctor injection: {nameof(IAspectRatioRepository)}");

        }

        public List<string> GetAll()
        {
            return _rep.GetAll();
        }

        public IAspectRatio GetByName(string aspectRatio)
        {
            return _rep.GetByName(aspectRatio);
        }

        public bool Save(IAspectRatio aspectRatio)
        {
            return _rep.Save(aspectRatio);
        }
    }
}
