<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sLocation, sAddress, nLocID
dim sqlEdit
'********************
nLocID = Request.Form("hdnLocID")
sAddress = Request.Form("txtAddress")
sLocation = Request.Form("txtLoc")


	sqlEdit = "Update qcLocation " & _
				"SET Location = '" & sLocation & "', " & _
				"Address = '" & sAddress & "' " & _
				"WHERE pkey = " & cint(nLocID)


cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.navigate("QCLoc.asp");
</script>
