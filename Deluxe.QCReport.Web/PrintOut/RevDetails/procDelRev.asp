<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sQCNum, sRev
dim updtRevDel
'********************


sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")

updtRevDel = "UPDATE qcHeader " & _
"SET Deleted = 1 " & _
"WHERE QCNum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev)

cnQCS.execute updtRevDel

cnQCS.Close
set cnQCS = nothing

Response.Write("<SCRIPT>")
Response.Write("parent('tree').navigate('../tree.asp');")
Response.Write("</SCRIPT>")

%>