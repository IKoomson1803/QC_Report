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


sQCNum = Request.QueryString("sQCNum")
sJobNum = Request.QueryString("sJobNum")

updtQCDel = "UPDATE qcHeader " & _
"SET Deleted = 1 " & _
"WHERE QCNum = " & clng(sQCNum)

cnQCS.execute updtQCDel

cnQCS.Close
set cnQCS = nothing

Response.Write("<SCRIPT>")
Response.Write("parent('tree').navigate('../tree.asp?sJobNum=" & sJobNum & "');")
Response.Write("</SCRIPT>")

%>