<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../include/connect.asp"-->

<%
'********************
'Declarations
'********************
dim sTapeDescID, sTapeDesc
dim insOPTTapeDesc
'********************

sTapeDescID = trim(Request("TapeDescID"))
sTapeDesc = trim(Request("TapeDesc"))

insOPTTapeDesc = "INSERT INTO optTapeDesc (TapeDesc) VALUES ('" & replace(sTapeDesc,"'","''")"

cnQCS.Execute insOPTFormat
cnQCS.close
set cnQCS = nothing

Response.Redirect("frmOptTapeDesc.asp")

%>