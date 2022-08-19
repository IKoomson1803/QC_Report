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

IF Trim(Request.Form("txtAudioDesc")) <> "" Then
  sql1 = "INSERT INTO optAudio (AudioDesc) SELECT '" & Trim(Request.Form("txtAudioDesc")) & "'"
  ''Check for duplicates
  sql1 = sql1 & " WHERE NOT EXISTS (SELECT NULL FROM optAudio WHERE AudioDesc ='" & Trim(Request.Form("txtAudioDesc")) & "')" 
  cnQCS.Execute sql1
  cnQCS.close
  set cnQCS = nothing
End If


Response.Redirect("frmAudioDescription.asp")

%>
