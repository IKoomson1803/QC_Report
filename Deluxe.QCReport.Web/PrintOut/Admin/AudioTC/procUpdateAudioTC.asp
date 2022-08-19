<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 17/01/1012
'Declarations
'********************
dim sql1, sAudioTC
'********************

sAudioTC = Trim(Request.Form("txtAudioTC"))

If sAudioTC <> "" Then
   sql1 = "UPDATE optAudioTC SET AudioTC = '" & sAudioTC & "' WHERE AudTCID = " & cint(Request.Form("hdnAudioTCID"))
   cnQCS.Execute sql1
   cnQCS.close
   set cnQCS = nothing
End If

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>
