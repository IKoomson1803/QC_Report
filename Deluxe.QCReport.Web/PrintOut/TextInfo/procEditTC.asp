<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim sItem, sDesc, sLength, sTC
dim sQCNum, sRev, sJobNum, sItemNum
dim sqlEdit
'********************


sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")


	sqlEdit = "Update qcTextInfo " & _
				"SET TextInfo = '" & Request.Form("txtText") & "', " & _
					 "TimeCodeIn = '" & Request.Form("txtTCIn") & "', " & _
					 "TimeCodeOut = '" & Request.Form("txtTCOut") & "' " & _
				"WHERE QCNum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " AND TextInfoID = " & clng(Request.Form("hdnTextInfoID"))


cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>