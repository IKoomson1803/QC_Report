<%@ Language=VBScript %>
<%option explicit%>
<html>
	<script language="JavaScript">
	
	function CloseEdit()
		{ self.history.go(-1); }
  
	function IsEmpty(StringToCheck, IsPulldown) {
		var EmptyCheck = ""
		
		if (IsPulldown) {
			EmptyCheck = "document.forms[0]." + StringToCheck + ".options[document.forms[0]." + StringToCheck + ".selectedIndex].value.length"
			if (eval(EmptyCheck) < 1) {
				return true;
			} else {
				return false;
			}
			
		} else {
			EmptyCheck = "document.forms[0]." + StringToCheck + ".value.length"
			if (eval(EmptyCheck) < 1) {
				return true;
			} else {
				return false;
			}
		}
	}

	function VerifyData() {
		if (IsEmpty("Location")) {
			alert("Please enter the Location.");
			document.forms[0].Location.focus();
			return false;
		}
		if (IsEmpty("Address")) {
			alert("Please enter the Address.");
			document.forms[0].Address.focus();
			return false;
		}
		return true;
	}
	</script>
	<!--#include file="../../include/connect.asp"-->
	<%
	dim rsLoc, sqlLoc
	
	set rsLoc = server.CreateObject("ADODB.Recordset")
	sqlLoc = "SELECT pkey, Location FROM qcLocation ORDER BY Location"
	rsLoc.ActiveConnection = cnQCS
	rsLoc.Open sqlLoc
	%>
	<body bgcolor=#f5f5dc class="bodyForm">
	<b>Add Location</b>
	<form method="post" name="frmClientUpdate" action="procQCLoc.asp">
	<table align="center" id="tblTapeFormat">
		<tr>
			<td>
				Location</td>
			<td>
				<input type="text" id="Location" name="Location"></td>	
		</tr>
		<tr>
			<td>
				Address</td>
			<td>
				<TEXTAREA cols=50 rows=4 name="Address" id=Address></TEXTAREA></td>
		</tr>
		<tr>
			<td>&nbsp</td>
			<td>&nbsp</td>
		</tr>
		<tr>
			<td>
				<input type=submit name=subUpdate value="  Add  " onclick="if (VerifyData()){submit()} else {return false;}">
			</td>
			<td align="right">
				<input type=button name=btnCancel id=btnCancel value="Cancel" onclick="Javascript:CloseEdit()">
			</td>
		</tr>
	</table>
	</form>
	</body>
</html>

