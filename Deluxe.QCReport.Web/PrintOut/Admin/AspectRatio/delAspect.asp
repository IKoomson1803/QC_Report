<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sqlEdit
'********************

sqlEdit = "DELETE FROM optAspectRatio WHERE AspectID = " & cint(Request.QueryString("AspectID"))

cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

