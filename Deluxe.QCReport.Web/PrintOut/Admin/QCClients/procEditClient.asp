<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sCustName, sCustCode, sAddress, nCustID, sPhone, nGrade
dim sqlEdit
'********************
nCustID = Request.Form("hdnCustID")
sCustCode = Request.Form("txtCustCode")
sCustName = Request.Form("txtCustName")
sAddress = Request.Form("txtAddress")
sPhone = Request.Form("txtPhone")
nGrade = Request.Form("GradingScale")


	sqlEdit = "Update qcClients " & _
				"SET CustCode = '" & sCustCode & "', " & _
				"CustName = '" & sCustName & "', " & _
				"CustAddress = '" & sAddress & "', " & _
				"CustPhone = '" & sPhone & "', " & _
				"GradingScale = " & cint(nGrade) & " " & _
				"WHERE CustID = " & cint(nCustID)


cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.navigate("QCClients.asp");
</script>
