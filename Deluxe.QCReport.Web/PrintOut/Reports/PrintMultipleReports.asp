<%@ Language=VBScript %>
<%
option explicit
dim rsHeader, rsTextInfo, sqlTextInfo
dim sBVMaster, sBVTech1, sBVTech2, sBVTech4, sCTISS, sQCR, sQCR100, sQCR1Pg, rsFullSpot, sqlFullSpot
dim sQCNum, sRev, sqlBVIMaster, siremv, sWBQCR
dim sMQCR,sQCWLR1Pg,sQCWTR1Pg,sQCWLER
 

sBVMaster = Request.QueryString("sBVMast")
sBVTech1 = Request.QueryString("sBV1")
sBVTech2 = Request.QueryString("sBV2")
sBVTech4 = Request.QueryString("sBV4")
sCTISS = Request.QueryString("sCTISS")
sQCR = Request.QueryString("sQCR")
sMQCR = Request.QueryString("sMQCR")  '' Master QC added by Isaac Koomson 25/04/2014
sQCR100 = Request.QueryString("sQCR100")
sQCR1Pg = Request.QueryString("sQCR1Pg")
sQCWLR1Pg = Request.QueryString("sQCWLR1Pg") '' Runtime QC With Log added by Isaac Koomson 13/05/2016
sQCWTR1Pg = Request.QueryString("sQCWTR1Pg") '' Runtime QC With Text Info added by Isaac Koomson 16/05/2016
sQCWLER = Request.QueryString("sQCWLER") '' Runtime QC With Log For ESI added by Isaac Koomson 26/05/2016

'Warner Bros Addition - 16/03/04 - by Matt Feltham
'-----------------
sWBQCR = Request.QueryString("sWBQCR")
'-----------------
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")

