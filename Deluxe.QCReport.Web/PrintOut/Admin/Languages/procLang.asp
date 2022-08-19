<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
''Updated to check for duplicate and empty values - Isaac Koomson 17/01/2012
'********************
dim sql1, sLang
'********************

sLang = Trim(Request.Form("txtLanguage"))

If sLang <> "" Then
   sql1 = "INSERT INTO optLanguage (Language) SELECT '" & sLang & "'"
   sql1 = sql1  & " WHERE NOT EXISTS (SELECT NULL FROM optLanguage WHERE Language = '" & sLang & "')"
   cnQCS.Execute sql1
   cnQCS.close
   set cnQCS = nothing
End If   

Response.Redirect("frmLang.asp")

%>
