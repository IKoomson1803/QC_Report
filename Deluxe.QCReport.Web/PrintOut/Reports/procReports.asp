<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sqlBVIMaster", sqlBVIMastTF", sqlBVIMastLog
'********************

'*********************************************************
'Mastering QC Report
'*********************************************************

'sqlBVIMaster covers page 1 except for the format section...Also
'covers header info for each page.
sqlBVIMaster = "SELECT " & _
					"qcheader.qcnum, qcheader.subqcnum, WONum, PONo, show, Epis_no, Epis_Name, " & _
					"This_part, Tot_part, Comp_Sync, Language, " & _
					"ch1_desc, ch1_tone, ch1_avg, ch1_peak, ch1_TruePeak, " & _
					"ch2_desc, ch2_tone, ch2_avg, ch2_peak, ch2_TruePeak, " & _
					"ch3_desc, ch3_tone, ch3_avg, ch3_peak, ch3_TruePeak, " & _
					"ch4_desc, ch4_tone, ch4_avg, ch4_peak, ch4_TruePeak, " & _
					"ch5_desc, ch5_tone, ch5_avg, ch5_peak, ch5_TruePeak, " & _
					"ch6_desc, ch6_tone, ch6_avg, ch6_peak, ch6_TruePeak, " & _
					"ch7_desc, ch7_tone, ch7_avg, ch7_peak, ch7_TruePeak, " & _
					"ch8_desc, ch8_tone, ch8_avg, ch8_peak, ch8_TruePeak, " & _
					"cue_desc, cue_tone, cue_avg, cue_peak, cue_TruePeak, " & _
					"QC_VTR, Operator, Rec_Fac, Rec_VTR, " & _
					"Rec_Date, Bar_vid, Bar_Set, HBlank, " & _
					"Bar_Chr, Front_Por, VBlank, Chroma_Avg, " & _
					"VITC, VITS, Chroma_Peak, Channel_cond, " & _
					"VIRS, qcheader.ctl_Track, RF, Tape_Wrap_QC,qcHeader.Timecode  " & _
				"FROM qcHeader " & _
				"INNER JOIN qcAudioTC ON qcHeader.QCNum = qcAudioTC.QCNum AND qcHeader.SubQCNum = qcAudioTC.SubQCNum " & _
				"INNER JOIN qcElement ON qcHeader.QCNum = qcElement.QCNum AND qcHeader.SubQCNum = qcElement.SubQCNum " & _
				"GROUP BY " & _
					"qcheader.qcnum, qcheader.subqcnum, WONum, PONo, show, Epis_no, Epis_Name, " & _
					"This_part, Tot_part, Comp_Sync, Language, " & _
					"ch1_desc, ch1_tone, ch1_avg, ch1_peak, ch1_TruePeak, " & _
					"ch2_desc, ch2_tone, ch2_avg, ch2_peak, ch2_TruePeak, " & _
					"ch3_desc, ch3_tone, ch3_avg, ch3_peak, ch3_TruePeak, " & _
					"ch4_desc, ch4_tone, ch4_avg, ch4_peak, ch4_TruePeak, " & _
					"ch5_desc, ch5_tone, ch5_avg, ch5_peak, ch5_TruePeak, " & _
					"ch6_desc, ch6_tone, ch6_avg, ch6_peak, ch6_TruePeak, " & _
					"ch7_desc, ch7_tone, ch7_avg, ch7_peak, ch7_TruePeak, " & _
					"ch8_desc, ch8_tone, ch8_avg, ch8_peak, ch8_TruePeak, " & _
					"cue_desc, cue_tone, cue_avg, cue_peak, cue_TruePeak, " & _
					"QC_VTR, Operator, Rec_Fac, Rec_VTR, " & _
					"Rec_Date, Bar_vid, Bar_Set, HBlank, " & _
					"Bar_Chr, Front_Por, VBlank, Chroma_Avg, " & _
					"VITC, VITS, Chroma_Peak, Channel_cond, " & _
					"VIRS, qcheader.ctl_Track, RF, Tape_Wrap_QC,qcHeader.Timecode " & _				
				"HAVING qcheader.Qcnum= " & cint(sQCNum) & " AND qcheader.subQcnum = " & cint(sRev)

'sqlBVIMasterTF is the tape format information for page 1
sqlBVIMastTF = "SELECT item_num, Description, Length " & _
			   "FROM qcTapeFormat " & _
			   "WHERE Qcnum= " & cint(sQCNum) & " AND subQcnum = " & cint(sRev) & _
			   "ORDER BY item_num"

'sqlBVIMastLog is Program Notes Section of pages >= page 2			   
sqlBVIMastLog = "SELECT Time_Code, Note, item_Duration, QC_Code, Action, In_master " & _
				"FROM qcTime " & _
				"WHERE Qcnum= " & cint(sQCNum) & " AND subQcnum = " & cint(sRev) & _
				"ORDER BY Time_Code"
				
 

    

'*********************************************************				
%>

