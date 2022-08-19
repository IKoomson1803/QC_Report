using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IFaultDescriptionImageService
    {
        List<FaultDescriptionImage> GetAll(int qcNum, int subQCNum);
        bool Save(IFaultDescriptionImage faultDescriptionImage);
        IFaultDescriptionImage GetById(int id);
        bool Delete(int id);


    }
}
