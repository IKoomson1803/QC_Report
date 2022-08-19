<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->
<meta NAME="robots" CONTENT="noindex">
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>
<script language="javascript">
	function submitCombo()
	{
		frmAudioTC.selCue.value = frmAudioTC.cmbCue.Text;
		frmAudioTC.txtCue_Tone.value = frmAudioTC.cmbCueTone.Text;
		
		/*********Updated by Isaac Koomson 29/12/2011 to increase the counter from 9 to 17******************************************/
		/*********Updated by Isaac Koomson 03/09/2012 to increase the counter from 17 to 25******************************************/
		/*********Updated by Isaac Koomson 10/01/2013 to add Languages******************************************/
			//for (i=1; i<25; i++)
			//{
			     //alert("cmbCH" + i + ":" + frmAudioTC.item("cmbCH" + i).Text);
			
			
				//frmAudioTC.item("selCH" + i).value = frmAudioTC.item("cmbCH" + i).Text;
				//frmAudioTC.item("selLanguage" + i).value = frmAudioTC.item("cmbLanguage" + i).Text;
				//frmAudioTC.item("txtCH" + i + "_Tone").value = frmAudioTC.item("cmbTone" + i ).Text;
			//}
	}
	
	//DOESN'T WORK FOR SOME REASON!!!!
	function clear(i){
	
	
	  	document.getElementById("cmbCH" + i).value = '';
		document.getElementById("cmbLanguage" + i).value = '';
		document.getElementById("cmbTone" + i).value = '';
        document.getElementById("txtCH" + i + "_Avg").value = '';
		document.getElementById("txtCH" + i + "_LKFS").value = '';
		document.getElementById("txtCH" + i + "_Peak").value = '';
		document.getElementById("txtCH" + i + "_TruePeak").value = '';
		document.getElementById("cmbFullSpot" + i).value = '';
		
	}
	
	function clear_1(){
	
	  	document.getElementById("cmbCH1").value = '';
		document.getElementById("cmbLanguage1").value = '';
		document.getElementById("cmbTone1").value = '';
        document.getElementById("txtCH1_Avg").value = '';
		document.getElementById("txtCH1_LKFS").value = '';
		document.getElementById("txtCH1_Peak").value = '';
		document.getElementById("txtCH1_TruePeak").value = '';
		document.getElementById("cmbFullSpot1").value = '';
		
	}
	
	function clear_2(){
	
	  	document.getElementById("cmbCH2").value = '';
		document.getElementById("cmbLanguage2").value = '';
		document.getElementById("cmbTone2").value = '';
        document.getElementById("txtCH2_Avg").value = '';
		document.getElementById("txtCH2_LKFS").value = '';
		document.getElementById("txtCH2_Peak").value = '';
		document.getElementById("txtCH2_TruePeak").value = '';
		document.getElementById("cmbFullSpot2").value = '';
		
	}
	
	function clear_3(){
	
	  	document.getElementById("cmbCH3").value = '';
		document.getElementById("cmbLanguage3").value = '';
		document.getElementById("cmbTone3").value = '';
        document.getElementById("txtCH3_Avg").value = '';
		document.getElementById("txtCH3_LKFS").value = '';
		document.getElementById("txtCH3_Peak").value = '';
		document.getElementById("txtCH3_TruePeak").value = '';
		document.getElementById("cmbFullSpot3").value = '';
		
	}
	
	function clear_4(){
	
	  	document.getElementById("cmbCH4").value = '';
		document.getElementById("cmbLanguage4").value = '';
		document.getElementById("cmbTone4").value = '';
        document.getElementById("txtCH4_Avg").value = '';
		document.getElementById("txtCH4_LKFS").value = '';
		document.getElementById("txtCH4_Peak").value = '';
		document.getElementById("txtCH4_TruePeak").value = '';
		document.getElementById("cmbFullSpot4").value = '';
		
	}
	
	function clear_5(){
	
	  	document.getElementById("cmbCH5").value = '';
		document.getElementById("cmbLanguage5").value = '';
		document.getElementById("cmbTone5").value = '';
        document.getElementById("txtCH5_Avg").value = '';
		document.getElementById("txtCH5_LKFS").value = '';
		document.getElementById("txtCH5_Peak").value = '';
		document.getElementById("txtCH5_TruePeak").value = '';
		document.getElementById("cmbFullSpot5").value = '';
		
	}
	
	function clear_6(){
	
	  	document.getElementById("cmbCH6").value = '';
		document.getElementById("cmbLanguage6").value = '';
		document.getElementById("cmbTone6").value = '';
        document.getElementById("txtCH6_Avg").value = '';
		document.getElementById("txtCH6_LKFS").value = '';
		document.getElementById("txtCH6_Peak").value = '';
		document.getElementById("txtCH6_TruePeak").value = '';
		document.getElementById("cmbFullSpot6").value = '';
		
	}
	
	function clear_7(){
	
	  	document.getElementById("cmbCH7").value = '';
		document.getElementById("cmbLanguage7").value = '';
		document.getElementById("cmbTone7").value = '';
        document.getElementById("txtCH7_Avg").value = '';
		document.getElementById("txtCH7_LKFS").value = '';
		document.getElementById("txtCH7_Peak").value = '';
		document.getElementById("txtCH7_TruePeak").value = '';
		document.getElementById("cmbFullSpot7").value = '';
		
	}
	
	function clear_8(){
	
	  	document.getElementById("cmbCH8").value = '';
		document.getElementById("cmbLanguage8").value = '';
		document.getElementById("cmbTone8").value = '';
        document.getElementById("txtCH8_Avg").value = '';
		document.getElementById("txtCH8_LKFS").value = '';
		document.getElementById("txtCH8_Peak").value = '';
		document.getElementById("txtCH8_TruePeak").value = '';
		document.getElementById("cmbFullSpot8").value = '';
		
	}
	
	function clear_9(){
	
	  	document.getElementById("cmbCH9").value = '';
		document.getElementById("cmbLanguage9").value = '';
		document.getElementById("cmbTone9").value = '';
        document.getElementById("txtCH9_Avg").value = '';
		document.getElementById("txtCH9_LKFS").value = '';
		document.getElementById("txtCH9_Peak").value = '';
		document.getElementById("txtCH9_TruePeak").value = '';
		document.getElementById("cmbFullSpot9").value = '';
		
	}
	
	function clear_10(){
	
	  	document.getElementById("cmbCH10").value = '';
		document.getElementById("cmbLanguage10").value = '';
		document.getElementById("cmbTone10").value = '';
        document.getElementById("txtCH10_Avg").value = '';
		document.getElementById("txtCH10_LKFS").value = '';
		document.getElementById("txtCH10_Peak").value = '';
		document.getElementById("txtCH10_TruePeak").value = '';
		document.getElementById("cmbFullSpot10").value = '';
		
	}
	
	function clear_11(){
	
	  	document.getElementById("cmbCH11").value = '';
		document.getElementById("cmbLanguage11").value = '';
		document.getElementById("cmbTone11").value = '';
        document.getElementById("txtCH11_Avg").value = '';
		document.getElementById("txtCH11_LKFS").value = '';
		document.getElementById("txtCH11_Peak").value = '';
		document.getElementById("txtCH11_TruePeak").value = '';
		document.getElementById("cmbFullSpot11").value = '';
		
	}
	
	function clear_12(){
	
	  	document.getElementById("cmbCH12").value = '';
		document.getElementById("cmbLanguage12").value = '';
		document.getElementById("cmbTone12").value = '';
        document.getElementById("txtCH12_Avg").value = '';
		document.getElementById("txtCH12_LKFS").value = '';
		document.getElementById("txtCH12_Peak").value = '';
		document.getElementById("txtCH12_TruePeak").value = '';
		document.getElementById("cmbFullSpot12").value = '';
		
	}
	
	function clear_13(){
	
	  	document.getElementById("cmbCH13").value = '';
		document.getElementById("cmbLanguage13").value = '';
		document.getElementById("cmbTone13").value = '';
        document.getElementById("txtCH13_Avg").value = '';
		document.getElementById("txtCH13_LKFS").value = '';
		document.getElementById("txtCH13_Peak").value = '';
		document.getElementById("txtCH13_TruePeak").value = '';
		document.getElementById("cmbFullSpot13").value = '';
		
	}
	
	function clear_14(){
	
	  	document.getElementById("cmbCH14").value = '';
		document.getElementById("cmbLanguage14").value = '';
		document.getElementById("cmbTone14").value = '';
        document.getElementById("txtCH14_Avg").value = '';
		document.getElementById("txtCH14_LKFS").value = '';
		document.getElementById("txtCH14_Peak").value = '';
		document.getElementById("txtCH14_TruePeak").value = '';
		document.getElementById("cmbFullSpot14").value = '';
		
	}
	
	function clear_15(){
	
	  	document.getElementById("cmbCH15").value = '';
		document.getElementById("cmbLanguage15").value = '';
		document.getElementById("cmbTone15").value = '';
        document.getElementById("txtCH15_Avg").value = '';
		document.getElementById("txtCH15_LKFS").value = '';
		document.getElementById("txtCH15_Peak").value = '';
		document.getElementById("txtCH15_TruePeak").value = '';
		document.getElementById("cmbFullSpot15").value = '';
		
	}
	
	function clear_16(){
	
	  	document.getElementById("cmbCH16").value = '';
		document.getElementById("cmbLanguage16").value = '';
		document.getElementById("cmbTone16").value = '';
        document.getElementById("txtCH16_Avg").value = '';
		document.getElementById("txtCH16_LKFS").value = '';
		document.getElementById("txtCH16_Peak").value = '';
		document.getElementById("txtCH16_TruePeak").value = '';
		document.getElementById("cmbFullSpot16").value = '';
		
	}
	
	function clear_17(){
	
	  	document.getElementById("cmbCH17").value = '';
		document.getElementById("cmbLanguage17").value = '';
		document.getElementById("cmbTone17").value = '';
        document.getElementById("txtCH17_Avg").value = '';
		document.getElementById("txtCH17_LKFS").value = '';
		document.getElementById("txtCH17_Peak").value = '';
		document.getElementById("txtCH17_TruePeak").value = '';
		document.getElementById("cmbFullSpot17").value = '';
		
	}
	
	function clear_18(){
	
	  	document.getElementById("cmbCH18").value = '';
		document.getElementById("cmbLanguage18").value = '';
		document.getElementById("cmbTone18").value = '';
        document.getElementById("txtCH18_Avg").value = '';
		document.getElementById("txtCH18_LKFS").value = '';
		document.getElementById("txtCH18_Peak").value = '';
		document.getElementById("txtCH18_TruePeak").value = '';
		document.getElementById("cmbFullSpot18").value = '';
		
	}
	
	function clear_19(){
	
	  	document.getElementById("cmbCH19").value = '';
		document.getElementById("cmbLanguage19").value = '';
		document.getElementById("cmbTone19").value = '';
        document.getElementById("txtCH19_Avg").value = '';
		document.getElementById("txtCH19_LKFS").value = '';
		document.getElementById("txtCH19_Peak").value = '';
		document.getElementById("txtCH19_TruePeak").value = '';
		document.getElementById("cmbFullSpot19").value = '';
		
	}
	
	function clear_20(){
	
	  	document.getElementById("cmbCH20").value = '';
		document.getElementById("cmbLanguage20").value = '';
		document.getElementById("cmbTone20").value = '';
        document.getElementById("txtCH20_Avg").value = '';
		document.getElementById("txtCH20_LKFS").value = '';
		document.getElementById("txtCH20_Peak").value = '';
		document.getElementById("txtCH20_TruePeak").value = '';
		document.getElementById("cmbFullSpot20").value = '';
		
	}
	
		function clear_21(){
	
	  	document.getElementById("cmbCH21").value = '';
		document.getElementById("cmbLanguage21").value = '';
		document.getElementById("cmbTone21").value = '';
        document.getElementById("txtCH21_Avg").value = '';
		document.getElementById("txtCH21_LKFS").value = '';
		document.getElementById("txtCH21_Peak").value = '';
		document.getElementById("txtCH21_TruePeak").value = '';
		document.getElementById("cmbFullSpot21").value = '';
		
	}
	
		function clear_22(){
	
	  	document.getElementById("cmbCH22").value = '';
		document.getElementById("cmbLanguage22").value = '';
		document.getElementById("cmbTone22").value = '';
        document.getElementById("txtCH22_Avg").value = '';
		document.getElementById("txtCH22_LKFS").value = '';
		document.getElementById("txtCH22_Peak").value = '';
		document.getElementById("txtCH22_TruePeak").value = '';
		document.getElementById("cmbFullSpot22").value = '';
		
	}
	
		function clear_23(){
	
	  	document.getElementById("cmbCH23").value = '';
		document.getElementById("cmbLanguage23").value = '';
		document.getElementById("cmbTone23").value = '';
        document.getElementById("txtCH23_Avg").value = '';
		document.getElementById("txtCH23_LKFS").value = '';
		document.getElementById("txtCH23_Peak").value = '';
		document.getElementById("txtCH23_TruePeak").value = '';
		document.getElementById("cmbFullSpot23").value = '';
		
	}
	
		function clear_24(){
	
	  	document.getElementById("cmbCH24").value = '';
		document.getElementById("cmbLanguage24").value = '';
		document.getElementById("cmbTone24").value = '';
        document.getElementById("txtCH24_Avg").value = '';
		document.getElementById("txtCH24_LKFS").value = '';
		document.getElementById("txtCH24_Peak").value = '';
		document.getElementById("txtCH24_TruePeak").value = '';
		document.getElementById("cmbFullSpot24").value = '';
		
	}
	
	
