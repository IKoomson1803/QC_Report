<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, intColourEncodingID
'********************

intColourEncodingID = Request.QueryString("ColourEncodingID")

sql = "DELETE FROM optColourEncoding WHERE ColourEncodingID = " & cint(intColourEncodingID)

cnQCS.Execute sql
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

