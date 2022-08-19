<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sqlEdit
'********************

sqlEdit = "DELETE FROM optFormat WHERE FormatID = " & cint(Request.QueryString("FormatID"))

cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

