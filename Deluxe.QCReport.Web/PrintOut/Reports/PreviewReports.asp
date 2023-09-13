<%@ Language=VBScript %>
<%
option explicit
Response.Expires = 0 
dim rsHeader
dim sBVMaster, sBVTech1, sBVTech2, sBVTech4, sCTISS, sQCR, sQCR100, sQCR1Pg, rsTextInfo, sqlTextInfo
dim sQCNum, sRev, sqlBVIMaster, rsFullSpot, sqlFullSpot, siremv
dim sWBQCR, sMQCR, sQCWLR1Pg, sQCWTR1Pg, sQCRWLE, sQCRWLDPP   
dim sAssetType, sQCType
Dim videoWidth,videoHeight
DIm bIsTwoChannels, bIsFourChannels, bIsSixChannels, bIsEightChannels, bIsTenChannels, bIsTwelveChannels
Dim bIsFourteenChannels, bIsSixteenChannels, bIsEighteenChannels, bIsTwentyChannels , bIsTwentyTwoChannels, bIsTwentyFourChannels
Dim rsChecklist, sqlChecklist, rsChecklistLionsGate, sqlChecklistLionsGate 
Dim rsChecklistWarner, sqlChecklistWarner,rsChecklistWildBunch, sqlChecklistWildBunch
Dim positionDisney, positionLionsGate, positionWarner, positionWildBunch 
Dim IsChecklistCompleted 
Dim rsFaultImage, sqlFaultImage, nFaultImages, nTotalImages
Dim sQCBNJR


sBVMaster = Request.QueryString("sBVMaster")
sBVTech1 = Request.QueryString("sBVTech1")
sBVTech2 = Request.QueryString("sBVTech2")
sBVTech4 = Request.QueryString("sBVTech4")
sCTISS = Request.QueryString("sCTISS")
sQCR = Request.QueryString("sQCR")
sMQCR = Request.QueryString("sMQCR")  '' Master QC Report added by Isaac Koomson 25/04/2014
sQCR100 = Request.QueryString("sQCR100")
sQCR1Pg = Request.QueryString("sQCR1Pg")
sQCWLR1Pg = Request.QueryString("sQCRWL1Pg") '' Runtime QC With Log Report added by Isaac Koomson 13/05/2016
sQCWTR1Pg = Request.QueryString("sQCRWT1Pg") '' Runtime QC With Text Info Report added by Isaac Koomson 16/05/2016
sQCRWLE = Request.QueryString("sQCRWLE") '' Runtime QC With Log For ESI Report added by Isaac Koomson 26/05/2016
sQCRWLDPP = Request.QueryString("sQCRWLDPP") ''Runtime QC With Log For DPP Eyeball Report added by Isaac Koomson 16/08/2022
sQCBNJR = Request.QueryString("sQCBNJR") ''Runtime QC With Log For Banijay Rights Report - New Tempalte - added by Isaac Koomson 22/02/2023

''response.write "Preview - sQCWTR1Pg: " & sQCWTR1Pg
''response.end

'Warner Bros Addition - 16/03/04 - by Matt Feltham
'-----------------
sWBQCR = Request.QueryString("sWBQCR")
'-----------------
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")

Function IIf(bClause, sTrue, sFalse)
    If CBool(bClause) Then
        IIf = sTrue
    Else 
        IIf = sFalse
    End If
End Function


%>

<!--#include file="../include/connect.asp"-->
<html>
<head>
<LINK rel="stylesheet" type="text/css" href="../css/qcs.css">
</head>
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak { page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 6pt; }
</style>

<%

''on error resume next


