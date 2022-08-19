<%@ Language=VBScript %>
<HTML>
<HEAD>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->
<meta NAME="robots" CONTENT="noindex">
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
</HEAD>

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
dim rsFrm
dim sql
dim rsCombo
dim sqlCombo

sJobNum = Request.QueryString("sJobNum")
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sFrm = Request.QueryString("frm")

Response.Write "<td><font size=2><b>" & sQCNum & " - " & sRev & ":  " & sFrm & "</b></font></td>"

Set rsFrm = server.CreateObject("ADODB.Recordset")
Set rsCombo = server.CreateObject("ADODB.Recordset")

'*******************************************************************************************************
'SELECT for BHVE Specs Screen
'*******************************************************************************************************
		sql="SELECT * " & _
			"FROM qcBVHE " & _
			"WHERE Qcnum= " & clng(sQCNum) & " AND subQcnum = " & cint(sRev)
'*******************************************************************************************************

		rsFrm.ActiveConnection = cnQCS
		rsFrm.Open sql

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

		<TABLE id="tblTapeFormat" width=100%>
		<form method="post" name="frmBHVESpecs" action="procBVHE.asp">
			<TR>
				<TD align="center" valign="top">
					<table id="tblTapeFormat" cellpadding=0 cellspacing=0 border=0>
						<tr bgcolor=#999900>
							<td>&nbsp;&nbsp;1</td>
							<td>&nbsp;&nbsp;2</td>
							<td>&nbsp;&nbsp;3</td>
							<td>&nbsp;&nbsp;4</td>
							<td>Demo Video</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVVidLevel") = "1" then Check_DVVidLevel_1 = "CHECKED"
								if rsFrm.Fields("DVVidLevel") = "2" then Check_DVVidLevel_2 = "CHECKED"
								if rsFrm.Fields("DVVidLevel") = "3" then Check_DVVidLevel_3 = "CHECKED"
								if rsFrm.Fields("DVVidLevel") = "4" then Check_DVVidLevel_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVVidLevel name=radDVVidLevel value="1" <%=Check_DVVidLevel_1%>></td>
							<td><input type=radio id=radDVVidLevel name=radDVVidLevel value="2" <%=Check_DVVidLevel_2%>></td>
							<td><input type=radio id=radDVVidLevel name=radDVVidLevel value="3" <%=Check_DVVidLevel_3%>></td>
							<td><input type=radio id=radDVVidLevel name=radDVVidLevel value="4" <%=Check_DVVidLevel_4%>></td>
							<td>Video Level</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVChromaLevel") = "1" then Check_DVChromaLevel_1 = "CHECKED"
								if rsFrm.Fields("DVChromaLevel") = "2" then Check_DVChromaLevel_2 = "CHECKED"
								if rsFrm.Fields("DVChromaLevel") = "3" then Check_DVChromaLevel_3 = "CHECKED"
								if rsFrm.Fields("DVChromaLevel") = "4" then Check_DVChromaLevel_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVChromaLevel name=radDVChromaLevel value="1" <%=Check_DVChromaLevel_1%>></td>
							<td><input type=radio id=radDVChromaLevel name=radDVChromaLevel value="2" <%=Check_DVChromaLevel_2%>></td>
							<td><input type=radio id=radDVChromaLevel name=radDVChromaLevel value="3" <%=Check_DVChromaLevel_3%>></td>
							<td><input type=radio id=radDVChromaLevel name=radDVChromaLevel value="4" <%=Check_DVChromaLevel_4%>></td>
							<td>Chroma Level</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVBlackLevel") = "1" then Check_DVBlackLevel_1 = "CHECKED"
								if rsFrm.Fields("DVBlackLevel") = "2" then Check_DVBlackLevel_2 = "CHECKED"
								if rsFrm.Fields("DVBlackLevel") = "3" then Check_DVBlackLevel_3 = "CHECKED"
								if rsFrm.Fields("DVBlackLevel") = "4" then Check_DVBlackLevel_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVBlackLevel name=radDVBlackLevel value="1" <%=Check_DVBlackLevel_1%>></td>
							<td><input type=radio id=radDVBlackLevel name=radDVBlackLevel value="2" <%=Check_DVBlackLevel_2%>></td>
							<td><input type=radio id=radDVBlackLevel name=radDVBlackLevel value="3" <%=Check_DVBlackLevel_3%>></td>
							<td><input type=radio id=radDVBlackLevel name=radDVBlackLevel value="4" <%=Check_DVBlackLevel_4%>></td>
							<td>Black Level</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVVBlank") = "1" then Check_DVVBlank_1 = "CHECKED"
								if rsFrm.Fields("DVVBlank") = "2" then Check_DVVBlank_2 = "CHECKED"
								if rsFrm.Fields("DVVBlank") = "3" then Check_DVVBlank_3 = "CHECKED"
								if rsFrm.Fields("DVVBlank") = "4" then Check_DVVBlank_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVVBlank name=radDVVBlank value="1" <%=Check_DVVBlank_1%>></td>
							<td><input type=radio id=radDVVBlank name=radDVVBlank value="2" <%=Check_DVVBlank_2%>></td>
							<td><input type=radio id=radDVVBlank name=radDVVBlank value="3" <%=Check_DVVBlank_3%>></td>
							<td><input type=radio id=radDVVBlank name=radDVVBlank value="4" <%=Check_DVVBlank_4%>></td>
							<td>Vert. Blanking</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVHBlank") = "1" then Check_DVHBlank_1 = "CHECKED"
								if rsFrm.Fields("DVHBlank") = "2" then Check_DVHBlank_2 = "CHECKED"
								if rsFrm.Fields("DVHBlank") = "3" then Check_DVHBlank_3 = "CHECKED"
								if rsFrm.Fields("DVHBlank") = "4" then Check_DVHBlank_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVHBlank name=radDVHBlank value="1" <%=Check_DVHBlank_1%>></td>
							<td><input type=radio id=radDVHBlank name=radDVHBlank value="2" <%=Check_DVHBlank_2%>></td>
							<td><input type=radio id=radDVHBlank name=radDVHBlank value="3" <%=Check_DVHBlank_3%>></td>
							<td><input type=radio id=radDVHBlank name=radDVHBlank value="4" <%=Check_DVHBlank_4%>></td>
							<td>Horiz. Blanking</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVFrontPor") = "1" then Check_DVFrontPor_1 = "CHECKED"
								if rsFrm.Fields("DVFrontPor") = "2" then Check_DVFrontPor_2 = "CHECKED"
								if rsFrm.Fields("DVFrontPor") = "3" then Check_DVFrontPor_3 = "CHECKED"
								if rsFrm.Fields("DVFrontPor") = "4" then Check_DVFrontPor_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVFrontPor name=radDVFrontPor value="1" <%=Check_DVFrontPor_1%>></td>
							<td><input type=radio id=radDVFrontPor name=radDVFrontPor value="2" <%=Check_DVFrontPor_2%>></td>
							<td><input type=radio id=radDVFrontPor name=radDVFrontPor value="3" <%=Check_DVFrontPor_3%>></td>
							<td><input type=radio id=radDVFrontPor name=radDVFrontPor value="4" <%=Check_DVFrontPor_4%>></td>
							<td>Front Porch</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVHSync") = "1" then Check_DVHSync_1 = "CHECKED"
								if rsFrm.Fields("DVHSync") = "2" then Check_DVHSync_2 = "CHECKED"
								if rsFrm.Fields("DVHSync") = "3" then Check_DVHSync_3 = "CHECKED"
								if rsFrm.Fields("DVHSync") = "4" then Check_DVHSync_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVHSync name=radDVHSync value="1" <%=Check_DVHSync_1%>></td>
							<td><input type=radio id=radDVHSync name=radDVHSync value="2" <%=Check_DVHSync_2%>></td>
							<td><input type=radio id=radDVHSync name=radDVHSync value="3" <%=Check_DVHSync_3%>></td>
							<td><input type=radio id=radDVHSync name=radDVHSync value="4" <%=Check_DVHSync_4%>></td>
							<td>Horiz. Sync</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVBurstCycle") = "1" then Check_DVBurstCycle_1 = "CHECKED"
								if rsFrm.Fields("DVBurstCycle") = "2" then Check_DVBurstCycle_2 = "CHECKED"
								if rsFrm.Fields("DVBurstCycle") = "3" then Check_DVBurstCycle_3 = "CHECKED"
								if rsFrm.Fields("DVBurstCycle") = "4" then Check_DVBurstCycle_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVBurstCycle name=radDVBurstCycle value="1" <%=Check_DVBurstCycle_1%>></td>
							<td><input type=radio id=radDVBurstCycle name=radDVBurstCycle value="2" <%=Check_DVBurstCycle_2%>></td>
							<td><input type=radio id=radDVBurstCycle name=radDVBurstCycle value="3" <%=Check_DVBurstCycle_3%>></td>
							<td><input type=radio id=radDVBurstCycle name=radDVBurstCycle value="4" <%=Check_DVBurstCycle_4%>></td>
							<td>Burst Cycle</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVBackPor") = "1" then Check_DVBackPor_1 = "CHECKED"
								if rsFrm.Fields("DVBackPor") = "2" then Check_DVBackPor_2 = "CHECKED"
								if rsFrm.Fields("DVBackPor") = "3" then Check_DVBackPor_3 = "CHECKED"
								if rsFrm.Fields("DVBackPor") = "4" then Check_DVBackPor_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVBackPor name=radDVBackPor value="1" <%=Check_DVBackPor_1%>></td>
							<td><input type=radio id=radDVBackPor name=radDVBackPor value="2" <%=Check_DVBackPor_2%>></td>
							<td><input type=radio id=radDVBackPor name=radDVBackPor value="3" <%=Check_DVBackPor_3%>></td>
							<td><input type=radio id=radDVBackPor name=radDVBackPor value="4" <%=Check_DVBackPor_4%>></td>
							<td>Back Porch</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVBurstAmp") = "1" then Check_DVBurstAmp_1 = "CHECKED"
								if rsFrm.Fields("DVBurstAmp") = "2" then Check_DVBurstAmp_2 = "CHECKED"
								if rsFrm.Fields("DVBurstAmp") = "3" then Check_DVBurstAmp_3 = "CHECKED"
								if rsFrm.Fields("DVBurstAmp") = "4" then Check_DVBurstAmp_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVBurstAmp name=radDVBurstAmp value="1" <%=Check_DVBurstAmp_1%>></td>
							<td><input type=radio id=radDVBurstAmp name=radDVBurstAmp value="2" <%=Check_DVBurstAmp_2%>></td>
							<td><input type=radio id=radDVBurstAmp name=radDVBurstAmp value="3" <%=Check_DVBurstAmp_3%>></td>
							<td><input type=radio id=radDVBurstAmp name=radDVBurstAmp value="4" <%=Check_DVBurstAmp_4%>></td>
							<td>Burst Amp</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVVidRF") = "1" then Check_DVVidRF_1 = "CHECKED"
								if rsFrm.Fields("DVVidRF") = "2" then Check_DVVidRF_2 = "CHECKED"
								if rsFrm.Fields("DVVidRF") = "3" then Check_DVVidRF_3 = "CHECKED"
								if rsFrm.Fields("DVVidRF") = "4" then Check_DVVidRF_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVVidRF name=radDVVidRF value="1" <%=Check_DVVidRF_1%>></td>
							<td><input type=radio id=radDVVidRF name=radDVVidRF value="2" <%=Check_DVVidRF_2%>></td>
							<td><input type=radio id=radDVVidRF name=radDVVidRF value="3" <%=Check_DVVidRF_3%>></td>
							<td><input type=radio id=radDVVidRF name=radDVVidRF value="4" <%=Check_DVVidRF_4%>></td>
							<td>Video RF</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVPCMRF") = "1" then Check_DVPCMRF_1 = "CHECKED"
								if rsFrm.Fields("DVPCMRF") = "2" then Check_DVPCMRF_2 = "CHECKED"
								if rsFrm.Fields("DVPCMRF") = "3" then Check_DVPCMRF_3 = "CHECKED"
								if rsFrm.Fields("DVPCMRF") = "4" then Check_DVPCMRF_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVPCMRF name=radDVPCMRF value="1" <%=Check_DVPCMRF_1%>></td>
							<td><input type=radio id=radDVPCMRF name=radDVPCMRF value="2" <%=Check_DVPCMRF_2%>></td>
							<td><input type=radio id=radDVPCMRF name=radDVPCMRF value="3" <%=Check_DVPCMRF_3%>></td>
							<td><input type=radio id=radDVPCMRF name=radDVPCMRF value="4" <%=Check_DVPCMRF_4%>></td>
							<td>PCM RF</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVCtlTrk") = "1" then Check_DVCtlTrk_1 = "CHECKED"
								if rsFrm.Fields("DVCtlTrk") = "2" then Check_DVCtlTrk_2 = "CHECKED"
								if rsFrm.Fields("DVCtlTrk") = "3" then Check_DVCtlTrk_3 = "CHECKED"
								if rsFrm.Fields("DVCtlTrk") = "4" then Check_DVCtlTrk_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVCtlTrk name=radDVCtlTrk value="1" <%=Check_DVCtlTrk_1%>></td>
							<td><input type=radio id=radDVCtlTrk name=radDVCtlTrk value="2" <%=Check_DVCtlTrk_2%>></td>
							<td><input type=radio id=radDVCtlTrk name=radDVCtlTrk value="3" <%=Check_DVCtlTrk_3%>></td>
							<td><input type=radio id=radDVCtlTrk name=radDVCtlTrk value="4" <%=Check_DVCtlTrk_4%>></td>
							<td>Control Track</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVTimeBase") = "1" then Check_DVTimeBase_1 = "CHECKED"
								if rsFrm.Fields("DVTimeBase") = "2" then Check_DVTimeBase_2 = "CHECKED"
								if rsFrm.Fields("DVTimeBase") = "3" then Check_DVTimeBase_3 = "CHECKED"
								if rsFrm.Fields("DVTimeBase") = "4" then Check_DVTimeBase_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVTimeBase name=radDVTimeBase value="1" <%=Check_DVTimeBase_1%>></td>
							<td><input type=radio id=radDVTimeBase name=radDVTimeBase value="2" <%=Check_DVTimeBase_2%>></td>
							<td><input type=radio id=radDVTimeBase name=radDVTimeBase value="3" <%=Check_DVTimeBase_3%>></td>
							<td><input type=radio id=radDVTimeBase name=radDVTimeBase value="4" <%=Check_DVTimeBase_4%>></td>
							<td>Timebase Stbl</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("DVMotionJit") = "1" then Check_DVMotionJit_1 = "CHECKED"
								if rsFrm.Fields("DVMotionJit") = "2" then Check_DVMotionJit_2 = "CHECKED"
								if rsFrm.Fields("DVMotionJit") = "3" then Check_DVMotionJit_3 = "CHECKED"
								if rsFrm.Fields("DVMotionJit") = "4" then Check_DVMotionJit_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radDVMotionJit name=radDVMotionJit value="1" <%=Check_DVMotionJit_1%>></td>
							<td><input type=radio id=radDVMotionJit name=radDVMotionJit value="2" <%=Check_DVMotionJit_2%>></td>
							<td><input type=radio id=radDVMotionJit name=radDVMotionJit value="3" <%=Check_DVMotionJit_3%>></td>
							<td><input type=radio id=radDVMotionJit name=radDVMotionJit value="4" <%=Check_DVMotionJit_4%>></td>
							<td>Motion Jitter</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr bgcolor=#999900>
							<td>&nbsp;&nbsp;1</td>
							<td>&nbsp;&nbsp;2</td>
							<td>&nbsp;&nbsp;3</td>
							<td>&nbsp;&nbsp;4</td>
							<td>Tape Stock</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("TSShred") = "1" then Check_TSShred_1 = "CHECKED"
								if rsFrm.Fields("TSShred") = "2" then Check_TSShred_2 = "CHECKED"
								if rsFrm.Fields("TSShred") = "3" then Check_TSShred_3 = "CHECKED"
								if rsFrm.Fields("TSShred") = "4" then Check_TSShred_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radTSShred name=radTSShred value="1" <%=Check_TSShred_1%>></td>
							<td><input type=radio id=radTSShred name=radTSShred value="2" <%=Check_TSShred_2%>></td>
							<td><input type=radio id=radTSShred name=radTSShred value="3" <%=Check_TSShred_3%>></td>
							<td><input type=radio id=radTSShred name=radTSShred value="4" <%=Check_TSShred_4%>></td>
							<td>Shedding</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("TSDropOut") = "1" then Check_TSDropOut_1 = "CHECKED"
								if rsFrm.Fields("TSDropOut") = "2" then Check_TSDropOut_2 = "CHECKED"
								if rsFrm.Fields("TSDropOut") = "3" then Check_TSDropOut_3 = "CHECKED"
								if rsFrm.Fields("TSDropOut") = "4" then Check_TSDropOut_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radTSDropOut name=radTSDropOut value="1" <%=Check_TSDropOut_1%>></td>
							<td><input type=radio id=radTSDropOut name=radTSDropOut value="2" <%=Check_TSDropOut_2%>></td>
							<td><input type=radio id=radTSDropOut name=radTSDropOut value="3" <%=Check_TSDropOut_3%>></td>
							<td><input type=radio id=radTSDropOut name=radTSDropOut value="4" <%=Check_TSDropOut_4%>></td>
							<td>Drop-outs</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("TSScratch") = "1" then Check_TSScratch_1 = "CHECKED"
								if rsFrm.Fields("TSScratch") = "2" then Check_TSScratch_2 = "CHECKED"
								if rsFrm.Fields("TSScratch") = "3" then Check_TSScratch_3 = "CHECKED"
								if rsFrm.Fields("TSScratch") = "4" then Check_TSScratch_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radTSScratch name=radTSScratch value="1" <%=Check_TSScratch_1%>></td>
							<td><input type=radio id=radTSScratch name=radTSScratch value="2" <%=Check_TSScratch_2%>></td>
							<td><input type=radio id=radTSScratch name=radTSScratch value="3" <%=Check_TSScratch_3%>></td>
							<td><input type=radio id=radTSScratch name=radTSScratch value="4" <%=Check_TSScratch_4%>></td>
							<td>Scratches</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							If rsFrm.BOF = true AND rsFrm.EOF = true Then
							else
								if rsFrm.Fields("TSEdgeDam") = "1" then Check_TSEdgeDam_1 = "CHECKED"
								if rsFrm.Fields("TSEdgeDam") = "2" then Check_TSEdgeDam_2 = "CHECKED"
								if rsFrm.Fields("TSEdgeDam") = "3" then Check_TSEdgeDam_3 = "CHECKED"
								if rsFrm.Fields("TSEdgeDam") = "4" then Check_TSEdgeDam_4 = "CHECKED"
							end if
							%>
							<td><input type=radio id=radTSEdgeDam name=radTSEdgeDam value="1" <%=Check_TSEdgeDam_1%>></td>
							<td><input type=radio id=radTSEdgeDam name=radTSEdgeDam value="2" <%=Check_TSEdgeDam_2%>></td>
							<td><input type=radio id=radTSEdgeDam name=radTSEdgeDam value="3" <%=Check_TSEdgeDam_3%>></td>
							<td><input type=radio id=radTSEdgeDam name=radTSEdgeDam value="4" <%=Check_TSEdgeDam_4%>></td>
							<td>Edge Damage</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("TSTapeTension") = "1" then Check_TSTapeTension_1 = "CHECKED"
							if rsFrm.Fields("TSTapeTension") = "2" then Check_TSTapeTension_2 = "CHECKED"
							if rsFrm.Fields("TSTapeTension") = "3" then Check_TSTapeTension_3 = "CHECKED"
							if rsFrm.Fields("TSTapeTension") = "4" then Check_TSTapeTension_4 = "CHECKED"
							%>
							<td><input type=radio id=radTSTapeTension name=radTSTapeTension value="1" <%=Check_TSTapeTension_1%>></td>
							<td><input type=radio id=radTSTapeTension name=radTSTapeTension value="2" <%=Check_TSTapeTension_2%>></td>
							<td><input type=radio id=radTSTapeTension name=radTSTapeTension value="3" <%=Check_TSTapeTension_3%>></td>
							<td><input type=radio id=radTSTapeTension name=radTSTapeTension value="4" <%=Check_TSTapeTension_4%>></td>
							<td>Tape Tension</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("TSCreasing") = "1" then Check_TSCreasing_1 = "CHECKED"
							if rsFrm.Fields("TSCreasing") = "2" then Check_TSCreasing_2 = "CHECKED"
							if rsFrm.Fields("TSCreasing") = "3" then Check_TSCreasing_3 = "CHECKED"
							if rsFrm.Fields("TSCreasing") = "4" then Check_TSCreasing_4 = "CHECKED"
							%>
							<td><input type=radio id=radTSCreasing name=radTSCreasing value="1" <%=Check_TSCreasing_1%>></td>
							<td><input type=radio id=radTSCreasing name=radTSCreasing value="2" <%=Check_TSCreasing_2%>></td>
							<td><input type=radio id=radTSCreasing name=radTSCreasing value="3" <%=Check_TSCreasing_3%>></td>
							<td><input type=radio id=radTSCreasing name=radTSCreasing value="4" <%=Check_TSCreasing_4%>></td>
							<td>Creasing</td>
						</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
						<tr bgcolor=#999900>
							<td>&nbsp;&nbsp;1</td>
							<td>&nbsp;&nbsp;2</td>
							<td>&nbsp;&nbsp;3</td>
							<td>&nbsp;&nbsp;4</td>
							<td>Film</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("FScratchesDirt") = "1" then Check_FScratchesDirt_1 = "CHECKED"
							if rsFrm.Fields("FScratchesDirt") = "2" then Check_FScratchesDirt_2 = "CHECKED"
							if rsFrm.Fields("FScratchesDirt") = "3" then Check_FScratchesDirt_3 = "CHECKED"
							if rsFrm.Fields("FScratchesDirt") = "4" then Check_FScratchesDirt_4 = "CHECKED"
							%>
							<td><input type=radio id=radFScratchesDirt name=radFScratchesDirt value="1" <%=Check_FScratchesDirt_1%>></td>
							<td><input type=radio id=radFScratchesDirt name=radFScratchesDirt value="2" <%=Check_FScratchesDirt_2%>></td>
							<td><input type=radio id=radFScratchesDirt name=radFScratchesDirt value="3" <%=Check_FScratchesDirt_3%>></td>
							<td><input type=radio id=radFScratchesDirt name=radFScratchesDirt value="4" <%=Check_FScratchesDirt_4%>></td>
							<td>Scratches/Dirt</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("FColorBal") = "1" then Check_FColorBal_1 = "CHECKED"
							if rsFrm.Fields("FColorBal") = "2" then Check_FColorBal_2 = "CHECKED"
							if rsFrm.Fields("FColorBal") = "3" then Check_FColorBal_3 = "CHECKED"
							if rsFrm.Fields("FColorBal") = "4" then Check_FColorBal_4 = "CHECKED"
							%>
							<td><input type=radio id=radFColorBal name=radFColorBal value="1" <%=Check_FColorBal_1%>></td>
							<td><input type=radio id=radFColorBal name=radFColorBal value="2" <%=Check_FColorBal_2%>></td>
							<td><input type=radio id=radFColorBal name=radFColorBal value="3" <%=Check_FColorBal_3%>></td>
							<td><input type=radio id=radFColorBal name=radFColorBal value="4" <%=Check_FColorBal_4%>></td>
							<td>Color Balance</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("FFraming") = "1" then Check_FFraming_1 = "CHECKED"
							if rsFrm.Fields("FFraming") = "2" then Check_FFraming_2 = "CHECKED"
							if rsFrm.Fields("FFraming") = "3" then Check_FFraming_3 = "CHECKED"
							if rsFrm.Fields("FFraming") = "4" then Check_FFraming_4 = "CHECKED"
							%>
							<td><input type=radio id=radFFraming name=radFFraming value="1" <%=Check_FFraming_1%>></td>
							<td><input type=radio id=radFFraming name=radFFraming value="2" <%=Check_FFraming_2%>></td>
							<td><input type=radio id=radFFraming name=radFFraming value="3" <%=Check_FFraming_3%>></td>
							<td><input type=radio id=radFFraming name=radFFraming value="4" <%=Check_FFraming_4%>></td>
							<td>Framing</td>
						</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
						<tr bgcolor=#999900>
							<td>&nbsp;&nbsp;1</td>
							<td>&nbsp;&nbsp;2</td>
							<td>&nbsp;&nbsp;3</td>
							<td>&nbsp;&nbsp;4</td>
							<td>Standard Conversion</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("SCColourimetry") = "1" then Check_SCColourimetry_1 = "CHECKED"
							if rsFrm.Fields("SCColourimetry") = "2" then Check_SCColourimetry_2 = "CHECKED"
							if rsFrm.Fields("SCColourimetry") = "3" then Check_SCColourimetry_3 = "CHECKED"
							if rsFrm.Fields("SCColourimetry") = "4" then Check_SCColourimetry_4 = "CHECKED"
							%>
							<td><input type=radio id=radSCColourimetry name=radSCColourimetry value="1" <%=Check_SCColourimetry_1%>></td>
							<td><input type=radio id=radSCColourimetry name=radSCColourimetry value="2" <%=Check_SCColourimetry_2%>></td>
							<td><input type=radio id=radSCColourimetry name=radSCColourimetry value="3" <%=Check_SCColourimetry_3%>></td>
							<td><input type=radio id=radSCColourimetry name=radSCColourimetry value="4" <%=Check_SCColourimetry_4%>></td>
							<td>Colourimetry</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("SCFlicker") = "1" then Check_SCFlicker_1 = "CHECKED"
							if rsFrm.Fields("SCFlicker") = "2" then Check_SCFlicker_2 = "CHECKED"
							if rsFrm.Fields("SCFlicker") = "3" then Check_SCFlicker_3 = "CHECKED"
							if rsFrm.Fields("SCFlicker") = "4" then Check_SCFlicker_4 = "CHECKED"
							%>
							<td><input type=radio id=radSCFlicker name=radSCFlicker value="1" <%=Check_SCFlicker_1%>></td>
							<td><input type=radio id=radSCFlicker name=radSCFlicker value="2" <%=Check_SCFlicker_2%>></td>
							<td><input type=radio id=radSCFlicker name=radSCFlicker value="3" <%=Check_SCFlicker_3%>></td>
							<td><input type=radio id=radSCFlicker name=radSCFlicker value="4" <%=Check_SCFlicker_4%>></td>
							<td>Flicker</td>
						</tr>
					</table>
					<br>
					<table id="tblTapeFormat" cellpadding=0 cellspacing=0 border=0>
						<tr>
							<td>1 - Standard/Non-Detectable</td>
						</tr>
						<tr>
							<td>2 - Acceptable</td>
						</tr>
						<tr>
							<td>3 - Marginal</td>
						</tr>
						<tr>
							<td>4 - Not Acceptable</td>
						</tr>
					</table>
				</TD>
				<TD align="center" valign="top">
					<table id="tblTapeFormat" cellpadding=0 cellspacing=0 border=0>
						<tr bgcolor=#999900>
							<td>&nbsp;&nbsp;1</td>
							<td>&nbsp;&nbsp;2</td>
							<td>&nbsp;&nbsp;3</td>
							<td>&nbsp;&nbsp;4</td>
							<td>Main Video</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("MVRes") = "1" then Check_MVRes_1 = "CHECKED"
							if rsFrm.Fields("MVRes") = "2" then Check_MVRes_2 = "CHECKED"
							if rsFrm.Fields("MVRes") = "3" then Check_MVRes_3 = "CHECKED"
							if rsFrm.Fields("MVRes") = "4" then Check_MVRes_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVRes name=radMVRes value="1" <%=Check_MVRes_1%>></td>
							<td><input type=radio id=radMVRes name=radMVRes value="2" <%=Check_MVRes_2%>></td>
							<td><input type=radio id=radMVRes name=radMVRes value="3" <%=Check_MVRes_3%>></td>
							<td><input type=radio id=radMVRes name=radMVRes value="4" <%=Check_MVRes_4%>></td>
							<td>Resolution</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("MVSignalNoise") = "1" then Check_MVSignalNoise_1 = "CHECKED"
							if rsFrm.Fields("MVSignalNoise") = "2" then Check_MVSignalNoise_2 = "CHECKED"
							if rsFrm.Fields("MVSignalNoise") = "3" then Check_MVSignalNoise_3 = "CHECKED"
							if rsFrm.Fields("MVSignalNoise") = "4" then Check_MVSignalNoise_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVSignalNoise name=radMVSignalNoise value="1" <%=Check_MVSignalNoise_1%>></td>
							<td><input type=radio id=radMVSignalNoise name=radMVSignalNoise value="2" <%=Check_MVSignalNoise_1%>></td>
							<td><input type=radio id=radMVSignalNoise name=radMVSignalNoise value="3" <%=Check_MVSignalNoise_1%>></td>
							<td><input type=radio id=radMVSignalNoise name=radMVSignalNoise value="4" <%=Check_MVSignalNoise_1%>></td>
							<td>Signal/Noise</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("MVColorBal") = "1" then Check_MVColorBal_1 = "CHECKED"
							if rsFrm.Fields("MVColorBal") = "2" then Check_MVColorBal_2 = "CHECKED"
							if rsFrm.Fields("MVColorBal") = "3" then Check_MVColorBal_3 = "CHECKED"
							if rsFrm.Fields("MVColorBal") = "4" then Check_MVColorBal_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVColorBal name=radMVColorBal value="1" <%=Check_MVColorBal_1%>></td>
							<td><input type=radio id=radMVColorBal name=radMVColorBal value="2" <%=Check_MVColorBal_2%>></td>
							<td><input type=radio id=radMVColorBal name=radMVColorBal value="3" <%=Check_MVColorBal_3%>></td>
							<td><input type=radio id=radMVColorBal name=radMVColorBal value="4" <%=Check_MVColorBal_4%>></td>
							<td>Color Balance</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("MVReg") = "1" then Check_MVReg_1 = "CHECKED"
							if rsFrm.Fields("MVReg") = "2" then Check_MVReg_2 = "CHECKED"
							if rsFrm.Fields("MVReg") = "3" then Check_MVReg_3 = "CHECKED"
							if rsFrm.Fields("MVReg") = "4" then Check_MVReg_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVReg name=radMVReg value="1" <%=Check_MVReg_1%>></td>
							<td><input type=radio id=radMVReg name=radMVReg value="2" <%=Check_MVReg_2%>></td>
							<td><input type=radio id=radMVReg name=radMVReg value="3" <%=Check_MVReg_3%>></td>
							<td><input type=radio id=radMVReg name=radMVReg value="4" <%=Check_MVReg_4%>></td>
							<td>Registration</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("MVEnt") = "1" then Check_MVEnt_1 = "CHECKED"
							if rsFrm.Fields("MVEnt") = "2" then Check_MVEnt_2 = "CHECKED"
							if rsFrm.Fields("MVEnt") = "3" then Check_MVEnt_3 = "CHECKED"
							if rsFrm.Fields("MVEnt") = "4" then Check_MVEnt_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVEnt name=radMVEnt value="1" <%=Check_MVEnt_1%>></td>
							<td><input type=radio id=radMVEnt name=radMVEnt value="2" <%=Check_MVEnt_2%>></td>
							<td><input type=radio id=radMVEnt name=radMVEnt value="3" <%=Check_MVEnt_3%>></td>
							<td><input type=radio id=radMVEnt name=radMVEnt value="4" <%=Check_MVEnt_4%>></td>
							<td>Entrancement</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("MVCSM") = "1" then Check_MVCSM_1 = "CHECKED"
							if rsFrm.Fields("MVCSM") = "2" then Check_MVCSM_2 = "CHECKED"
							if rsFrm.Fields("MVCSM") = "3" then Check_MVCSM_3 = "CHECKED"
							if rsFrm.Fields("MVCSM") = "4" then Check_MVCSM_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVCSM name=radMVCSM value="1" <%=Check_MVCSM_1%>></td>
							<td><input type=radio id=radMVCSM name=radMVCSM value="2" <%=Check_MVCSM_2%>></td>
							<td><input type=radio id=radMVCSM name=radMVCSM value="3" <%=Check_MVCSM_3%>></td>
							<td><input type=radio id=radMVCSM name=radMVCSM value="4" <%=Check_MVCSM_4%>></td>
							<td>Camera/Scene Match</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("MVChrLvT") = "1" then Check_MVChrLvT_1 = "CHECKED"
							if rsFrm.Fields("MVChrLvT") = "2" then Check_MVChrLvT_2 = "CHECKED"
							if rsFrm.Fields("MVChrLvT") = "3" then Check_MVChrLvT_3 = "CHECKED"
							if rsFrm.Fields("MVChrLvT") = "4" then Check_MVChrLvT_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVChrLvT name=radMVChrLvT value="1" <%=Check_MVChrLvT_1%>></td>
							<td><input type=radio id=radMVChrLvT name=radMVChrLvT value="2" <%=Check_MVChrLvT_2%>></td>
							<td><input type=radio id=radMVChrLvT name=radMVChrLvT value="3" <%=Check_MVChrLvT_3%>></td>
							<td><input type=radio id=radMVChrLvT name=radMVChrLvT value="4" <%=Check_MVChrLvT_4%>></td>
							<td>Chroma Level vs Test</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("MVPGMPvT") = "1" then Check_MVPGMPvT_1 = "CHECKED"
							if rsFrm.Fields("MVPGMPvT") = "2" then Check_MVPGMPvT_2 = "CHECKED"
							if rsFrm.Fields("MVPGMPvT") = "3" then Check_MVPGMPvT_3 = "CHECKED"
							if rsFrm.Fields("MVPGMPvT") = "4" then Check_MVPGMPvT_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVPGMPvT name=radMVPGMPvT value="1" <%=Check_MVPGMPvT_1%>></td>
							<td><input type=radio id=radMVPGMPvT name=radMVPGMPvT value="2" <%=Check_MVPGMPvT_2%>></td>
							<td><input type=radio id=radMVPGMPvT name=radMVPGMPvT value="3" <%=Check_MVPGMPvT_3%>></td>
							<td><input type=radio id=radMVPGMPvT name=radMVPGMPvT value="4" <%=Check_MVPGMPvT_4%>></td>
							<td>PGM Phase vs Test</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("MVPGMLvT") = "1" then Check_MVPGMLvT_1 = "CHECKED"
							if rsFrm.Fields("MVPGMLvT") = "2" then Check_MVPGMLvT_2 = "CHECKED"
							if rsFrm.Fields("MVPGMLvT") = "3" then Check_MVPGMLvT_3 = "CHECKED"
							if rsFrm.Fields("MVPGMLvT") = "4" then Check_MVPGMLvT_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVPGMLvT name=radMVPGMLvT value="1" <%=Check_MVPGMLvT_1%>></td>
							<td><input type=radio id=radMVPGMLvT name=radMVPGMLvT value="2" <%=Check_MVPGMLvT_2%>></td>
							<td><input type=radio id=radMVPGMLvT name=radMVPGMLvT value="3" <%=Check_MVPGMLvT_3%>></td>
							<td><input type=radio id=radMVPGMLvT name=radMVPGMLvT value="4" <%=Check_MVPGMLvT_4%>></td>
							<td>PGM Levels vs Test</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("MVPedLvT") = "1" then Check_MVPedLvT_1 = "CHECKED"
							if rsFrm.Fields("MVPedLvT") = "2" then Check_MVPedLvT_2 = "CHECKED"
							if rsFrm.Fields("MVPedLvT") = "3" then Check_MVPedLvT_3 = "CHECKED"
							if rsFrm.Fields("MVPedLvT") = "4" then Check_MVPedLvT_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVPedLvT name=radMVPedLvT value="1" <%=Check_MVPedLvT_1%>></td>
							<td><input type=radio id=radMVPedLvT name=radMVPedLvT value="2" <%=Check_MVPedLvT_2%>></td>
							<td><input type=radio id=radMVPedLvT name=radMVPedLvT value="3" <%=Check_MVPedLvT_3%>></td>
							<td><input type=radio id=radMVPedLvT name=radMVPedLvT value="4" <%=Check_MVPedLvT_4%>></td>
							<td>Pedestal Levels vs Test</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("MVSS") = "1" then Check_MVSS_1 = "CHECKED"
							if rsFrm.Fields("MVSS") = "2" then Check_MVSS_2 = "CHECKED"
							if rsFrm.Fields("MVSS") = "3" then Check_MVSS_3 = "CHECKED"
							if rsFrm.Fields("MVSS") = "4" then Check_MVSS_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVSS name=radMVSS value="1" <%=Check_MVSS_1%>></td>
							<td><input type=radio id=radMVSS name=radMVSS value="2" <%=Check_MVSS_2%>></td>
							<td><input type=radio id=radMVSS name=radMVSS value="3" <%=Check_MVSS_3%>></td>
							<td><input type=radio id=radMVSS name=radMVSS value="4" <%=Check_MVSS_4%>></td>
							<td>Streaking/Smearing</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("MVLagBoom") = "1" then Check_MVLagBoom_1 = "CHECKED"
							if rsFrm.Fields("MVLagBoom") = "2" then Check_MVLagBoom_2 = "CHECKED"
							if rsFrm.Fields("MVLagBoom") = "3" then Check_MVLagBoom_3 = "CHECKED"
							if rsFrm.Fields("MVLagBoom") = "4" then Check_MVLagBoom_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVLagBoom name=radMVLagBoom value="1" <%=Check_MVLagBoom_1%>></td>
							<td><input type=radio id=radMVLagBoom name=radMVLagBoom value="2" <%=Check_MVLagBoom_2%>></td>
							<td><input type=radio id=radMVLagBoom name=radMVLagBoom value="3" <%=Check_MVLagBoom_3%>></td>
							<td><input type=radio id=radMVLagBoom name=radMVLagBoom value="4" <%=Check_MVLagBoom_4%>></td>
							<td>Lag/Boom</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("MVMoire") = "1" then Check_MVMoire_1 = "CHECKED"
							if rsFrm.Fields("MVMoire") = "2" then Check_MVMoire_2 = "CHECKED"
							if rsFrm.Fields("MVMoire") = "3" then Check_MVMoire_3 = "CHECKED"
							if rsFrm.Fields("MVMoire") = "4" then Check_MVMoire_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVMoire name=radMVMoire value="1" <%=Check_MVMoire_1%>></td>
							<td><input type=radio id=radMVMoire name=radMVMoire value="2" <%=Check_MVMoire_2%>></td>
							<td><input type=radio id=radMVMoire name=radMVMoire value="3" <%=Check_MVMoire_3%>></td>
							<td><input type=radio id=radMVMoire name=radMVMoire value="4" <%=Check_MVMoire_4%>></td>
							<td>Moire</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("MVChrTearing") = "1" then Check_MVChrTearing_1 = "CHECKED"
							if rsFrm.Fields("MVChrTearing") = "2" then Check_MVChrTearing_2 = "CHECKED"
							if rsFrm.Fields("MVChrTearing") = "3" then Check_MVChrTearing_3 = "CHECKED"
							if rsFrm.Fields("MVChrTearing") = "4" then Check_MVChrTearing_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVChrTearing name=radMVChrTearing value="1" <%=Check_MVChrTearing_1%>></td>
							<td><input type=radio id=radMVChrTearing name=radMVChrTearing value="2" <%=Check_MVChrTearing_2%>></td>
							<td><input type=radio id=radMVChrTearing name=radMVChrTearing value="3" <%=Check_MVChrTearing_3%>></td>
							<td><input type=radio id=radMVChrTearing name=radMVChrTearing value="4" <%=Check_MVChrTearing_4%>></td>
							<td>Chroma Tearing</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("MVRinging") = "1" then Check_MVRinging_1 = "CHECKED"
							if rsFrm.Fields("MVRinging") = "2" then Check_MVRinging_2 = "CHECKED"
							if rsFrm.Fields("MVRinging") = "3" then Check_MVRinging_3 = "CHECKED"
							if rsFrm.Fields("MVRinging") = "4" then Check_MVRinging_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVRinging name=radMVRinging value="1" <%=Check_MVRinging_1%>></td>
							<td><input type=radio id=radMVRinging name=radMVRinging value="2" <%=Check_MVRinging_2%>></td>
							<td><input type=radio id=radMVRinging name=radMVRinging value="3" <%=Check_MVRinging_3%>></td>
							<td><input type=radio id=radMVRinging name=radMVRinging value="4" <%=Check_MVRinging_4%>></td>
							<td>Ringing</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("MVMicrophonics") = "1" then Check_MVMicrophonics_1 = "CHECKED"
							if rsFrm.Fields("MVMicrophonics") = "2" then Check_MVMicrophonics_2 = "CHECKED"
							if rsFrm.Fields("MVMicrophonics") = "3" then Check_MVMicrophonics_3 = "CHECKED"
							if rsFrm.Fields("MVMicrophonics") = "4" then Check_MVMicrophonics_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVMicrophonics name=radMVMicrophonics value="1" <%=Check_MVMicrophonics_1%>></td>
							<td><input type=radio id=radMVMicrophonics name=radMVMicrophonics value="2" <%=Check_MVMicrophonics_2%>></td>
							<td><input type=radio id=radMVMicrophonics name=radMVMicrophonics value="3" <%=Check_MVMicrophonics_3%>></td>
							<td><input type=radio id=radMVMicrophonics name=radMVMicrophonics value="4" <%=Check_MVMicrophonics_4%>></td>
							<td>Microphonics</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("MVBlackComp") = "1" then Check_MVBlackComp_1 = "CHECKED"
							if rsFrm.Fields("MVBlackComp") = "2" then Check_MVBlackComp_2 = "CHECKED"
							if rsFrm.Fields("MVBlackComp") = "3" then Check_MVBlackComp_3 = "CHECKED"
							if rsFrm.Fields("MVBlackComp") = "4" then Check_MVBlackComp_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVBlackComp name=radMVBlackComp value="1" <%=Check_MVBlackComp_1%>></td>
							<td><input type=radio id=radMVBlackComp name=radMVBlackComp value="2" <%=Check_MVBlackComp_2%>></td>
							<td><input type=radio id=radMVBlackComp name=radMVBlackComp value="3" <%=Check_MVBlackComp_3%>></td>
							<td><input type=radio id=radMVBlackComp name=radMVBlackComp value="4" <%=Check_MVBlackComp_4%>></td>
							<td>Black Compression</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("MVWhiteComp") = "1" then Check_MVWhiteComp_1 = "CHECKED"
							if rsFrm.Fields("MVWhiteComp") = "2" then Check_MVWhiteComp_2 = "CHECKED"
							if rsFrm.Fields("MVWhiteComp") = "3" then Check_MVWhiteComp_3 = "CHECKED"
							if rsFrm.Fields("MVWhiteComp") = "4" then Check_MVWhiteComp_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVWhiteComp name=radMVWhiteComp value="1" <%=Check_MVWhiteComp_1%>></td>
							<td><input type=radio id=radMVWhiteComp name=radMVWhiteComp value="2" <%=Check_MVWhiteComp_2%>></td>
							<td><input type=radio id=radMVWhiteComp name=radMVWhiteComp value="3" <%=Check_MVWhiteComp_3%>></td>
							<td><input type=radio id=radMVWhiteComp name=radMVWhiteComp value="4" <%=Check_MVWhiteComp_4%>></td>
							<td>White Compression</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("MVTransGlitch") = "1" then Check_MVTransGlitch_1 = "CHECKED"
							if rsFrm.Fields("MVTransGlitch") = "2" then Check_MVTransGlitch_2 = "CHECKED"
							if rsFrm.Fields("MVTransGlitch") = "3" then Check_MVTransGlitch_3 = "CHECKED"
							if rsFrm.Fields("MVTransGlitch") = "4" then Check_MVTransGlitch_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVTransGlitch name=radMVTransGlitch value="1" <%=Check_MVTransGlitch_1%>></td>
							<td><input type=radio id=radMVTransGlitch name=radMVTransGlitch value="2" <%=Check_MVTransGlitch_2%>></td>
							<td><input type=radio id=radMVTransGlitch name=radMVTransGlitch value="3" <%=Check_MVTransGlitch_3%>></td>
							<td><input type=radio id=radMVTransGlitch name=radMVTransGlitch value="4" <%=Check_MVTransGlitch_4%>></td>
							<td>Transients/Glitches</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("MVBRi") = "1" then Check_MVBRi_1 = "CHECKED"
							if rsFrm.Fields("MVBRi") = "2" then Check_MVBRi_2 = "CHECKED"
							if rsFrm.Fields("MVBRi") = "3" then Check_MVBRi_3 = "CHECKED"
							if rsFrm.Fields("MVBRi") = "4" then Check_MVBRi_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVBRi name=radMVBRi value="1" <%=Check_MVBRi_1%>></td>
							<td><input type=radio id=radMVBRi name=radMVBRi value="2" <%=Check_MVBRi_2%>></td>
							<td><input type=radio id=radMVBRi name=radMVBRi value="3" <%=Check_MVBRi_3%>></td>
							<td><input type=radio id=radMVBRi name=radMVBRi value="4" <%=Check_MVBRi_4%>></td>
							<td>Banding Recorded in</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("MVVERi") = "1" then Check_MVVERi_1 = "CHECKED"
							if rsFrm.Fields("MVVERi") = "2" then Check_MVVERi_2 = "CHECKED"
							if rsFrm.Fields("MVVERi") = "3" then Check_MVVERi_3 = "CHECKED"
							if rsFrm.Fields("MVVERi") = "4" then Check_MVVERi_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVVERi name=radMVVERi value="1" <%=Check_MVVERi_1%>></td>
							<td><input type=radio id=radMVVERi name=radMVVERi value="2" <%=Check_MVVERi_2%>></td>
							<td><input type=radio id=radMVVERi name=radMVVERi value="3" <%=Check_MVVERi_3%>></td>
							<td><input type=radio id=radMVVERi name=radMVVERi value="4" <%=Check_MVVERi_4%>></td>
							<td>Velocity Error Recorded in</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("MVDROi") = "1" then Check_MVDROi_1 = "CHECKED"
							if rsFrm.Fields("MVDROi") = "2" then Check_MVDROi_2 = "CHECKED"
							if rsFrm.Fields("MVDROi") = "3" then Check_MVDROi_3 = "CHECKED"
							if rsFrm.Fields("MVDROi") = "4" then Check_MVDROi_4 = "CHECKED"
							%>
							<td><input type=radio id=radMVDROi name=radMVDROi value="1" <%=Check_MVDROi_1%>></td>
							<td><input type=radio id=radMVDROi name=radMVDROi value="2" <%=Check_MVDROi_2%>></td>
							<td><input type=radio id=radMVDROi name=radMVDROi value="3" <%=Check_MVDROi_3%>></td>
							<td><input type=radio id=radMVDROi name=radMVDROi value="4" <%=Check_MVDROi_4%>></td>
							<td>Drop Outs Recorded in</td>
						</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
						<tr bgcolor=#999900>
							<td>&nbsp;&nbsp;1</td>
							<td>&nbsp;&nbsp;2</td>
							<td>&nbsp;&nbsp;3</td>
							<td>&nbsp;&nbsp;4</td>
							<td>Audio</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("APGMLvT") = "1" then Check_APGMLvT_1 = "CHECKED"
							if rsFrm.Fields("APGMLvT") = "2" then Check_APGMLvT_2 = "CHECKED"
							if rsFrm.Fields("APGMLvT") = "3" then Check_APGMLvT_3 = "CHECKED"
							if rsFrm.Fields("APGMLvT") = "4" then Check_APGMLvT_4 = "CHECKED"
							%>
							<td><input type=radio id=radAPGMLvT name=radAPGMLvT value="1" <%=Check_APGMLvT_1%>></td>
							<td><input type=radio id=radAPGMLvT name=radAPGMLvT value="2" <%=Check_APGMLvT_2%>></td>
							<td><input type=radio id=radAPGMLvT name=radAPGMLvT value="3" <%=Check_APGMLvT_3%>></td>
							<td><input type=radio id=radAPGMLvT name=radAPGMLvT value="4" <%=Check_APGMLvT_4%>></td>
							<td>PGM Level vs Test</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("AIntellig") = "1" then Check_AIntellig_1 = "CHECKED"
							if rsFrm.Fields("AIntellig") = "2" then Check_AIntellig_2 = "CHECKED"
							if rsFrm.Fields("AIntellig") = "3" then Check_AIntellig_3 = "CHECKED"
							if rsFrm.Fields("AIntellig") = "4" then Check_AIntellig_4 = "CHECKED"
							%>
							<td><input type=radio id=radAIntellig name=radAIntellig value="1" <%=Check_AIntellig_1%>></td>
							<td><input type=radio id=radAIntellig name=radAIntellig value="2" <%=Check_AIntellig_2%>></td>
							<td><input type=radio id=radAIntellig name=radAIntellig value="3" <%=Check_AIntellig_3%>></td>
							<td><input type=radio id=radAIntellig name=radAIntellig value="4" <%=Check_AIntellig_4%>></td>
							<td>Intelligibility</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("ADist") = "1" then Check_ADist_1 = "CHECKED"
							if rsFrm.Fields("ADist") = "2" then Check_ADist_2 = "CHECKED"
							if rsFrm.Fields("ADist") = "3" then Check_ADist_3 = "CHECKED"
							if rsFrm.Fields("ADist") = "4" then Check_ADist_4 = "CHECKED"
							%>
							<td><input type=radio id=radADist name=radADist value="1" <%=Check_ADist_1%>></td>
							<td><input type=radio id=radADist name=radADist value="2" <%=Check_ADist_2%>></td>
							<td><input type=radio id=radADist name=radADist value="3" <%=Check_ADist_3%>></td>
							<td><input type=radio id=radADist name=radADist value="4" <%=Check_ADist_4%>></td>
							<td>
							Distortion&nbsp;&nbsp;
							<%	
								if rsFrm.Fields("ADistLo") = -1 then 
									Check_ADistLo = "CHECKED"
								else
									Check_AdistLo = ""
								end if
							%>
							Lo<input type=radio id=Dist name=Dist value="L" <%=Check_ADistLo%>>&nbsp;
							<%	
								if rsFrm.Fields("ADistMed") = -1 then 
									Check_ADistMed = "CHECKED"
								else
									Check_AdistMed = ""
								end if
							%>
							Med<input type=radio id=Dist name=Dist value="M" <%=Check_ADistMed%>>&nbsp;
							<%	
								if rsFrm.Fields("ADistHi") = -1 then 
									Check_ADistHi = "CHECKED"
								else
									Check_ADistHi = ""
								end if
							%>
							Hi<input type=radio id=Dist name=Dist value="H" <%=Check_ADistHi%>>&nbsp;
							</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("AHHN") = "1" then Check_AHHN_1 = "CHECKED"
							if rsFrm.Fields("AHHN") = "2" then Check_AHHN_2 = "CHECKED"
							if rsFrm.Fields("AHHN") = "3" then Check_AHHN_3 = "CHECKED"
							if rsFrm.Fields("AHHN") = "4" then Check_AHHN_4 = "CHECKED"
							%>
							<td><input type=radio id=radAHHN name=radAHHN value="1" <%=Check_AHHN_1%>></td>
							<td><input type=radio id=radAHHN name=radAHHN value="2" <%=Check_AHHN_2%>></td>
							<td><input type=radio id=radAHHN name=radAHHN value="3" <%=Check_AHHN_3%>></td>
							<td><input type=radio id=radAHHN name=radAHHN value="4" <%=Check_AHHN_4%>></td>
							<td>Hiss/Hum/Noise</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("ASib") = "1" then Check_ASib_1 = "CHECKED"
							if rsFrm.Fields("ASib") = "2" then Check_ASib_2 = "CHECKED"
							if rsFrm.Fields("ASib") = "3" then Check_ASib_3 = "CHECKED"
							if rsFrm.Fields("ASib") = "4" then Check_ASib_4 = "CHECKED"
							%>
							<td><input type=radio id=radASib name=radASib value="1" <%=Check_ASib_1%>></td>
							<td><input type=radio id=radASib name=radASib value="2" <%=Check_ASib_2%>></td>
							<td><input type=radio id=radASib name=radASib value="3" <%=Check_ASib_3%>></td>
							<td><input type=radio id=radASib name=radASib value="4" <%=Check_ASib_4%>></td>
							<td>Sibilance</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("ALipSync") = "1" then Check_ALipSync_1 = "CHECKED"
							if rsFrm.Fields("ALipSync") = "2" then Check_ALipSync_2 = "CHECKED"
							if rsFrm.Fields("ALipSync") = "3" then Check_ALipSync_3 = "CHECKED"
							if rsFrm.Fields("ALipSync") = "4" then Check_ALipSync_4 = "CHECKED"
							%>
							<td><input type=radio id=radALipSync name=radALipSync value="1" <%=Check_ALipSync_1%>></td>
							<td><input type=radio id=radALipSync name=radALipSync value="2" <%=Check_ALipSync_2%>></td>
							<td><input type=radio id=radALipSync name=radALipSync value="3" <%=Check_ALipSync_3%>></td>
							<td><input type=radio id=radALipSync name=radALipSync value="4" <%=Check_ALipSync_4%>></td>
							<td>Lip Sync</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("AStereoPhase") = "1" then Check_AStereoPhase_1 = "CHECKED"
							if rsFrm.Fields("AStereoPhase") = "2" then Check_AStereoPhase_2 = "CHECKED"
							if rsFrm.Fields("AStereoPhase") = "3" then Check_AStereoPhase_3 = "CHECKED"
							if rsFrm.Fields("AStereoPhase") = "4" then Check_AStereoPhase_4 = "CHECKED"
							%>
							<td><input type=radio id=radAStereoPhase name=radAStereoPhase value="1" <%=Check_AStereoPhase_1%>></td>
							<td><input type=radio id=radAStereoPhase name=radAStereoPhase value="2" <%=Check_AStereoPhase_2%>></td>
							<td><input type=radio id=radAStereoPhase name=radAStereoPhase value="3" <%=Check_AStereoPhase_3%>></td>
							<td><input type=radio id=radAStereoPhase name=radAStereoPhase value="4" <%=Check_AStereoPhase_4%>></td>
							<td>Stereo Phase</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("AUpcuts") = "1" then Check_AUpcuts_1 = "CHECKED"
							if rsFrm.Fields("AUpcuts") = "2" then Check_AUpcuts_2 = "CHECKED"
							if rsFrm.Fields("AUpcuts") = "3" then Check_AUpcuts_3 = "CHECKED"
							if rsFrm.Fields("AUpcuts") = "4" then Check_AUpcuts_4 = "CHECKED"
							%>
							<td><input type=radio id=radAUpcuts name=radAUpcuts value="1" <%=Check_AUpcuts_1%>></td>
							<td><input type=radio id=radAUpcuts name=radAUpcuts value="2" <%=Check_AUpcuts_2%>></td>
							<td><input type=radio id=radAUpcuts name=radAUpcuts value="3" <%=Check_AUpcuts_3%>></td>
							<td><input type=radio id=radAUpcuts name=radAUpcuts value="4" <%=Check_AUpcuts_4%>></td>
							<td>Upcuts</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("ATestTones") = "1" then Check_ATestTones_1 = "CHECKED"
							if rsFrm.Fields("ATestTones") = "2" then Check_ATestTones_2 = "CHECKED"
							if rsFrm.Fields("ATestTones") = "3" then Check_ATestTones_3 = "CHECKED"
							if rsFrm.Fields("ATestTones") = "4" then Check_ATestTones_4 = "CHECKED"
							%>
							<td><input type=radio id=radATestTones name=radATestTones value="1" <%=Check_ATestTones_1%>></td>
							<td><input type=radio id=radATestTones name=radATestTones value="2" <%=Check_ATestTones_2%>></td>
							<td><input type=radio id=radATestTones name=radATestTones value="3" <%=Check_ATestTones_3%>></td>
							<td><input type=radio id=radATestTones name=radATestTones value="4" <%=Check_ATestTones_4%>></td>
							<td>Test Tones</td>
						</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
						<tr bgcolor=#999900>
							<td>&nbsp;&nbsp;1</td>
							<td>&nbsp;&nbsp;2</td>
							<td>&nbsp;&nbsp;3</td>
							<td>&nbsp;&nbsp;4</td>
							<td>Overall Quality</td>
						</tr>
						<tr bgcolor=#cccc99>
							<%
							if rsFrm.Fields("OQPrelim") = "1" then Check_OQPrelim_1 = "CHECKED"
							if rsFrm.Fields("OQPrelim") = "2" then Check_OQPrelim_2 = "CHECKED"
							if rsFrm.Fields("OQPrelim") = "3" then Check_OQPrelim_3 = "CHECKED"
							if rsFrm.Fields("OQPrelim") = "4" then Check_OQPrelim_4 = "CHECKED"
							%>
							<td><input type=radio id=radOQPrelim name=radOQPrelim value="1" <%=Check_OQPrelim_1%>></td>
							<td><input type=radio id=radOQPrelim name=radOQPrelim value="2" <%=Check_OQPrelim_2%>></td>
							<td><input type=radio id=radOQPrelim name=radOQPrelim value="3" <%=Check_OQPrelim_3%>></td>
							<td><input type=radio id=radOQPrelim name=radOQPrelim value="4" <%=Check_OQPrelim_4%>></td>
							<td>Preliminary</td>
						</tr>
						<tr bgcolor=#ffffcc>
							<%
							if rsFrm.Fields("OQFinal") = "1" then Check_OQFinal_1 = "CHECKED"
							if rsFrm.Fields("OQFinal") = "2" then Check_OQFinal_2 = "CHECKED"
							if rsFrm.Fields("OQFinal") = "3" then Check_OQFinal_3 = "CHECKED"
							if rsFrm.Fields("OQFinal") = "4" then Check_OQFinal_4 = "CHECKED"
							%>
							<td><input type=radio id=radOQFinal name=radOQFinal value="1" <%=Check_OQFinal_1%>></td>
							<td><input type=radio id=radOQFinal name=radOQFinal value="2" <%=Check_OQFinal_2%>></td>
							<td><input type=radio id=radOQFinal name=radOQFinal value="3" <%=Check_OQFinal_3%>></td>
							<td><input type=radio id=radOQFinal name=radOQFinal value="4" <%=Check_OQFinal_4%>></td>
							<td>Final</td>
						</tr>
					</table>				
				</TD>
			</TR>
		</TABLE>
		<table width=100%>
		<input type=hidden id=hdnQCNum name=hdnQCNum value="<%=sQCNum%>">
		<input type=hidden id=hdnRev name=hdnRev value="<%=sRev%>">
		<input type=hidden id=hdnJobNum name=hdnJobNum value="<%=sJobNum%>">
			<tr>
				<td align="right">
				<%if sLevel >= 1 then%>
					<INPUT type="submit" id="Action" name="Action" value="Save">&nbsp;&nbsp;&nbsp;&nbsp;
				<%end if%>
				</td>
			</tr>
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
