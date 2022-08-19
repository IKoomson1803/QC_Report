<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 16/01/1012
'Declarations
'********************
dim sql1
'********************

If Trim(Request.Form("txtAudioDesc")) <> "" Then
   sql1 = "UPDATE optAudio SET AudioDesc = '" & Trim(Request.Form("txtAudioDesc")) & "' WHERE AudioID = " & cint(Request.Form("hdnAudioID"))
   cnQCS.Execute sql1
   cnQCS.close
   set cnQCS = nothing
End If

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>
