<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sQCNum, sRev, sTimeID, sJobNum
dim sqlEdit
'********************

sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sJobNum = Request.QueryString("sJobNum")
sTimeID = Request.QueryString("sTimeID")

sqlEdit = "DELETE FROM qctime WHERE QCNum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " AND TimeID = " & clng(sTimeID)

cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

Response.Write("<script language='javascript'>")
	Response.write("self.navigate('frmLog.asp?frm=Log&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev & "');")
Response.Write("</script>")
%>
