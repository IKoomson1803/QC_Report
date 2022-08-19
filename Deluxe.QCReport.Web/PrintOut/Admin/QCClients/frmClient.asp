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
		if (IsEmpty("CustCode")) {
			alert("Please enter the Customer Code.");
			document.forms[0].CustCode.focus();
			return false;
		}
		if (IsEmpty("CustName")) {
			alert("Please enter the Customer Name.");
			document.forms[0].CustName.focus();
			return false;
		}
		if (IsEmpty("CustAddress")) {
			alert("Please enter the Customer Address.");
			document.forms[0].CustAddress.focus();
			return false;
		}
		if (IsEmpty("CustPhone")) { 
			alert("Please enter the Phone Number.");
			document.forms[0].CustPhone.focus();
			return false;
		}
		return true;
	}
	</script>
	<LINK rel="stylesheet" type="text/css" href="../../css/qcs.css">
	<body bgcolor=#f5f5dc>
	<b>Add a New Client</b>
	<table align="center" id="tblTapeFormat">
	<form method="post" name="frmClientUpdate" action="procClient.asp">
		<tr>
			<td>
				Customer Code</td>
			<td>
				<input type="text" id="CustCode" name="CustCode"></td>	
		</tr>
		<tr>
			<td>
				Customer Name</td>
			<td>
				<input type="text" id="CustName" name="CustName"></td>
		</tr>
		<tr>
			<td>
				Address</td>
			<td>
				<input size=45 type="text" id="CustAddress" name="CustAddress"></td>
		</tr>
		<tr>
			<td>
				Phone #</td>
			<td>
				<input type="text" id="CustPhone" name="CustPhone" size="20" maxlength="20"></td>
		</tr>
		<tr>
			<td>
				Grading Scale</td>
			<td>
				<select id="GradingScale" name="GradingScale">
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp</td>
		</tr>
		<tr>
			<td>
				<input type=submit name=subUpdate value="Add Client" onclick="if (VerifyData()){submit()} else {return false;}">
			</td>
			<td align="right">
				<input type=button name=btnCancel id=btnCancel value="Cancel" onclick="Javascript:CloseEdit()">			
			</td>
		</tr>
	</table>
	</form>
	</body>
</html>

