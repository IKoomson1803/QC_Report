<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'' Updated to escape single quotes - Isaac Koomson 18/01/2012
'********************
dim rsOperator
dim sJobNum, sQCNum, sRev, sFrm
dim sRevisedBy, sOperator, sBayNum, sTelecineOp, sQCVTR
dim sStockMfg, sStockBatch, sRecDate, sRecVTR, sRecFac
dim sSrcFormat, sSrcStandard, sSrcDesc, sAddInfo, sTextless
dim sql, updtHistory
'********************
sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")


sOperator = Request.Form("selOperator")


'Get User ID from qcUsers based on Operator Name
Set rsOperator = server.CreateObject("ADODB.Recordset")
sql = "SELECT qcUserID FROM qcUsers WHERE FullName = '" & sOperator & "'"
rsOperator.ActiveConnection = cnQCS
rsOperator.Open sql

updtHistory = "UPDATE qcHeader " & _
			"SET Revised_by = '" & Request.Form("txtRevBy") & "', " & _
			    "revised_date = '" & Now() & "', " & _
				"Operator = " & rsOperator.Fields(0) & ", " & _
				"Bay_num = '" & Request.Form("selBayNum") & "', " & _
				"QC_VTR = '" & Request.Form("txtQCVTR") & "', " & _
				"Stock_Mfg = '" & Request.Form("txtStockMfg") & "', " & _
				"Stock_Batch = '" & Request.Form("txtStockBatch") & "', " & _
				"Rec_Date = '" & Request.Form("txtRecDate") & "', " & _
				"Rec_VTR = '" & Request.Form("txtRecVTR") & "', " & _
				"Rec_Fac = '" & Request.Form("txtRecFac") & "', " & _
				"Src_Format = '" & Request.Form("selSourceFormat") & "', " & _
				"Src_Standard = '" & Request.Form("selSrcStandard") & "', " & _
				"src_desc = '" & Request.Form("selSrcDesc") & "', " & _
				"AddInfo = '" &  Replace(Request.Form("txtAddInfo"), "'", "''")     & "', " & _
				"Textless = '" & Request.Form("radTextless") & "', " & _
				"Duration = '" & replace(Request.Form("txtDuration"), "'", "''") & "' " & _
			"WHERE qcNum = " & clng(sQCNum) & " " & _
					"AND subQCNum = " & cint(sRev)
			
rsOperator.Close
set rsOperator = Nothing

cnQCS.Execute updtHistory

cnQCS.Close
Set cnQCS = Nothing

Response.Redirect("frmHistory.asp?frm=History&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev)

%>
