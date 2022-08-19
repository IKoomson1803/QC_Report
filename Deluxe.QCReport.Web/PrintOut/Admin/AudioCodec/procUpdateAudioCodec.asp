<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 24/09/1012
'Declarations
'********************
dim sql, sAudioCodec, intAudioCodecID
'********************

sAudioCodec = Request.Form("txtAudioCodec")
intAudioCodecID = Request.Form("hdnAudioCodecID")

If Trim(sAudioCodec) <> "" Then
    sAudioCodec = Replace(sAudioCodec,"'","''")
     ''Check for duplicates
     sql = "IF (SELECT COUNT(*) FROM optAudioCodec WHERE AudioCodec = '" & sAudioCodec  & "')= 0 "
	 sql = sql & " BEGIN "
	 sql = sql & " UPDATE optAudioCodec SET AudioCodec = '" & sAudioCodec & "' WHERE AudioCodecID = " & cint(intAudioCodecID )
     sql = sql & " END "

   cnQCS.Execute sql
   cnQCS.close
   set cnQCS = nothing
End If

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>
