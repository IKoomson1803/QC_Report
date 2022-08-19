<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sqlEdit
'********************

sqlEdit = "DELETE FROM optTapeDesc WHERE TapeDescID = " & cint(Request.QueryString("TapeDescID"))

cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

