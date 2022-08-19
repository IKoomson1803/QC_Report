<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, sGOPStructure
'********************

sGOPStructure = Request.Form("txtGOPStructure")

IF Trim(sGOPStructure) <> "" Then
   sGOPStructure = Replace(sGOPStructure,"'","''")
  sql = "INSERT INTO optGOPStructure (GOPStructure) SELECT '" & sGOPStructure & "'"
  ''Check for duplicates
  sql = sql & " WHERE NOT EXISTS (SELECT NULL FROM optGOPStructure WHERE GOPStructure ='" & sGOPStructure & "')"
  
  cnQCS.Execute sql
  cnQCS.close
  set cnQCS = nothing
End If

Response.Redirect("frmGOPStructure.asp")

%>
