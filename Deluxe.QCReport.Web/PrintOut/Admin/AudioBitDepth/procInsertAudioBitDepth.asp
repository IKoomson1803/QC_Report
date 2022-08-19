<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 24/09/1012
'Declarations
'********************
dim sql, intAudioBitDepth
'********************

intAudioBitDepth = Request.Form("txtAudioBitDepth")

''response.write "intAudioBitDepth:" & intAudioBitDepth
''response.end

IF IsNumeric(intAudioBitDepth) Then
  sql = "INSERT INTO optAudioBitDepth (AudioBitDepth) SELECT " & Cint(intAudioBitDepth)
  ''Check for duplicates
  sql = sql & " WHERE NOT EXISTS (SELECT NULL FROM optAudioBitDepth WHERE AudioBitDepth =" & Cint(intAudioBitDepth) & ")"
  
  ''response.write "sql:" & sql
  ''response.end

  cnQCS.Execute sql
  cnQCS.close
  set cnQCS = nothing
End If

Response.Redirect("frmAudioBitDepth.asp")

%>
