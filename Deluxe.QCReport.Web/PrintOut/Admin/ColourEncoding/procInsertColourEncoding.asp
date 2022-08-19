<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, sColourEncoding
'********************

sColourEncoding = Request.Form("txtColourEncoding")

IF Trim(sColourEncoding) <> "" Then
   sColourEncoding = Replace(sColourEncoding,"'","''")
  sql = "INSERT INTO optColourEncoding (ColourEncoding) SELECT '" & sColourEncoding & "'"
  ''Check for duplicates
  sql = sql & " WHERE NOT EXISTS (SELECT NULL FROM optColourEncoding WHERE ColourEncoding ='" & sColourEncoding & "')"
  
  cnQCS.Execute sql
  cnQCS.close
  set cnQCS = nothing
End If

Response.Redirect("frmColourEncoding.asp")

%>
