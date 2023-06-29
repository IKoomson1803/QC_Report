using System;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Services
{
    public class HDRMetadataService : IHDRMetadataService
    {
        private readonly IHDRMetadataRepository _rep;

        public HDRMetadataService(IHDRMetadataRepository rep)
        {

            this._rep = rep ?? throw new ArgumentNullException(
                    $"HDRMetadataService expects ctor injection: {nameof(IHDRMetadataRepository)}");
        }


        public IHDRMetadata Get(int qcNum, int subQCNum)
        {
            return _rep.Get(qcNum, subQCNum);
        }

        public bool Save(IHDRMetadata metadata)
        {
            return Save(metadata);
        }
    }
}
