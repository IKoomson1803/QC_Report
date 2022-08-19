<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../include/connect.asp"-->

<%
'********************
'Declarations
'********************
dim sTeleOpID, sTOFullName, sPhone
dim insOPTTelecineOp
'********************

sTelecineOpID = trim(Request("TelecineOpID"))
sTOFullName = trim(Request("TOFullName"))
sPhone = trim(Request("Phone"))

insOPTTelecineOp = "INSERT INTO optTelecineOp (TOFullName, Phone) VALUES ('" & replace(sBayNumber,"'","''") _
		& "','" & replace(sUserName,"'","''")"

cnQCS.Execute insOPTTelecineOp
cnQCS.close
set cnQCS = nothing

Response.Redirect("frmTelecineOp.asp")

%>