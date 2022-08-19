<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sQCNum, sRev, sID, sJobNum
dim sqlEdit
'********************
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sID = Request.QueryString("sID")
sJobNum = Request.QueryString("sJobNum")

sqlEdit = "DELETE FROM qcTextInfo WHERE QCNum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " AND TextInfoID = " & clng(sID)

cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing



Response.Write("<script language='javascript'>")
	Response.write("self.navigate('frmTextInfo.asp?frm=TextInfo&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev & "');")
Response.Write("</script>")

%>
