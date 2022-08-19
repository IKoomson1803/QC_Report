<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 24/09/1012
'Declarations
'********************
dim sql, sStandard, intStandardID
'********************

sStandard = Request.Form("txtStandard")
intStandardID = Request.Form("hdnStandardID")

If Trim(sStandard) <> "" Then
    sStandard = Replace(sStandard,"'","''")
     ''Check for duplicates
     sql = "IF (SELECT COUNT(*) FROM optStandard WHERE Standard = '" & sStandard  & "')= 0 "
	 sql = sql & " BEGIN "
	 sql = sql & " UPDATE optStandard SET Standard = '" & sStandard & "' WHERE StandardID = " & cint(intStandardID )
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
