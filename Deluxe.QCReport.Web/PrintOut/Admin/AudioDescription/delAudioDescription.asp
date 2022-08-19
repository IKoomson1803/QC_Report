<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'' Isaac Koomson - 16/01/1012
'Declarations
'********************
dim sqlEdit
'********************

sqlEdit = "DELETE FROM optAudio WHERE AudioID = " & cint(Request.QueryString("AudioID"))

cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

