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

IF sAudioTC  <> "" Then
  sql1 = "INSERT INTO optAudioTC (AudioTC) SELECT '" & sAudioTC  & "'"
  ''Check for duplicates
  sql1 = sql1 & " WHERE NOT EXISTS (SELECT NULL FROM optAudioTC WHERE AudioTC ='" & sAudioTC  & "')" 
  cnQCS.Execute sql1
  cnQCS.close
  set cnQCS = nothing
End If


Response.Redirect("frmAudioTC.asp")

%>
