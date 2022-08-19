<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
	dim delUser
	
	delUser = "UPDATE qcUsers SET Deleted = 1 WHERE QCUserID = " & Request.QueryString("sQCUserID") 
	cnQCS.execute delUser
	cnQCS.close
	set cnQCS = nothing
	Response.Redirect("frmQCOperator.asp")	
%>