<%@ Language=VBScript %>
<%
option explicit
dim rsHeader
dim sBVMaster, sBVTech1, sBVTech2, sBVTech4, sCTISS, sQCR, rsTextInfo, sqlTextInfo
dim sQCNum, sRev, sqlBVIMaster, rsFullSpot, sqlFullSpot, siremv

<!--#include file="../include/connect.asp"-->

sBVMaster = Request.QueryString("sBVMaster")
sBVTech1 = Request.QueryString("sBVTech1")
sBVTech2 = Request.QueryString("sBVTech2")
sBVTech4 = Request.QueryString("sBVTech4")
sCTISS = Request.QueryString("sCTISS")
sQCR = Request.QueryString("sQCR")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")

%>

<html>
<head>
<%
Response.ContentType = ("Application/vnd.ms-word")
Response.AddHeader "Content-Disposition","Attachment;filename=report.doc"
%>
<LINK rel="stylesheet" type="text/css" href="../css/qcs.css">
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
					"qcheader.qcnum, qcheader.subqcnum, WONum, PONo, show, Epis_no, Epis_Name, HeadLogo, TailLogo, TapeDesc1, addinfo, textless, " & _
					"This_part, Tot_part, Comp_Sync, NR, Language, HLanguage, TapeNumber, src_barcode, CloseCap, Bay_num, " & _
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
					"cue_desc, cue_tone, cue_avg, cue_peak, cue_TruePeak, " & _
					"QC_VTR, Operator, qcUserID, FullName, Rec_Fac, Rec_VTR, QC_Date, revised_date, revised_by, " & _
					"Rec_Date, Bar_vid, Bar_Set, HBlank, Format, Aspect, Time_Code, Address, Src_Format, src_standard, src_desc, " & _
					"IRE_MV, Lum_Peak, Lum_Avg, Black, Bar_Chr, Front_Por, VBlank, Chroma_Avg, Standard, stock_mfg, rec_fac, " & _
					"VITC, VITS, Chroma_Peak, Channel_cond, Version, Stock_batch, CH12_Phase, CH34_Phase, Tone_Phase, " & _
					"VIRS, tracking_qc, ctl_Track, RF, Tape_Wrap_QC, Eval_Stat, TRT, CustName, FullName, TCInteg, QCinUnity, LTC_VITC_Match, SurroundSound " & _
				"FROM qcHeader " & _
				"INNER JOIN qcAudioTC ON qcHeader.QCNum = qcAudioTC.QCNum AND qcHeader.SubQCNum = qcAudioTC.SubQCNum " & _
				"INNER JOIN qcElement ON qcHeader.QCNum = qcElement.QCNum AND qcHeader.SubQCNum = qcElement.SubQCNum " & _
				"INNER JOIN qcUsers ON qcHeader.Operator = qcUsers.qcUserID " & _
				"INNER JOIN qcClients ON qcHeader.CustID = qcClients.CustID " & _
				"INNER JOIN qcLocation ON qcUsers.Location = qcLocation.pkey " & _
				"GROUP BY " & _
					"qcheader.qcnum, qcheader.subqcnum, WONum, PONo, show, Epis_no, Epis_Name, HeadLogo, TailLogo, TapeDesc1, addinfo, textless, " & _
					"This_part, Tot_part, Comp_Sync, NR, Language, HLanguage, TapeNumber, src_barcode, CloseCap, Bay_num, " & _
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
					"cue_desc, cue_tone, cue_avg, cue_peak, cue_TruePeak, " & _
					"QC_VTR, Operator, qcUserID, FullName, Rec_Fac, Rec_VTR, QC_Date, revised_date, revised_by, " & _
					"Rec_Date, Bar_vid, Bar_Set, HBlank, Format, Aspect, Time_Code, Address, Src_Format, src_standard, src_desc, " & _
					"IRE_MV, Lum_Peak, Lum_Avg, Black, Bar_Chr, Front_Por, VBlank, Chroma_Avg, Standard, Stock_mfg, rec_fac, " & _
					"VITC, VITS, Chroma_Peak, Channel_cond, Version, Stock_batch, CH12_Phase, CH34_Phase, Tone_Phase, " & _
					"VIRS, tracking_qc, ctl_Track, RF, Tape_Wrap_QC, Eval_Stat, TRT, CustName, FullName, TCInteg, QCinUnity, LTC_VITC_Match, SurroundSound " & _				
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
sqlBVIMastTF = "SELECT item_num, Description, Length, Time_Code " & _
			   "FROM qcTapeFormat " & _
			   "WHERE Qcnum= " & clng(sQCNum)& "AND subQcnum = " & cint (sRev) & _
			   "ORDER BY item_num"
rsTapeFormat.Open sqlBVIMastTF

set rsFullSpot = Server.CreateObject("ADODB.Recordset")
rsFullSpot.ActiveConnection = cnQCS
sqlFullSpot = "SELECT FullQC_vid, FullQC_Ch1, FullQC_Ch2, FullQC_Ch3, FullQC_Ch4, " & _
			  "FullQC_Ch5, FullQC_Ch6, FullQC_Ch7, FullQC_Ch8, FullQC_Cue, " & _
			  "SpotQC_vid, SpotQC_Ch1, SpotQC_Ch2, SpotQC_Ch3, SpotQC_Ch4, " & _
			  "SpotQC_Ch5, SpotQC_Ch6, SpotQC_Ch7, SpotQC_Ch8, SpotQC_Cue, Comments " & _
			  "FROM qcHeader WHERE qcheader.Qcnum= " & clng(sQCNum) & " AND qcheader.subQcnum = " & cint(sRev)
rsFullSpot.Open sqlFullSpot

set rsTextInfo = Server.CreateObject("ADODB.Recordset")
rsTextInfo.ActiveConnection = cnQCS
sqlTextInfo = "SELECT TextInfo, TimecodeIn, TimecodeOut FROM qcTextInfo WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev) & " ORDER BY textinfo"
rsTextInfo.Open sqlTextInfo

%>

<body>
<script language=JavaScript>
	self.focus();
</script>
	<!--#include file="GetLines.asp"-->
<%if sBVMaster = "1" then %>
	<!--#include file="BVMasteringQC.asp" -->
	<%if (sBVTech1 = "1") or (sBVTech2 = "1") or (sBVTech4 = "1") or (sCTISS = "1") or (sQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sBVTech1 = "1" then %>
	<!--#include file="BVHETech1.asp" -->
	<%if (sBVTech2 = "1") or (sBVTech4 = "1") or (sCTISS = "1") or (sQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sBVTech2 = "1" then %>
	<!--#include file="BVHETech2.asp" -->
	<%if (sBVTech4 = "1") or (sCTISS = "1") or (sQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sBVTech4 = "1" then %>
	<!--#include file="BVHETech4.asp" -->
	<%if (sCTISS = "1") or (sQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sCTISS = "1" then %>
	<!--#include file="CTISS.asp" -->
	<%if (sQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sQCR = "1" then %>
	<!--#include file="QualityControl.asp" -->
<%end if%>
</body>

</html>
