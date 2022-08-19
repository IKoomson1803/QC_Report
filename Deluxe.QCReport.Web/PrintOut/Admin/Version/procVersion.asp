<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
'' Updated to check for duplicate and empty values - Isaac Koomson 17/01/2012
'********************
dim sql1, sVersion
'********************

sVersion = Trim(Request.Form("txtVersion"))

If sVersion <> "" Then
   sql1 = "INSERT INTO optVersion (Version) SELECT '" & sVersion & "'"
   sql1 = sql1 & " WHERE NOT EXISTS (SELECT NULL FROM optVersion WHERE Version = '" & sVersion & "')"
   cnQCS.Execute sql1
   cnQCS.close
  set cnQCS = nothing
End If

Response.Redirect("frmVersion.asp")

%>
