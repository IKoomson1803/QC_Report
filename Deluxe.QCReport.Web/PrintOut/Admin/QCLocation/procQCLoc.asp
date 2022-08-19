<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
'********************
dim sLocation, sAddress
dim insLoc
'********************

sLocation = trim(Request("Location"))
sAddress = trim(Request("Address"))

insLoc = "INSERT INTO qcLocation (Location, Address) " & _
	"VALUES ('" & sLocation & "', '" & sAddress & "')"

cnQCS.Execute insLoc
cnQCS.close
set cnQCS = nothing

Response.Redirect("QCLoc.asp")

%>