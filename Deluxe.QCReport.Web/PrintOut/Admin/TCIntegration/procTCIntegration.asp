<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 18/01/1012
'Declarations

'********************
dim sql1, sTCIntegration
'********************

sTCIntegration = Trim(Request.Form("txtTCIntegration"))

IF sTCIntegration  <> "" Then
  sql1 = "INSERT INTO optTCInteg (TCInteg) SELECT '" & sTCIntegration  & "'"
  ''Check for duplicates
  sql1 = sql1 & " WHERE NOT EXISTS (SELECT NULL FROM optTCInteg WHERE  TCInteg='" & sTCIntegration  & "')" 
  cnQCS.Execute sql1
  cnQCS.close
  set cnQCS = nothing
End If


Response.Redirect("frmTCIntegration.asp")

%>
