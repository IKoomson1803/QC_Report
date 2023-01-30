﻿using System.Collections.Generic;
using Deluxe.QCReport.Common.Repositories;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface ILookupsRepository
    {
        IList<string> GetLookups(StoredProcedure.Lookup lookup);
    }
}
