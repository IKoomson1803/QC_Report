using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Deluxe.QCReport.Common.Models;
using System.Web.Mvc;

namespace Deluxe.QCReport.Web.Models
{
    public class HomeVM
    {
        public string SearchWONumber { get; set; }
        public int? SearchQCNumber { get; set; }
         public bool ResponseSuccess { get; set; }
        public string ResponseText { get; set; }
        public int SecurityLevel { get; set; }

        public string QCType { get; set; }

        public string CustomerName { get; set; }

        public string Specification { get; set; }
        public List<string> Specifications { get; set; }

        public JobTreeViewVM JobTVVM { get; set; }
        public NewQCReport NewQC { get; set; }

        public JobDetailsVM JobDetVM { get; set; }
        public QCDetailsVM QCDetVM { get; set; }
        public RevDetailsVM RevDetVM { get; set; }

        public HeaderVM Header_VM { get; set; }
        public HistoryVM History_VM { get; set; }
        public TapeLayoutVM TapeLayout_VM { get; set; }
        public TextInfoVM TextInfo_VM { get; set; }
        public AudioTCVM AudioTC_VM { get; set; }
        public IndividualSpecsVM IndividualSpecs_VM { get; set; }
        public OverallSpecsVM OverallSpecs_VM { get; set; }
        public LogVM Log_VM { get; set; }
        public FinalVM Final_VM { get; set; }
        public ESIFinal ESIFinalVM { get; set; }
        public ESISpecifics ESISpecificsVM { get; set; }


        public Dictionary<int, string> AspectRatioList { get; set; }
        public Dictionary<int, string> ClientNameList { get; set; }
        public Dictionary<int, string> VersionList { get; set; }
        public Dictionary<int, string> FormatList { get; set; }
        public Dictionary<int, string> DescriptionList { get; set; }
        public Dictionary<int, string> StandardList { get; set; }
        public Dictionary<int, string> OperatorList { get; set; }
        public Dictionary<int, string> RevisedByList { get; set; }
        public Dictionary<int, string> QCRoomList { get; set; }
        public Dictionary<int, string> LanguageList { get; set; }
        public Dictionary<int, string> AudioTCList { get; set; }
        public Dictionary<int, string> AudioDescList { get; set; }
        public Dictionary<int, string> ChannelCountList { get; set; }
        public Dictionary<int, string> ToneList { get; set; }
        public Dictionary<int, string> FullSpotCheckList { get; set; }
        public Dictionary<string, string> YesNoList { get; set; }
        public Dictionary<string, string> YesNoNAList { get; set; }
        public Dictionary<string, string> NextWeekOrTrailerPresentList { get; set; }
        public Dictionary<string, string> YesNoNotAllList { get; set; }
        public Dictionary<string, string>  SeamlessOrPartedList { get; set; }
        public Dictionary<int, string> ChannelPhaseList { get; set; }
        public Dictionary<int, string> TCIntegrityList { get; set; }
        public Dictionary<int, string> NoiseReductionList { get; set; }
        public Dictionary<int, string> VideoCodecList { get; set; }
        public Dictionary<int, string> VideoBitDepthList { get; set; }
        public Dictionary<int, string> BitRateModeList { get; set; }
        public Dictionary<int, string> AudioCodecList { get; set; }
        public Dictionary<int, string> AudioBitDepthList { get; set; }
        public Dictionary<int, string> GOPStructureList { get; set; }
        public Dictionary<int, string> GamutList { get; set; }
        public Dictionary<int, string> ColourEncodingList { get; set; }
        public Dictionary<int, string> ClosedCapsList { get; set; }
        public Dictionary<int, string> EvalStatusList { get; set; }
        public Dictionary<string, string> QCStatusList { get; set; }
        public Dictionary<int, string> FinalGradesList { get; set; }
        public Dictionary<int, string> QCTypeList { get; set; }
        public Dictionary<int, string> ScrtList { get; set; }
        public Dictionary<int, string> TimecodeList { get; set; }
        public Dictionary<string, string> PassOrFailList { get; set; }
        public Dictionary<string, string> PassedOrFailedList { get; set; }
        public Dictionary<string, string>  CountAsShowList { get; set; }
        public Dictionary<string, string> QCActionTypeList { get; set; }

        public ChecklistDisney ChecklistDisney { get; set; }
        public ChecklistLionsGate ChecklistLionsGate { get; set; }
        public ChecklistWarner ChecklistWarner { get; set; }
        public ChecklistWildBunch ChecklistWildBunch { get; set; }
        public ChecklistBanijayRights ChecklistBanijayRights { get; set; }
        public FaultDescriptionImage  FaultDescriptionImage { get; set; }
        public List<FaultDescriptionImage> FaultDescriptionImages { get; set; }
        public string Message { get; set; }

        /**************** Add DPP Models **********************************************/
        public DPPProgDetails DPPProgDetails { get; set; }
        public  DPPProdDetails DPPProdDetails { get; set; }
        public DPPCommBroadcasters DPPCommBroadcasters { get; set; }
        public DPPProdSignOff DPPProdSignOff { get; set; }
        public ChecklistDPP ChecklistDPP { get; set; }
        public List<DPPLog> DPPLogs { get; set; }
        public DPPLog DPPLog { get; set; }

        /**************** Add Banijah Rights **********************************************/
        public BanijahRightsProgrammeDetails BanijahRightsProgrammeDetails { get; set; }
        public BanijahRightsProgrammeLayout BanijahRightsProgrammeLayout  { get; set; }
        public BanijahRightsTapeLayout BanijahRightsTapeLayout { get; set; }
        public List<BanijahRightsTapeLayout> BanijahRightsTapeLayouts { get; set; }
        public BanijayRightsTextDetails  BanijayRightsTextDetails { get; set; }
        public List<string> BanijayRightsAspectRatioList { get; set; }
        public List<string> BanijayRightsCaptionSafeList { get; set; }
        public List<string> BanijayRightsCodecList { get; set; }
        public List<string> BanijayRightsFileWrapperList { get; set; }
        public List<string> BanijayRightsFrameRateList { get; set; }
        public List<string> BanijayRightsInShowAndAfterProgList { get; set; }
        public List<string> BanijayRightsLanguageList { get; set; }
        public List<string> BanijayRightsPositionList { get; set; }
        public List<string> BanijayRightsSDROrHDRList { get; set; }
        public List<string> BanijayRightsTimecodeList { get; set; }
        public List<string> BanijayRightsToneList { get; set; }
        public List<string> BanijayRightsTrackContentList { get; set; }
        public List<string> BanijayRightsTypeOfHDRList { get; set; }
        public List<string> BanijayRightsVideoLinesList { get; set; }
        public List<string> BanijayRightsBitRateList { get; set; }

        /*************************************************************************/

    }

}