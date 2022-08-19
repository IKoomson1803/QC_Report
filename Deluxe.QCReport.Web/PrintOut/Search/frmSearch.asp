<%@ Language=VBScript %>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<LINK rel="stylesheet" type="text/css" href="../css/cssForms.css">
</HEAD>
<BODY topmargin=0 leftmargin=0 rightmargin=0 bgcolor=#f5f5dc>

<Table id="tblForm">
	<tr>
		<td>
			<b>Advanced Search</b>
		</td>
	</tr>
</table>
<table width=100% border=1 cellpadding=0 cellspacing=0>
	<tr height=0>
		<td></td>
	</tr>
</table>
<Table id="tblForm" width="100%">
<form id="frmSearch" name="frmSearch" method="post" action="listSearch.asp" target="results">
	<tr>
		<td>Tape Number:</td>
		<td><input type=textbox id="txtSrchBar" name="txtSrchBar"></td>
		<td>QC Operator:</td>
		<td><input type=textbox id="txtSrchOp" name="txtSrchOp"></td>
	</tr>
	<tr>
		<td>Client:</td>
		<td><input type=textbox id="txtSrchClient" name="txtSrchClient"></td>
		<td>Title:</td>
		<td><input type=textbox id="txtSrchTitle" name="txtSrchTitle"></td>
	</tr>
	<tr>
		<td>Episode Name:</td>
		<td><input type=textbox id="txtSrchEpisodeName" name="txtSrchEpisodeName"></td>
		<td>Episode Number:</td>
		<td><input type=textbox id="txtSrchEpisodeNumber" name="txtSrchEpisodeNumber"></td>
	</tr>
</table>
<table width=100% border=1 cellpadding=0 cellspacing=0>
	<tr height=0>
		<td></td>
	</tr>
</table>
<table id="tblForm">
	<tr>
		<td>Date</td>
		<td>&nbsp;&nbsp;&nbsp;</td>
		<td>From: <input type=textbox id="txtFromDate" name="txtFromDate"></td>
		<td>To: <input type=textbox id="txtToDate" name="txtToDate"></td>
	</tr>
</table>


<table width=100% border=1 cellpadding=0 cellspacing=0>
	<tr height=0>
		<td></td>
	</tr>
</table>
<table id="tblForm">
	<tr>
		<td valign="top">
		   <fieldset style="border:2px solid #808080;"  >
            <legend >Grading</legend>
		      <table>
		       <tr>
			     <td>&nbsp;&nbsp;&nbsp;</td>
				 <td style="width:40px;padding-left:10px;">1</td>
				 <td style="width:40px;padding-left:10px;">2</td>
				 <td style="width:40px;padding-left:10px;">3</td>
				 <td style="width:40px;padding-left:10px;">4</td>
				 <td style="width:40px;padding-left:10px;">5</td>
			   </tr>
		       <tr>
			     <td>Video:</td>
				 <td><input type="checkbox" id="chkGradeVideo_1" name="chkGradeVideo_1"></td>
				 <td><input type="checkbox" id="chkGradeVideo_2" name="chkGradeVideo_2"></td>
				 <td><input type="checkbox" id="chkGradeVideo_3" name="chkGradeVideo_3"></td>
				 <td><input type="checkbox" id="chkGradeVideo_4" name="chkGradeVideo_4"></td>
				 <td><input type="checkbox" id="chkGradeVideo_5" name="chkGradeVideo_5"></td>
			   </tr>
			    <tr>
			     <td>Audio:</td>
				 <td><input type="checkbox" id="chkGradeAudio_1" name="chkGradeAudio_1"></td>
				 <td><input type="checkbox" id="chkGradeAudio_2" name="chkGradeAudio_2"></td>
				 <td><input type="checkbox" id="chkGradeAudio_3" name="chkGradeAudio_3"></td>
				 <td><input type="checkbox" id="chkGradeAudio_4" name="chkGradeAudio_4"></td>
				 <td><input type="checkbox" id="chkGradeAudio_5" name="chkGradeAudio_5"></td>
			   </tr>
			   <tr>
			     <td>Overall:</td>
				 <td><input type="checkbox" id="chkGradeOverall_1" name="chkGradeOverall_1"></td>
				 <td><input type="checkbox" id="chkGradeOverall_2" name="chkGradeOverall_2"></td>
				 <td><input type="checkbox" id="chkGradeOverall_3" name="chkGradeOverall_3"></td>
				 <td><input type="checkbox" id="chkGradeOverall_4" name="chkGradeOverall_4"></td>
				 <td><input type="checkbox" id="chkGradeOverall_5" name="chkGradeOverall_5"></td>
			   </tr>
			   
		
		     </table>
		    </fieldset>
		</td>
		<td valign="top" style="padding-top:10px;">Status:</td>
		 <td valign="top" style="padding-top:10px;">
		    <select id="cboStatus" name="cboStatus">
		        <option value=""></option>
				<option value="PASSED">PASSED</option>
				<option value="FAILED">FAILED</option>
				<option value="HOLD">HOLD</option>
		    </select>
		 </td>
	</tr>
	
</table>



<table width=100% border=1 cellpadding=0 cellspacing=0>
	<tr height=0>
		<td></td>
	</tr>
</table>
<table id="tblForm">
	<tr>
		<td><input type=Submit id="subSearch" name="subSearch" value="Search">&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td><input type=reset id="btnReset" name="btnReset" value=" Reset "></td>
	</tr>
</form>
</table>
<iframe name="results" id="results" width="100%" height="60%" src="blank.asp">
</iframe>
</BODY>
</HTML>
