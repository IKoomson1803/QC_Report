<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../include/connect.asp"-->

<%
'********************
'Declarations
'********************
dim sFormatID, sFormat
dim insOPTFormat
'********************

sFormatID = trim(Request("FormatID"))
sFormat = trim(Request("Format"))

insOPTFormat = "INSERT INTO optFormat (Format) VALUES ('" & replace(sBayNumber,"'","''")"

cnQCS.Execute insOPTFormat
cnQCS.close
set cnQCS = nothing

Response.Redirect("frmOptFormat.asp")

%>