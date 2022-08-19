<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, sColourEncoding, intColourEncodingID
'********************

sColourEncoding = Request.Form("txtColourEncoding")
intColourEncodingID = Request.Form("hdnColourEncodingID")

If Trim(sColourEncoding) <> "" Then
    sColourEncoding = Replace(sColourEncoding,"'","''")
     ''Check for duplicates
     sql = "IF (SELECT COUNT(*) FROM optColourEncoding WHERE ColourEncoding = '" & sColourEncoding  & "')= 0 "
	 sql = sql & " BEGIN "
	 sql = sql & " UPDATE optColourEncoding SET ColourEncoding = '" & sColourEncoding & "' WHERE ColourEncodingID = " & cint(intColourEncodingID )
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
