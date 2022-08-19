<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
'' Updated to check for duplicate and empty values - Isaac Koomson 16/01/2012
'********************
dim sql1,sFormat
'********************

sFormat = Request.Form("txtFormat")

If Trim(sFormat) <> "" Then
  sql1 = "UPDATE optFormat SET Format = '" & replace(Trim(sFormat),"'","''") & "' WHERE FormatID = " & cint(Request.Form("hdnFormatID"))
  cnQCS.Execute sql1
  cnQCS.close
  set cnQCS = nothing
End If

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>