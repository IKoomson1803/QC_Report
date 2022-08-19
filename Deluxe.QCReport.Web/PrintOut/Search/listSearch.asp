<%@ Language=VBScript %>
<%option explicit


dim rsSearch, sqlSearch
dim sQCUser, sClient, sTitle, sToDate, sFromDate, sBarcode
dim nBarcode, nClientID, nQCUserID
dim sBGColor, sqlClient, sqlQCUser, sqlDate, sqlTitle
dim sCriteria, sBarCrit, sClientCrit, sQCUserCrit, sTitleCrit, sToCrit, sFromCrit
dim sEpisodeName, sEpisodeNumber,sEpisodeNameCrit,sEpisodeNumberCrit

''Added By Isaac Koomson 12/10/2015
dim sGradeVideo_1,sGradeVideo_2,sGradeVideo_3,sGradeVideo_4,sGradeVideo_5
dim sGradeAudio_1,sGradeAudio_2,sGradeAudio_3,sGradeAudio_4,sGradeAudio_5
dim sGradeOverall_1,sGradeOverall_2,sGradeOverall_3,sGradeOverall_4,sGradeOverall_5
dim sStatus

dim sGradeVideo_1Crit,sGradeVideo_2Crit,sGradeVideo_3Crit,sGradeVideo_4Crit,sGradeVideo_5Crit, sGradeVideoCrit
dim sGradeAudio_1Crit,sGradeAudio_2Crit,sGradeAudio_3Crit,sGradeAudio_4Crit,sGradeAudio_5Crit, sGradeAudioCrit
dim sGradeOverall_1Crit,sGradeOverall_2Crit,sGradeOverall_3Crit,sGradeOverall_4Crit,sGradeOverall_5Crit, sGradeOverallCrit
dim sStatusCrit

sBarcode = Request.Form("txtSrchBar")
sClient = Request.Form("txtSrchClient")
sQCUser = Request.Form("txtSrchOp")
sTitle = Request.Form("txtSrchTitle")
sFromDate = Request.Form("txtFromDate")
sToDate = Request.Form("txtToDate")
'' Added by Isaac Koomson 06/09/2012
sEpisodeName  = Request.Form("txtSrchEpisodeName")
sEpisodeNumber = Request.Form("txtSrchEpisodeNumber")

''Added By Isaac Koomson 12/10/2015
sGradeVideo_1 = Request.Form("chkGradeVideo_1")
sGradeVideo_2 = Request.Form("chkGradeVideo_2")
sGradeVideo_3 = Request.Form("chkGradeVideo_3")
sGradeVideo_4 = Request.Form("chkGradeVideo_4")
sGradeVideo_5 = Request.Form("chkGradeVideo_5")
sGradeAudio_1 = Request.Form("chkGradeAudio_1")
sGradeAudio_2 = Request.Form("chkGradeAudio_2")
sGradeAudio_3 = Request.Form("chkGradeAudio_3")
sGradeAudio_4 = Request.Form("chkGradeAudio_4")
sGradeAudio_5 = Request.Form("chkGradeAudio_5")
sGradeOverall_1 = Request.Form("chkGradeOverall_1")
sGradeOverall_2 = Request.Form("chkGradeOverall_2")
sGradeOverall_3 = Request.Form("chkGradeOverall_3")
sGradeOverall_4 = Request.Form("chkGradeOverall_4")
sGradeOverall_5 = Request.Form("chkGradeOverall_5")
sStatus = Request.Form("cboStatus")

' Response.Write "sGradeVideo_1: " +  sGradeVideo_1 + "<br/>"
' Response.Write "sGradeVideo_2: " +  sGradeVideo_2 + "<br/>"
' Response.Write "sGradeVideo_3: " +  sGradeVideo_3 + "<br/>"
' Response.Write "sGradeVideo_4: " +  sGradeVideo_4 + "<br/>"
' Response.Write "sGradeVideo_5: " +  sGradeVideo_5 + "<br/>"
''Response.Write "sStatus: " +  sStatus + "<br/>"
''Response.End

