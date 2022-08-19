<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sQCNum, sRev, sItemNum, sJobNum
dim sqlEdit
'********************
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sJobNum = Request.QueryString("sJobNum")
sItemNum = Request.QueryString("sItem")

sqlEdit = "DELETE FROM qcTapeFormat WHERE QCNum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " AND Item_Num = " & cint(sItemNum)

cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

Response.Write("<script language='javascript'>")
Response.Write("self.navigate('frmTapeLayout.asp?frm=TapeLayout&sQCNum=" & sQCNum & "&sRev=" & sRev & "&sJobNum=" & sJobNum & "');")
Response.Write("</script>")
%>