%>
<!--#include file="../include/connect.asp"-->
<html>
<head>
<LINK rel="stylesheet" type="text/css" href="../css/qcs2.css">
</head>
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak { page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 6pt; }
</style>
<%
set rsHeader = Server.CreateObject("ADODB.Recordset")
rsHeader.ActiveConnection = cnQCS
sqlBVIMaster = "SELECT " & _
					"qcheader.qcnum, qcheader.subqcnum, WONum, PONo, show, Epis_no, Epis_Name, HeadLogo, TailLogo, TapeDesc1, addinfo, textless,AssetType, " & _
					"This_part, Tot_part, Comp_Sync, NR, Language, HLanguage, TapeNumber, Filename, src_barcode, CloseCap, Bay_num, " & _
					"Sync_Levl, Labels_Qc, Burst_Levl, Slate_qc, Serrations, Subtitle, Subtitle_QC, GradingScale, Duration, " & _
					"OTPercent, OTVer, CTPercent, CTVer, CapPercent, CapVer, " & _
					"ch1_desc, ch1_tone, ch1_avg, ch1_peak, ch1_TruePeak, " & _
					"ch2_desc, ch2_tone, ch2_avg, ch2_peak, ch2_TruePeak, " & _
					"ch3_desc, ch3_tone, ch3_avg, ch3_peak, ch3_TruePeak, " & _
					"ch4_desc, ch4_tone, ch4_avg, ch4_peak, ch4_TruePeak, " & _
					"ch5_desc, ch5_tone, ch5_avg, ch5_peak, ch5_TruePeak, " & _
					"ch6_desc, ch6_tone, ch6_avg, ch6_peak, ch6_TruePeak, " & _
					"ch7_desc, ch7_tone, ch7_avg, ch7_peak, ch7_TruePeak, " & _
					"ch8_desc, ch8_tone, ch8_avg, ch8_peak, ch8_TruePeak, " & _
					"ch9_desc, ch9_LKFS,  ch9_tone, ch9_avg, ch9_peak, ch9_TruePeak, " & _
					"ch10_desc, ch10_LKFS,  ch10_tone, ch10_avg, ch10_peak, ch10_TruePeak, " & _
					"ch11_desc, ch11_LKFS,  ch11_tone, ch11_avg, ch11_peak, ch11_TruePeak, " & _
					"ch12_desc, ch12_LKFS,  ch12_tone, ch12_avg, ch12_peak, ch12_TruePeak, " & _
					"ch13_desc, ch13_LKFS,  ch13_tone, ch13_avg, ch13_peak, ch13_TruePeak, " & _
					"ch14_desc, ch14_LKFS,  ch14_tone, ch14_avg, ch14_peak, ch14_TruePeak, " & _
					"ch15_desc, ch15_LKFS,  ch15_tone, ch15_avg, ch15_peak, ch15_TruePeak, " & _
					"ch16_desc, ch16_LKFS,  ch16_tone, ch16_avg, ch16_peak, ch16_TruePeak, " & _
					"ch17_desc, ch17_LKFS,  ch17_tone, ch17_avg, ch17_peak, ch17_TruePeak, " & _
					"ch18_desc, ch18_LKFS,  ch18_tone, ch18_avg, ch18_peak, ch18_TruePeak, " & _
					"ch19_desc, ch19_LKFS,  ch19_tone, ch19_avg, ch19_peak, ch19_TruePeak, " & _
					"ch20_desc, ch20_LKFS,  ch20_tone, ch20_avg, ch20_peak, ch20_TruePeak, " & _
					"ch21_desc, ch21_LKFS,  ch21_tone, ch21_avg, ch21_peak, ch21_TruePeak, " & _
					"ch22_desc, ch22_LKFS,  ch22_tone, ch22_avg, ch22_peak, ch22_TruePeak, " & _
					"ch23_desc, ch23_LKFS,  ch23_tone, ch23_avg, ch23_peak, ch23_TruePeak, " & _
					"ch24_desc, ch24_LKFS,  ch24_tone, ch24_avg, ch24_peak, ch24_TruePeak, " & _
					"cue_desc, cue_LKFS,  cue_tone, cue_avg, cue_peak, cue_TruePeak, " & _
					"Video_Codec,Video_Bit_Rate,Video_Bit_Depth,Bit_Rate_Mode, " & _
			        "Audio_Codec,Audio_Bit_Rate,Audio_Bit_Depth,Sample_Rate, " & _
			        "GOP_Structure,Gamut,Colour_Encoding,File_Size,Active_Picture, " & _
					"QC_VTR, Operator, qcUserID, FullName, Rec_Fac, Rec_VTR, QC_Date, revised_date, revised_by, " & _
					"Rec_Date, Bar_vid, Bar_Set, HBlank, Format, Aspect, Time_Code, Address, Src_Format, src_standard, src_desc, " & _
					"IRE_MV, Lum_Peak, Lum_Avg, Black, Bar_Chr, Front_Por, VBlank, Chroma_Avg, Standard, stock_mfg, rec_fac, " & _
					"VITC, VITS, Chroma_Peak, Channel_cond, Version, Stock_batch, CH12_Phase, CH34_Phase, Tone_Phase, " & _
					"VIRS, tracking_qc, ctl_Track, RF, Tape_Wrap_QC, Eval_Stat, TRT, CustName, FullName, TCInteg, QCinUnity, LTC_VITC_Match, SurroundSound, " & _
					"grdVideo, grdAudio, grdOverall " & _
				"FROM qcHeader " & _
				"INNER JOIN qcAudioTC ON qcHeader.QCNum = qcAudioTC.QCNum AND qcHeader.SubQCNum = qcAudioTC.SubQCNum " & _
				"INNER JOIN qcElement ON qcHeader.QCNum = qcElement.QCNum AND qcHeader.SubQCNum = qcElement.SubQCNum " & _
				"INNER JOIN qcUsers ON qcHeader.Operator = qcUsers.qcUserID " & _
				"INNER JOIN qcClients ON qcHeader.CustID = qcClients.CustID " & _
				"INNER JOIN qcLocation ON qcUsers.Location = qcLocation.pkey " & _
				"GROUP BY " & _
					"qcheader.qcnum, qcheader.subqcnum, WONum, PONo, show, Epis_no, Epis_Name, HeadLogo, TailLogo, TapeDesc1, addinfo, textless,AssetType,  " & _
					"This_part, Tot_part, Comp_Sync, NR, Language, HLanguage, TapeNumber,Filename, src_barcode, CloseCap, Bay_num, " & _
					"Sync_Levl, Labels_QC, Burst_Levl, slate_qc, Serrations, Subtitle, Subtitle_QC, GradingScale, Duration, " & _
					"OTPercent, OTVer, CTPercent, CTVer, CapPercent, CapVer, " & _
					"ch1_desc, ch1_tone, ch1_avg, ch1_peak, ch1_TruePeak, " & _
					"ch2_desc, ch2_tone, ch2_avg, ch2_peak, ch2_TruePeak, " & _
					"ch3_desc, ch3_tone, ch3_avg, ch3_peak, ch3_TruePeak, " & _
					"ch4_desc, ch4_tone, ch4_avg, ch4_peak, ch4_TruePeak, " & _
					"ch5_desc, ch5_tone, ch5_avg, ch5_peak, ch5_TruePeak, " & _
					"ch6_desc, ch6_tone, ch6_avg, ch6_peak, ch6_TruePeak, " & _
					"ch7_desc, ch7_tone, ch7_avg, ch7_peak, ch7_TruePeak, " & _
					"ch8_desc, ch8_tone, ch8_avg, ch8_peak, ch8_TruePeak, " & _
					"ch9_desc, ch9_LKFS,  ch9_tone, ch9_avg, ch9_peak, ch9_TruePeak, " & _
					"ch10_desc, ch10_LKFS,  ch10_tone, ch10_avg, ch10_peak, ch10_TruePeak, " & _
					"ch11_desc, ch11_LKFS,  ch11_tone, ch11_avg, ch11_peak, ch11_TruePeak, " & _
					"ch12_desc, ch12_LKFS,  ch12_tone, ch12_avg, ch12_peak, ch12_TruePeak, " & _
					"ch13_desc, ch13_LKFS,  ch13_tone, ch13_avg, ch13_peak, ch13_TruePeak, " & _
					"ch14_desc, ch14_LKFS,  ch14_tone, ch14_avg, ch14_peak, ch14_TruePeak, " & _
					"ch15_desc, ch15_LKFS,  ch15_tone, ch15_avg, ch15_peak, ch15_TruePeak, " & _
					"ch16_desc, ch16_LKFS,  ch16_tone, ch16_avg, ch16_peak, ch16_TruePeak, " & _
					"ch17_desc, ch17_LKFS,  ch17_tone, ch17_avg, ch17_peak, ch17_TruePeak, " & _
					"ch18_desc, ch18_LKFS,  ch18_tone, ch18_avg, ch18_peak, ch18_TruePeak, " & _
					"ch19_desc, ch19_LKFS,  ch19_tone, ch19_avg, ch19_peak, ch19_TruePeak, " & _
					"ch20_desc, ch20_LKFS,  ch20_tone, ch20_avg, ch20_peak, ch20_TruePeak, " & _
					"ch21_desc, ch21_LKFS,  ch21_tone, ch21_avg, ch21_peak, ch21_TruePeak, " & _
					"ch22_desc, ch22_LKFS,  ch22_tone, ch22_avg, ch22_peak, ch22_TruePeak, " & _
					"ch23_desc, ch23_LKFS,  ch23_tone, ch23_avg, ch23_peak, ch23_TruePeak, " & _
					"ch24_desc, ch24_LKFS,  ch24_tone, ch24_avg, ch24_peak, ch24_TruePeak, " & _
					"cue_desc, cue_tone, cue_avg, cue_peak, cue_TruePeak,cue_LKFS,  " & _
					"Video_Codec,Video_Bit_Rate,Video_Bit_Depth,Bit_Rate_Mode, " & _
			        "Audio_Codec,Audio_Bit_Rate,Audio_Bit_Depth,Sample_Rate, " & _
			        "GOP_Structure,Gamut,Colour_Encoding,File_Size,Active_Picture, " & _
					"QC_VTR, Operator, qcUserID, FullName, Rec_Fac, Rec_VTR, QC_Date, revised_date, revised_by, " & _
					"Rec_Date, Bar_vid, Bar_Set, HBlank, Format, Aspect, Time_Code, Address, Src_Format, src_standard, src_desc, " & _
					"IRE_MV, Lum_Peak, Lum_Avg, Black, Bar_Chr, Front_Por, VBlank, Chroma_Avg, Standard, Stock_mfg, rec_fac, " & _
					"VITC, VITS, Chroma_Peak, Channel_cond, Version, Stock_batch, CH12_Phase, CH34_Phase, Tone_Phase, " & _
					"VIRS, tracking_qc, ctl_Track, RF, Tape_Wrap_QC, Eval_Stat, TRT, CustName, FullName, TCInteg, QCinUnity, LTC_VITC_Match, SurroundSound, " & _
					"grdVideo, grdAudio, grdOverall " & _				
				"HAVING qcheader.Qcnum= " & clng(sQCNum) & " AND qcheader.subQcnum = " & cint(sRev)