%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<LINK rel="stylesheet" type="text/css" href="../css/qcs.css">
</HEAD>
<!--#include file="../include/connect.asp"-->
<script language="javascript">
		function PopForm(nTimeID, nQCNum, nRev, sJobNum, sTC, sType, sFaultDesc, sGrade, sSector, sDuration, sMaster)
		{
			parent.frmLog.hdnTimeID.value = nTimeID;
			parent.frmLog.hdnQCNum.value = nQCNum;
			parent.frmLog.hdnRev.value = nRev;
			parent.frmLog.hdnJobNum.value = sJobNum;
			parent.frmLog.txtTC.value = sTC;
			parent.frmLog.selType.value = sType;
			parent.frmLog.txtDesc.value = sFaultDesc;
			parent.frmLog.selGrade.value = sGrade;
			parent.frmLog.selSect.value = sSector;
			parent.frmLog.txtDuratn.value = sDuration;
			//alert(sMaster);
			if (sMaster == "True"){
				parent.frmLog.cbxMaster.checked = true;
			}
			if (sMaster == "False"){
				parent.frmLog.cbxMaster.checked = false;
			}
			parent.frmLog.subUpdate.value = "Save";
			parent.frmLog.btnDel.disabled = false;
		}
		
		function setVariables()
		{
			if (navigator.appName == "Netscape")
			{
				v=".top=";
				dS="document.";
				sD="";
				y="window.pageYOffset";
				if (parseInt(navigator.appVersion) >= 4)
				{
					domove = "T"
				}
				else
				{
					domove = "F"
				}
			}
			else
			{
				if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.indexOf("MSIE 5") != -1)
				{
					domove = "T"
				}
				else
				{
					domove = "F"
				}
				v=".pixelTop=";
				dS="";
				sD=".style";
				y="document.body.scrollTop";
			}
		}
		function checkLocation() {
			if (domove == "T")
			{
				Aobject="object1";
				Bobject="object2";
				Cobject="object3";
				Dobject="object4";
				Eobject="object5";
				Fobject="object6";
				Gobject="object7";
				Hobject="object8";
				Iobject="object9";
				Jobject="object10";
				yy=eval(y);
				eval(dS+Aobject+sD+v+yy);
				eval(dS+Bobject+sD+v+yy);
				eval(dS+Cobject+sD+v+yy);
				eval(dS+Dobject+sD+v+yy);
				eval(dS+Eobject+sD+v+yy);
				eval(dS+Fobject+sD+v+yy);
				eval(dS+Gobject+sD+v+yy);
				eval(dS+Hobject+sD+v+yy);
				eval(dS+Iobject+sD+v+yy);
				eval(dS+Jobject+sD+v+yy);
				setTimeout("checkLocation()",10);
			}
		}
	//  End -->
	</script>

<%


if trim(sBarcode) <> "" then
	sBarCrit = " TapeNumber = '" & sBarcode & "' "
else
	sBarCrit = ""
end if

if trim(sClient) <> "" then
	sClientCrit = " CustName LIKE '%" & replace(sClient, " ", "%") & "%' "
else
	sClientCrit = ""
end if

if trim(sQCUser) <> "" then
	sQCUserCrit = " FullName LIKE '%" & replace(sQCUser, " ", "%") & "%' "
else
	sQCUserCrit = ""
end if

if trim(sTitle) <> "" then
    sTitle = replace( sTitle, " ", "%")
	sTitle  = replace(sTitle,"'","''")
	sTitleCrit = " Show LIKE '%" & sTitle & "%' "
else
	sTitleCrit = ""
end if

if trim(sEpisodeName) <> "" then
    sEpisodeName = replace( sEpisodeName, " ", "%")
	sEpisodeName  = replace(sEpisodeName,"'","''")
	sEpisodeNameCrit = "  Epis_Name LIKE '%" & sEpisodeName & "%' "
