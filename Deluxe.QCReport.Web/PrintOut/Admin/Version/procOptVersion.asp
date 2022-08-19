<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../include/connect.asp"-->

<%
'********************
'Declarations
'********************
dim sVersionID, sVersionNumber
dim insOptVersion
'********************

sVersionID = trim(Request("VersionID"))
sVersion = trim(Request("VersionNumber"))


insOptVersion = "INSERT INTO optVersion (VersionNumber) VALUES ('" & replace(sVersionNumber,"'","''")

cnQCS.Execute insOptVersion
cnQCS.close
set cnQCS = nothing

Response.Redirect("frmOptVersion.asp")

%>