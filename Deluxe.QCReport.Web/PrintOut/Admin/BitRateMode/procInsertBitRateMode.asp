<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, sBitRateMode
'********************

sBitRateMode = Request.Form("txtBitRateMode")

IF Trim(sBitRateMode) <> "" Then
   sBitRateMode = Replace(sBitRateMode,"'","''")
  sql = "INSERT INTO optBitRateMode (BitRateMode) SELECT '" & sBitRateMode & "'"
  ''Check for duplicates
  sql = sql & " WHERE NOT EXISTS (SELECT NULL FROM optBitRateMode WHERE BitRateMode ='" & sBitRateMode & "')"
  
  cnQCS.Execute sql
  cnQCS.close
  set cnQCS = nothing
End If

Response.Redirect("frmBitRateMode.asp")

%>
