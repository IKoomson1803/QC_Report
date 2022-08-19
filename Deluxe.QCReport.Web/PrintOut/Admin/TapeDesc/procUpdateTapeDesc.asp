<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
''Update to check for empty value - Isaac Koomson 16/01/2012
'********************
dim sql1,sTapeDesc
'********************

sTapeDesc = Request.Form("txtTapeDesc")

If sTapeDesc <> "" Then
  sql1 = "UPDATE optTapeDesc SET TapeDesc = '" & replace(Trim(sTapeDesc), "'", "''") & "' WHERE TapeDescID = " & cint(Request.Form("hdnTapeDescID"))
  cnQCS.Execute sql1
  cnQCS.close
  set cnQCS = nothing
End If

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>