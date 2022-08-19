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
IF Trim(Request.Form("txtBayNum")) <> "" Then
   sql1 = "INSERT INTO optQCRoom (BayNumber) SELECT ('" & Trim(Request.Form("txtBayNum")) & "')"
   sql1 = sql1 & " WHERE NOT EXISTS ( SELECT NULL FROM optQCRoom WHERE BayNumber='" & Trim(Request.Form("txtBayNum")) & "')"
   cnQCS.Execute sql1
   cnQCS.close
   set cnQCS = nothing
End If

Response.Redirect("frmBayNumber.asp")

%>
