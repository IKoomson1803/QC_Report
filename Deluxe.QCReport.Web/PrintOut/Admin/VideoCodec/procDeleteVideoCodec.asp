<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'' Isaac Koomson - 25/09/1012
'Declarations
'********************
dim sql, intVideoCodecID
'********************

intVideoCodecID = Request.QueryString("VideoCodecID")

sql = "DELETE FROM optVideoCodec WHERE VideoCodecID = " & cint(intVideoCodecID)

cnQCS.Execute sql
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

