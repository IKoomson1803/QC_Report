<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<LINK rel="stylesheet" type="text/css" href="../css/cssForms.css">
<Title>Add New QC</Title>
</HEAD>
<script language="javascript">
  function CloseNewQC()
  { 
	  close(); 
  
  }
  
</script>
<!--#include file="../include/connect.asp"-->
<%
dim rsCombo
dim sqlCombo
%>
<BODY topmargin=3 bgcolor=#f5f5dc>
<table id="tblTapeFormat" width="500px" CellSpacing="10">
<form action="../tree.asp" target="tree" method=post name="frmSelect">
	<tr>
		<td align="right">*Job #: </td>
		<td>
			<input type=textbox id="txtJobNum" name="txtJobNum">
		</td>
	</tr>
	<tr>
		<td align="right">*Customer: </td>
		<td>
			<select id=selCustomer name=selCustomer>
				<option>Choose a Customer</option>
				<%
					set rsCombo = server.CreateObject("ADODB.Recordset")
					sqlCombo = "SELECT CustName FROM qcClients ORDER BY CustName"
					rsCombo.ActiveConnection = cnQCS
					rsCombo.Open sqlCombo
					
					do while not rsCombo.EOF
				%>
						<option><%=rsCombo.Fields("CustName")%></option>
				<%
					rsCombo.MoveNext
					loop
					rsCombo.Close
					set rsCombo = Nothing
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td align="right" valign="top">*QC Type: </td>
		<td>
			<!-- <input type="radio" id="radio1" name="rdoQCType" value="R">&nbsp;Restoration QC<br> -->
			<input type="radio" id="Radio2" name="rdoQCType" value="B">&nbsp;Broadcast QC<br>
			<input type="radio" id="Radio3" name="rdoQCType" value="A">&nbsp;Runtime QC<br>  <!--Used to be Approval QC -->
			<input type="radio" id="Radio3" name="rdoQCType" value="L">&nbsp;Runtime QC With Log<br> 
			<input type="radio" id="Radio3" name="rdoQCType" value="E">&nbsp;Runtime QC With Log For ESI<br> 
			<input type="radio" id="Radio3" name="rdoQCType" value="T">&nbsp;Runtime QC With Text Info<br> 
			<input type="radio" id="Radio4" name="rdoQCType" value="M">&nbsp;Master QC<br>
			<!--  <input type="radio" id="Radio4" name="rdoQCType" value="W">&nbsp;Warner Bros QC -->
		</td>
	
	</tr>
	
	<tr>
		
		<td align="right" valign="top" >*Asset Type:</td>
		<td>
			<input type="radio" id="rdoFile" name="rdoAssetType" value="File">&nbsp;File<br>
			<input type="radio" id="rdoTape" name="rdoAssetType" value="Tape">&nbsp;Tape<br> 
		</td>
	</tr>
	
	<tr>
		
		<td align="right" valign="top"   >&nbsp;</td>
		<td>* Specifies Mandatory field</td>
	</tr>
	
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align=right>
			<INPUT type="submit" value="Add New QC" id=btnSelect name=btnSelect onclick="javascript:CloseNewQC();">
			<INPUT type="button" value="Cancel" id=btnCancel name=btnCancel onclick="javascript:CloseNewQC()">
		</td>
	</tr>
</form>
</table>
</BODY>
</HTML>
