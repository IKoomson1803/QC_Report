<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'' Isaac Koomson - 24/09/1012
'Declarations
'********************
dim sql
'********************

sql = "DELETE FROM optVideoBitDepth WHERE VideoBitDepthID = " & cint(Request.QueryString("VideoBitDepthID"))

cnQCS.Execute sql
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

