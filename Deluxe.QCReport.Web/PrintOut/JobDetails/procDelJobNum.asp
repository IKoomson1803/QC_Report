<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sQCNum, sJobNum
dim updtQCDel
'********************

sJobNum = Request.QueryString("sJobNum")

updtQCDel = "UPDATE qcHeader " & _
"SET Deleted = 1 " & _
"WHERE wonum = '" & sJobNum & "'"

cnQCS.execute updtQCDel

cnQCS.Close
set cnQCS = nothing
%>
<SCRIPT>
parent("tree").navigate("../tree.asp");
</SCRIPT>