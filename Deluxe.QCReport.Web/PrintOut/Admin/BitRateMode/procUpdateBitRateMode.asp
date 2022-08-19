<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, sBitRateMode, intBitRateModeID
'********************

sBitRateMode = Request.Form("txtBitRateMode")
intBitRateModeID = Request.Form("hdnBitRateModeID")

If Trim(sBitRateMode) <> "" Then
    sBitRateMode = Replace(sBitRateMode,"'","''")
     ''Check for duplicates
     sql = "IF (SELECT COUNT(*) FROM optBitRateMode WHERE BitRateMode = '" & sBitRateMode  & "')= 0 "
	 sql = sql & " BEGIN "
	 sql = sql & " UPDATE optBitRateMode SET BitRateMode = '" & sBitRateMode & "' WHERE BitRateModeID = " & cint(intBitRateModeID )
     sql = sql & " END "

   cnQCS.Execute sql
   cnQCS.close
   set cnQCS = nothing
End If

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>