else
	sEpisodeNameCrit = ""
end if

if trim(sEpisodeNumber) <> "" then
	sEpisodeNumberCrit = "  Epis_no LIKE '%" & replace(sEpisodeNumber, " ", "%") & "%' "
else
	sEpisodeNumberCrit = ""
end if

if trim(sFromDate) <> "" then
	sFromCrit = " QC_Date >= '" & sFromDate & "' "
else
	sFromCrit = ""
end if

if trim(sToDate) <> "" then
	sToCrit = " QC_Date <= '" & sToDate & "' "
else
	sToCrit = ""
end if

''Added By Isaac Koomson 12/10/2015
if trim(sGradeVideo_1) <> "" and trim(sGradeVideo_1) = "on"  then
   sGradeVideo_1Crit = " grdVideo = 1  " 
else
   sGradeVideo_1Crit = ""
end if

if trim(sGradeVideo_2) <> "" and trim(sGradeVideo_2) = "on"  then
   sGradeVideo_2Crit = " grdVideo = 2  " 
else
   sGradeVideo_2Crit = ""
end if

if trim(sGradeVideo_3) <> "" and trim(sGradeVideo_3) = "on"  then
   sGradeVideo_3Crit = " grdVideo = 3  " 
else
   sGradeVideo_3Crit = ""
end if

if trim(sGradeVideo_4) <> "" and trim(sGradeVideo_4) = "on"  then
   sGradeVideo_4Crit = " grdVideo = 4  " 
else
   sGradeVideo_4Crit = ""
end if

if trim(sGradeVideo_5) <> "" and trim(sGradeVideo_5) = "on"  then
   sGradeVideo_5Crit = " grdVideo = 5  " 
else
   sGradeVideo_5Crit = ""
end if

if trim(sGradeAudio_1) <> "" and trim(sGradeAudio_1) = "on"  then
   sGradeAudio_1Crit = " grdAudio = 1  " 
else
   sGradeAudio_1Crit = ""
end if

if trim(sGradeAudio_2) <> "" and trim(sGradeAudio_2) = "on"  then
   sGradeAudio_2Crit = " grdAudio = 2  " 
else
   sGradeAudio_2Crit = ""
end if

if trim(sGradeAudio_3) <> "" and trim(sGradeAudio_3) = "on"  then
   sGradeAudio_3Crit = " grdAudio = 3  " 
else
   sGradeAudio_3Crit = ""
end if

if trim(sGradeAudio_4) <> "" and trim(sGradeAudio_4) = "on"  then
   sGradeAudio_4Crit = " grdAudio = 4  " 
else
   sGradeAudio_4Crit = ""
end if

if trim(sGradeAudio_5) <> "" and trim(sGradeAudio_5) = "on"  then
   sGradeAudio_5Crit = " grdAudio = 5  " 
else
   sGradeAudio_5Crit = ""
end if

if trim(sGradeOverall_1) <> "" and trim(sGradeOverall_1) = "on"  then
   sGradeOverall_1Crit = " grdOverall = 1  " 
else
   sGradeOverall_1Crit = ""
end if

if trim(sGradeOverall_2) <> "" and trim(sGradeOverall_2) = "on"  then
   sGradeOverall_2Crit = " grdOverall = 2  " 
else
   sGradeOverall_2Crit = ""
end if

if trim(sGradeOverall_3) <> "" and trim(sGradeOverall_3) = "on"  then
   sGradeOverall_3Crit = " grdOverall = 3  " 
else
   sGradeOverall_3Crit = ""
end if

if trim(sGradeOverall_4) <> "" and trim(sGradeOverall_4) = "on"  then
   sGradeOverall_4Crit = " grdOverall = 4  " 
else
   sGradeOverall_4Crit = ""
end if

if trim(sGradeOverall_5) <> "" and trim(sGradeOverall_5) = "on"  then
   sGradeOverall_5Crit = " grdOverall = 5  " 
