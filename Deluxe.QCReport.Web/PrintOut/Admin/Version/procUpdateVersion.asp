<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
''Updated to check for empty value - Isaac Koomson 17/01/2012
'********************
dim sql1, sVersion
'********************

sVersion = Trim(Request.Form("txtVersion"))

If sVersion <> "" Then
   sql1 = "UPDATE optVersion SET Version = '" & sVersion & "' WHERE VersionID = " & cint(Request.Form("hdnVersionID"))
   cnQCS.Execute sql1
   cnQCS.close
  set cnQCS = nothing
End IF

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>