</script>
<BODY class="bodyForm">
<SCRIPT language="javascript">
	self.focus();
</SCRIPT>
<!--#include file="../include/connect.asp"-->
<!--#include file="../include/login.asp"-->
<table ID="tblForm" border="0" CELLPADDING="0" CELLSPACING="0" width="100%">
	<tr>
		<td>
<%
'********************
'Declarations
'********************
dim rsFrm, rsCombo, rsFullSpot
dim sJobNum, sQCNum, sRev, sFrm
dim sql, sqlCombo, i, sqlFullSpot
'********************

dim fullSelected_1, fullSelected_2,fullSelected_3,fullSelected_4,fullSelected_5,fullSelected_6
dim fullSelected_7, fullSelected_8,fullSelected_9,fullSelected_10,fullSelected_11,fullSelected_12
dim fullSelected_13, fullSelected_14,fullSelected_15,fullSelected_16,fullSelected_17,fullSelected_18
dim fullSelected_19, fullSelected_20,fullSelected_21,fullSelected_22,fullSelected_23,fullSelected_24
dim fullSelected_Cue

dim spotSelected_1, spotSelected_2,spotSelected_3,spotSelected_4,spotSelected_5,spotSelected_6
dim spotSelected_7, spotSelected_8,spotSelected_9,spotSelected_10,spotSelected_11,spotSelected_12
dim spotSelected_13, spotSelected_14,spotSelected_15,spotSelected_16,spotSelected_17,spotSelected_18
dim spotSelected_19, spotSelected_20,spotSelected_21,spotSelected_22,spotSelected_23,spotSelected_24
dim spotSelected_Cue

sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")

Response.Write "<td><font size=2><b>" & sQCNum & " - " & sRev & ":  " & sFrm & "</b></font></td>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
Set rsCombo = server.CreateObject("ADODB.Recordset")
Set rsFullSpot = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for Audio TC Screen
'' Updated By: Isaac Koomson 29/12/2011
'' Update Note: Updated to increase the channels from 8 to 16

''Updated : 27/01/2012 - Isaac Koomson
''Update Notes: Updated to include new field LKFS

''Updated : 03/09/2012 - Isaac Koomson
''Update Notes: Updated to increase the channels from 16 to 24

''Updated : 10/01/2013 - Isaac Koomson
''Update Notes: Updated to increase the Languages from 1 to 24
'*******************************************************************************************************
		sql="SELECT Language, ChannelCount," & _
		       "Language1, Language2, Language3, Language4, Language5, Language6, " & _		
		       "Language7, Language8, Language9, Language10, Language11, Language12, " & _
		       "Language13, Language14, Language15, Language16, Language17, Language18, " & _
		       "Language19, Language20, Language21, Language22, Language23, Language24, " & _
				"ch1_desc, ch1_LKFS, ch1_tone, ch1_avg, ch1_peak, ch1_TruePeak," & _
				"ch2_desc, ch2_LKFS, ch2_tone, ch2_avg, ch2_peak, ch2_TruePeak," & _
				"ch3_desc,  ch3_LKFS, ch3_tone, ch3_avg, ch3_peak, ch3_TruePeak," & _
				"ch4_desc,  ch4_LKFS, ch4_tone, ch4_avg, ch4_peak, ch4_TruePeak," & _
				"ch5_desc,  ch5_LKFS, ch5_tone, ch5_avg, ch5_peak, ch5_TruePeak," & _
				"ch6_desc,  ch6_LKFS, ch6_tone, ch6_avg, ch6_peak, ch6_TruePeak," & _
				"ch7_desc,  ch7_LKFS, ch7_tone, ch7_avg, ch7_peak, ch7_TruePeak," & _
				"ch8_desc,  ch8_LKFS, ch8_tone, ch8_avg, ch8_peak, ch8_TruePeak," & _
				 "ch9_desc,  ch9_LKFS, ch9_tone, ch9_avg, ch9_peak, ch9_TruePeak," & _
				 "ch10_desc, ch10_LKFS,  ch10_tone, ch10_avg, ch10_peak, ch10_TruePeak," & _
				 "ch11_desc, ch11_LKFS,  ch11_tone, ch11_avg, ch11_peak, ch11_TruePeak," & _
				 "ch12_desc,  ch12_LKFS, ch12_tone, ch12_avg, ch12_peak, ch12_TruePeak," & _
				 "ch13_desc, ch13_LKFS,  ch13_tone, ch13_avg, ch13_peak, ch13_TruePeak," & _
				 "ch14_desc, ch14_LKFS,  ch14_tone, ch14_avg, ch14_peak, ch14_TruePeak," & _
				 "ch15_desc, ch15_LKFS,  ch15_tone, ch15_avg, ch15_peak, ch15_TruePeak," & _
				 "ch16_desc, ch16_LKFS,  ch16_tone, ch16_avg, ch16_peak, ch16_TruePeak," & _
				 "ch17_desc, ch17_LKFS,  ch17_tone, ch17_avg, ch17_peak, ch17_TruePeak," & _
				 "ch18_desc, ch18_LKFS,  ch18_tone, ch18_avg, ch18_peak, ch18_TruePeak," & _
				 "ch19_desc, ch19_LKFS,  ch19_tone, ch19_avg, ch19_peak, ch19_TruePeak," & _
				 "ch20_desc, ch20_LKFS,  ch20_tone, ch20_avg, ch20_peak, ch20_TruePeak," & _
				 "ch21_desc, ch21_LKFS,  ch21_tone, ch21_avg, ch21_peak, ch21_TruePeak," & _
				 "ch22_desc, ch22_LKFS,  ch22_tone, ch22_avg, ch22_peak, ch22_TruePeak," & _
				 "ch23_desc, ch23_LKFS,  ch23_tone, ch23_avg, ch23_peak, ch23_TruePeak," & _
				 "ch24_desc, ch24_LKFS,  ch24_tone, ch24_avg, ch24_peak, ch24_TruePeak," & _
				 "cue_desc, cue_LKFS,  cue_tone, cue_avg, cue_peak, cue_TruePeak," & _
				"NR, time_code, CH12_Phase, CH34_Phase, QCinUnity, LTC_VITC_Match, SurroundSound, " & _
				"TCInteg, Tone_Phase, Comp_Sync " & _
			"FROM qcAudioTC " & _
			"WHERE qcnum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev)
'*******************************************************************************************************

'*******************************************************************************************************
'Moved from Overall Specs Screen
''  Isaac Koomson 03/09/2012
'*******************************************************************************************************
		sqlFullSpot="SELECT FullQC_Vid, FullQC_ch1, FullQC_ch2, FullQC_ch3, FullQC_ch4, " & _
				"FullQC_ch5, FullQC_ch6, FullQC_ch7, FullQC_ch8, " & _
				"FullQC_ch9, FullQC_ch10, FullQC_ch11, FullQC_ch12," & _
				"FullQC_ch13,FullQC_ch14,FullQC_ch15,FullQC_ch16, FullQC_cue," & _
				"FullQC_ch17,FullQC_ch18,FullQC_ch19,FullQC_ch20, " & _
				"FullQC_ch21,FullQC_ch22,FullQC_ch23,FullQC_ch24,FullQC_Cue, " & _
				"SpotQC_vid, SpotQC_ch1, SpotQC_ch2, SpotQC_ch3, SpotQC_ch4, " & _
				"SpotQC_ch5, SpotQC_ch6, SpotQC_ch7, SpotQC_ch8, " & _
				"SpotQC_ch9, SpotQC_ch10, SpotQC_ch11, SpotQC_ch12," & _
				"SpotQC_ch13,SpotQC_ch14,SpotQC_ch15,SpotQC_ch16, SpotQC_cue, " & _
				"SpotQC_ch17,SpotQC_ch18,SpotQC_ch19,SpotQC_ch20,  " & _
				"SpotQC_ch21,SpotQC_ch22,SpotQC_ch23,SpotQC_ch24,SpotQC_Cue  " & _
				"FROM qcHeader " & _
			"WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