else
   sGradeOverall_5Crit = ""
end if

if trim(sStatus <> "")  then
   sStatusCrit = " Eval_Stat = '" & trim(sStatus) & "' "
else
   sStatusCrit = ""
end if

if (trim(sBarcode) = "") and (trim(sClient) = "") and (trim(sQCUser) = "") and (trim(sTitle) = "") and  (trim(sFromDate) = "") and (trim(sToDate) = "") And (trim(sEpisodeName) = "") And (trim(sEpisodeNumber) = "") and _
 (trim(sGradeVideo_1) = "") and (trim(sGradeVideo_2) = "")  and (trim(sGradeVideo_3) = "") and (trim(sGradeVideo_4) = "") and (trim(sGradeVideo_5) = "") and _
  (trim(sGradeAudio_1) = "")  and (trim(sGradeAudio_2) = "")  and (trim(sGradeAudio_3) = "")   and (trim(sGradeAudio_4) = "")   and (trim(sGradeAudio_5) = "")  and  _
 (trim(sGradeOverall_1) = "")  and (trim(sGradeOverall_2) = "")    and (trim(sGradeOverall_3) = "")  and (trim(sGradeOverall_4) = "")   and (trim(sGradeOverall_5) = "")  and  _
 (trim(sStatus) = "") then
	sCriteria = ""
