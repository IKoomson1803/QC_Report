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
sItem = Request.Form("txtItem")
sDesc = Request.Form("txtDesc")
sLength = Request.Form("txtLength")
sTC = Request.Form("txtTC")

sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")
sItemNum = Request.Form("hdnItemNum")

	sqlEdit = "Update qcTapeFormat " & _
				"SET item_num = " & cint(sItemNum) & ", " & _
					 "Description = '" & replace(sDesc, "'", "''") & "', " & _
					 "Length = '" & sLength & "', " & _
					 "Time_code = '" & trim(sTC) & "' " & _
				"WHERE QCNum = " & clng(sQCNum) & " AND subQCNum = " & cint(sRev) & " AND Item_Num = " & cint(sItemNum)


cnQCS.Execute sqlEdit
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>