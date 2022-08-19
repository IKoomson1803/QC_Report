<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
'********************
dim sFullName, sUserName, sLocation, sPhone, sSecurityLevel
dim insQCClientOperator, sActive
'********************

sFullName = trim(Request("FullName"))
sUserName = trim(Request("UserName"))
sLocation = trim(Request("Location"))
sPhone = trim(Request("Phone"))
sSecurityLevel = trim(Request("SecurityLevel"))

sFullName = replace(sFullName, "'","''")
sUserName = replace(sUserName,"'","''")
sLocation = replace(sLocation,"'","''")


insQCClientOperator = "INSERT INTO qcUsers (Location, UserName, FullName, " _
	& "Phone, SecurityLevel) SELECT '" & sLocation _
	& "','" & sUserName & "','" & sFullName _
	& "','" & sPhone & "'," & cint(sSecurityLevel) _
	& " WHERE NOT EXISTS ( SELECT NULL FROM qcUsers WHERE UserName ='" & sUserName & "' AND  FullName='" & sFullName & "' )" 
	

cnQCS.Execute insQCClientOperator
cnQCS.close
set cnQCS = nothing

Response.Redirect("frmQCOperator.asp")

%>