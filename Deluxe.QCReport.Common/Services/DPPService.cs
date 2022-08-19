using System;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Abstractions;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Services
{
    public class DPPService : IDPPService
    {
        private readonly IDPPRepository _rep;

        public DPPService(IDPPRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"DPPService expects ctor injection: {nameof(IDPPRepository)}");

        }

        public IDPPCommBroadcasters GetCommBroadcasters(int qcNum, int subQCNum)
        {
            return _rep.GetCommBroadcasters(qcNum,subQCNum);
        }

        public IDPPProdDetails GetProdDetails(int qcNum, int subQCNum)
        {
            return _rep.GetProdDetails(qcNum, subQCNum); 
        }

        public IDPPProdSignOff GetProdSignOff(int qcNum, int subQCNum)
        {
            return _rep.GetProdSignOff(qcNum, subQCNum);
        }

        public IDPPProgDetails GetProgDetails(int qcNum, int subQCNum)
        {
            return _rep.GetProgDetails(qcNum, subQCNum);
        }

        public bool SaveCommBroadcasters(IDPPCommBroadcasters dPPCommBroadcasters)
        {
            return _rep.SaveCommBroadcasters(dPPCommBroadcasters);
        }

        public bool SaveProdDetails(IDPPProdDetails dPPProgDetails)
        {
            return _rep.SaveProdDetails(dPPProgDetails);
        }

        public bool SaveProdSignOffs(IDPPProdSignOff dPPProdSignOff)
        {
            return _rep.SaveProdSignOffs(dPPProdSignOff);
        }

        public bool SaveProgDetails(IDPPProgDetails dPPProgDetails)
        {
            return _rep.SaveProgDetails(dPPProgDetails);
        }

        public IChecklistDPP GetChecklist(int qcNum, int subQCNum)
        {
            return _rep.GetChecklist(qcNum, subQCNum);
        }

        public bool SaveChecklist(IChecklistDPP checklistDPP)
        {
            return _rep.SaveChecklist(checklistDPP);
        }

        public IList<DPPLog> GetLogs(int qcNum, int subQCNum)
        {
            return _rep.GetLogs(qcNum, subQCNum);
        }

        public bool SaveLog(IDPPLog dppLog)
        {
            return _rep.SaveLog(dppLog);
        }

        public bool DeleteLog(int id)
        {
            return _rep.DeleteLog(id);
        }
    }
}