else
	sCriteria = "WHERE"
	if (trim(sBarcode) <> "") then
		sCriteria = sCriteria & sBarCrit
	end if
	if trim(sClient) <> "" Then
		if sCriteria = "WHERE" then
			sCriteria = sCriteria & sClientCrit
		else
			sCriteria = sCriteria & "AND" & sClientCrit
		end if
	end if
	if trim(sQCUser) <> "" Then
		if sCriteria = "WHERE" then
			sCriteria = sCriteria & sQCUserCrit
		else
			sCriteria = sCriteria & "AND" & sQCUserCrit
		end if
	end if
	if trim(sTitle) <> "" Then
		if sCriteria = "WHERE" then
			sCriteria = sCriteria & sTitleCrit
		else
			sCriteria = sCriteria & "AND" & sTitleCrit
		end if	
	end if
	
	if trim(sEpisodeName) <> "" then
	  if sCriteria = "WHERE" then
			sCriteria = sCriteria & sEpisodeNameCrit
		else
			sCriteria = sCriteria & "AND" & sEpisodeNameCrit
		end if	
	End If
	
	if trim(sEpisodeNumber) <> "" then
	   if sCriteria = "WHERE" then
			sCriteria = sCriteria & sEpisodeNumberCrit
		else
			sCriteria = sCriteria & "AND" & sEpisodeNumberCrit
		end if	
	End IF
	
	if trim(sFromDate) <> "" then
		if sCriteria = "WHERE" then
			sCriteria = sCriteria & sFromCrit 
		else
			sCriteria = sCriteria & "AND" & sFromCrit 
		end if
	end if
	if trim(sToDate) <> "" then
		if sCriteria = "WHERE" then
			sCriteria = sCriteria & sToCrit 
		else
			sCriteria = sCriteria & "AND" & sToCrit 
		end if
	end if
			
	''Added By Isaac Koomson 12/10/2015
	
	if trim(sStatusCrit) <> "" then
		if sCriteria = "WHERE" then
			sCriteria = sCriteria & sStatusCrit
		else
			sCriteria = sCriteria & "AND" & sStatusCrit
		end if
	end if
	
	''*************Video Grading******************************************************''
		
	sGradeVideoCrit  = ""

	if (trim(sGradeVideo_1Crit) <> "") or (trim(sGradeVideo_2Crit) <> "")  or (trim(sGradeVideo_3Crit) <> "") or (trim(sGradeVideo_4Crit) <> "") or (trim(sGradeVideo_5Crit) <> "") then
	  
		sGradeVideoCrit  = " ("
		
		if trim(sGradeVideo_1Crit) <> "" then
			 sGradeVideoCrit = sGradeVideoCrit & sGradeVideo_1Crit
		end if
		
		if trim(sGradeVideo_2Crit) <> "" then
			 if sGradeVideoCrit  = " (" then
				sGradeVideoCrit = sGradeVideoCrit & sGradeVideo_2Crit
			 else
				sGradeVideoCrit = sGradeVideoCrit & "OR" & sGradeVideo_2Crit
			 end if
		end if
		
		if trim(sGradeVideo_3Crit) <> "" then
			 if sGradeVideoCrit  = " (" then
				sGradeVideoCrit = sGradeVideoCrit & sGradeVideo_3Crit
			 else
				sGradeVideoCrit = sGradeVideoCrit & "OR" & sGradeVideo_3Crit
			 end if
		end if
		
		if trim(sGradeVideo_4Crit) <> "" then
			 if sGradeVideoCrit  = " (" then
				sGradeVideoCrit = sGradeVideoCrit & sGradeVideo_4Crit
			 else
				sGradeVideoCrit = sGradeVideoCrit & "OR" & sGradeVideo_4Crit
			 end if
		end if
		
		if trim(sGradeVideo_5Crit) <> "" then
			 if sGradeVideoCrit  = " (" then
				sGradeVideoCrit = sGradeVideoCrit & sGradeVideo_5Crit
			 else
				sGradeVideoCrit = sGradeVideoCrit & "OR" & sGradeVideo_5Crit
			 end if
		end if

	  sGradeVideoCrit  =  sGradeVideoCrit & ") "
	  
	end if
	
	if trim(sGradeVideoCrit) <> "" then
		if sCriteria = "WHERE" then
			sCriteria = sCriteria & sGradeVideoCrit 
		else
			sCriteria = sCriteria & "AND" & sGradeVideoCrit
		end if
	end if
	
	''*************Audio Grading******************************************************''
	sGradeAudioCrit  = ""

	if (trim(sGradeAudio_1Crit) <> "") or (trim(sGradeAudio_2Crit) <> "")  or (trim(sGradeAudio_3Crit) <> "") or (trim(sGradeAudio_4Crit) <> "") or (trim(sGradeAudio_5Crit) <> "") then
	  
		sGradeAudioCrit  = " ("
		
		if trim(sGradeAudio_1Crit) <> "" then
			 sGradeAudioCrit = sGradeAudioCrit & sGradeAudio_1Crit
		end if
		
		if trim(sGradeAudio_2Crit) <> "" then
			 if sGradeAudioCrit  = " (" then
				sGradeAudioCrit = sGradeAudioCrit & sGradeAudio_2Crit
			 else
				sGradeAudioCrit = sGradeAudioCrit & "OR" & sGradeAudio_2Crit
			 end if
		end if
		
		if trim(sGradeAudio_3Crit) <> "" then
			 if sGradeAudioCrit  = " (" then
				sGradeAudioCrit = sGradeAudioCrit & sGradeAudio_3Crit
			 else
				sGradeAudioCrit = sGradeAudioCrit & "OR" & sGradeAudio_3Crit
			 end if
		end if
		
		if trim(sGradeAudio_4Crit) <> "" then
			 if sGradeAudioCrit  = " (" then
				sGradeAudioCrit = sGradeAudioCrit & sGradeAudio_4Crit
			 else
				sGradeAudioCrit = sGradeAudioCrit & "OR" & sGradeAudio_4Crit
			 end if
		end if
		
		if trim(sGradeAudio_5Crit) <> "" then
			 if sGradeAudioCrit  = " (" then
				sGradeAudioCrit = sGradeAudioCrit & sGradeAudio_5Crit
			 else
				sGradeAudioCrit = sGradeAudioCrit & "OR" & sGradeAudio_5Crit
			 end if
		end if

	  sGradeAudioCrit  =  sGradeAudioCrit & ") "
	  
	end if
	
	if trim(sGradeAudioCrit) <> "" then
		if sCriteria = "WHERE" then
			sCriteria = sCriteria & sGradeAudioCrit 
		else
			sCriteria = sCriteria & "AND" & sGradeAudioCrit
		end if
	end if
		
	''*************Overall Grading******************************************************''
	
	sGradeOverallCrit  = ""

	if (trim(sGradeOverall_1Crit) <> "") or (trim(sGradeOverall_2Crit) <> "")  or (trim(sGradeOverall_3Crit) <> "") or (trim(sGradeOverall_4Crit) <> "") or (trim(sGradeOverall_5Crit) <> "") then
	  
		sGradeOverallCrit  = " ("
		
		if trim(sGradeOverall_1Crit) <> "" then
			 sGradeOverallCrit = sGradeOverallCrit & sGradeOverall_1Crit
		end if
		
		if trim(sGradeOverall_2Crit) <> "" then
			 if sGradeOverallCrit  = " (" then
				sGradeOverallCrit = sGradeOverallCrit & sGradeOverall_2Crit
			 else
				sGradeOverallCrit = sGradeOverallCrit & "OR" & sGradeOverall_2Crit
			 end if
		end if
		
		if trim(sGradeOverall_3Crit) <> "" then
			 if sGradeOverallCrit  = " (" then
				sGradeOverallCrit = sGradeOverallCrit & sGradeOverall_3Crit
			 else
				sGradeOverallCrit = sGradeOverallCrit & "OR" & sGradeOverall_3Crit
			 end if
		end if
		
		if trim(sGradeOverall_4Crit) <> "" then
			 if sGradeOverallCrit  = " (" then
				sGradeOverallCrit = sGradeOverallCrit & sGradeOverall_4Crit
			 else
				sGradeOverallCrit = sGradeOverallCrit & "OR" & sGradeOverall_4Crit
			 end if
		end if
		
		if trim(sGradeOverall_5Crit) <> "" then
			 if sGradeOverallCrit  = " (" then
				sGradeOverallCrit = sGradeOverallCrit & sGradeOverall_5Crit
			 else
				sGradeOverallCrit = sGradeOverallCrit & "OR" & sGradeOverall_5Crit
			 end if
		end if

	  sGradeOverallCrit  =  sGradeOverallCrit & ") "
	  
	end if
	
	if trim(sGradeOverallCrit) <> "" then
		if sCriteria = "WHERE" then
			sCriteria = sCriteria & sGradeOverallCrit 
		else
			sCriteria = sCriteria & "AND" & sGradeOverallCrit
		end if
	end if
		
	''****************************************************************************
		
