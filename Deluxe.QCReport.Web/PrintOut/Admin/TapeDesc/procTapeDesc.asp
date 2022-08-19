<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'Declarations
''Updated to check for duplicate and empty values - Isaac Koomson16/01/2012
'********************
dim sTapeDesc
dim insOPTTapeDesc
'********************


sTapeDesc = trim(Request.Form("txtTapeDesc"))

If sTapeDesc <> "" Then
  insOPTTapeDesc = "INSERT INTO optTapeDesc (TapeDesc) SELECT '" & replace(sTapeDesc,"'","''") & "'"
  insOPTTapeDesc =  insOPTTapeDesc & " WHERE NOT EXISTS (SELECT NULL FROM optTapeDesc WHERE TapeDesc='" & replace(sTapeDesc,"'","''") & "')"
  cnQCS.Execute insOPTTapeDesc
  cnQCS.close
  set cnQCS = nothing
End If


Response.Redirect("frmOptTapeDesc.asp")

%>