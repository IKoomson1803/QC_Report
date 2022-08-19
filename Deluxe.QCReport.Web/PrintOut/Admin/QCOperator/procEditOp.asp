<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sFullName, sUserName, sLocation, sPhone, rsLoc, sSecLevel
dim nLocation, nSecLevel
dim sQCNum, sRev, sJobNum, sItemNum
dim sqlEdit, sqlLoc
'********************
sFullName = Request.Form("txtFullName")
sUserName = Request.Form("txtUserName")
sLocation = Request.Form("txtLocation")
sPhone = Request.Form("txtPhone")
sSecLevel = Request.Form("txtSecLevel")
select case sSecLevel
		case "Read Only"
			nSecLevel = 0
		case "Operator"
			nSecLevel = 1
		case "Supervisor"
			nSecLevel = 2
		case "Administrator"
			nSecLevel = 3
end select 
set rsLoc = server.CreateObject("ADODB.Recordset")
sqlLoc = "SELECT pkey FROM qcLocation WHERE Location = '" & sLocation & "'"
rsLoc.ActiveConnection = cnQCS
rsLoc.Open sqlLoc
nLocation = rsLoc.Fields("pkey")
rsLoc.Close
set rsLoc = nothing

	sqlEdit = "Update qcUsers " & _
				"SET FullName = '" & sFullName & "', " & _
					 "UserName = '" & sUserName & "', " & _
					 "Location = " & cint(nLocation) & ", " & _
					 "Phone = '" & sPhone & "', " & _
					 "SecurityLevel = " & nSecLevel & " " & _
				"WHERE UserName = '" & sUserName & "'"


cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.navigate("frmQCOperator.asp");
</script>
