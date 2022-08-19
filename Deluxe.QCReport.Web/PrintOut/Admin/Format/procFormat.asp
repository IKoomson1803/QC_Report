<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
''Updated to check for duplicate and empty values - Isaac koomson 16/01/2012
'********************
dim sFormatID, sFormat
dim insOPTFormat
'********************

sFormat = Request.Form("txtFormat")

If Trim(sFormat) <> "" Then
  insOPTFormat = "INSERT INTO optFormat (Format) SELECT '" & replace(Trim(sFormat),"'","''") & "'"
  insOPTFormat = insOPTFormat & " WHERE NOT EXISTS (SELECT NULL FROM optFormat WHERE Format= '" & replace(Trim(sFormat),"'","''") & "')" 
  cnQCS.Execute insOPTFormat
  cnQCS.close
  set cnQCS = nothing
End If

Response.Redirect("frmOptFormat.asp")

%>