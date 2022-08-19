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

sql = "DELETE FROM optAudioBitDepth WHERE AudioBitDepthID = " & cint(Request.QueryString("AudioBitDepthID"))

cnQCS.Execute sql
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