'' Updated to include channels 9-16 Isaac Koomson 04/01/2012
''Updated to include LKFS Isaac Koomson 04/01/2012
'' Updated to include channels 17-24 Isaac Koomson 10/09/2012
set rsHeader = Server.CreateObject("ADODB.Recordset")
rsHeader.ActiveConnection = cnQCS
sqlBVIMaster = "SELECT " & _
					"qcheader.qcnum, qcheader.subqcnum, WONum, PONo, show, Epis_no, Epis_Name, HeadLogo, TailLogo, TapeDesc1, addinfo, textless,AssetType, " & _
					"This_part, Tot_part, Comp_Sync, NR, Language, HLanguage, TapeNumber, Filename, src_barcode, CloseCap, Bay_num, " & _
					"Sync_Levl, Labels_Qc, Burst_Levl, Slate_qc, Serrations, Subtitle, Subtitle_QC, GradingScale, qcheader.Duration, " & _
					"OTPercent, OTVer, CTPercent, CTVer, CapPercent, CapVer, " & _
					"Language1, Language2, Language3, Language4, Language5, Language6, " & _		
		            "Language7, Language8, Language9, Language10, Language11, Language12, " & _
		            "Language13, Language14, Language15, Language16, Language17, Language18, " & _
		            "Language19, Language20, Language21, Language22, Language23, Language24,ChannelCount, " & _
					"ch1_desc, ch1_LKFS, ch1_tone, ch1_avg, ch1_peak, ch1_TruePeak, " & _
					"ch2_desc, ch2_LKFS,  ch2_tone, ch2_avg, ch2_peak, ch2_TruePeak, " & _
					"ch3_desc, ch3_LKFS,  ch3_tone, ch3_avg, ch3_peak, ch3_TruePeak, " & _
					"ch4_desc, ch4_LKFS,  ch4_tone, ch4_avg, ch4_peak, ch4_TruePeak, " & _
					"ch5_desc, ch5_LKFS,  ch5_tone, ch5_avg, ch5_peak, ch5_TruePeak, " & _
					"ch6_desc, ch6_LKFS,  ch6_tone, ch6_avg, ch6_peak, ch6_TruePeak, " & _
					"ch7_desc, ch7_LKFS,  ch7_tone, ch7_avg, ch7_peak, ch7_TruePeak, " & _
					"ch8_desc, ch8_LKFS,  ch8_tone, ch8_avg, ch8_peak, ch8_TruePeak, " & _
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
			        "GOP_Structure,Gamut,Colour_Encoding,File_Size,Active_Picture, Frame_Size, " & _
					"QC_VTR, Operator, u1.qcUserID, u1.FullName, Rec_Fac, Rec_VTR, QC_Date, revised_date, revised_by, " & _
					"Rec_Date, Bar_vid, Bar_Set, HBlank, Format, Aspect, Time_Code, Address, Src_Format, src_standard, src_desc, " & _
					"IRE_MV, Lum_Peak, Lum_Avg, Black, Bar_Chr, Front_Por, VBlank, Chroma_Avg, Standard, stock_mfg, rec_fac, " & _
					"VITC, VITS, Chroma_Peak, Channel_cond, Version, Stock_batch, CH12_Phase, CH34_Phase, Tone_Phase, " & _
					"VIRS, tracking_qc, ctl_Track, RF, Tape_Wrap_QC, Eval_Stat, TRT, CustName, TCInteg, QCinUnity, LTC_VITC_Match, SurroundSound, " & _
					"grdVideo, grdAudio, grdOverall,HBlanking, VBlanking,qc_type, " & _
					"Broadcast_Suitable,Broadcast_Suitable_Reason,DVD_Blu_Ray_Suitable,DVD_Blu_Ray_Suitable_Reason,VOD_Suitable,VOD_Suitable_Reason, CatalogueID, Timecode, " & _ 
					"InPhase1, InPhase2, InPhase3, InPhase4, InPhase5, InPhase6, InPhase7, InPhase8, InPhase9, InPhase10, InPhase11, InPhase12, " & _ 
					"InPhase13, InPhase14, InPhase15, InPhase16, InPhase17, InPhase18, InPhase19, InPhase20, InPhase21, InPhase22, InPhase23, InPhase24,  " & _
					"Discreate1, Discreate2, Discreate3, Discreate4, Discreate5, Discreate6, Discreate7, Discreate8, Discreate9, Discreate10, Discreate11, Discreate12, " & _
					"Discreate13, Discreate14, Discreate15, Discreate16, Discreate17, Discreate18, Discreate19, Discreate20, Discreate21, Discreate22, Discreate23, Discreate24,  " & _
					"Revised_Date_2, Revised_By_2, " & _
					"u2.qcUserID 'qcUserID2', u2.FullName 'FullName2', QC_Date_2, Operator_Activity, Operator_2_Activity, Bay_Num_2, QC_VTR_2, " & _
					"ProgrammeDetails, ProductionNumber, ProgrammeTitleAndNumber,ProductionCompany, ContactPhoneNumber, PostCompany,   " & _
					"ProductPlacementLogoPresentAndInSafeArea, SponsorshipHeadAndTailPresent, TAndCsWithinSafeArea,   " & _
					"AuthorisedBy, AuthorisedDate, JobTitle,   " & _
					"FileWrapper, SDROrHDR, FrameRate, VideoLines, TypeOfHDR, CaptionSafe, " & _
					"EmbeddedCCTrack, BitRate, PSEResult, QCActionType, QCVendor, " & _
					"TrackContent1, TrackContent2, TrackContent3, TrackContent4, TrackContent5, TrackContent6,  " & _
					"TrackContent7, TrackContent8, TrackContent9, TrackContent10, TrackContent11, TrackContent12,  " & _
					"TrackContent13, TrackContent14, TrackContent15, TrackContent16, TrackContent17, TrackContent18, TrackContent19, TrackContent20,  " & _
					"TrackContent21, TrackContent22, TrackContent23, TrackContent24, " & _
					"DecodeCheck, MaxCLL, MaxFALL, ColourSpace, ColourRange, " & _
	                "ColourPrimaries, TransferCharacteristics, MatrixCoefficients " & _
     			"FROM qcHeader " & _
				"INNER JOIN qcAudioTC ON qcHeader.QCNum = qcAudioTC.QCNum AND qcHeader.SubQCNum = qcAudioTC.SubQCNum " & _
				"INNER JOIN qcElement ON qcHeader.QCNum = qcElement.QCNum AND qcHeader.SubQCNum = qcElement.SubQCNum " & _
				"INNER JOIN qcUsers u1 ON qcHeader.Operator = u1.qcUserID " & _
				"INNER JOIN qcClients ON qcHeader.CustID = qcClients.CustID " & _
				"INNER JOIN qcLocation ON u1.Location = qcLocation.pkey " & _
				"LEFT JOIN qcUsers u2 ON qcHeader.Operator_2 = u2.qcUserID " & _
				"GROUP BY " & _
					"qcheader.qcnum, qcheader.subqcnum, WONum, PONo, show, Epis_no, Epis_Name, HeadLogo, TailLogo, TapeDesc1, addinfo, textless,AssetType,  " & _
					"This_part, Tot_part, Comp_Sync, NR, Language, HLanguage, TapeNumber, Filename, src_barcode, CloseCap, Bay_num, " & _
					"Sync_Levl, Labels_QC, Burst_Levl, slate_qc, Serrations, Subtitle, Subtitle_QC, GradingScale, qcheader.Duration, " & _
					"OTPercent, OTVer, CTPercent, CTVer, CapPercent, CapVer, " & _
					"Language1, Language2, Language3, Language4, Language5, Language6, " & _		
		            "Language7, Language8, Language9, Language10, Language11, Language12, " & _
		            "Language13, Language14, Language15, Language16, Language17, Language18, " & _
		            "Language19, Language20, Language21, Language22, Language23, Language24,ChannelCount, " & _
					"ch1_desc, ch1_LKFS,  ch1_tone, ch1_avg, ch1_peak, ch1_TruePeak, " & _
					"ch2_desc, ch2_LKFS,  ch2_tone, ch2_avg, ch2_peak, ch2_TruePeak, " & _
					"ch3_desc, ch3_LKFS,  ch3_tone, ch3_avg, ch3_peak, ch3_TruePeak, " & _
					"ch4_desc, ch4_LKFS,  ch4_tone, ch4_avg, ch4_peak, ch4_TruePeak, " & _
					"ch5_desc, ch5_LKFS,  ch5_tone, ch5_avg, ch5_peak, ch5_TruePeak, " & _
					"ch6_desc, ch6_LKFS, ch6_tone, ch6_avg, ch6_peak, ch6_TruePeak, " & _
					"ch7_desc, ch7_LKFS,  ch7_tone, ch7_avg, ch7_peak, ch7_TruePeak, " & _
					"ch8_desc, ch8_LKFS,  ch8_tone, ch8_avg, ch8_peak, ch8_TruePeak, " & _
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
			        "GOP_Structure,Gamut,Colour_Encoding,File_Size,Active_Picture, Frame_Size," & _
					"QC_VTR, Operator, u1.qcUserID, u1.FullName, Rec_Fac, Rec_VTR, QC_Date, revised_date, revised_by, " & _
					"Rec_Date, Bar_vid, Bar_Set, HBlank, Format, Aspect, Time_Code, Address, Src_Format, src_standard, src_desc, " & _
					"IRE_MV, Lum_Peak, Lum_Avg, Black, Bar_Chr, Front_Por, VBlank, Chroma_Avg, Standard, Stock_mfg, rec_fac, " & _
					"VITC, VITS, Chroma_Peak, Channel_cond, Version, Stock_batch, CH12_Phase, CH34_Phase, Tone_Phase, " & _
					"VIRS, tracking_qc, ctl_Track, RF, Tape_Wrap_QC, Eval_Stat, TRT, CustName, TCInteg, QCinUnity, LTC_VITC_Match, SurroundSound, " & _
					"grdVideo, grdAudio, grdOverall,HBlanking, VBlanking, qc_type, " & _
                    "Broadcast_Suitable,Broadcast_Suitable_Reason,DVD_Blu_Ray_Suitable,DVD_Blu_Ray_Suitable_Reason,VOD_Suitable,VOD_Suitable_Reason, CatalogueID, Timecode, " & _ 
                    "InPhase1, InPhase2, InPhase3, InPhase4, InPhase5, InPhase6, InPhase7, InPhase8, InPhase9, InPhase10, InPhase11, InPhase12, " & _ 
					"InPhase13, InPhase14, InPhase15, InPhase16, InPhase17, InPhase18, InPhase19, InPhase20, InPhase21, InPhase22, InPhase23, InPhase24,  " & _
					"Discreate1, Discreate2, Discreate3, Discreate4, Discreate5, Discreate6, Discreate7, Discreate8, Discreate9, Discreate10, Discreate11, Discreate12, " & _
					"Discreate13, Discreate14, Discreate15, Discreate16, Discreate17, Discreate18, Discreate19, Discreate20, Discreate21, Discreate22, Discreate23, Discreate24,  " & _
					"Revised_Date_2, Revised_By_2, " & _		
                    "u2.qcUserID, u2.FullName, QC_Date_2, Operator_Activity, Operator_2_Activity, Bay_Num_2, QC_VTR_2, " & _
                    "ProgrammeDetails, ProductionNumber, ProgrammeTitleAndNumber,ProductionCompany, ContactPhoneNumber, PostCompany,   " & _
					"ProductPlacementLogoPresentAndInSafeArea, SponsorshipHeadAndTailPresent, TAndCsWithinSafeArea,   " & _
					"AuthorisedBy, AuthorisedDate, JobTitle,  " & _	
  					"FileWrapper, SDROrHDR, FrameRate, VideoLines, TypeOfHDR, CaptionSafe, " & _
					"EmbeddedCCTrack, BitRate, PSEResult, QCActionType, QCVendor, " & _
					"TrackContent1, TrackContent2, TrackContent3, TrackContent4, TrackContent5, TrackContent6,  " & _
					"TrackContent7, TrackContent8, TrackContent9, TrackContent10, TrackContent11, TrackContent12,  " & _
					"TrackContent13, TrackContent14, TrackContent15, TrackContent16, TrackContent17, TrackContent18, TrackContent19, TrackContent20,  " & _
					"TrackContent21, TrackContent22, TrackContent23, TrackContent24, " & _
	                "DecodeCheck, MaxCLL, MaxFALL, ColourSpace, ColourRange, " & _
					"ColourPrimaries, TransferCharacteristics, MatrixCoefficients " & _
				"HAVING qcheader.Qcnum= " & clng(sQCNum) & " AND qcheader.subQcnum = " & cint(sRev)
	

