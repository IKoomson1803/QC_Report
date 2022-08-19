<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'' Isaac Koomson - 17/01/1012
'Declarations
'********************
dim sqlEdit
'********************

sqlEdit = "DELETE FROM optAudioTC WHERE AudTCID = " & cint(Request.QueryString("AudioTCID"))

cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

