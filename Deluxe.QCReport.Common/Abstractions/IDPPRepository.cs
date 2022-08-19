using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;

namespace Deluxe.QCReport.Common.Abstractions
{
    public interface IDPPRepository
    {
        IDPPProgDetails GetProgDetails(int qcNum, int subQCNum);

        bool SaveProgDetails(IDPPProgDetails dPPProgDetails);

        IDPPProdDetails GetProdDetails(int qcNum, int subQCNum);

        bool SaveProdDetails(IDPPProdDetails dPPProgDetails);

        IDPPCommBroadcasters GetCommBroadcasters(int qcNum, int subQCNum);

        bool SaveCommBroadcasters(IDPPCommBroadcasters dPPCommBroadcasters);

        IDPPProdSignOff GetProdSignOff(int qcNum, int subQCNum);

        bool SaveProdSignOffs(IDPPProdSignOff dPPProdSignOff);

        IChecklistDPP GetChecklist(int qcNum, int subQCNum);
        bool SaveChecklist(IChecklistDPP checklistDPP);

        IList<DPPLog> GetLogs(int qcNum, int subQCNum);
        bool SaveLog(IDPPLog dppLog);
        bool DeleteLog(int id);
    }
}
