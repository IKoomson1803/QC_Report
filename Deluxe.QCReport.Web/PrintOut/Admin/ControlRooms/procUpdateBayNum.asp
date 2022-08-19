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

IF Trim(Request.Form("txtBayNumber")) <> "" Then
   sql1 = "UPDATE optQCRoom SET BayNumber = '" & Trim(Request.Form("txtBayNumber")) & "' WHERE QCRoomID = " & cint(Request.Form("hdnQCRoomID"))
   cnQCS.Execute sql1
   cnQCS.close
  set cnQCS = nothing
End If

%>
<script language="javascript">
	self.opener.history.go();
	close();
</script>