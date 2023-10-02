using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;


namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IClientRepository
    {
        List<string> GetClients();
        bool SaveClient(IClient client);
        IClient GetClientDetails(string clientName);
        IClient GetClientDetails(int qcNum, int subQCNum);
        IClient GetClientDetails(int id);
        IList<Client> GetClientsList();
    }
}