rsHeader.Open sqlBVIMaster

'********************************************
'Set Recordsets for Tape Layout
'Log Detail
'********************************************
dim rsBVMastLog, rsBVMastTapeLayout, sqlBVIMastLog, i
dim rsTapeFormat, sqlBVIMastTF, x
dim nTotalLines, nLines

set rsBVMastLog = Server.CreateObject("ADODB.Recordset")
rsBVMastLog.ActiveConnection = cnQCS
sqlBVIMastLog = "SELECT part_num, Time_Code, Note, item_Duratn, QC_Code, QC_Grade, Action, In_master " & _
				"FROM qcTime " & _
				"WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev) & _
				"ORDER BY Time_Code"

set rsTapeFormat = Server.CreateObject("ADODB.Recordset")
rsTapeFormat.ActiveConnection = cnQCS
sqlBVIMastTF = "SELECT item_num, Time_code, Description, Length " & _
			   "FROM qcTapeFormat " & _
			   "WHERE Qcnum= " & clng(sQCNum)& "AND subQcnum = " & cint (sRev) & _
			   "ORDER BY item_num"
rsTapeFormat.Open sqlBVIMastTF

set rsFullSpot = Server.CreateObject("ADODB.Recordset")
rsFullSpot.ActiveConnection = cnQCS
sqlFullSpot = "SELECT FullQC_vid, FullQC_Ch1, FullQC_Ch2, FullQC_Ch3, FullQC_Ch4, " & _
			  "FullQC_Ch5, FullQC_Ch6, FullQC_Ch7, FullQC_Ch8, FullQC_Ch9," & _
			  "FullQC_Ch10, FullQC_Ch11, FullQC_Ch12, FullQC_Ch13, " & _
			  "FullQC_Ch14, FullQC_Ch15, FullQC_Ch16, FullQC_Cue," & _
			  "FullQC_Ch17, FullQC_Ch18, FullQC_Ch19, FullQC_Ch20, " & _
			  "FullQC_Ch21, FullQC_Ch22, FullQC_Ch23, FullQC_ch24," & _
			  "SpotQC_vid, SpotQC_Ch1, SpotQC_Ch2, SpotQC_Ch3, SpotQC_Ch4, " & _
			  "SpotQC_Ch5, SpotQC_Ch6, SpotQC_Ch7, SpotQC_Ch8, " & _
			  "SpotQC_Ch9, SpotQC_Ch10, SpotQC_Ch11, SpotQC_Ch12, SpotQC_Ch13, " & _
			  "SpotQC_Ch14, SpotQC_Ch15, SpotQC_Ch16, " & _
			  "SpotQC_Ch17, SpotQC_Ch18, SpotQC_Ch19, SpotQC_Ch20, SpotQC_Ch21, " & _
			  "SpotQC_Ch22, SpotQC_Ch23, SpotQC_Ch24, " & _
			  "SpotQC_Cue, Comments, RecommendationComments,VideoComments " & _
			  "FROM qcHeader WHERE qcheader.Qcnum= " & clng(sQCNum) & " AND qcheader.subQcnum = " & cint(sRev)
			  