end if

''If no search criteria then don't return any records
if sCriteria = "" then
   sCriteria = "WHERE 1 = 2 "
end if

''Response.Write "Criteria:" & sCriteria 
''Response.end

	set rsSearch = server.CreateObject("ADODB.recordset")
	
	sqlSearch = "SELECT top 2000 woNum, QCNum, subqcnum, CustName, FullName, TapeNumber, Show, Epis_Name, Epis_no, QC_Date, " & _
	" Eval_Stat, grdVideo, grdAudio, grdOverall,Version  FROM qcHeader a " & _
	"LEFT OUTER JOIN qcClients b ON a.custid = b.custid " & _
	"LEFT OUTER JOIN qcUsers c ON a.operator = c.qcUserID " & _
	"" & sCriteria & " AND a.Deleted = 0 ORDER BY wonum, qcNum, subQCNum"
	
	rsSearch.ActiveConnection = cnQCS
	'Response.Write(sqlSearch)
	'Response.End
	rsSearch.Open sqlSearch
%>
<BODY topmargin=0 rightmargin=0 leftmargin=0 bgcolor=#f5f5dc OnLoad="setVariables();checkLocation()">
<table id="tblForm" cellpadding=0 cellspacing=0 width="100%">
	<tr>
		<td>&nbsp;&nbsp;&nbsp</td>
	</tr>
	<tr>
	<td>
	<table id="tblForm" cellpadding=0 cellspacing=0 width="100%">
					<tr bgcolor="#f5f5dc">
						<td valign="bottom" >
						<div id="object1" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Job Num</b>
						</font></div>
						</td>
						<td valign="bottom" >
						<div id="object2" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>QC Num</b>
						</font></div>
						</td>
						<td valign="bottom" >
						<div id="object3" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Rev.</b>
						</font></div>
						</td>
						<td valign="bottom" >
						<div id="object4" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Tape Num</b>
						</font></div>
						</td>
						<td valign="bottom" >
						<div id="object5" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Operator</b>
						</font></div>
						</td>
						<td valign="bottom" >
						<div id="object6" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Client</b>
						</font></div>
						</td>
						<td valign="bottom" >
						<div id="object7" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Title</b>
						</font></div>
						</td>
						<td valign="bottom" >
						<div id="object9" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Ep. Name</b>
						</font></div>
						</td>
						<td valign="bottom" >
						<div id="object10" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Ep. Number</b>
						</font></div>
						</td>
						<td valign="bottom" >
						<div id="object8" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>QC Date</b>
						</font></div>
						</td>
						<!-- ''Added By Isaac Koomson 12/10/2015 -->
						<td valign="bottom" >
						<div id="object8" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Status</b>
						</font></div>
						</td>
						<td valign="bottom" >
						<div id="object8" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Grd. Video </b>
						</font></div>
						</td>
						<td valign="bottom" >
						<div id="object8" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Grd. Audio </b>
						</font></div>
						</td>
						<td valign="bottom" >
						<div id="object8" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Grd. Orverall </b>
						</font></div>
						</td>
						<td valign="bottom" >
						<div id="object8" style="position:relative; visibility:show; z-index:2; background-color:#999900; layer-background-color:#999900;">
						<font face=tahoma size="1" color="black">
						<b>Version </b>
						</font></div>
						</td>
					</tr>
