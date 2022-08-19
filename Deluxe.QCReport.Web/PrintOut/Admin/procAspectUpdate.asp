<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../include/connect.asp"-->

<%
'********************
'Declarations
'********************
dim sQCRoomID, sBayNumber
dim insOPTQCRoom
'********************

sQCRoomID = trim(Request("QCRoomID"))
sBayNumber = trim(Request("BayNumber"))

insOPTQCRoom = "INSERT INTO optQCRoom (BayNumber) VALUES ('" & replace(sBayNumber,"'","''") _

cnQCS.Execute insOPTQCRoom
cnQCS.close
set cnQCS = nothing

Response.Redirect("frmBayNumber.asp")

%>