rsHeader.CursorType=1
rsHeader.LockType=3

'' cnQCS.CommandTimeout  = 120	
rsHeader.Open sqlBVIMaster
	
	''Response.Write "Record Count: " & rsHeader.RecordCount & "<br/>"
	''Response.Write "sQCNum: " & sQCNum & "<br/>"
	''Response.Write "sRev: " & sRev & "<br/>"
		
   '' Response.Write "BOF: " & rsHeader.BOF & "<br/>"
   '' Response.Write "EOF: " & rsHeader.EOF & "<br/>"

 ''Response.End

sAssetType = rsHeader.Fields("AssetType")
sQCType = rsHeader.Fields("qc_type")

''Set deafault as Tape since the File option was recently added
if IsNull(sAssetType) or sAssetType = ""  Then
	sAssetType = "Tape"
End If


'********************************************
'Set Recordsets for Tape Layout
'Log Detail
'********************************************
dim rsBVMastLog, rsBVMastTapeLayout, sqlBVIMastLog,i
''Dim j,thisPage
dim rsTapeFormat, sqlBVIMastTF, x
dim nTotalLines, nLines
dim rsItemNumber, sqlItemNumber, itemNumberCount
itemNumberCount = 0
dim rsDPPLog, sqlDPPLog
Dim rsChecklistDPP, sqlChecklistDPP
Dim rsChecklistBanijayRights, sqlChecklistBanijayRights
Dim rsHDRMetadata, sqlHDRMetadata