<%if (not(rsSearch.BOF) and not(rsSearch.EOF)) then 'Builds list of Companys%>
		<%sBGColor = ""%>
  <%do while not rsSearch.EOF response.flush %>
		<tr bgcolor=<%=sBGColor%>>
			<td><a href="../tree.asp?sJobNum=<%=rsSearch.Fields("wonum")%>" target="tree">
				<%=rsSearch.Fields("wonum")%></a></td>
			<td><a href="../tree.asp?sQCNum=<%=rsSearch.Fields("QCNum")%>" target="tree">
				<%=rsSearch.Fields("QCNum")%></td>
			<td><%=rsSearch.Fields("subQCNum")%></td>
			<td><%=rsSearch.Fields("TapeNumber")%></td>
			<td><%=rsSearch.Fields("FullName")%></td>
			<td width="70"><%=rsSearch.Fields("CustName")%></td>
			<td width="100"><%=rsSearch.Fields("Show")%></td>
			<td width="100"><%=rsSearch.Fields("Epis_Name")%></td>
			<td width="100"><%=rsSearch.Fields("Epis_No")%></td>
			<td><%=rsSearch.Fields("QC_Date")%></td>
			<td><%=rsSearch.Fields("Eval_Stat")%></td>
			<td><%=rsSearch.Fields("grdVideo")%></td>
			<td><%=rsSearch.Fields("grdAudio")%></td>
			<td><%=rsSearch.Fields("grdOverall")%></td>
			<td><%=rsSearch.Fields("Version")%></td>
		</tr>
		<% rsSearch.MoveNext
		If sBGColor = "" Then
			sBGColor = "#cccc99"
		Else
			sBGColor = ""
		End If	
	loop
  	rsSearch.Close
	set rsSearch = Nothing 
  else
		Response.Write("<tr><td colspan='7'>No Records Found...</td></tr>")
  end if %>
    </table>
    </td>
   </tr>
</table>


</BODY>
</HTML>
