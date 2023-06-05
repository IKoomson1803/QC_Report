using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common.Repositories
{
    public sealed class StoredProcedure
    {
        public enum Logger
        {
            ins_LogUserActivity,
            ins_LogSystemActivity,
            ins_LogEmailMessage,
        }

        public enum User
        {
            ins_up_InsertOrUpdateUser,
            sel_GetUserByUsername,
            sel_GetUsers,
            sel_GetRevisedByUsers

        }

        public enum Client
        {
            sel_GetClients,
            ins_up_InsertOrUpdateClient,
            sel_GetClientDetails,
            sel_GetClientDetailsByQCNum
        }

        public enum Location
        {
            sel_GetLocations,
            ins_up_InsertOrUpdateLocation,
            sel_GetLocationDetails
        }

        public enum AspectRatio
        {
            ins_up_InsertOrUpdateAspectRatio,
            sel_GetAspectRatioDetails,
            sel_GetAspectRatios
        }


        public enum Checklist
        {
            sel_GetChecklist,
            ins_up_InsertOrUpdateChecklist,
            sel_GetChecklistLionsGate,
            ins_up_InsertOrUpdateChecklistLionsGate,
            sel_GetChecklistWarner,
            ins_up_InsertOrUpdateChecklistWarner,
            sel_GetChecklistWildBunch,
            ins_up_InsertOrUpdateChecklistWildBunch,
            sel_GetChecklistBanijayRights,
            ins_up_InsertOrUpdateChecklistBanijayRights
        }

        public enum ESISpecifics
        {
            sel_GetESISpecifics,
            up_UpdateESISpecifics
        }

        public enum ESIFinal
        {
            sel_GetESIFinal,
            up_UpdateESIFinal
           
        }

        public enum FaultDescriptionImage
        {
            ins_up_InsertOrUpdateFaultDescriptionImage,
            del_DeleteFaultDescriptionImage,
            sel_FaultDescriptionImages,
            sel_GetFaultDescriptionImageById
        }

        public enum DPP
        {
            sel_GetDPPProgDetails,
            sel_GetDPPProdDetails,
            sel_GetDPPCommBroadcasters,
            sel_GetDPPProdSignOff,
            up_UpdateDPPProgDetails,
            up_UpdateDPPProdDetails,
            up_UpdateDPPCommBroadcasters,
            up_UpdateDPPProdSignOff,
            sel_GetChecklistDPP,
            ins_up_InsertOrUpdateChecklistDPP,
            sel_GetDPPLog,
            ins_up_InsertOrUpdateDPPLog,
            del_DeleteDPPLog
        }

        public enum BanijayRights
        {
            sel_GetBanijayRightsProgrammeDetails,
            up_UpdateBanijayRightsProgrammeDetails,
            sel_GetBanijayRightsProgrammeLayout,
            ins_up_InsertOrUpdateBanijayRightsProgrammeLayout,
            ins_up_InsertOrUpdateBanijayRightsTapeLayout,
            sel_GetBanijayRightsTapeLayoutById,
            del_DeleteBanijayRightsTapeLayoutById,
            ins_up_InsertOrUpdateBanijayRightsTextDetails,
            sel_GetBanijayRightsTextDetails,
            up_UpdateBanijayRightsNotes,
            sel_GetBanijayRightsNotes

        }

        public enum Lookup
        {
            sel_GetLookup,
            BanijayRightsAspectRatio,
            BanijayRightsCaptionSafe,
            BanijayRightsCodec,
            BanijayRightsFileWrapper,
            BanijayRightsFrameRate,
            BanijayRightsInShowAndAfterProg,
            BanijayRightsLanguage,
            BanijayRightsPosition,
            BanijayRightsSDROrHDR,
            BanijayRightsTimecode,
            BanijayRightsTone,
            BanijayRightsTrackContent,
            BanijayRightsTypeOfHDR,
            BanijayRightsVideoLines,
            BanijayRightsBitRate
        }

       
    }
}
