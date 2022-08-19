<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, intBitRateModeID
'********************

intBitRateModeID = Request.QueryString("BitRateModeID")

sql = "DELETE FROM optBitRateMode WHERE BitRateModeID = " & cint(intBitRateModeID)

cnQCS.Execute sql
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

