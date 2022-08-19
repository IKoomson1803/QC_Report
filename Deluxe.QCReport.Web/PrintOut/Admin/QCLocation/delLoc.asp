<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
	dim delUser
	
	delUser = "DELETE FROM qcLocation WHERE pkey = " & cint(Request.QueryString("nLocID"))
	cnQCS.execute delUser
	cnQCS.close
	set cnQCS = nothing
	
	Response.Redirect("QCLoc.asp")	
%>