'*******************************************************************************************************


		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql
		
		rsFullSpot.ActiveConnection = cnQCS
		rsFullSpot.Open sqlFullSpot
		
		rsCombo.ActiveConnection = cnQCS
	
		
 %>
 		<TD width=40% align=right>
			<a href="../reports/reports.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" tabindex="10" target="main">Reports&nbsp;</a>
		</TD>
		<td>
			<a href="../reports/reports.asp?sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" tabindex="10" target="main">			
 			<IMG HSPACE="1" HEIGHT="19" WIDTH="18" BORDER="0" SRC="../images/reports_off.gif" ALT="Reports"></a>
		</TD>
	</tr>
</table>
<!--#include file="../include/frmToolBar.asp"-->
		<table ID="tblTapeFormat" border=0 width=100% cellpadding=0 cellspacing=0>
		<form method="post" name="frmAudioTC" action="procAudioTC.asp">
		<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
		<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
		<input type=hidden id=hdnJobNum name=hdnJobNum value="<%=sJobNum%>">
		

			<tr bgcolor=#999900>
				<td align=right>Channel Count:&nbsp;&nbsp;</td>
				<td>
				  <select id="cmbChannelCount" name="cmbChannelCount">
				     <option value=""></option>
				     <option value="2 Channels" <% If rsFrm.Fields("ChannelCount") = "2 Channels" Then %>selected<%End If%> >2 Channels</option>
					 <option value="4 Channels" <% If rsFrm.Fields("ChannelCount") = "4 Channels" Then %>selected<%End If%> >4 Channels</option>
					 <option value="6 Channels" <% If rsFrm.Fields("ChannelCount") = "6 Channels" Then %>selected<%End If%> >6 Channels</option>
					 <option value="8 Channels" <% If rsFrm.Fields("ChannelCount") = "8 Channels" Then %>selected<%End If%> >8 Channels</option>
					 <option value="10 Channels" <% If rsFrm.Fields("ChannelCount") = "10 Channels" Then %>selected<% End If%> >10 Channels</option>
					 <option value="12 Channels" <% If rsFrm.Fields("ChannelCount") = "12 Channels" Then %>selected<%End If%> >12 Channels</option>
					 <option value="14 Channels" <% If rsFrm.Fields("ChannelCount") = "14 Channels" Then %>selected<%End If%> >14 Channels</option>
					 <option value="16 Channels" <% If rsFrm.Fields("ChannelCount") = "16 Channels" Then %>selected<%End If%> >16 Channels</option>
					 <option value="18 Channels" <% If rsFrm.Fields("ChannelCount") = "18 Channels" Then %>selected<%End If%> >18 Channels</option>
					 <option value="20 Channels" <% If rsFrm.Fields("ChannelCount") = "20 Channels" Then %>selected<%End If%> >20 Channels</option>
					 <option value="22 Channels" <% If rsFrm.Fields("ChannelCount") = "22 Channels" Then %>selected<%End If%> >22 Channels</option>
					 <option value="24 Channels" <% If rsFrm.Fields("ChannelCount") = "24 Channels" Then %>selected<%End If%> >24 Channels</option>
				  </select>
				</td>
				<td>Language</td>
				<td>Tone</td>
				<td>AVG db</td>
				<td>LUFS</td>
				<td>Peak db</td>
				<td>True Peak</td>
				<td>Full / Spot</td>
			</tr>
		
<input type="hidden" id="selCH1" name="selCH1" value="<%=rsFrm.Fields("CH1_Desc")%>">
			<tr bgcolor=#F5F5DC>
			 	<td align=right><span class="clear" onclick="clear_1()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CH 1:&nbsp;&nbsp;</td>
				<td>
				
				
				<select id="cmbCH1" name="cmbCH1" style="height:30px" >
				 <option><%=rsFrm.Fields("CH1_Desc")%></option>
				</select>
		    	</td>
				
				<input type="hidden" id="selLanguage1" name="selLanguage1" value="<%=rsFrm.Fields("Language1")%>">
				<td>
				    <select id="cmbLanguage1" name="cmbLanguage1">
					<option><%=rsFrm.Fields("Language1")%></option>
					</select>
				
			</td>
				
			
				<td>
				<!--
				  <select id="cmbTone1" name="cmbTone1">
				     <option><%=rsFrm.Fields("ch1_tone")%></option>
				  </select>
				  -->
				  <input size="8" type="text" id="cmbTone1" name="cmbTone1" value="<%=rsFrm.Fields("ch1_tone")%>">
				
				</td>
			<td>
				<input size=8 type="text" id=txtCH1_Avg name=txtCH1_Avg value=<%=rsFrm.Fields("ch1_avg")%>>
			</td>
			<td>
				<input size="8" type="text" id="txtCH1_LKFS" name="txtCH1_LKFS" value="<%=rsFrm.Fields("ch1_LKFS")%>">
			</td>
				<td>
			<input size=8 type="text" id=txtCH1_Peak name=txtCH1_Peak value=<%=rsFrm.Fields("ch1_peak")%>>
				</td>
				<td>
			<input size=8 type="text" id=txtCH1_TruePeak name=txtCH1_TruePeak value=<%=rsFrm.Fields("ch1_TruePeak")%>>
				</td>
				<td>
				
				  <%
					if rsFullSpot("FullQC_ch1") = True Then
						fullSelected_1 = "selected"
					elseif rsFullSpot("SpotQC_ch1") = True Then
						spotSelected_1 = "selected"
					end if
				%>
		
				  <select id="cmbFullSpot1" name="cmbFullSpot1">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_1%> >Full</option>
					 <option value="Spot" <%=spotSelected_1%> > Spot</option>
				  </select>
				  
				</td>
			</tr>
			
			<input type="hidden" id="txtCH1_Tone" name="txtCH1_Tone" value=<%=rsFrm.Fields("ch1_tone")%>>

			
