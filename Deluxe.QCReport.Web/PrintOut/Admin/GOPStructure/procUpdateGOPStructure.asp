<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, sGOPStructure, intGOPStructureID
'********************

sGOPStructure = Request.Form("txtGOPStructure")
intGOPStructureID = Request.Form("hdnGOPStructureID")

If Trim(sGOPStructure) <> "" Then
    sGOPStructure = Replace(sGOPStructure,"'","''")
     ''Check for duplicates
     sql = "IF (SELECT COUNT(*) FROM optGOPStructure WHERE GOPStructure = '" & sGOPStructure  & "')= 0 "
	 sql = sql & " BEGIN "
	 sql = sql & " UPDATE optGOPStructure SET GOPStructure = '" & sGOPStructure & "' WHERE GOPStructureID = " & cint(intGOPStructureID )
     sql = sql & " END "

   cnQCS.Execute sql
   cnQCS.close
   set cnQCS = nothing
End If

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>
