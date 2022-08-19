<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, sGamut
'********************

sGamut = Request.Form("txtGamut")

IF Trim(sGamut) <> "" Then
   sGamut = Replace(sGamut,"'","''")
  sql = "INSERT INTO optGamut (Gamut) SELECT '" & sGamut & "'"
  ''Check for duplicates
  sql = sql & " WHERE NOT EXISTS (SELECT NULL FROM optGamut WHERE Gamut ='" & sGamut & "')"
  
  cnQCS.Execute sql
  cnQCS.close
  set cnQCS = nothing
End If

Response.Redirect("frmGamut.asp")

%>
