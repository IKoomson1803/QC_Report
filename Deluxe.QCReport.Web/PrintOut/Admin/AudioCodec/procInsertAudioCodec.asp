<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 24/09/1012
'Declarations
'********************
dim sql, sAudioCodec
'********************

sAudioCodec = Request.Form("txtAudioCodec")

IF Trim(sAudioCodec) <> "" Then
   sAudioCodec = Replace(sAudioCodec,"'","''")
  sql = "INSERT INTO optAudioCodec (AudioCodec) SELECT '" & sAudioCodec & "'"
  ''Check for duplicates
  sql = sql & " WHERE NOT EXISTS (SELECT NULL FROM optAudioCodec WHERE AudioCodec ='" & sAudioCodec & "')"
  
  cnQCS.Execute sql
  cnQCS.close
  set cnQCS = nothing
End If

Response.Redirect("frmAudioCodec.asp")

%>
