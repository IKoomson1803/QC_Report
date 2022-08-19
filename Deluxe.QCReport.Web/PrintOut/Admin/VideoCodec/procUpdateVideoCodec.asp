<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, sVideoCodec, intVideoCodecID
'********************

sVideoCodec = Request.Form("txtVideoCodec")
intVideoCodecID = Request.Form("hdnVideoCodecID")

If Trim(sVideoCodec) <> "" Then
    sVideoCodec = Replace(sVideoCodec,"'","''")
     ''Check for duplicates
     sql = "IF (SELECT COUNT(*) FROM optVideoCodec WHERE VideoCodec = '" & sVideoCodec  & "')= 0 "
	 sql = sql & " BEGIN "
	 sql = sql & " UPDATE optVideoCodec SET VideoCodec = '" & sVideoCodec & "' WHERE VideoCodecID = " & cint(intVideoCodecID )
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
