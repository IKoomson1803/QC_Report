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



        public ChecklistDisney GetChecklistDisney(int QCNum, int subQCNum)
        {
            return _rep.GetChecklistDisney(QCNum, subQCNum);
        }

        public bool SaveChecklistDisney(ChecklistDisney checklist)
        {
            return _rep.SaveChecklistDisney(checklist);
        }

        public ChecklistLionsGate GetChecklistLionsGate(int QCNum, int subQCNum)
        {
            return _rep.GetChecklistLionsGate(QCNum, subQCNum);
        }

        public bool SaveChecklistLionsGate(ChecklistLionsGate checklist)
        {
            return _rep.SaveChecklistLionsGate(checklist);
        }

        public ChecklistWarner GetChecklistWarner(int QCNum, int subQCNum)
        {
            return _rep.GetChecklistWarner(QCNum, subQCNum);
        }

        public bool SaveChecklistWarner(ChecklistWarner checklist)
        {
            return _rep.SaveChecklistWarner(checklist);
        }

        public ChecklistWildBunch GetChecklistWildBunch(int QCNum, int subQCNum)
        {
            return _rep.GetChecklistWildBunch(QCNum, subQCNum);
        }

        public bool SaveChecklistWildBunch(ChecklistWildBunch checklist)
        {
            return _rep.SaveChecklistWildBunch(checklist);
        }

        public ChecklistBanijayRights GetChecklistBanijayRights(int QCNum, int subQCNum)
        {
            return _rep.GetChecklisBanijayRights(QCNum, subQCNum);
        }

        public bool SaveChecklistBanijayRights(ChecklistBanijayRights checklist)
        {
            return _rep.SaveChecklistBanijayRights(checklist);
        }
    }
}
