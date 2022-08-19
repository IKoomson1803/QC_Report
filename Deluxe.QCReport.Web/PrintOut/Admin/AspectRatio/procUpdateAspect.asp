<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
''Updated to check for empty value - Isaac Koomson 16/01/2012 
'********************
dim sql1
'********************
IF Trim(Request.Form("txtAspectRatio")) <> "" Then
  sql1 = "UPDATE optAspectRatio SET AspectRatio = '" & Trim(Request.Form("txtAspectRatio")) & "' WHERE AspectID = " & cint(Request.Form("hdnAspectID"))
  cnQCS.Execute sql1
  cnQCS.close
  set cnQCS = nothing
End If

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>