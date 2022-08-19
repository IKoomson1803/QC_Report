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
		if (IsEmpty("FullName")) {
			alert("Please enter the Full Name.");
			document.forms[0].FullName.focus();
			return false;
		}
		if (IsEmpty("UserName")) {
			alert("Please enter the User Name.");
			document.forms[0].UserName.focus();
			return false;
		}
		if (IsEmpty("Location")) {
			alert("Please enter the Location.");
			document.forms[0].Location.focus();
			return false;
		}
		if (IsEmpty("Phone")) { 
			alert("Please enter the Phone Number.");
			document.forms[0].Phone.focus();
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
	<body bgcolor=#f5f5dc class="bodyForm" topmargin=0>
	<b>Add a QC Operator</b>
	<table align="center">
	<form method="post" name="frmClientUpdate" action="procQCOperator.asp">
		<tr>
			<td>
				User Name:</td>
			<td>
				<input type="text" id="UserName" name="UserName"></td>	
		</tr>
		<tr>
			<td>
				Full Name:</td>
			<td>
				<input type="text" id="FullName" name="FullName"></td>
		</tr>
		<tr>
			<td>
				Location:</td>
			<td>
				<SELECT id="Location" name="Location">
				<%do while not rsLoc.EOF %>
				  <OPTION value="<%=rsLoc.Fields("pkey")%>"><%=rsLoc.Fields("Location")%></OPTION>
				<%rsLoc.MoveNext
				  loop
				  rsLoc.Close
				  set rsLoc = nothing
				%>
				</SELECT>
			</td>
		</tr>
		<tr>
			<td>
				Phone #:</td>
			<td>
				<input type="text" id="Phone" name="Phone" size="10" maxlength="10"></td>
		</tr>
		<tr>
			<td>
				Security Level:</td>
			<td>
				<select id="SecurityLevel" name="SecurityLevel">
				<option value="0">Read Only</option>
				<option value="1">Operator</option>
				<option value="2">Supervisor</option>
				<option value="3">Administrator</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>
				<input type=submit name=subUpdate value="Add User" onclick="if (VerifyData()){submit()} else {return false;}">
			</td>
			<td align="right">
				<input type=button name=btnCancel id=btnCancel value="Cancel" onclick="Javascript:CloseEdit()">			
			</td>
		</tr>
	</table>
	</form>
	</body>
</html>