rsFullSpot.Open sqlFullSpot

set rsTextInfo = Server.CreateObject("ADODB.Recordset")
rsTextInfo.ActiveConnection = cnQCS
sqlTextInfo = "SELECT TextInfo, TimecodeIn, TimecodeOut FROM qcTextInfo WHERE Qcnum= " & cint(sQCNum) & " AND subQcnum = " & cint(sRev) & " ORDER BY timecodein"
rsTextInfo.Open sqlTextInfo
%>
<body>

<!--#include file="GetLines.asp"-->
<%if sBVMaster = "1" then %>
	<!--#include file="BVMasteringQC.asp" -->
	<%if (sBVTech1 = "1") or (sBVTech2 = "1") or (sBVTech4 = "1") or (sCTISS = "1") or (sQCR = "1")or(sQCR100 = "1")or(sQCR1Pg = "1") or (sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sBVTech1 = "1" then %>
	<!--#include file="BVHETech1.asp" -->
	<%if (sBVTech2 = "1") or (sBVTech4 = "1") or (sCTISS = "1") or (sQCR = "1")or(sQCR100 = "1")or(sQCR1Pg = "1") or (sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sBVTech2 = "1" then %>
	<!--#include file="BVHETech2.asp" -->
	<%if (sBVTech4 = "1") or (sCTISS = "1") or (sQCR = "1")or(sQCR100 = "1")or(sQCR1Pg = "1") or (sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sBVTech4 = "1" then %>
	<!--#include file="BVHETech4.asp" -->
	<%if (sCTISS = "1") or (sQCR = "1")or(sQCR100 = "1")or(sQCR1Pg = "1") or (sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sCTISS = "1" then %>
	<!--#include file="CTISS.asp" -->
	<%if (sQCR = "1")or(sQCR100 = "1")or(sQCR1Pg = "1") or (sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sQCR = "1" then %>
	<!--#include file="QualityControl.asp" -->
	<%if (sQCR100 = "1")or(sQCR1Pg = "1") or (sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sMQCR = "1" then %>
	<!--#include file="Master_QualityControl.asp" -->
	<%if (sQCR100 = "1")or(sQCR1Pg = "1") or (sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sQCR100 = "1" then %>
	<!--#include file="QC100.asp" -->
	<%if (sQCR1Pg = "1") or (sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sQCR1Pg = "1" then %>
	<!--#include file="QC1Page.asp" -->
	<%if (sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<!-- Runtime QC with Log -->
<%if sQCWLR1Pg = "1" then %>
	<!--#include file="QCWL1Pg.asp" -->
<%end if%>

<!-- Runtime QC with Text Info -->
<%if sQCWTR1Pg = "1" then %>
	<!--#include file="QCWT1Pg.asp" -->
<%end if%>

<!-- Runtime QC with Log For ESI -->
<%if sQCWLER = "1" then %>
	<!--#include file="QCEndemol.asp" -->
<%end if%>


<%if sWBQCR = "1" then %>
	<!--#include file="WB_QualityControl.asp" -->
<%end if%>

</body>
</html>
<OBJECT 
id=ctlPrintSettings1 
style="LEFT: 0px; TOP: 0px" 
classid="clsid:1632FBB6-EF91-43DA-80BA-3116A5734F7B" 
codebase="../controls/ieprintsettings.ocx"
VIEWASTEXT>
	<PARAM NAME="_ExtentX" VALUE="661">
	<PARAM NAME="_ExtentY" VALUE="767">
</OBJECT>

<script language="javascript">
function window.onbeforeprint()
{
ctlPrintSettings1.NewSettings();
}
function window.onafterprint()
{
parent.navigate("FinishPrint.asp")
}
	self.focus();
	window.print();
</script>

