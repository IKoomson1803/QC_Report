<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../include/connect.asp"-->
<!--#include file="../include/login.asp"-->
<%
'***********************************************************
'Declarations
'' Updated to include Channels 9-16 Isaac Koomson 06/01/2012
'************************************************************
Dim sQCNum, sRev, sJobNum, sNewRev
Dim sql1, sql2, sql3, sql4, sql5
'********************

sJobNum = Request.Form("hdnJobNum")
sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sNewRev = Request.Form("hdnNewRev")

sql1 = "INSERT INTO qcHeader " & _
		"(QCNum, subQCNum, wonum, CustID, Show, Epis_no, " & _
		"Epis_name, Comments, Tot_Part, TapeDesc1, Standard, " & _
		"Format, Version, Aspect, Textless, " & _
		"Client_trk, TRT, bay_num, supervise, qc_type, " & _
		"in_house, DVNR, TelecineOp,  addinfo, src_standard, " & _
		"src_desc, Input_Date, pono, QC_date, eval_stat, " & _
		"revised_date, FullQC_vid, FullQC_Ch1, FullQC_ch2, " & _
		"FullQC_ch3, FullQC_ch4, FullQC_ch5, FullQC_ch6, FullQC_ch7, " & _
		"FullQC_ch8, FullQC_ch9,FullQC_ch10,FullQC_ch11,FullQC_ch12, " & _
		"FullQC_ch13, FullQC_ch14,FullQC_ch15,FullQC_ch16, " & _
		"FullQC_cue, SpotQC_vid, SpotQC_ch1, SpotQC_ch2, " & _
		"SpotQC_ch3, SpotQC_ch4, SpotQC_ch5, SpotQC_ch6, SpotQC_ch7, " & _
		"SpotQC_ch8,SpotQC_ch9, SpotQC_ch10, SpotQC_ch11, SpotQC_ch12, " & _
		"SpotQC_ch13,SpotQC_ch14, SpotQC_ch15, SpotQC_ch16, " & _
		"SpotQC_cue, Revised_By, QC_VTR, Operator, " & _
		"Stock_mfg, Stock_batch, src_format, Rec_Date, Rec_Vtr, " & _
		"Rec_fac, Bar_Vid, Bar_chr, Bar_set, Black, Chroma_avg, " & _
		"Lum_Avg, Chroma_peak, format_qc, IRE_MV, This_part) " & _
	"SELECT QCNum,  " & CInt(sNewRev) & " as subQCNum, wonum, CustID, Show, Epis_no, " & _
		"Epis_name, Comments, Tot_Part, TapeDesc1, Standard, " & _
		"Format, Version, Aspect, Textless, " & _
		"Client_trk, TRT, bay_num, supervise, qc_type, " & _
		"in_house, DVNR, TelecineOp,  addinfo, src_standard, " & _
		"src_desc, Input_Date, pono, QC_date, eval_stat, " & _
		"'" & Date() & "' as revised_date, FullQC_vid, FullQC_Ch1, FullQC_ch2, " & _
		"FullQC_ch3, FullQC_ch4, FullQC_ch5, FullQC_ch6, FullQC_ch7, " & _
		"FullQC_ch8, FullQC_ch9,FullQC_ch10,FullQC_ch11,FullQC_ch12," & _
		"FullQC_ch13, FullQC_ch14,FullQC_ch15,FullQC_ch16, " & _
		"FullQC_cue, SpotQC_vid, SpotQC_ch1, SpotQC_ch2, " & _
		"SpotQC_ch3, SpotQC_ch4, SpotQC_ch5, SpotQC_ch6, SpotQC_ch7, " & _
		"SpotQC_ch8,SpotQC_ch9, SpotQC_ch10, SpotQC_ch11, SpotQC_ch12," & _
		"SpotQC_ch13,SpotQC_ch14, SpotQC_ch15, SpotQC_ch16, " & _ 
		"SpotQC_cue, '" & sQCFullName & "' as Revised_By, QC_VTR, Operator, " & _
		"Stock_mfg, Stock_batch, src_format, Rec_Date, Rec_Vtr, " & _
		"Rec_fac, Bar_Vid, Bar_chr, Bar_set, Black, Chroma_avg, " & _
		"Lum_Avg, Chroma_peak, format_qc, IRE_MV, This_part " & _
	"FROM qcHeader " & _
	"WHERE QCNum = " & CLng(sQCNum) & " AND subQCNum = " & CInt(sRev)
	
	cnQCS.execute sql1
	
	sql2 = "INSERT INTO qcAudioTC " & _
			"(qcNum, subQCNum, Language, " & _
			"ch1_Desc, ch1_Tone, ch1_avg, ch1_Peak, ch1_TruePeak, " & _
			"ch2_Desc, ch2_Tone, ch2_avg, ch2_Peak, ch2_TruePeak, " & _
			"ch3_Desc, ch3_Tone, ch3_avg, ch3_Peak, ch3_TruePeak, " & _
			"ch4_Desc, ch4_Tone, ch4_avg, ch4_Peak, ch4_TruePeak, " & _
			"ch5_Desc, ch5_Tone, ch5_avg, ch5_Peak, ch5_TruePeak, " & _
			"ch6_Desc, ch6_Tone, ch6_avg, ch6_Peak, ch6_TruePeak, " & _
			"ch7_Desc, ch7_Tone, ch7_avg, ch7_Peak, ch7_TruePeak, " & _
			"ch8_Desc, ch8_Tone, ch8_avg, ch8_Peak, ch8_TruePeak, " & _
			"ch9_Desc, ch9_Tone, ch9_avg, ch9_Peak, ch9_TruePeak, " & _
			"ch10_Desc, ch10_Tone, ch10_avg, ch10_Peak, ch10_TruePeak, " & _
			"ch11_Desc, ch11_Tone, ch11_avg, ch11_Peak, ch11_TruePeak, " & _
			"ch12_Desc, ch12_Tone, ch12_avg, ch12_Peak, ch12_TruePeak, " & _
			"ch13_Desc, ch13_Tone, ch13_avg, ch13_Peak, ch13_TruePeak, " & _
			"ch14_Desc, ch14_Tone, ch14_avg, ch14_Peak, ch14_TruePeak, " & _
			"ch15_Desc, ch15_Tone, ch15_avg, ch15_Peak, ch15_TruePeak, " & _
			"ch16_Desc, ch16_Tone, ch16_avg, ch16_Peak, ch16_TruePeak, " & _
			"cue_Desc, cue_Tone, cue_avg, cue_Peak, cue_TruePeak, " & _
			"Time_code, NR, TCInteg, Comp_Sync, ch12_phase, " & _
			"Tone_phase, ch34_phase) " & _
		"SELECT qcNum, " & CInt(sNewRev) & " as subQCNum, Language, " & _
			"ch1_Desc, ch1_Tone, ch1_avg, ch1_Peak, ch1_TruePeak, " & _
			"ch2_Desc, ch2_Tone, ch2_avg, ch2_Peak, ch2_TruePeak, " & _
			"ch3_Desc, ch3_Tone, ch3_avg, ch3_Peak, ch3_TruePeak, " & _
			"ch4_Desc, ch4_Tone, ch4_avg, ch4_Peak, ch4_TruePeak, " & _
			"ch5_Desc, ch5_Tone, ch5_avg, ch5_Peak, ch5_TruePeak, " & _
			"ch6_Desc, ch6_Tone, ch6_avg, ch6_Peak, ch6_TruePeak, " & _
			"ch7_Desc, ch7_Tone, ch7_avg, ch7_Peak, ch7_TruePeak, " & _
			"ch8_Desc, ch8_Tone, ch8_avg, ch8_Peak, ch8_TruePeak, " & _
			"ch9_Desc, ch9_Tone, ch9_avg, ch9_Peak, ch9_TruePeak, " & _
			"ch10_Desc, ch10_Tone, ch10_avg, ch10_Peak, ch10_TruePeak, " & _
			"ch11_Desc, ch11_Tone, ch11_avg, ch11_Peak, ch11_TruePeak, " & _
			"ch12_Desc, ch12_Tone, ch12_avg, ch12_Peak, ch12_TruePeak, " & _
			"ch13_Desc, ch13_Tone, ch13_avg, ch13_Peak, ch13_TruePeak, " & _
			"ch14_Desc, ch14_Tone, ch14_avg, ch14_Peak, ch14_TruePeak, " & _
			"ch15_Desc, ch15_Tone, ch15_avg, ch15_Peak, ch15_TruePeak, " & _
			"ch16_Desc, ch16_Tone, ch16_avg, ch16_Peak, ch16_TruePeak, " & _
			"cue_Desc, cue_Tone, cue_avg, cue_Peak, cue_TruePeak, " & _
			"Time_code, NR, TCInteg, Comp_Sync, ch12_phase, " & _
			"Tone_phase, ch34_phase " & _
		"FROM qcAudioTC " & _
		"WHERE QCNum = " & CLng(sQCNum) & " AND subQCNum = " & CInt(sRev)
		
		cnQCS.execute sql2
		
	sql3 = "INSERT INTO qcBVHE " & _
			"(qcnum, subqcnum, DVVidLevel, DVChromaLevel, DVBlackLevel, " & _
			"DVVBlank, DVHBlank, DVFrontPor, DVHSync, DVBurstCycle, " & _
			"DVBackPor, DVBurstAmp, DVVidRF, DVPCMRF, DVCtlTrk, " & _
			"DVTimeBase, DVMotionJit, TSShred, TSDropOut, TSScratch, " & _
			"TSEdgeDam, TSTapeTension, TSCreasing, FScratchesDirt, " & _
			"FColorBal, FFraming, SCColourimetry, SCFlicker, MVRes, " & _
			"MVSignalNoise, MVColorBal, MVReg, MVEnt, MVCSM, MVChrLvT, " & _
			"MVPGMPvT, MVPGMLvT, MVPedLvT, MVSS, MVLagBoom, MVMoire, " & _
			"MVChrTearing, MVRinging, MVMicrophonics, MVBlackComp, " & _
			"MVWhiteComp, MVTransGlitch, MVBRi, MVVERi, MVDROi, APGMLvT, " & _
			"AIntellig, ADist, ADistLo, ADistMed, ADistHi, AHHN, ASib, " & _
			"ALipSync, AStereoPhase, AUpcuts, ATestTones, OQPrelim, OQFinal) " & _
		"SELECT qcNum, " & CInt(sNewRev) & " as subQCNum, " & _
			"DVVidLevel, DVChromaLevel, DVBlackLevel, " & _
			"DVVBlank, DVHBlank, DVFrontPor, DVHSync, DVBurstCycle, " & _
			"DVBackPor, DVBurstAmp, DVVidRF, DVPCMRF, DVCtlTrk, " & _
			"DVTimeBase, DVMotionJit, TSShred, TSDropOut, TSScratch, " & _
			"TSEdgeDam, TSTapeTension, TSCreasing, FScratchesDirt, " & _
			"FColorBal, FFraming, SCColourimetry, SCFlicker, MVRes, " & _
			"MVSignalNoise, MVColorBal, MVReg, MVEnt, MVCSM, MVChrLvT, " & _
			"MVPGMPvT, MVPGMLvT, MVPedLvT, MVSS, MVLagBoom, MVMoire, " & _
			"MVChrTearing, MVRinging, MVMicrophonics, MVBlackComp, " & _
			"MVWhiteComp, MVTransGlitch, MVBRi, MVVERi, MVDROi, APGMLvT, " & _
			"AIntellig, ADist, ADistLo, ADistMed, ADistHi, AHHN, ASib, " & _
			"ALipSync, AStereoPhase, AUpcuts, ATestTones, OQPrelim, OQFinal " & _
		"FROM qcBVHE " & _
		"WHERE QCNum = " & CInt(sQCNum) & " AND subQCNum = " & CInt(sRev)
	
	cnQCS.Execute sql3
	
	sql4 = "INSERT INTO qcElement " & _
			"(qcnum, subQCNum, Part_num, Barcode, length, slate_QC, " & _
			"Labels_QC, Shipper_QC, Src_barcode, Serrations, Tracking_QC, " & _
			"Tape_Wrap_QC, HBlank, VBlank, RF, CloseCap, VITS, VIRS, " & _
			"Front_Por, Burst_Levl, Sync_Levl, StartTC, SubTitle_QC, " & _
			"Channel_cond, ctl_track, VITC) " & _
		"SELECT qcNum, " & CInt(sNewRev) & " as subQCNum, " & _
			"Part_num, Barcode, length, slate_QC, " & _
			"Labels_QC, Shipper_QC, Src_barcode, Serrations, Tracking_QC, " & _
			"Tape_Wrap_QC, HBlank, VBlank, RF, CloseCap, VITS, VIRS, " & _
			"Front_Por, Burst_Levl, Sync_Levl, StartTC, SubTitle_QC, " & _
			"Channel_cond, ctl_track, VITC " & _
		"FROM qcElement " & _
		"WHERE QCNum = " & CLng(sQCNum) & " AND subQCNum = " & CInt(sRev)
	
	cnQCS.Execute sql4
	
	sql5 = "INSERT INTO qcTapeFormat " & _
			"(qcnum, subQCNum, " & _
			"Item_Num, description, length, Time_code) " & _
		"SELECT qcNum, " & CInt(sNewRev) & " as subQCNum, " & _
			"Item_Num, description, length, Time_code " & _
		"FROM qcTapeFormat " & _
		"WHERE QCNum = " & CLng(sQCNum) & " AND subQCNum = " & CInt(sRev)
		
	cnQCS.Execute sql5
	
	cnQCS.close
	set cnQCS = Nothing
	
%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>