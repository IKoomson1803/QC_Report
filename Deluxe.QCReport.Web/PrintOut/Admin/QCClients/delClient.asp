<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
	dim delUser
	
	delUser = "DELETE FROM qcClients WHERE CustID = " & cint(Request.QueryString("nCustID"))
	cnQCS.execute delUser
	cnQCS.close
	set cnQCS = nothing
	
	Response.Redirect("QCClients.asp")	
%>