<input type="hidden" id=selCH2 name=selCH2 value="<%=rsFrm.Fields("CH2_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_2()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CH 2:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH2" name="cmbCH2" >
				<option><%=rsFrm.Fields("CH2_Desc")%></option>
				</select>
				
				</td>
				
				<input type="hidden" id="selLanguage2" name="selLanguage2" value="<%=rsFrm.Fields("Language2")%>">
				<td>
				    <select id="cmbLanguage2" name="cmbLanguage2" >
					<option><%=rsFrm.Fields("Language2")%></option>
					</select>
				
			</td>
				
				
				
				<td>
				 <!--
				 <select id="cmbTone2" name="cmbTone2">
				  <option><%=rsFrm.Fields("ch2_tone")%></option>
				 </select>
		         -->
				 
				 <input size="8" type="text" id="cmbTone2" name="cmbTone2" value="<%=rsFrm.Fields("ch2_tone")%>">
				 
				</td>
				<td>
				<input size=8 type="text" id=txtCH2_Avg name=txtCH2_Avg value=<%=rsFrm.Fields("ch2_avg")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH2_LKFS name=txtCH2_LKFS value=<%=rsFrm.Fields("ch2_LKFS")%>>
			</td>
				<td>
				<input size=8 type="text" id=txtCH2_Peak name=txtCH2_Peak value=<%=rsFrm.Fields("ch2_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH2_TruePeak name=txtCH2_TruePeak value=<%=rsFrm.Fields("ch2_TruePeak")%>>
				</td>
				<td>
				 <%
					if rsFullSpot("FullQC_ch2") = True Then
						fullSelected_2 = "selected"
					elseif rsFullSpot("SpotQC_ch2") = True Then
						spotSelected_2 = "selected"
					end if
				%>
				
				  <select id="cmbFullSpot2" name="cmbFullSpot2">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_2%> >Full</option>
					 <option value="Spot" <%=spotSelected_2%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id=txtCH2_Tone name=txtCH2_Tone value=<%=rsFrm.Fields("ch2_tone")%>>



			
<input type="hidden" id=selCH3 name=selCH3 value="<%=rsFrm.Fields("CH3_Desc")%>">
			<tr bgcolor=#F5F5DC>
				<td align=right><span class="clear" onclick="clear_3()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CH 3:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH3" name="cmbCH3">
				<option><%=rsFrm.Fields("CH3_Desc")%></option>
				</select>
				
				</td>
				
				<input type="hidden" id="selLanguage3" name="selLanguage3" value="<%=rsFrm.Fields("Language3")%>">
				<td>
				
				   <select id="cmbLanguage3" name="cmbLanguage3">
				   <option><%=rsFrm.Fields("Language3")%></option>
				   </select>
				
			</td>
				
				
			
				<td>
				<!--
				<select id="cmbTone3" name="cmbTone3" >
				<option><%=rsFrm.Fields("ch3_tone")%></option>
				</select>
				-->
				<input size="8" type="text" id="cmbTone3" name="cmbTone3" value="<%=rsFrm.Fields("ch3_tone")%>">
				</td>
				<td>
				<input size=8 type="text" id=txtCH3_Avg name=txtCH3_Avg value=<%=rsFrm.Fields("ch3_avg")%>>
				</td>
					<td>
				<input size=8 type="text" id=txtCH3_LKFS name=txtCH3_LKFS value=<%=rsFrm.Fields("ch3_LKFS")%>>
			</td>
				<td>
				<input size=8 type="text" id=txtCH3_Peak name=txtCH3_Peak value=<%=rsFrm.Fields("ch3_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH3_TruePeak name=txtCH3_TruePeak value=<%=rsFrm.Fields("ch3_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch3") = True Then
						fullSelected_3 = "selected"
					elseif rsFullSpot("SpotQC_ch3") = True Then
						spotSelected_3 = "selected"
					end if
				%>

				
				<select id="cmbFullSpot3" name="cmbFullSpot3">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_3%> >Full</option>
					 <option value="Spot" <%=spotSelected_3%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id=txtCH3_Tone name=txtCH3_Tone value=<%=rsFrm.Fields("ch3_tone")%>>

			
<input type="hidden" id=selCH4 name=selCH4 value="<%=rsFrm.Fields("CH4_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_4()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CH 4:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH4" name="cmbCH4">
				<option><%=rsFrm.Fields("CH4_Desc")%></option>
				</select>
				
				</td>
				
				<input type="hidden" id="selLanguage4" name="selLanguage4" value="<%=rsFrm.Fields("Language4")%>">
				<td>
				  
				   <select id="cmbLanguage4"  name="cmbLanguage4" >
				   <option><%=rsFrm.Fields("Language4")%></option>
				   </select>
		
			</td>
			
				<td>
				<!--
				 <select id="cmbTone4" name="cmbTone4">
				  <option><%=rsFrm.Fields("ch4_tone")%></option>
				 </select>
				-->
				<input size="8" type="text" id="cmbTone4" name="cmbTone4" value="<%=rsFrm.Fields("ch4_tone")%>">
				</td>
				<td>
				<input size=8 type="text" id=txtCH4_Avg name=txtCH4_Avg value=<%=rsFrm.Fields("ch4_avg")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH4_LKFS name=txtCH4_LKFS value=<%=rsFrm.Fields("ch4_LKFS")%>>
			</td>
				<td>
				<input size=8 type="text" id=txtCH4_Peak name=txtCH4_Peak value=<%=rsFrm.Fields("ch4_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH4_TruePeak name=txtCH4_TruePeak value=<%=rsFrm.Fields("ch4_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch4") = True Then
						fullSelected_4 = "selected"
					elseif rsFullSpot("SpotQC_ch4") = True Then
						spotSelected_4 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot4" name="cmbFullSpot4">
				     <option value=""></option>
				     <option value="Full"  <%=fullSelected_4%> >Full</option>
					 <option value="Spot" <%=spotSelected_4%> >Spot</option>
				  </select>
			   </td>
			</tr>
				<input type="hidden" id=txtCH4_Tone name=txtCH4_Tone value=<%=rsFrm.Fields("ch4_tone")%>>

	
<input type="hidden" id=selCH5 name=selCH5 value="<%=rsFrm.Fields("CH5_Desc")%>">
			<tr bgcolor=#F5F5DC>
				<td align=right><span class="clear" onclick="clear_5()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CH 5:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH5" name="cmbCH5">
				<option><%=rsFrm.Fields("CH5_Desc")%></option>
				</select>
			
				</td>
				
				<input type="hidden" id="selLanguage5" name="selLanguage5" value="<%=rsFrm.Fields("Language5")%>">
				<td>
				
				 <select id="cmbLanguage5"  name="cmbLanguage5" >
				  <option><%=rsFrm.Fields("Language5")%></option>
				 </select>
			
			</td>
				
			
				<td>
				<!--
				<select id="cmbTone5" name="cmbTone5">
				 <option><%=rsFrm.Fields("ch5_tone")%></option>
				</select>
			   -->
			   <input size="8" type="text" id="cmbTone5" name="cmbTone5" value="<%=rsFrm.Fields("ch5_tone")%>">
				</td>
				<td>
				<input size=8 type="text" id=txtCH5_Avg name=txtCH5_Avg value=<%=rsFrm.Fields("ch5_avg")%>>
				</td>
					
				<td>
				<input size=8 type="text" id=txtCH5_LKFS name=txtCH5_LKFS value=<%=rsFrm.Fields("ch5_LKFS")%>>
			</td>
				<td>
				<input size=8 type="text" id=txtCH5_Peak name=txtCH5_Peak value=<%=rsFrm.Fields("ch5_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH5_TruePeak name=txtCH5_TruePeak value=<%=rsFrm.Fields("ch5_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch5") = True Then
						fullSelected_5 = "selected"
					elseif rsFullSpot("SpotQC_ch5") = True Then
						spotSelected_5 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot5" name="cmbFullSpot5">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_5%> >Full</option>
					 <option value="Spot" <%=spotSelected_5%> >Spot</option>
				  </select>
				  </td>
			</tr>
				<input type="hidden" id=txtCH5_Tone name=txtCH5_Tone value=<%=rsFrm.Fields("ch5_tone")%>>
				
<input type="hidden" id=selCH6 name=selCH6 value="<%=rsFrm.Fields("CH6_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_6()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CH 6:&nbsp;&nbsp;</td>
				
				<td>
				
				<select id="cmbCH6" name="cmbCH6">
				<option><%=rsFrm.Fields("CH6_Desc")%></option>
				</select>
				
				</td>
				
				<input type="hidden" id="selLanguage6" name="selLanguage6" value="<%=rsFrm.Fields("Language6")%>">
				<td>
				
				   <select id="cmbLanguage6" name="cmbLanguage6">
				    <option><%=rsFrm.Fields("Language6")%></option>
				   </select>
				
			</td>
				
				
				
			
				<td>
				<!--
				<select id="cmbTone6" name="cmbTone6">
				 <option><%=rsFrm.Fields("ch6_tone")%></option>
				</select>
			    -->
				<input size="8" type="text" id="cmbTone6" name="cmbTone6" value="<%=rsFrm.Fields("ch6_tone")%>">
				</td>
				<td>
				<input size=8 type="text" id=txtCH6_Avg name=txtCH6_Avg value=<%=rsFrm.Fields("ch6_avg")%>>
				</td>
					<td>
				<input size=8 type="text" id=txtCH6_LKFS name=txtCH6_LKFS value=<%=rsFrm.Fields("ch6_LKFS")%>>
			</td>
				<td>
				<input size=8 type="text" id=txtCH6_Peak name=txtCH6_Peak value=<%=rsFrm.Fields("ch6_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH6_TruePeak name=txtCH6_TruePeak value=<%=rsFrm.Fields("ch6_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch6") = True Then
						fullSelected_6 = "selected"
					elseif rsFullSpot("SpotQC_ch6") = True Then
						spotSelected_6 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot6" name="cmbFullSpot6">
				     <option value=""></option>
				     <option value="Full"  <%=fullSelected_6%> >Full</option>
					 <option value="Spot" <%=spotSelected_6%> >Spot</option>
				  </select>
				 </td>
			</tr>
				<input type="hidden" id=txtCH6_Tone name=txtCH6_Tone value=<%=rsFrm.Fields("ch6_tone")%>>

<input type="hidden" id=selCH7 name=selCH7 value="<%=rsFrm.Fields("CH7_Desc")%>">
			<tr bgcolor=#F5F5DC>
				<td align=right><span class="clear" onclick="clear_7()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CH 7:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH7" name="cmbCH7">
				<option><%=rsFrm.Fields("CH7_Desc")%></option>
				</select>
				
				</td>
				
				<input type="hidden" id="selLanguage7" name="selLanguage7" value="<%=rsFrm.Fields("Language7")%>">
				<td>
				
				<select id="cmbLanguage7"  name="cmbLanguage7" >
				<option><%=rsFrm.Fields("Language7")%></option>
				</select>
				
			</td>
		
			
				<td>
				<!--
				<select id="cmbTone7" name="cmbTone7">
				 <option><%=rsFrm.Fields("ch7_tone")%></option>
				</select>
				-->
				<input size="8" type="text" id="cmbTone7" name="cmbTone7" value="<%=rsFrm.Fields("ch7_tone")%>">
				</td>
				<td>
				<input size=8 type="text" id=txtCH7_Avg name=txtCH7_Avg value=<%=rsFrm.Fields("ch7_avg")%>>
				</td>
					<td>
				<input size=8 type="text" id=txtCH7_LKFS name=txtCH7_LKFS value=<%=rsFrm.Fields("ch7_LKFS")%>>
			</td>
				<td>
				<input size=8 type="text" id=txtCH7_Peak name=txtCH7_Peak value=<%=rsFrm.Fields("ch7_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH7_TruePeak name=txtCH7_TruePeak value=<%=rsFrm.Fields("ch7_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch7") = True Then
						fullSelected_7 = "selected"
					elseif rsFullSpot("SpotQC_ch7") = True Then
						spotSelected_7 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot7" name="cmbFullSpot7">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_7%> >Full</option>
					 <option value="Spot" <%=spotSelected_7%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id=txtCH7_Tone name=txtCH7_Tone value=<%=rsFrm.Fields("ch7_tone")%>>

				
<input type="hidden" id=selCH8 name=selCH8 value="<%=rsFrm.Fields("CH8_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_8()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CH 8:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH8" name="cmbCH8">
				<option><%=rsFrm.Fields("CH8_Desc")%></option>
				</select>
			
				</td>
				
				<input type="hidden" id="selLanguage8" name="selLanguage8" value="<%=rsFrm.Fields("Language8")%>">
				<td>
				
				  <select id="cmbLanguage8" name="cmbLanguage8">
				    <option><%=rsFrm.Fields("Language8")%></option>
				  </select>
			
			</td>
	
				<td>
				<!--
				<select id="cmbTone8" name="cmbTone8">
				  <option><%=rsFrm.Fields("ch8_tone")%></option>
				</select>
				-->
				<input size="8" type="text" id="cmbTone8" name="cmbTone8" value="<%=rsFrm.Fields("ch8_tone")%>">
				</td>
				<td>
				<input size=8 type="text" id=txtCH8_Avg name=txtCH8_Avg value=<%=rsFrm.Fields("ch8_avg")%>>
				</td>
				
				<td>
				<input size=8 type="text" id=txtCH8_LKFS name=txtCH8_LKFS value=<%=rsFrm.Fields("ch8_LKFS")%>>
			</td>
				<td>
				<input size=8 type="text" id=txtCH8_Peak name=txtCH8_Peak value=<%=rsFrm.Fields("ch8_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH8_TruePeak name=txtCH8_TruePeak value=<%=rsFrm.Fields("ch8_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch8") = True Then
						fullSelected_8 = "selected"
					elseif rsFullSpot("SpotQC_ch8") = True Then
						spotSelected_8 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot8" name="cmbFullSpot8">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_8%> >Full</option>
					 <option value="Spot" <%=spotSelected_8%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id=txtCH8_Tone name=txtCH8_Tone value=<%=rsFrm.Fields("ch8_tone")%>>
				
            
				
	<!-- ********  Added by Isaac Koomson to include 9-16 channells  *******  -->
	
		<!-- Channel 9 Start -->
				
			<input type="hidden" id=selCH9 name=selCH9 value="<%=rsFrm.Fields("CH9_Desc")%>">
			<tr bgcolor=#F5F5DC>
				<td align=right><span class="clear" onclick="clear_9()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CH 9:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH9" name="cmbCH9">
				<option><%=rsFrm.Fields("CH9_Desc")%></option>
				</select>
				
				</td>
				
				<input type="hidden" id="selLanguage9" name="selLanguage9" value="<%=rsFrm.Fields("Language9")%>">
				<td>
				
				<select id="cmbLanguage9"  name="cmbLanguage9" >
				  <option><%=rsFrm.Fields("Language9")%></option>
				</select>
				
			</td>
				
				
		
				<td>
				<!--
				<select id="cmbTone9" name="cmbTone9">
				  <option><%=rsFrm.Fields("ch9_tone")%></option>
				</select>
				-->
				<input size="8" type="text" id="cmbTone9" name="cmbTone9" value="<%=rsFrm.Fields("ch9_tone")%>">
				</td>
				<td>
				<input size=8 type="text" id=txtCH9_Avg name=txtCH9_Avg value=<%=rsFrm.Fields("ch9_avg")%>>
				</td>
						
				<td>
				<input size=8 type="text" id=txtCH9_LKFS name=txtCH9_LKFS value=<%=rsFrm.Fields("ch9_LKFS")%>>
			</td>
				<td>
				<input size=8 type="text" id=txtCH9_Peak name=txtCH9_Peak value=<%=rsFrm.Fields("ch9_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH9_TruePeak name=txtCH9_TruePeak value=<%=rsFrm.Fields("ch9_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch9") = True Then
						fullSelected_9 = "selected"
					elseif rsFullSpot("SpotQC_ch9") = True Then
						spotSelected_9 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot9" name="cmbFullSpot9">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_9%> >Full</option>
					 <option value="Spot" <%=spotSelected_9%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id=txtCH9_Tone name=txtCH9_Tone value=<%=rsFrm.Fields("ch9_tone")%>>
						
	<!-- Channel 9 Ends -->
	
	<!-- Channel 10 Starts -->
	
	<input type="hidden" id=selCH10 name=selCH10 value="<%=rsFrm.Fields("CH10_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_10()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 10:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH10" name="cmbCH10" >
				<option><%=rsFrm.Fields("CH10_Desc")%></option>
				</select>
				
				
				</td>
				
				<input type="hidden" id="selLanguage10" name="selLanguage10" value="<%=rsFrm.Fields("Language10")%>">
				<td>
				
				<select id="cmbLanguage10"  name="cmbLanguage10" >
				  <option><%=rsFrm.Fields("Language10")%></option>
				</select>
				
			</td>
				
				
				
			
				<td>
				<!--
				<select  id="cmbTone10" name="cmbTone10">
				  <option><%=rsFrm.Fields("ch10_tone")%></option>
				</select>
				-->
				<input size="8" type="text" id="cmbTone10" name="cmbTone10" value="<%=rsFrm.Fields("ch10_tone")%>">
				
				</td>
				<td>
				<input size=8 type="text" id=txtCH10_Avg name=txtCH10_Avg value=<%=rsFrm.Fields("ch10_avg")%>>
				</td>
					<td>
				<input size=8 type="text" id=txtCH10_LKFS name=txtCH10_LKFS value=<%=rsFrm.Fields("ch10_LKFS")%>>
			</td>
				<td>
				<input size=8 type="text" id=txtCH10_Peak name=txtCH10_Peak value=<%=rsFrm.Fields("ch10_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH10_TruePeak name=txtCH10_TruePeak value=<%=rsFrm.Fields("ch10_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch10") = True Then
						fullSelected_10 = "selected"
					elseif rsFullSpot("SpotQC_ch10") = True Then
						spotSelected_10 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot10" name="cmbFullSpot10">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_10%> >Full</option>
					 <option value="Spot" <%=spotSelected_10%> >Spot</option>
				  </select>
			 </td>
			</tr>
				<input type="hidden" id=txtCH10_Tone name=txtCH10_Tone value=<%=rsFrm.Fields("ch10_tone")%>>
	
	<!-- Channel 10 Ends  ---> 
				
	<!-- Channel 11 Start -->
				
			<input type="hidden" id=selCH11 name=selCH11 value="<%=rsFrm.Fields("CH11_Desc")%>">
			<tr bgcolor=#F5F5DC>
				<td align=right><span class="clear" onclick="clear_11()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 11:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH11" name="cmbCH11"  >
				<option><%=rsFrm.Fields("CH11_Desc")%></option>
				</select>
				
				</td>
				
				<input type="hidden" id="selLanguage11" name="selLanguage11" value="<%=rsFrm.Fields("Language11")%>">
				<td>
				
				<select id="cmbLanguage11"  name="cmbLanguage11" >
				<option><%=rsFrm.Fields("Language11")%></option>
				</select>
			
			</td>
				
				
				
				
				<td>
				<!--
				 <select id="cmbTone11" name="cmbTone11">
				  <option><%=rsFrm.Fields("ch11_tone")%></option>
				 </select>
			     -->
				 <input size="8" type="text" id="cmbTone11" name="cmbTone11" value="<%=rsFrm.Fields("ch11_tone")%>">
				</td>
				<td>
				<input size=8 type="text" id=txtCH11_Avg name=txtCH11_Avg value=<%=rsFrm.Fields("ch11_avg")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH11_LKFS name=txtCH11_LKFS value=<%=rsFrm.Fields("ch11_LKFS")%>>
			</td>
				<td>
				<input size=8 type="text" id=txtCH11_Peak name=txtCH11_Peak value=<%=rsFrm.Fields("ch11_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH11_TruePeak name=txtCH11_TruePeak value=<%=rsFrm.Fields("ch11_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch11") = True Then
						fullSelected_11 = "selected"
					elseif rsFullSpot("SpotQC_ch11") = True Then
						spotSelected_11 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot11" name="cmbFullSpot11">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_11%> >Full</option>
					 <option value="Spot" <%=spotSelected_11%>>Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id=txtCH11_Tone name=txtCH11_Tone value=<%=rsFrm.Fields("ch11_tone")%>>
						
	<!-- Channel 11 Ends -->
				
	<!-- Channel 12 Starts -->
	
	<input type="hidden" id=selCH12 name=selCH12 value="<%=rsFrm.Fields("CH12_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_12()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 12:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH12" name="cmbCH12" >
				<option><%=rsFrm.Fields("CH12_Desc")%></option>
				</select>
				
				
				</td>
				
				<input type="hidden" id="selLanguage12" name="selLanguage12" value="<%=rsFrm.Fields("Language12")%>">
				<td>
				
				<select id="cmbLanguage12" name="cmbLanguage12">
				 <option><%=rsFrm.Fields("Language12")%></option>
				</select>
				
			</td>
				
				
			
				<td>
				<!--
				<select id="cmbTone12" name="cmbTone12">
				 <option><%=rsFrm.Fields("ch12_tone")%></option>
				</select>
				-->
				<input size="8" type="text" id="cmbTone12" name="cmbTone12" value="<%=rsFrm.Fields("ch12_tone")%>">
				
				</td>
				<td>
				<input size=8 type="text" id=txtCH12_Avg name=txtCH12_Avg value=<%=rsFrm.Fields("ch12_avg")%>>
				</td>
					<td>
				  <input size=8 type="text" id=txtCH12_LKFS name=txtCH12_LKFS value=<%=rsFrm.Fields("ch12_LKFS")%>>
			   </td>
				<td>
				<input size=8 type="text" id=txtCH12_Peak name=txtCH12_Peak value=<%=rsFrm.Fields("ch12_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH12_TruePeak name=txtCH12_TruePeak value=<%=rsFrm.Fields("ch12_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch12") = True Then
						fullSelected_12 = "selected"
					elseif rsFullSpot("SpotQC_ch12") = True Then
						spotSelected_12 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot12" name="cmbFullSpot12">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_12%> >Full</option>
					 <option value="Spot" <%=spotSelected_12%>  >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id=txtCH12_Tone name=txtCH12_Tone value=<%=rsFrm.Fields("ch12_tone")%>>
	
	<!-- Channel 12 Ends  ---> 			
				
	<!-- Channel 13 Start -->
				
			<input type="hidden" id=selCH13 name=selCH13 value="<%=rsFrm.Fields("CH13_Desc")%>">
			<tr bgcolor=#F5F5DC>
				<td align=right><span class="clear" onclick="clear_13()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 13:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH13" name="cmbCH13" >
				<option><%=rsFrm.Fields("CH13_Desc")%></option>
				</select>
				
				</td>
				
				<input type="hidden" id="selLanguage13" name="selLanguage13" value="<%=rsFrm.Fields("Language13")%>">
				<td>
				
				<select id="cmbLanguage13" name="cmbLanguage13">
				 <option><%=rsFrm.Fields("Language13")%></option>
				</select>
				
			
			</td>
				
				
			
				<td>
				<!--
				<select id="cmbTone13" name="cmbTone13">
				  <option><%=rsFrm.Fields("ch13_tone")%></option>
				</select>
				-->
				
				<input size="8" type="text" id="cmbTone13" name="cmbTone13" value="<%=rsFrm.Fields("ch13_tone")%>">
				
				</td>
				<td>
				<input size=8 type="text" id=txtCH13_Avg name=txtCH13_Avg value=<%=rsFrm.Fields("ch13_avg")%>>
				</td>
			   <td>
				   <input size=8 type="text" id=txtCH13_LKFS name=txtCH13_LKFS value=<%=rsFrm.Fields("ch13_LKFS")%>>
			   </td>
				<td>
				<input size=8 type="text" id=txtCH13_Peak name=txtCH13_Peak value=<%=rsFrm.Fields("ch13_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH13_TruePeak name=txtCH13_TruePeak value=<%=rsFrm.Fields("ch13_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch13") = True Then
						fullSelected_13 = "selected"
					elseif rsFullSpot("SpotQC_ch13") = True Then
						spotSelected_13 = "selected"
					end if
				%>
				
				
				<select id="cmbFullSpot13" name="cmbFullSpot13">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_13%> >Full</option>
					 <option value="Spot" <%=spotSelected_13%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id=txtCH13_Tone name=txtCH13_Tone value=<%=rsFrm.Fields("ch13_tone")%>>
						
	<!-- Channel 13 Ends -->
							
				
	<!-- Channel 14 Starts -->
	
	<input type="hidden" id=selCH14 name=selCH14 value="<%=rsFrm.Fields("CH14_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_14()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 14:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH14" name="cmbCH14">
				<option><%=rsFrm.Fields("CH14_Desc")%></option>
				</select>
				
				</td>
				
				<input type="hidden" id="selLanguage14" name="selLanguage14" value="<%=rsFrm.Fields("Language14")%>">
				<td>
				
				<select id="cmbLanguage14"  name="cmbLanguage14" >
				 <option><%=rsFrm.Fields("Language14")%></option>
				</select>
				
				 
			</td>
				
				
			
				<td>
				<!--
				<select id="cmbTone14" name="cmbTone14">
				  <option><%=rsFrm.Fields("ch14_tone")%></option>
				</select>
				-->
				<input size="8" type="text" id="cmbTone14" name="cmbTone14" value="<%=rsFrm.Fields("ch14_tone")%>">
				
				</td>
				<td>
				<input size=8 type="text" id=txtCH14_Avg name=txtCH14_Avg value=<%=rsFrm.Fields("ch14_avg")%>>
				</td>
					
				<td>
				<input size=8 type="text" id=txtCH14_LKFS name=txtCH14_LKFS value=<%=rsFrm.Fields("ch14_LKFS")%>>
			</td>
				<td>
				<input size=8 type="text" id=txtCH14_Peak name=txtCH14_Peak value=<%=rsFrm.Fields("ch14_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH14_TruePeak name=txtCH14_TruePeak value=<%=rsFrm.Fields("ch14_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch14") = True Then
						fullSelected_14 = "selected"
					elseif rsFullSpot("SpotQC_ch14") = True Then
						spotSelected_14 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot14" name="cmbFullSpot14">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_14%> >Full</option>
					 <option value="Spot" <%=spotSelected_14%> >Spot</option>
				  </select>
		       </td>
			</tr>
				<input type="hidden" id=txtCH14_Tone name=txtCH14_Tone value=<%=rsFrm.Fields("ch14_tone")%>>
	
	<!-- Channel 14 Ends  ---> 			
							
	<!-- Channel 15 Start -->
				
			<input type="hidden" id=selCH15 name=selCH15 value="<%=rsFrm.Fields("CH15_Desc")%>">
			<tr bgcolor=#F5F5DC>
				<td align=right><span class="clear" onclick="clear_15()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 15:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH15" name="cmbCH15" >
				<option><%=rsFrm.Fields("CH15_Desc")%></option>
				</select>
				
				
				</td>
				
				<input type="hidden" id="selLanguage15" name="selLanguage15" value="<%=rsFrm.Fields("Language15")%>">
				<td>
				
				<select id="cmbLanguage15"  name="cmbLanguage15" >
				<option><%=rsFrm.Fields("Language15")%></option>
				</select>
				
				
			</td>
				
			
				<td>
				<!--
				<select id="cmbTone15" name="cmbTone15">
				  <option><%=rsFrm.Fields("ch15_tone")%></option>
				</select>
				-->
				<input size="8" type="text" id="cmbTone15" name="cmbTone15" value="<%=rsFrm.Fields("ch15_tone")%>">
				
				</td>
				<td>
				<input size=8 type="text" id=txtCH15_Avg name=txtCH15_Avg value=<%=rsFrm.Fields("ch15_avg")%>>
				</td>
					
				
				<td>
				<input size=8 type="text" id=txtCH15_LKFS name=txtCH15_LKFS value=<%=rsFrm.Fields("ch15_LKFS")%>>
			</td>
				<td>
				<input size=8 type="text" id=txtCH15_Peak name=txtCH15_Peak value=<%=rsFrm.Fields("ch15_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH15_TruePeak name=txtCH15_TruePeak value=<%=rsFrm.Fields("ch15_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch15") = True Then
						fullSelected_15 = "selected"
					elseif rsFullSpot("SpotQC_ch15") = True Then
						spotSelected_15 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot15" name="cmbFullSpot15">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_15%> >Full</option>
					 <option value="Spot" <%=spotSelected_15%> >Spot</option>
				  </select>
               </td>
			</tr>
				<input type="hidden" id=txtCH15_Tone name=txtCH15_Tone value=<%=rsFrm.Fields("ch15_tone")%>>
						
	<!-- Channel 15 Ends -->			
				
					
	<!-- Channel 16 Starts -->
	
	<input type="hidden" id=selCH16 name=selCH16 value="<%=rsFrm.Fields("CH16_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_16()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 16:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH16" name="cmbCH16">
				<option><%=rsFrm.Fields("CH16_Desc")%></option>
				</select>
				
				</td>
				
				<input type="hidden" id="selLanguage16" name="selLanguage16" value="<%=rsFrm.Fields("Language16")%>">
				<td>
				
				<select id="cmbLanguage16" name="cmbLanguage16">
				 <option><%=rsFrm.Fields("Language16")%></option>
				</select>
				
			
			</td>
				
			
				<td>
				<!--
				<select id="cmbTone16" name="cmbTone16">
				 <option><%=rsFrm.Fields("ch16_tone")%></option>
				</select>
				-->
				<input size="8" type="text" id="cmbTone16" name="cmbTone16" value="<%=rsFrm.Fields("ch16_tone")%>">
				
				</td>
				<td>
				<input size=8 type="text" id=txtCH16_Avg name=txtCH16_Avg value=<%=rsFrm.Fields("ch16_avg")%>>
				</td>
					
				<td>
				<input size=8 type="text" id=txtCH16_LKFS name=txtCH16_LKFS value=<%=rsFrm.Fields("ch16_LKFS")%>>
			</td>
				<td>
				<input size=8 type="text" id=txtCH16_Peak name=txtCH16_Peak value=<%=rsFrm.Fields("ch16_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id=txtCH16_TruePeak name=txtCH16_TruePeak value=<%=rsFrm.Fields("ch16_Truepeak")%>>
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch16") = True Then
						fullSelected_16 = "selected"
					elseif rsFullSpot("SpotQC_ch16") = True Then
						spotSelected_16 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot16" name="cmbFullSpot16">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_16%> >Full</option>
					 <option value="Spot" <%=spotSelected_16%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id=txtCH16_Tone name=txtCH16_Tone value=<%=rsFrm.Fields("ch16_tone")%>>
	
	<!-- Channel 16 Ends  ---> 			
	
	
						
	<!-- Channel 17 Starts -->
	
	<input type="hidden" id="selCH17" name="selCH17" value="<%=rsFrm.Fields("CH17_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_17()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 17:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH17" name="cmbCH17">
				<option><%=rsFrm.Fields("CH17_Desc")%></option>
				</select>
		
				</td>
				
				<input type="hidden" id="selLanguage17" name="selLanguage17" value="<%=rsFrm.Fields("Language17")%>">
				<td>
				
				<select id="cmbLanguage17"  name="cmbLanguage17" >
				 <option><%=rsFrm.Fields("Language17")%></option>
				</select>
				
			
				
			</td>
				
				
			
				<td>
				<!--
				<select id="cmbTone17" name="cmbTone17">
				  <option><%=rsFrm.Fields("ch17_tone")%></option>
				</select>
				-->
				 <input size="8" type="text" id="cmbTone17" name="cmbTone17" value="<%=rsFrm.Fields("ch17_tone")%>">
				
				</td>
				<td>
				<input size=8 type="text" id="txtCH17_Avg" name="txtCH17_Avg" value="<%=rsFrm.Fields("ch17_avg")%>" >
				</td>
					<td>
				<input size="8" type="text" id="txtCH17_LKFS" name="txtCH17_LKFS" value="<%=rsFrm.Fields("ch17_LKFS")%>" >
			</td>
				<td>
				<input size=8 type="text" id="txtCH17_Peak" name="txtCH17_Peak" value="<%=rsFrm.Fields("ch17_peak")%>" >
				</td>
				<td>
				<input size=8 type="text" id="txtCH17_TruePeak" name="txtCH17_TruePeak" value="<%=rsFrm.Fields("ch17_Truepeak")%>" >
				</td>
				<td>
					<%
					if rsFullSpot("FullQC_ch17") = True Then
						fullSelected_17 = "selected"
					elseif rsFullSpot("SpotQC_ch17") = True Then
						spotSelected_17 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot17" name="cmbFullSpot17">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_17%> >Full</option>
					 <option value="Spot" <%=spotSelected_17%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id="txtCH17_Tone" name="txtCH17_Tone" value="<%=rsFrm.Fields("ch17_tone")%>" >
	
	<!-- Channel 17 Ends  ---> 			
	
	
	<!-- Channel 18 Starts -->
	
	<input type="hidden" id="selCH18" name="selCH18" value="<%=rsFrm.Fields("CH18_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_18()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 18:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH18" name="cmbCH18">
				<option><%=rsFrm.Fields("CH18_Desc")%></option>
				</select>
				
				
				</td>
				
				<input type="hidden" id="selLanguage18" name="selLanguage18" value="<%=rsFrm.Fields("Language18")%>">
				<td>
				
				<select id="cmbLanguage18" name="cmbLanguage18">
				 <option><%=rsFrm.Fields("Language18")%></option>
				</select>
				
				
			</td>
				
			
				<td>
				<!--
				<select id="cmbTone18" name="cmbTone18">
				  <option><%=rsFrm.Fields("ch18_tone")%></option>
				</select>
				-->
				<input size="8" type="text" id="cmbTone18" name="cmbTone18" value="<%=rsFrm.Fields("ch18_tone")%>">
				
				</td>
				<td>
				<input size=8 type="text" id="txtCH18_Avg" name="txtCH18_Avg" value="<%=rsFrm.Fields("ch18_avg")%>" >
				</td>
					
				<td>
				<input size="8" type="text" id="txtCH18_LKFS" name="txtCH18_LKFS" value="<%=rsFrm.Fields("ch18_LKFS")%>" >
			</td>
				<td>
				<input size=8 type="text" id="txtCH18_Peak" name="txtCH18_Peak" value="<%=rsFrm.Fields("ch18_peak")%>" >
				</td>
				<td>
				<input size=8 type="text" id="txtCH18_TruePeak" name="txtCH18_TruePeak" value="<%=rsFrm.Fields("ch18_Truepeak")%>" >
				</td>
				<td>
					<%
					if rsFullSpot("FullQC_ch18") = True Then
						fullSelected_18 = "selected"
					elseif rsFullSpot("SpotQC_ch18") = True Then
						spotSelected_18 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot18" name="cmbFullSpot18">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_18%> >Full</option>
					 <option value="Spot" <%=spotSelected_18%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id="txtCH18_Tone" name="txtCH18_Tone" value="<%=rsFrm.Fields("ch18_tone")%>" >
	
	<!-- Channel 18 Ends  ---> 	

    <!-- Channel 19 Starts -->
	
	<input type="hidden" id="selCH19" name="selCH19" value="<%=rsFrm.Fields("CH19_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_19()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 19:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH19" name="cmbCH19">
				<option><%=rsFrm.Fields("CH19_Desc")%></option>
				</select>
			
				</td>
				
				<input type="hidden" id="selLanguage19" name="selLanguage19" value="<%=rsFrm.Fields("Language19")%>">
				<td>
				
				<select id="cmbLanguage19" name="cmbLanguage19">
				 <option><%=rsFrm.Fields("Language19")%></option>
				</select>
				
				
			</td>
				
			
				<td>
				<!--
				<select id="cmbTone19" name="cmbTone19">
				  <option><%=rsFrm.Fields("ch19_tone")%></option>
				</select>
			   -->
			   <input size="8" type="text" id="cmbTone19" name="cmbTone19" value="<%=rsFrm.Fields("ch19_tone")%>">
				</td>
				<td>
				<input size=8 type="text" id="txtCH19_Avg" name="txtCH19_Avg" value="<%=rsFrm.Fields("ch19_avg")%>" >
				</td>
					
				<td>
				<input size="8" type="text" id="txtCH19_LKFS" name="txtCH19_LKFS" value="<%=rsFrm.Fields("ch19_LKFS")%>" >
			</td>
				<td>
				<input size=8 type="text" id="txtCH19_Peak" name="txtCH19_Peak" value="<%=rsFrm.Fields("ch19_peak")%>" >
				</td>
				<td>
				<input size=8 type="text" id="txtCH19_TruePeak" name="txtCH19_TruePeak" value="<%=rsFrm.Fields("ch19_Truepeak")%>" >
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch19") = True Then
						fullSelected_19 = "selected"
					elseif rsFullSpot("SpotQC_ch19") = True Then
						spotSelected_19 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot19" name="cmbFullSpot19">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_19%> >Full</option>
					 <option value="Spot" <%=spotSelected_19%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id="txtCH19_Tone" name="txtCH19_Tone" value="<%=rsFrm.Fields("ch19_tone")%>" >
	
	<!-- Channel 19 Ends  ---> 			
	
	
	 <!-- Channel 20 Starts -->
	
	<input type="hidden" id="selCH20" name="selCH20" value="<%=rsFrm.Fields("CH20_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_20()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 20:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH20" name="cmbCH20">
				<option><%=rsFrm.Fields("CH20_Desc")%></option>
				</select>
				
				</td>
				
				<input type="hidden" id="selLanguage20" name="selLanguage20" value="<%=rsFrm.Fields("Language20")%>">
				<td>
				
				<select id="cmbLanguage20" name="cmbLanguage20">
				 <option><%=rsFrm.Fields("Language20")%></option>				
				</select>
				
				
			</td>
			
				<td>
				<!--
				<select id="cmbTone20" name="cmbTone20">
				  <option><%=rsFrm.Fields("ch20_tone")%></option>
				</select>
				  -->
				  <input size="8" type="text" id="cmbTone20" name="cmbTone20" value="<%=rsFrm.Fields("ch20_tone")%>">
				</td>
				<td>
				<input size=8 type="text" id="txtCH20_Avg" name="txtCH20_Avg" value="<%=rsFrm.Fields("ch20_avg")%>" >
				</td>
					
				
				<td>
				<input size="8" type="text" id="txtCH20_LKFS" name="txtCH20_LKFS" value="<%=rsFrm.Fields("ch20_LKFS")%>" >
			</td>
				<td>
				<input size=8 type="text" id="txtCH20_Peak" name="txtCH20_Peak" value="<%=rsFrm.Fields("ch20_peak")%>" >
				</td>
				<td>
				<input size=8 type="text" id="txtCH20_TruePeak" name="txtCH20_TruePeak" value="<%=rsFrm.Fields("ch20_Truepeak")%>" >
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch20") = True Then
						fullSelected_20 = "selected"
					elseif rsFullSpot("SpotQC_ch20") = True Then
						spotSelected_20 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot20" name="cmbFullSpot20">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_20%> >Full</option>
					 <option value="Spot" <%=spotSelected_20%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id="txtCH20_Tone" name="txtCH20_Tone" value="<%=rsFrm.Fields("ch20_tone")%>" >
	
	<!-- Channel 20 Ends  ---> 			
	
	
	
	 <!-- Channel 21 Starts -->
	
	<input type="hidden" id="selCH21" name="selCH21" value="<%=rsFrm.Fields("CH21_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_21()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 21:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH21" name="cmbCH21">
				<option><%=rsFrm.Fields("CH21_Desc")%></option>
				</select>
				
				</td>
				
				<input type="hidden" id="selLanguage21" name="selLanguage21" value="<%=rsFrm.Fields("Language21")%>">
				<td>
				
				<select id="cmbLanguage21"  name="cmbLanguage21" >
				<option><%=rsFrm.Fields("Language21")%></option>	
				</select>
				
			</td>
			
				<td>
				<!--
				<select id="cmbTone21" name="cmbTone21">
				   <option><%=rsFrm.Fields("ch21_tone")%></option>
				</select>
				-->
				 <input size="8" type="text" id="cmbTone21" name="cmbTone21" value="<%=rsFrm.Fields("ch21_tone")%>">
				
				</td>
				<td>
				<input size=8 type="text" id="txtCH21_Avg" name="txtCH21_Avg" value="<%=rsFrm.Fields("ch21_avg")%>" >
				</td>
					
				<td>
				<input size="8" type="text" id="txtCH21_LKFS" name="txtCH21_LKFS" value="<%=rsFrm.Fields("ch21_LKFS")%>" >
			</td>
				<td>
				<input size=8 type="text" id="txtCH21_Peak" name="txtCH21_Peak" value="<%=rsFrm.Fields("ch21_peak")%>" >
				</td>
				<td>
				<input size=8 type="text" id="txtCH21_TruePeak" name="txtCH21_TruePeak" value="<%=rsFrm.Fields("ch21_Truepeak")%>" >
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch21") = True Then
						fullSelected_21 = "selected"
					elseif rsFullSpot("SpotQC_ch21") = True Then
						spotSelected_21 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot21" name="cmbFullSpot21">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_21%> >Full</option>
					 <option value="Spot" <%=spotSelected_21%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id="txtCH21_Tone" name="txtCH21_Tone" value="<%=rsFrm.Fields("ch21_tone")%>" >
	
	<!-- Channel 21 Ends  ---> 			
	
	
	
	 <!-- Channel 22 Starts -->
	
	<input type="hidden" id="selCH22" name="selCH22" value="<%=rsFrm.Fields("CH22_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_22()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 22:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH22" name="cmbCH22">
				<option><%=rsFrm.Fields("CH22_Desc")%></option>
				</select>
				
			
				</td>
				
				<input type="hidden" id="selLanguage22" name="selLanguage22" value="<%=rsFrm.Fields("Language22")%>">
				<td>
				
				<select id="cmbLanguage22" name="cmbLanguage22">
				  <option><%=rsFrm.Fields("Language22")%></option>	
				</select>
				
			</td>
			
				<td>
				<!--
				<select id="cmbTone22" name="cmbTone22">
				   <option><%=rsFrm.Fields("ch22_tone")%></option>
				</select>
				-->
				 <input size="8" type="text" id="cmbTone22" name="cmbTone22" value="<%=rsFrm.Fields("ch20_tone")%>">
				
				</td>
				<td>
				<input size=8 type="text" id="txtCH22_Avg" name="txtCH22_Avg" value="<%=rsFrm.Fields("ch22_avg")%>" >
				</td>
					
				
				<td>
				<input size="8" type="text" id="txtCH22_LKFS" name="txtCH22_LKFS" value="<%=rsFrm.Fields("ch22_LKFS")%>" >
			</td>
				<td>
				<input size=8 type="text" id="txtCH22_Peak" name="txtCH22_Peak" value="<%=rsFrm.Fields("ch22_peak")%>" >
				</td>
				<td>
				<input size=8 type="text" id="txtCH22_TruePeak" name="txtCH22_TruePeak" value="<%=rsFrm.Fields("ch22_Truepeak")%>" >
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch22") = True Then
						fullSelected_22 = "selected"
					elseif rsFullSpot("SpotQC_ch22") = True Then
						spotSelected_22 = "selected"
					end if
				%>
				
				
				<select id="cmbFullSpot22" name="cmbFullSpot22">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_22%> >Full</option>
					 <option value="Spot" <%=spotSelected_22%>  >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id="txtCH22_Tone" name="txtCH22_Tone" value="<%=rsFrm.Fields("ch22_tone")%>" >
	
	<!-- Channel 22 Ends  ---> 			
	
	
	
	
	 <!-- Channel 23 Starts -->
	
	<input type="hidden" id="selCH23" name="selCH23" value="<%=rsFrm.Fields("CH23_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_23()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 23:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH23" name="cmbCH23">
				<option><%=rsFrm.Fields("CH23_Desc")%></option>
				</select>
				
				
				</td>
				
				<input type="hidden" id="selLanguage23" name="selLanguage23" value="<%=rsFrm.Fields("Language23")%>">
				<td>
				
				<select id="cmbLanguage23"  name="cmbLanguage23" >
				 <option><%=rsFrm.Fields("Language23")%></option>	
				</select>
				
				
			</td>
			
				<td>
				<!--
				<select id="cmbTone23" name="cmbTone23">
				   <option><%=rsFrm.Fields("ch23_tone")%></option>
				</select>
				-->
				 <input size="8" type="text" id="cmbTone23" name="cmbTone23" value="<%=rsFrm.Fields("ch23_tone")%>">
				
				</td>
				<td>
				<input size=8 type="text" id="txtCH23_Avg" name="txtCH23_Avg" value="<%=rsFrm.Fields("ch23_avg")%>" >
				</td>
					
				
				<td>
				<input size="8" type="text" id="txtCH23_LKFS" name="txtCH23_LKFS" value="<%=rsFrm.Fields("ch23_LKFS")%>" >
			</td>
				<td>
				<input size=8 type="text" id="txtCH23_Peak" name="txtCH23_Peak" value="<%=rsFrm.Fields("ch23_peak")%>" >
				</td>
				<td>
				<input size=8 type="text" id="txtCH23_TruePeak" name="txtCH23_TruePeak" value="<%=rsFrm.Fields("ch23_Truepeak")%>" >
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch23") = True Then
						fullSelected_23 = "selected"
					elseif rsFullSpot("SpotQC_ch23") = True Then
						spotSelected_23 = "selected"
					end if
				%>
				
				<select id="cmbFullSpot23" name="cmbFullSpot23">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_23%>  >Full</option>
					 <option value="Spot"  <%=spotSelected_23%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id="txtCH23_Tone" name="txtCH23_Tone" value="<%=rsFrm.Fields("ch23_tone")%>" >
	
	<!-- Channel 23 Ends  ---> 			
	
	
	
	 <!-- Channel 24 Starts -->
	
	<input type="hidden" id="selCH24" name="selCH24" value="<%=rsFrm.Fields("CH24_Desc")%>">
			<tr bgcolor=#cccc99>
				<td align=right><span class="clear" onclick="clear_24()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;CH 24:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCH24" name="cmbCH24">
				<option><%=rsFrm.Fields("CH24_Desc")%></option>
				</select>
				
				
				</td>
				
				<input type="hidden" id="selLanguage24" name="selLanguage24" value="<%=rsFrm.Fields("Language24")%>">
				<td>
				
				<select id="cmbLanguage24" name="cmbLanguage24">
				 <option><%=rsFrm.Fields("Language24")%></option>	
				</select>

			</td>
				
				<td>
				<!--
				<select id="cmbTone24" name="cmbTone24">
				   <option><%=rsFrm.Fields("ch24_tone")%></option>
				</select>
				-->
				 <input size="8" type="text" id="cmbTone24" name="cmbTone24" value="<%=rsFrm.Fields("ch24_tone")%>">
				</td>
				<td>
				<input size=8 type="text" id="txtCH24_Avg" name="txtCH24_Avg" value="<%=rsFrm.Fields("ch24_avg")%>" >
				</td>
			
				<td>
				<input size="8" type="text" id="txtCH24_LKFS" name="txtCH24_LKFS" value="<%=rsFrm.Fields("ch24_LKFS")%>" >
			</td>
				<td>
				<input size=8 type="text" id="txtCH24_Peak" name="txtCH24_Peak" value="<%=rsFrm.Fields("ch24_peak")%>" >
				</td>
				<td>
				<input size=8 type="text" id="txtCH24_TruePeak" name="txtCH24_TruePeak" value="<%=rsFrm.Fields("ch24_Truepeak")%>" >
				</td>
				<td>
				<%
					if rsFullSpot("FullQC_ch24") = True Then
						fullSelected_24 = "selected"
					elseif rsFullSpot("SpotQC_ch24") = True Then
						spotSelected_24 = "selected"
					end if
				%>
				
				
				<select id="cmbFullSpot24" name="cmbFullSpot24">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_24%> >Full</option>
					 <option value="Spot" <%=spotSelected_24%> >Spot</option>
				  </select>
				</td>
			</tr>
				<input type="hidden" id="txtCH24_Tone" name="txtCH24_Tone" value="<%=rsFrm.Fields("ch24_tone")%>" >
	
	<!-- Channel 24 Ends  ---> 			
	

				
			 <!-- **************  End of 9-24 channells  *****************  -->	
				
				
				<% 
				    Response.Write("<script language='javascript'>")
				   
				  
				   
				    ''Populate Languages
					sqlCombo = "SELECT Language FROM optLanguage ORDER BY Language"
					rsCombo.Open sqlCombo
					rsCombo.MoveFirst
		        	do while not rsCombo.EOF 
								
					   for i = 1 to 24
						  ''Response.Write("frmAudioTC.item('cmbLanguage" & i & "').AddItem('" & rsCombo.Fields("Language") & "');")
						  
						    Response.Write("var x = document.getElementById('cmbLanguage" & i & "');")
							Response.Write("var option = document.createElement('option');")
							Response.Write("option.text = '" & rsCombo.Fields("Language") & "';")
														
							Response.Write("x.add(option);")
						  
						  
						next
				    	rsCombo.MoveNext
					loop
					rsCombo.Close 
					
					Response.Write("</script>")
							
                    Response.Write("<script language='javascript'>")							
				    '' Populate Channel Desc
					sqlCombo = "SELECT AudioDesc FROM optAudio ORDER BY AudioDesc"
					rsCombo.Open sqlCombo
					rsCombo.MoveFirst
					do while not rsCombo.EOF 
							
						for i = 1 to 24
						   ''Response.Write("frmAudioTC.item('cmbCH" & i & "').AddItem('" & rsCombo.Fields("AudioDesc") & "');")
						
							Response.Write("var x = document.getElementById('cmbCH" & i & "');")
							Response.Write("var option = document.createElement('option');")
							Response.Write("option.text = '" & rsCombo.Fields("AudioDesc") & "';")
							Response.Write("x.add(option);")
						
						next
						rsCombo.MoveNext
					loop
					
					Response.Write("</script>")
				%>
				
				
<script language="javascript">

	//for (i=1; i<25; i++)
	//{
	    
		/*
	    var x = document.getElementById("cmbTone" + i);
		var option = document.createElement('option');
		option.text = "-18dbFS";
		x.add(option);
		 
		option = document.createElement('option');
		option.text = "-20dbFS"
	    x.add(option);
	    */
	
		/*********Updated by Isaac Koomson 29/12/2011 to increase the counter from 9 to 17******************************************/
		/*********Updated by Isaac Koomson 03/09/2012 to increase the counter from 17 to 25******************************************/
		/*********Updated by Isaac Koomson 10/01/2013 to add Languages******************************************/
		//frmAudioTC.item("cmbCH" + i).Text = frmAudioTC.item("selCH" + i).value;
		//frmAudioTC.item("cmbLanguage" + i).Text = frmAudioTC.item("selLanguage" + i).value;
		//frmAudioTC.item("cmbTone" + i ).Text =  frmAudioTC.item("txtCH" + i + "_Tone").value;
			
		/*
		frmAudioTC.item("cmbTone" + i ).AddItem("-18dbFS")
		frmAudioTC.item("cmbTone" + i ).AddItem("-20dbFS")
		*/
		
	//}
	
	
	
	
	function clearCue(){
		
	  	document.getElementById("cmbCue").value = '';
		document.getElementById("cmbCueTone").value = '';
        document.getElementById("txtCue_Avg").value = '';
		document.getElementById("txtCue_LKFS").value = '';
		document.getElementById("txtCue_Peak").value = '';
		document.getElementById("txtCue_TruePeak").value = '';
		document.getElementById("cmbFullSpotCue").value = '';
		
	}

	
	
</script>
<input type="hidden" id=selCue name="selCue" value="<%=rsFrm.Fields("cue_Desc")%>">
			<tr bgcolor=#F5F5DC>
				<td align=right><span class="clear" onclick="clearCue()" >Clear</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cue:&nbsp;&nbsp;</td>
				<td>
				
				<select id="cmbCue" name="cmbCue">
				<option><%=rsFrm.Fields("cue_Desc")%></option>	
				</select>
			
		</td>
		<td>&nbsp;</td>

            
			
			
				<td>
				
				<!--
				<select id="cmbCueTone"  name="cmbCueTone" >
				    <option><%=rsFrm.Fields("cue_tone")%></option>
				    <option>-18dbFS</option>
					<option>-20dbFS</option>
				</select>
				 -->
				  <input size="8" type="text" id="cmbCueTone" name="cmbCueTone" value="<%=rsFrm.Fields("cue_tone")%>">
				</td>
				<td>
				<input size=8 type="text" id="txtCue_Avg" name="txtCue_Avg" value=<%=rsFrm.Fields("cue_avg")%>>
				</td>
				 <td>
				    <input size=8 type="text" id="txtCue_LKFS" name="txtCue_LKFS" value=<%=rsFrm.Fields("cue_LKFS")%>>
			    </td>
				<td>
				<input size=8 type="text" id="txtCue_Peak" name="txtCue_Peak" value=<%=rsFrm.Fields("cue_peak")%>>
				</td>
				<td>
				<input size=8 type="text" id="txtCue_TruePeak" name="txtCue_TruePeak" value=<%=rsFrm.Fields("cue_Truepeak")%>>
				</td>
				<td>
				
				<%
					if rsFullSpot("FullQC_Cue") = True Then
						fullSelected_Cue = "selected"
					elseif rsFullSpot("SpotQC_Cue") = True Then
						spotSelected_Cue = "selected"
					end if
				%>
				
								
				<select id="cmbFullSpotCue" name="cmbFullSpotCue">
				     <option value=""></option>
				     <option value="Full" <%=fullSelected_Cue%> >Full</option>
					 <option value="Spot" <%=spotSelected_Cue%> >Spot</option>
				  </select>
				  
				  
				</td>
			</tr>
				<input type="hidden" id="txtCue_Tone" name="txtCue_Tone" value=<%=rsFrm.Fields("cue_tone")%>>

				<% rsCombo.MoveFirst
				Response.Write("<script language='javascript'>")
				do while not rsCombo.EOF 
					''Response.Write("frmAudioTC.cmbCue.AddItem('" & rsCombo.Fields("AudioDesc") & "');")
					
					Response.Write("var x = document.getElementById('cmbCue');")
					Response.Write("var option = document.createElement('option');")
					Response.Write("option.text = '" & rsCombo.Fields("AudioDesc") & "';")
					Response.Write("x.add(option);")
					
					rsCombo.MoveNext
				loop
					Response.Write("frmAudioTC.cmbCue.Text = frmAudioTC.selCue.value;")
					Response.Write("</script>")
					rsCombo.Close
					%>
					
<script language="javascript">



	frmAudioTC.cmbCueTone.Text = frmAudioTC.txtCue_Tone.value;
	
	/*
	   frmAudioTC.cmbCueTone.AddItem("-18dbFS")
	   frmAudioTC.cmbCueTone.AddItem("-20dbFS")
	*/
</script>
		</table>
		<BR>
		<table id="tblForm" border=0 width=100% cellpadding=0 cellspacing=0>
			<tr>
				<td align="right">Noise Reduction:&nbsp;</td>
				<td>
					<select id=selNR name=selNR>
						<option><%=rsFrm.Fields("NR")%></option>
						<option>None</option>
						<option>DolbA</option>
						<option>DolbB</option>
						<option>DolSR</option>
					</select>
				</td>
				<td align="right">Time Code:&nbsp;</td>
				<td>
					<select id=selTC name=selTC>
						<option><%=rsFrm.Fields("Time_Code")%></option>
					<%	sqlCombo = "SELECT AudioTC FROM optAudioTC ORDER BY AudioTC"
						rsCombo.Open sqlCombo
							do while not rsCombo.EOF %>
								<option><%=rsCombo.Fields("AudioTC")%></option>
						<% 
							rsCombo.MoveNext
							loop
							rsCombo.Close 
						%>
					</select>
				</td>
				<td align="right">Audio QC'd in Unity:&nbsp;</td>
				<td>
					<select id=selQCinUnity name=selQCinUnity>
						<option><%=rsFrm.Fields("QCinUnity")%></option>
						<option>YES</option>
						<option>NO</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">CH1 and 2 Phase:&nbsp;</td>
				<td>
					<select id=selCH12Phase name=selCH12Phase>
						<option><%=rsFrm.Fields("CH12_Phase")%></option>
						<option>NA</option>
						<option>OK</option>
						<option>Marginal</option>
						<option>NG</option>
					</select>
				</td>
				<td align="right">T.C. Integrity:&nbsp;</td>
				<td>
					<select id=selTCInteg name=selTCInteg>
						<option><%=rsFrm.Fields("TCInteg")%></option>
					<%	sqlCombo = "SELECT TCInteg FROM optTCInteg ORDER BY TCInteg"
						rsCombo.Open sqlCombo
							do while not rsCombo.EOF %>
								<option><%=rsCombo.Fields("TCInteg")%></option>
						<% 
							rsCombo.MoveNext
							loop
							rsCombo.Close 
						%>
					 </select>
				</td>
				<td align="right">Surround Sound:&nbsp;</td>
				<td>
					<select id=selSurroundSound name=selSurroundSound>
						<option><%=rsFrm.Fields("SurroundSound")%></option>
						<option>YES</option>
						<option>NO</option>
					</select>
				</td>				
			</tr>
			<tr>
				<td align="right">CH3 and 4 Phase:&nbsp;</td>
				<td>
					<select id=selCH34Phase name=selCH34Phase>
						<option><%=rsFrm.Fields("CH34_Phase")%></option>
						<option>NA</option>
						<option>OK</option>
						<option>Marginal</option>
						<option>NG</option>
					</select>
				</td>
				<td align="right">Comp/M_E Sync:&nbsp;</td>
				<td>
					<select id=selCompSync name=selCompSync>
						<option><%=rsFrm.Fields("Comp_Sync")%></option>
						<option>NA</option>
						<option>OK</option>
						<option>Marginal</option>
						<option>NG</option>
					 </select>
				</td>
				<td align="right">LTC & VITC Match:&nbsp;</td>
				<td>
					<select id=selLTC_VITC_Match name=selLTC_VITC_Match>
						<option><%=rsFrm.Fields("LTC_VITC_Match")%></option>
						<option>YES</option>
						<option>NO</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">Audio Phase/Tone:&nbsp;</td>
				<td><input size=5 type=textbox id=txtTone_Phase name=txtTone_Phase value=<%=rsFrm.Fields("Tone_Phase")%>></td>
				<td colspan=2></td>

			</tr>
			<tr>
				<td colspan=5>&nbsp;</td>
				<td>
				 <% 
				 '' Response.write "sLevel:" & sLevel & "<br>"
				  '' Response.write "sUserName:" & sUserName & "<br>"
				 if sLevel >= 1 then 
				 
				 %> 
					<input type="submit" id="subSaveATC" name="subSaveATC" value="Save" onclick="javascript:submitCombo();">
				 <% end if %>
				</td>
			<tr>
		</form>
		</table>

<%
rsFrm.Close
Set rsFrm = Nothing
Set rsCombo = Nothing
cnQCS.Close
set cnQCS = Nothing%>
</BODY>
</HTML>