''*****************Log item number check***********************************************************************

set rsItemNumber = Server.CreateObject("ADODB.Recordset")
rsItemNumber.ActiveConnection = cnQCS
sqlItemNumber = "SELECT count(item_num) ItemNumberCount FROM [bward].[qcTime] " & _
                 " WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)     

rsItemNumber.Open sqlItemNumber

''**************************************************************************************************

set rsBVMastLog = Server.CreateObject("ADODB.Recordset")
rsBVMastLog.ActiveConnection = cnQCS
itemNumberCount = rsItemNumber.Fields("ItemNumberCount")

   '' If itemNumberCount = 0 Then 
 
         sqlBVIMastLog = "SELECT part_num, Time_Code, Note, item_Duratn, QC_Code, QC_Codename, QC_Grade, Action, In_master, item_num, REPLACE(REPLACE(ActionsForDisplay, CHAR(13), '<br/>'), CHAR(10), '<br/>') ActionsForDisplay " & _
				" FROM qcTime " & _
				" WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev) & _
				" ORDER BY Time_Code"
 
'' Else
 
      '' sqlBVIMastLog = "SELECT part_num, Time_Code, Note, item_Duratn, QC_Code, QC_Codename, QC_Grade, Action, In_master, item_num, REPLACE(REPLACE(ActionsForDisplay, CHAR(13), '<br/>'), CHAR(10), '<br/>') ActionsForDisplay " & _
				'' " FROM qcTime " & _
				'' " WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev) & _
				'' " ORDER BY COALESCE( item_num, 1000)"
 
 '' End If
 
 rsItemNumber.Close
 set rsItemNumber = Nothing

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
			  "SpotQC_Cue, " & _
			  "REPLACE(CONVERT(VARCHAR(8000), Comments) , CHAR(13), '<br/>') Comments, "  & _
			  "REPLACE(CONVERT(VARCHAR(8000), RecommendationComments)  , CHAR(13), '<br/>') RecommendationComments, "  & _
			  "REPLACE(CONVERT(VARCHAR(8000), VideoComments)  , CHAR(13), '<br/>') VideoComments " & _
			  "FROM qcHeader WHERE qcheader.Qcnum= " & clng(sQCNum) & " AND qcheader.subQcnum = " & cint(sRev)
	  
