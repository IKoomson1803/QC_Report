<%@ Language=VBScript %>
<%Option Explicit%>
<!--#include file="../../include/connect.asp"-->

<%
'********************
'' Isaac Koomson - 24/09/1012
'Declarations
'********************
dim sql, intVideoBitDepth, intVideoBitDepthID
'********************

intVideoBitDepth = Request.Form("txtVideoBitDepth")
intVideoBitDepthID = Request.Form("hdnVideoBitDepthID")

''Response.write "intVideoBitDepth :" & intVideoBitDepth  & "<br>"
''Response.write "intVideoBitDepthID  :" & intVideoBitDepthID   & "<br>"
''response.end

If IsNumeric(intVideoBitDepth) Then
     ''Check for duplicates before updating
     sql = "IF (SELECT COUNT(*) FROM optVideoBitDepth WHERE VideoBitDepth = " & cint(intVideoBitDepth ) & ")= 0 "
	 sql = sql & " BEGIN "
	 sql = sql & " UPDATE optVideoBitDepth SET VideoBitDepth = " & cint(intVideoBitDepth) & " WHERE VideoBitDepthID = " & cint(intVideoBitDepthID )
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
