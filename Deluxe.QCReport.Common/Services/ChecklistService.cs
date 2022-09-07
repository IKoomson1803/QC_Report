using System;
using System.Collections.Generic;
using Deluxe.QCReport.Common.Models;
using Deluxe.QCReport.Common.Repositories;
using Deluxe.QCReport.Common.Abstractions;

namespace Deluxe.QCReport.Common.Services
{
    public class ChecklistService
    {
        private readonly ChecklistRepository _rep;


        public ChecklistService(ChecklistRepository rep)
        {
            this._rep = rep ?? throw new ArgumentNullException(
                      $"ChecklistService expects ctor injection: {nameof(ChecklistRepository)}");

        }



        public ChecklistDisney GetChecklistDisney(int qcNum, int subQCNum, int customerId)
        {
            return _rep.GetChecklistDisney(qcNum, subQCNum, customerId);
        }

        public bool SaveChecklistDisney(ChecklistDisney checklist)
        {
            return _rep.SaveChecklistDisney(checklist);
        }

        public ChecklistLionsGate GetChecklistLionsGate(int qcNum, int subQCNum, int customerId)
        {
            return _rep.GetChecklistLionsGate(qcNum, subQCNum, customerId);
        }

        public bool SaveChecklistLionsGate(ChecklistLionsGate checklist)
        {
            return _rep.SaveChecklistLionsGate(checklist);
        }

        public ChecklistWarner GetChecklistWarner(int qcNum, int subQCNum, int customerId)
        {
            return _rep.GetChecklistWarner(qcNum, subQCNum, customerId);
        }

        public bool SaveChecklistWarner(ChecklistWarner checklist)
        {
            return _rep.SaveChecklistWarner(checklist);
        }

        public ChecklistWildBunch GetChecklistWildBunch(int qcNum, int subQCNum, int customerId)
        {
            return _rep.GetChecklistWildBunch(qcNum, subQCNum, customerId);
        }

        public bool SaveChecklistWildBunch(ChecklistWildBunch checklist)
        {
            return _rep.SaveChecklistWildBunch(checklist);
        }

        public ChecklistBanijayRights GetChecklistBanijayRights(int qcNum, int subQCNum, int customerId)
        {
            return _rep.GetChecklisBanijayRights(qcNum, subQCNum, customerId);
        }

        public bool SaveChecklistBanijayRights(ChecklistBanijayRights checklist)
        {
            return _rep.SaveChecklistBanijayRights(checklist);
        }
    }
}
