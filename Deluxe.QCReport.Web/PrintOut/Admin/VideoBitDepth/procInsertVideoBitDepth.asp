<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 24/09/1012
'Declarations
'********************
dim sql, intVideoBitDepth
'********************

intVideoBitDepth = Request.Form("txtVideoBitDepth")

''response.write "intVideoBitDepth:" & intVideoBitDepth
''response.end

IF IsNumeric(intVideoBitDepth) Then
  sql = "INSERT INTO optVideoBitDepth (VideoBitDepth) SELECT " & Cint(intVideoBitDepth)
  ''Check for duplicates
  sql = sql & " WHERE NOT EXISTS (SELECT NULL FROM optVideoBitDepth WHERE VideoBitDepth =" & Cint(intVideoBitDepth) & ")"
  
  ''response.write "sql:" & sql
  ''response.end

  cnQCS.Execute sql
  cnQCS.close
  set cnQCS = nothing
End If

Response.Redirect("frmVideoBitDepth.asp")

%>
