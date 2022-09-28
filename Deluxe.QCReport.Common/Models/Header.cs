using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace Deluxe.QCReport.Common.Models
{
    public class Header
        { 
       
        public int Qcnum { get; set; }
        public int subQcnum { get; set; }
        public string Wonum { get; set; }
        public int CustId { get; set; }
        public string CustName { get; set; }
        public string Show { get; set; }
        public string Epis_no { get; set; }
        public string Epis_Name { get; set; }

        public string Comments { get; set; }
         public int Tot_Part { get; set; }
       public string TapeDesc1 { get; set; }
        public string TapeDesc2 { get; set; }
        public string Standard { get; set; }
        public string Format { get; set; }
        public string Version { get; set; }
        public string Origin { get; set; }
        public string Aspect { get; set; }
        public string Textless { get; set; }
        public string client_trk { get; set; }
        public string TRT { get; set; }
        public string bay_num { get; set; }
        public string supervise { get; set; }
        public string qc_type { get; set; }
        public string in_house { get; set; }
        public string DVNR { get; set; }
        public string TelecineOp { get; set; }
        public string addinfo { get; set; }
        public string src_standard { get; set; }
        public string src_desc { get; set; }
        public DateTime Input_Date { get; set; }
        public string Pono { get; set; }
        public DateTime QC_date { get; set; }
       public DateTime? QC_Date_2 { get; set; }
        public string Eval_Stat { get; set; }
        public DateTime revised_date { get; set; }
        public bool FullQC_Vid { get; set; }
        public bool FullQC_Ch1 { get; set; }
        public bool FullQC_Ch2 { get; set; }
        public bool FullQC_Ch3 { get; set; }
        public bool FullQC_Ch4 { get; set; }
        public bool FullQC_Ch5 { get; set; }
        public bool FullQC_Ch6 { get; set; }
        public bool FullQC_Ch7 { get; set; }
        public bool FullQC_Ch8 { get; set; }
        public bool FullQC_Cue { get; set; }
        public bool SpotQC_Vid { get; set; }
        public bool SpotQC_Ch1 { get; set; }
        public bool SpotQC_Ch2 { get; set; }
        public bool SpotQC_Ch3 { get; set; }
        public bool SpotQC_Ch4 { get; set; }
        public bool SpotQC_Ch5 { get; set; }
        public bool SpotQC_Ch6 { get; set; }
        public bool SpotQC_Ch7 { get; set; }
        public bool SpotQC_Ch8 { get; set; }
        public bool SpotQC_Cue { get; set; }
        public string Revised_By { get; set; }
        public string Revised_By_2 { get; set; }
        public string QC_VTR { get; set; }
        public int Operator { get; set; }
        public string FullName { get; set; }
        public string FullName2 { get; set; }
        public string Stock_Mfg { get; set; }
        public string Stock_Batch { get; set; }
        public string src_Format { get; set; }
        public DateTime Rec_Date { get; set; }
        public string Rec_vtr { get; set; }
        public string Rec_fac { get; set; }
        public string Bar_Vid { get; set; }
        public string Bar_Chr { get; set; }
        public string Bar_Set { get; set; }
        public string Black { get; set; }
        public string Chroma_Avg { get; set; }
        public string Lum_Avg { get; set; }
        public string Lum_Peak { get; set; }
        public string Chroma_peak { get; set; }
        public string format_qc { get; set; }
        public string IRE_MV { get; set; }
        public string Duration { get; set; }
        public string TapeNumber { get; set; }
        public string Subtitle { get; set; }
        public string HLanguage { get; set; }
        public string Status { get; set; }
        public string HeadLogo { get; set; }
        public string TailLogo { get; set; }
        public int This_part { get; set; }
        public int Deleted { get; set; }
        public string OTPercent { get; set; }
        public string OTVer { get; set; }
        public string CTPercent { get; set; }
        public string CTVer { get; set; }
        public string CapPercent { get; set; }
        public string CapVer { get; set; }
        public int grdVideo { get; set; }
        public int grdAudio { get; set; }
        public int grdOverall { get; set; }
        public string RecommendationComments { get; set; }
        public bool FullQC_Ch9 { get; set; }
        public bool FullQC_Ch10 { get; set; }
        public bool FullQC_Ch11 { get; set; }
        public bool FullQC_Ch12 { get; set; }
        public bool FullQC_Ch13 { get; set; }
        public bool FullQC_Ch14 { get; set; }
        public bool FullQC_Ch15 { get; set; }
        public bool FullQC_Ch16 { get; set; }
        public bool SpotQC_Ch9 { get; set; }
        public bool SpotQC_Ch10 { get; set; }
        public bool SpotQC_Ch11 { get; set; }
        public bool SpotQC_Ch12 { get; set; }
        public bool SpotQC_Ch13 { get; set; }
        public bool SpotQC_Ch14 { get; set; }
        public bool SpotQC_Ch15 { get; set; }
        public bool SpotQC_Ch16 { get; set; }
        public string AssetType { get; set; }
        public string Filename { get; set; }
        public bool FullQC_Ch17 { get; set; }
        public bool FullQC_Ch18 { get; set; }
        public bool FullQC_Ch19 { get; set; }
        public bool FullQC_Ch20 { get; set; }
        public bool FullQC_Ch21 { get; set; }
        public bool FullQC_Ch22 { get; set; }
        public bool FullQC_Ch23 { get; set; }
        public bool FullQC_Ch24 { get; set; }
        public bool SpotQC_Ch17 { get; set; }
        public bool SpotQC_Ch18 { get; set; }
        public bool SpotQC_Ch19 { get; set; }
        public bool SpotQC_Ch20 { get; set; }
        public bool SpotQC_Ch21 { get; set; }
        public bool SpotQC_Ch22 { get; set; }
        public bool SpotQC_Ch23 { get; set; }
        public bool SpotQC_Ch24 { get; set; }
        public string VideoComments { get; set; }
        public string Video_Codec { get; set; }
        public string Video_Bit_Rate { get; set; }
        public string Video_Bit_Depth { get; set; }
        public string Bit_Rate_Mode { get; set; }
        public string Audio_Codec { get; set; }
        public string Audio_Bit_Rate { get; set; }
        public string Audio_Bit_Depth { get; set; }
        public string Sample_Rate { get; set; }
        public string GOP_Structure { get; set; }
        public string Gamut { get; set; }
        public string Colour_Encoding { get; set; }
        public string File_Size { get; set; }
        public string Active_Picture { get; set; }
        public string Broadcast_Suitable { get; set; }
        public string Broadcast_Suitable_Reason { get; set; }
        public string DVD_Blu_Ray_Suitable { get; set; }
        public string DVD_Blu_Ray_Suitable_Reason { get; set; }
        public string VOD_Suitable { get; set; }
        public string VOD_Suitable_Reason { get; set; }
        public string Frame_Size { get; set; }
    }
}
