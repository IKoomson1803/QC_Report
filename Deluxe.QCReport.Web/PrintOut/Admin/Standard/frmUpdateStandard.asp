<%@ Language=VBScript %>
<%option explicit%>
<HTML>
<HEAD>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->
<meta NAME="robots" CONTENT="noindex">
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">

<script language="javascript">

   function CloseEdit()
    { 
	  close();
    }

  function confirmdel(url)
	{
		if (confirm("Are you sure you want to delete this record?"))
			{
				self.navigate(url)
			}
		else
			{ }
	}
		
</script>

</HEAD>

<!--#include file="../../include/connect.asp"-->
<%
'' Isaac Koomson - 12/07/2017

dim rsFrm, sql, intStandardID
 intStandardID = Request.QueryString("StandardID")

 ''Response.Write("intStandardID:" + intStandardID)

set rsFrm = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM optStandard WHERE  StandardID= " & cint(intStandardID)
rsFrm.ActiveConnection = cnQCS
rsFrm.Open sql

%>
<body bgcolor=#f5f5dc>
	<table align="center">
	<form method="post" name="frmUpdateStandard" action="procUpdateStandard.asp">
	<input type="hidden" name="hdnStandardID" id="hdnStandardID" value="<%=intStandardID%>">
		<tr>
			<td colspan=2>
				Standard:
			</td>
			<td colspan=3>				
				<input type="text" id="txtStandard" name="txtStandard" size="50" value="<%=rsFrm.fields("Standard")%>">
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
            <td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td style="text-align: center;" >
				<input type="submit" name=subUpdate value="Save"  >
			</td>
			<td style="text-align: center;">
				<input type="button" name="btnDelete" value="Delete" onclick="javascript:confirmdel('procDeleteStandard.asp?StandardID=<%=intStandardID%>')">
			</td>
			<td style="text-align: center;">
				<input type="button" name=btnCancel value="Cancel" onclick="CloseEdit();">
			</td>
                  
		</tr>
	</form>
	</table>
	</body>
</html>

