<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
'********************
dim sCustCode, sCustName, sCustAddress, sCustPhone, sGradingScale
dim insQCClientTable
'********************

sCustCode = trim(Request("CustCode"))
sCustName = trim(Request("CustName"))
sCustAddress = trim(Request("CustAddress"))
sCustPhone = trim(Request("CustPhone"))
sGradingScale = trim(Request("GradingScale"))

insQCClientTable = "INSERT INTO qcClients (CustCode, CustName, CustAddress, " _
	& "CustPhone, GradingScale) VALUES ('" & replace(sCustCode,"'","''") _
	& "','" & replace(sCustName,"'","''") & "','" & replace(sCustAddress, "'","''") _
	& "','" & sCustPhone & "'," & int(sGradingScale)& ")"

cnQCS.Execute insQCClientTable
cnQCS.close
set cnQCS = nothing

Response.Redirect("qcClients.asp")

%>