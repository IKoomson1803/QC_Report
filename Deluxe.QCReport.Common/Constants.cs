using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Deluxe.QCReport.Common
{
    public class Constants
    {
        public enum LookupType
        {
            AspectRatio,
            CustName,
            Version,
            Format,
            TapeDesc,
            Operator,
            QCRoom,
            AudioTC,
            AudioDesc,
            Language,
            TCIntegrity,
            ColourEncoding,
            Gamut,
            GOPStructure,
            AudioBitDepth,
            AudioCodec,
            BitRateMode,
            VideoBitDepth,
            VideoCodec,
            Status, 
            Standard
        }

        public enum Location
        {
            WardourStreet = 1, /*Legacy location*/
            DeluxeAustralia = 7,
            DeluxeBangolore = 8,
            DeluxeHouse  = 9,
            DeluxeMadrid = 10
        }

        public enum UserRole
        {
            ReadOnly = 0,
            Operator = 1,
            SuperUser = 2,
            Administrator = 3
        }

        public enum ActivityType
        {
            Login,
            LogOff,
            CreatedNewUser,
            UpdatedUser,
            DeactivatedUser,
            FailedToCreateNewUser,
            FailedToUpdateUser,
            Search,
            Report,
            ExportedToExcel,
            SendEmail,
            DeletedJob,
            CreatedNewQC,
            UpdatedQC,
            DeletedQC,
            DeletedQCRevisionNumber,
            UpdatedHeader,
            UpdatedHistory,
            UpdatedTapeLayout,
            DeletedTapeLayout,
            DeletedTextInfo,
            UpdatedTextInfo,
            UpdatedAudioTC,
            UpdatedIndividualSpecs,
            UpdatedMeasurements,
            UpdatedOverallspecs,
            UpdatedLog,
            UpdatedFinal,
            CopiedQC,
            DeletedLogDetails,
            CalculatedTimecodeOffset,
            AppliedTimecodeOffset,
            UpdateESISpecifics,
            UpdateESIFinal,
            SaveChecklist,
            HeaderViewed,
            HistoryViewed,
            TapeLayoutViewed,
            TextInfoViewed,
            AudioTCViewed,
            MeasurementsViewed,
            ChecklistViewed,
            LogViewed,
            FinalViewed,
            CopyQCViewed,
            PrintViewed,
            SearchViewed,
            AdminViewed,
            NavigationViwed,
            AudioTCChanged,
            IndividualSpecsViwed,
            DeletedLog,
            ClientSpecsViewed,
            ESISpecificsViewed,
            ESIFinalViewed,
            ReportTypesViewed,
            ByPassChecklist,
            UserDetailsSearched,
            InsertUser,
            UserPartialViewed,
            ClientPartialViewed,
            JobDetailsViewed,
            QCDetailsViewed,
            ClientDetailsSearched,
            ClientDetailsUpdated,
            NewClientAdded,
            LocationPartialViewed,
            LocationDetailsSearched,
            LocationDetailsUpdated,
            NewLocationAdded,
            AspectRatioPartialViewed,
            AspectRatioDetailsSearched,
            AspectRatioDetailsUpdated,
            NewAspectRatioAdded,
            FaultDescriptionAdded,
            FaultDescriptionUpdated,
            FaultDescriptionDeleted,
            FaultDescriptionSearched,
            FaultDescriptionViewed,
            FormatPartialViewed,
            FormatDetailsSearched,
            FormatDetailsUpdated,
            NewFormatAdded,
            ControlRoomPartialViewed,
            ControlRoomDetailsSearched,
            ControlRoomDetailsUpdated,
            NewControlRoomAdded,
            DPPProgDetailsViewed,
            DPPProgDetailsUpdated,
            DPPProdDetailsViewed,
            DPPProdDetailsUpdated,
            DPPCommBroadcastersViewed,
            DPPCommBroadcastersUpdated,
            DPPProdSignOffViewed,
            DPPProdSignOffUpdated,
            DPPChecklistViewed,
            DPPChecklistUpdated,
            DPPLogViewed,
            DPPLogUpdated,
            DPPLogDeleted,

            BanijayRightsProgrammeDetailsViewed,
            BanijayRightsProgrammeDetailsUpdated,
            BanijayRightsAudioViewed,
            BanijayRightsAudioUpdated,
            BanijayRightsAudioDeleted,
            BanijayRightsVideoViewed,
            BanijayRightsVideoUpdated,
            BanijayRightsProgrammeLayoutViewed,
            BanijayRightsProgrammeLayoutUpdated,
            BanijayRightsTextDetailsViewed,
            BanijayRightsTextDetailsUpdated,
            BanijayRightsFaultsViewed,
            BanijayRightsFaultsUpdated,
            BanijayRightsFaultsDeleted,
            BanijayRightsNotesViewed,
            BanijayRightsNotesUpdated


        }

        public enum LogCategory
        {
            Fatal,
            Error,
            Warning,
            Information,
            UserActivity
        }

        public enum LogSource
        {
            Repository,
            Utilities,
            WebApp
        }
    }
}
