<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 18/01/1012
'Declarations
'********************
dim sql1, sTCIntegration
'********************

sTCIntegration = Trim(Request.Form("txtIntegrationTC"))

If sTCIntegration <> "" Then
   sql1 = "UPDATE optTCInteg SET TCInteg = '" & sTCIntegration & "' WHERE TCIntegID = " & cint(Request.Form("hdnIntergationTCID"))
   cnQCS.Execute sql1
   cnQCS.close
   set cnQCS = nothing
End If

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>