rsFullSpot.Open sqlFullSpot


set rsTextInfo = Server.CreateObject("ADODB.Recordset")
rsTextInfo.ActiveConnection = cnQCS
sqlTextInfo = "SELECT TextInfo, TimecodeIn, TimecodeOut FROM qcTextInfo WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev) & " ORDER BY timecodein"
rsTextInfo.Open sqlTextInfo

'' Checklist Disney
   set rsChecklist = Server.CreateObject("ADODB.Recordset")
   rsChecklist.ActiveConnection = cnQCS
   sqlChecklist = "SELECT TOP 1 * " & _
   " FROM [QCSUK].[bward].[Checklist] " & _
   " WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
  
   rsChecklist.Open sqlChecklist,cnQCS
   
      
'' Checklist LionsGate
   set rsChecklistLionsGate = Server.CreateObject("ADODB.Recordset")
   rsChecklistLionsGate.ActiveConnection = cnQCS
   sqlChecklistLionsGate = "SELECT TOP 1 * " & _
   " FROM [QCSUK].[bward].[ChecklistLionsGate] " & _
   " WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
  
   rsChecklistLionsGate.Open sqlChecklistLionsGate,cnQCS  

'' Checklist Warner
   set rsChecklistWarner = Server.CreateObject("ADODB.Recordset")
   rsChecklistWarner.ActiveConnection = cnQCS
   sqlChecklistWarner = "SELECT TOP 1 * " & _
   " FROM [QCSUK].[bward].[ChecklistWarner] " & _
   " WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
  
   rsChecklistWarner.Open sqlChecklistWarner,cnQCS     

