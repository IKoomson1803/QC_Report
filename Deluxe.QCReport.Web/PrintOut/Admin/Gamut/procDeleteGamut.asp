<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, intGamutID
'********************

intGamutID = Request.QueryString("GamutID")

sql = "DELETE FROM optGamut WHERE GamutID = " & cint(intGamutID)

cnQCS.Execute sql
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

