<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
'' Updated to ckeck for empty value - Isaac Koomson 17/01/2012
'********************
dim sql1, sLang
'********************

sLang = Trim(Request.Form("txtLanguage"))

If sLang <> "" Then
  sql1 = "UPDATE optLanguage SET Language = '" & sLang & "' WHERE LangID = " & cint(Request.Form("hdnLangID"))
  cnQCS.Execute sql1
  cnQCS.close
  set cnQCS = nothing
End If

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>