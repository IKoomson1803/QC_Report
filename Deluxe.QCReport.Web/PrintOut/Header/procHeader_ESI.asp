<%@ Language=VBScript %>
<%option explicit%>
<!--#include file="../include/connect.asp"-->
<%
'********************
'Declarations
'********************
dim rsClient
dim sPONum, sThis_Part, sTot_Part, sQCDate, sAspect
dim sCustName, sShow, sEpNum, sEpName, sClient_Trk
dim sVersion, sFormat, sStandard, sTRT, sTapeDesc, sSubTitle
dim sQCNum, sRev, sJobNum
dim sql, updtHeader
'********************


sCustName =  Request.Form("cmbCust")  ''Request.Form("hdnCustName")  

''response.write "sCustName:" & sCustName & "<br>"
''Response.write "Format:" & Request.Form("selFormat") & "<br>"
''Response.write "Aspect:" & Request.Form("selAspectRatio") & "<br>"
''Response.end

sQCNum = Request.Form("hdnQCNum")
sRev = Request.Form("hdnRev")
sJobNum = Request.Form("hdnJobNum")

sTRT = Request.Form("txtTRT")
if sTRT <> "" Then
  sTRT = replace(sTRT, "'", "''")
  sTRT = replace(sTRT, chr(34), "''''" )
End If

sShow = Request.Form("txtShow")
if sShow <> "" Then
  sShow = replace(sShow, "'", "''")
  sShow = replace(sShow, chr(34), "''''" )
End If

sEpName = Request.Form("txtEpName")
if sEpName <> "" Then
  sEpName = replace(sEpName, "'", "''")
  sEpName = replace(sEpName, chr(34), "''''" )
End If

sSubTitle = Request.Form("txtsubtitle")
if sSubTitle <> "" Then
  sSubTitle = replace(sSubTitle, "'", "''")
  sSubTitle = replace(sSubTitle, chr(34), "''''" )
End If

''Response.write "Version:" & Request.Form("selVersion") & "<br>"
''Response.write "TapeDesc:" & Request.Form("selTapeDesc") & "<br>"
''Response.write "Filename:" & Request.Form("txtFilename") & "<br>"
''Response.End

'Get customer ID from qcClients based on Customer Name

if sCustName <> "" Then
  sCustName = replace(sCustName, "'", "''")
  sCustName = replace(sCustName, chr(34), "''''" )
End If

Set rsClient = server.CreateObject("ADODB.Recordset")
sql = "SELECT CustID FROM qcClients WHERE CustName = '" & sCustName & "'"
rsClient.ActiveConnection = cnQCS
rsClient.Open sql

''Response.write "CustID: " &  rsClient.Fields("CustID")
''Response.end

updtHeader = "UPDATE qcHeader " & _
			"SET pono = '" & Request.Form("txtPONum") & "', " & _
				"This_part = " & cint(Request.Form("txtThis_part")) & ", " & _
				"Tot_part = " & cint(Request.Form("txtTot_part")) & ", " & _
				"QC_Date = '" & Request.Form("txtQCDate") & "', " & _
				"Aspect = '" & Request.Form("selAspectRatio") & "', " & _
				"CustID = " & rsClient.Fields("CustID") & ", " & _
				"Show = '" & sShow & "', " & _
				"Epis_no = '" & Request.Form("txtEpNum") & "', " & _
				"Epis_name = '" & sEpName & "', " & _
				"Version = '" & Request.Form("cmbVersion") & "', " & _
				"Format = '" & Request.Form("selFormat") & "', " & _
				"Standard = '" & Request.Form("selStandard") & "', " & _
				"TRT = '" & sTRT & "', " & _
				"TapeDesc1 = '" & Request.Form("cmbTapeDesc") & "', " & _
				"TapeNumber = '" & Request.Form("txtTapeNum") & "', " & _
				"Filename = '" & Request.Form("txtFilename") & "', " & _
				"Subtitle = '" & sSubTitle & "', " & _
				"HLanguage = '" & Request.Form("txtHLanguage") & "', " & _
				"Status = '" & Request.Form("hdnStatus") & "', " & _
				"HeadLogo = '" & Request.Form("txtHeadLogo") & "', " & _
				"TailLogo = '" & Request.Form("txtTailLogo") & "' " & _
			" WHERE qcNum = " & clng(sQCNum) & " " & _
					"AND subQCNum = " & cint(sRev)
			
rsClient.Close
set rsClient = Nothing

cnQCS.Execute updtHeader

cnQCS.Close
Set cnQCS = Nothing

Response.Redirect("frmHeader_ESI.asp?frm=Header&sJobNum=" & sJobNum & "&sQCNum=" & sQCNum & "&sRev=" & sRev)



%>