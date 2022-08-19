<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 24/09/1012
'Declarations
'********************
dim sql, intAudioBitDepth, intAudioBitDepthID
'********************

intAudioBitDepth = Request.Form("txtAudioBitDepth")
intAudioBitDepthID = Request.Form("hdnAudioBitDepthID")

''Response.write "intAudioBitDepth :" & intAudioBitDepth  & "<br>"
''Response.write "intAudioBitDepthID  :" & intAudioBitDepthID   & "<br>"
''response.end

If IsNumeric(intAudioBitDepth) Then
     ''Check for duplicates
     sql = "IF (SELECT COUNT(*) FROM optAudioBitDepth WHERE AudioBitDepth = " & cint(intAudioBitDepth ) & ")= 0 "
	 sql = sql & " BEGIN "
	 sql = sql & " UPDATE optAudioBitDepth SET AudioBitDepth = " & cint(intAudioBitDepth) & " WHERE AudioBitDepthID = " & cint(intAudioBitDepthID )
     sql = sql & " END "
   
   ''Response.write "sql :" & sql  & "<br>"
  '' response.end
   
   cnQCS.Execute sql
   cnQCS.close
   set cnQCS = nothing
End If

%>

<script language="javascript">
	self.opener.history.go();
	close();
</script>
