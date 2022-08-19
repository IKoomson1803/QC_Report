<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
''Updated to check for duplicate and empty values - Isaac Koomson 16/01/2012 
'********************
dim sql1
'********************

IF Trim(Request.Form("txtAspectRatio")) <> "" Then
  sql1 = "INSERT INTO optAspectRatio (AspectRatio) SELECT ('" & Trim(Request.Form("txtAspectRatio")) & "')"
  ''Check for duplicate
  sql1 = sql1 & " WHERE NOT EXISTS (SELECT NULL FROM optAspectRatio WHERE AspectRatio='" & Trim(Request.Form("txtAspectRatio")) & "')"
  cnQCS.Execute sql1
  cnQCS.close
  set cnQCS = nothing
End If


Response.Redirect("frmAspectRatio.asp")

%>