'' Checklist Wild Bunch
   set rsChecklistWildBunch = Server.CreateObject("ADODB.Recordset")
   rsChecklistWildBunch.ActiveConnection = cnQCS
   sqlChecklistWildBunch = "SELECT TOP 1 * " & _
   " FROM [QCSUK].[bward].[ChecklistWildBunch] " & _
   " WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
  
   rsChecklistWildBunch.Open sqlChecklistWildBunch,cnQCS   
   
'' Fault Images   
  set rsFaultImage = Server.CreateObject("ADODB.Recordset")
   rsFaultImage.ActiveConnection = cnQCS
   sqlFaultImage = "SELECT * " & _
   " FROM [QCSUK].[bward].[qcFaultDescriptionImage] " & _
   " WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
   
   rsFaultImage.CursorType=1
   rsFaultImage.LockType=3
  
   rsFaultImage.Open sqlFaultImage,cnQCS
  
'' DPP Eyeball Checklist
 set rsChecklistDPP = Server.CreateObject("ADODB.Recordset")
   rsChecklistDPP.ActiveConnection = cnQCS
   sqlChecklistDPP = "SELECT TOP 1 * " & _
   " FROM [bward].[ChecklistDPP] " & _
   " WHERE QCNum= " & clng(sQCNum) & " AND SubQCNum = " & cint(sRev)
   
rsChecklistDPP.Open sqlChecklistDPP

  
 '' DPP Eyeball Log 
 set rsDPPLog = Server.CreateObject("ADODB.Recordset")
rsDPPLog.ActiveConnection = cnQCS
sqlDPPLog = "SELECT TimeCode, Issue, ActionOrResolution, Initials " & _
			   "FROM [bward].[DPPLog] " & _
			   "WHERE QCNum= " & clng(sQCNum)& "AND SubQCNum = " & cint (sRev) & _
			   "ORDER BY Id"
