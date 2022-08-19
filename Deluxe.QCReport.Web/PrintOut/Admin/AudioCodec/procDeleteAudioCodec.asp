<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../../include/connect.asp"-->
<%
'********************
'' Isaac Koomson - 24/09/1012
'Declarations
'********************
dim sql, intAudioCodecID
'********************

intAudioCodecID = Request.QueryString("AudioCodecID")

''response.write "intAudioCodecID:" & intAudioCodecID
''response.end 

sql = "DELETE FROM optAudioCodec WHERE AudioCodecID = " & cint(intAudioCodecID)

cnQCS.Execute sql
cnQCS.close
set cnQCS = nothing

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>

