<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, sVideoCodec
'********************

sVideoCodec = Request.Form("txtVideoCodec")

IF Trim(sVideoCodec) <> "" Then
   sVideoCodec = Replace(sVideoCodec,"'","''")
  sql = "INSERT INTO optVideoCodec (VideoCodec) SELECT '" & sVideoCodec & "'"
  ''Check for duplicates
  sql = sql & " WHERE NOT EXISTS (SELECT NULL FROM optVideoCodec WHERE VideoCodec ='" & sVideoCodec & "')"
  
  cnQCS.Execute sql
  cnQCS.close
  set cnQCS = nothing
End If

Response.Redirect("frmVideoCodec.asp")

%>