rsDPPLog.Open sqlDPPLog

'' Checklist Banijay Rights
 set rsChecklistBanijayRights = Server.CreateObject("ADODB.Recordset")
   rsChecklistBanijayRights.ActiveConnection = cnQCS
   sqlChecklistBanijayRights = "SELECT TOP 1 * " & _
   " FROM [QCSUK].[bward].[ChecklistBanijayRights] " & _
   " WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
  
   rsChecklistBanijayRights.Open sqlChecklistBanijayRights, cnQCS 



'' HDR Metadata Dim rsHDRMetadata, sqlHDRMetadata
 set rsHDRMetadata = Server.CreateObject("ADODB.Recordset")
   rsHDRMetadata.ActiveConnection = cnQCS
   sqlHDRMetadata = "SELECT TOP 1 * " & _
   " FROM [QCSUK].[bward].[HDRMetadata] " & _
   " WHERE QCNum= " & clng(sQCNum) & " AND SubQCNum = " & cint(sRev)
  
   rsHDRMetadata.Open sqlHDRMetadata, cnQCS 


%>

<body>
<script language=JavaScript>
	self.focus();
</script>


	<!--#include file="GetLines.asp"-->
<%if sBVMaster = "1" then %>
	<!--#include file="BVMasteringQC.asp" -->
	<%if (sBVTech1 = "1") or (sBVTech2 = "1") or (sBVTech4 = "1") or (sCTISS = "1") or (sQCR = "1")or(sQCR100 = "1")or(sQCR1Pg = "1") or(sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sBVTech1 = "1" then %>
	<!--#include file="BVHETech1.asp" -->
	<%if (sBVTech2 = "1") or (sBVTech4 = "1") or (sCTISS = "1") or (sQCR = "1")or(sQCR100 = "1")or(sQCR1Pg = "1") or(sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sBVTech2 = "1" then %>
	<!--#include file="BVHETech2.asp" -->
	<%if (sBVTech4 = "1") or (sCTISS = "1") or (sQCR = "1")or(sQCR100 = "1")or(sQCR1Pg = "1") or(sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sBVTech4 = "1" then %>
	<!--#include file="BVHETech4.asp" -->
	<%if (sCTISS = "1") or (sQCR = "1")or(sQCR100 = "1")or(sQCR1Pg = "1") or(sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sCTISS = "1" then %>
	<!--#include file="CTISS.asp" -->
	<%if (sQCR = "1")or(sQCR100 = "1")or(sQCR1Pg = "1") or(sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>


<%if sQCR = "1" then %>
  	<!--#include file="QualityControl.asp" -->
	<%if (sQCR100 = "1")or(sQCR1Pg = "1") or(sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<%if sMQCR = "1" then %>
	<!--#include file="Master_QualityControl.asp" -->
	<%if (sQCR100 = "1")or(sQCR1Pg = "1") or(sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>

<!-- RUNTIME QUALITY CONTROL  -->
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

<!-- Runtime QC with Log For ESI-->
<%if sQCRWLE = "1" then %>
	<!--#include file="QCEndemol.asp" -->
<%end if%>

<!-- Runtime QC with Log For Banijah Rights new template-->
<%if sQCBNJR = "1" then %>
	<!--#include file="QCBanijayRights.asp" -->
	
<%end if%>

<!-- Runtime QC with Log For DPP Eyeball-->
<%if sQCRWLDPP = "1" then %>
	<!--#include file="DPPEyeball.asp" -->
<%end if%>

<%if sQCR100 = "1" then %>
	<!--#include file="QC100.asp" -->
	<%if (sQCR1Pg = "1") or(sWBQCR = "1") then%>
	<DIV class=PageBreak>
	<%end if%>
<%end if%>


<%

 ''Response.write "FileType: " & rsChecklist.Fields("FileType") & "<br/>"
'' Response.write " Customer Name: " & rsHeader.Fields("CustName")
%>

</body>

</html>
