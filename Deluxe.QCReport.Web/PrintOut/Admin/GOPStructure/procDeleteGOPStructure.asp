<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, intGOPStructureID
'********************

intGOPStructureID = Request.QueryString("GOPStructureID")

sql = "DELETE FROM optGOPStructure WHERE GOPStructureID = " & cint(intGOPStructureID)

cnQCS.Execute sql
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

