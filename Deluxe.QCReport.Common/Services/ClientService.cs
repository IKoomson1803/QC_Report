using System;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Services
{
    public class ClientService : IClientService
    {
        private readonly IClientRepository _rep;

        public ClientService(IClientRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"ClientService expects ctor injection: {nameof(IClientRepository)}");

        }

        public List<string> GetClients()
        {
            return _rep.GetClients();
        }
         public bool SaveClient(IClient client)
        {
            return _rep.SaveClient(client);
        }

        public IClient GetClientDetails(string clientName)
        {
            return _rep.GetClientDetails(clientName);
        }

        public IClient GetClientDetails(int qcNum, int subQCNum)
        {
            return _rep.GetClientDetails(qcNum, subQCNum);
        }
    }
}
