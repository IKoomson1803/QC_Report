<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, sGamut, intGamutID
'********************

sGamut = Request.Form("txtGamut")
intGamutID = Request.Form("hdnGamutID")

If Trim(sGamut) <> "" Then
    sGamut = Replace(sGamut,"'","''")
     ''Check for duplicates
     sql = "IF (SELECT COUNT(*) FROM optGamut WHERE Gamut = '" & sGamut  & "')= 0 "
	 sql = sql & " BEGIN "
	 sql = sql & " UPDATE optGamut SET Gamut = '" & sGamut & "' WHERE GamutID = " & cint(intGamutID )
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
