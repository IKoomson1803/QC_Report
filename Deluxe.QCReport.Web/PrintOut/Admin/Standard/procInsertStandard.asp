<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 13/07/2017
'Declarations
'********************
dim sql, sStandard
'********************

sStandard = Request.Form("txtStandard")

IF Trim(sStandard) <> "" Then
   sStandard = Replace(sStandard,"'","''")
   sql = "INSERT INTO optStandard (Standard) SELECT '" & sStandard & "'"
  ''Check for duplicates
  sql = sql & " WHERE NOT EXISTS (SELECT NULL FROM optStandard WHERE Standard ='" & sStandard & "')"
  
  cnQCS.Execute sql
  cnQCS.close
  set cnQCS = nothing
End If

Response.Redirect("frmStandard.asp")

%>
