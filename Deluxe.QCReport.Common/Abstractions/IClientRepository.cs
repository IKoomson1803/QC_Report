using System.Collections.Generic;


namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IClientRepository
    {
        List<string> GetClients();
        bool SaveClient(IClient client);
        IClient GetClientDetails(string clientName);
        IClient GetClientDetails(int qcNum, int subQCNum);
    }
}
