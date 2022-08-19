using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IClientService
    {
        List<string> GetClients();
        bool SaveClient(IClient client);
        IClient GetClientDetails(string clientName);
        IClient GetClientDetails(int qcNum, int subQCNum);
    }
}
