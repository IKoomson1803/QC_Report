<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'' Isaac Koomson - 18/01/1012
'Declarations
'********************
dim sqlEdit
'********************

sqlEdit = "DELETE FROM optTCInteg WHERE TCIntegID = " & cint(Request.QueryString("TCIntegrationID"))

cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

