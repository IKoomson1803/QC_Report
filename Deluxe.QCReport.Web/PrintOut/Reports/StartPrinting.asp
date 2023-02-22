<%@ Language=VBScript %>
		<script language="javascript">
		
		function OpenPrintWin(nQCNum, nRev, sBVMaster, sBVTech1, sBVTech2, sBVTech4, sCTISS, sQCR, sQCR100, sQCR1Pg, sQCWLR1Pg, sQCWTR1Pg, sQCRWLE, sWBQCR,sMQCR)
		{
			open("printsplash.asp?sQCNum=" + nQCNum + "&sRev=" + nRev + "&sBVMaster=" + sBVMaster + "&sBVTech1=" + sBVTech1 + "&sBVTech2=" + sBVTech2 + "&sBVTech4=" + sBVTech4 + "&sCTISS=" + sCTISS + 
			"&sQCR=" + sQCR + "&sQCR100=" + sQCR100 + "&sQCR1Pg=" + sQCR1Pg + "&sQCWLR1Pg=" + sQCWLR1Pg + "&sQCWTR1Pg=" + sQCWTR1Pg + "&sQCWLER=" + sQCRWLE + 
			"&sWBQCR=" + sWBQCR + "&sMQCR=" + sMQCR, 'PrintWindow', 'HEIGHT=150, WIDTH=500');
			window.navigate("reports.asp?sQCNum=" + nQCNum + "&sRev=" + nRev);
			//
		}
		</script>	
<%

sBVMaster = "" ''Request.Form("chkBVMaster")
sBVTech1 =  "" ''Request.Form("chkBVTech1")
sBVTech2 =  "" ''Request.Form("chkBVTech2")
sBVTech4 =  "" ''Request.Form("chkBVTech4")
sCTISS =  "" ''Request.Form("chkCTISS")
sQCR100 =  "" ''Request.Form("chkQCR100")
'Warner Bros Addition - 16/03/04 - by Matt Feltham
'-----------------
sWBQCR = "" ''Request.Form("chkWBQCR")
'-----------------

sQCR = Request.Form("chkQCR")
sMQCR = Request.Form("chkMQCR")  ''Master QC Report added by Isaac Koomson 25/04/2014
sQCR1Pg = Request.Form("chkQCR1Pg")
sQCRWL1Pg = Request.Form("chkQCWLR1Pg") ''Runtime QC With Log Report added by Isaac Koomson 13/05/2016
sQCRWT1Pg = Request.Form("chkQCWTR1Pg") ''Runtime QC With Text Info Report added by Isaac Koomson 16/05/2016
sQCRWLE = Request.Form("chkQCWLER") ''Runtime QC With Log For ESI Report added by Isaac Koomson 26/05/2016
sQCRWLDPP = Request.Form("chkQCRWLDPP") ''Runtime QC With Log For DPP Eyeball Report added by Isaac Koomson 16/08/2022
sQCBNJR = Request.Form("chkQCBNJR") ''Runtime QC With Log For Banijay Rights Report - New Template - added by Isaac Koomson 22/02/2023

''response.write "Start Printing - sQCRWT1Pg:" & sQCRWT1Pg
''response.end


 
 ''Response.write "RecordCount: " & rsChecklist.RecordCount
 


nlQCNum = Request.Form("txtQCNum")
nlRev = Request.Form("txtQCRev")	

Select case Request.Form("action")
	case "  Print  " 
		Response.Write ("<script>")
		Response.Write("OpenPrintWin('" & nlQCNum & "', '" & nlRev & "', '" & sBVMaster & "', '" & sBVTech1 & "', '" & sBVTech2 & "', '" & sBVTech4 & "', '" & sCTISS & "', '" & sQCR & "', '" & sQCR100 & "', '" & sQCR1Pg & _
		"', '" & sQCWLR1Pg & "', '" & sQCWTR1Pg & "', '" & sQCRWLE & "', '" & sWBQCR & "', '" + sMQCR + "');")
		Response.Write("</script>")
	
	case "Preview"
		Response.Write("<script>")
		Response.Write("open('PreviewReports.asp?sQCNum=" & nlQCNum & _
		"&sRev=" & nlRev & "&sBVMaster=" & sBVMaster & _
		"&sBVTech1=" & sBVTech1 & "&sBVTech2=" & sBVTech2 & _
		"&sBVTech4=" & sBVTech4 & "&sCTISS=" & sCTISS & _ 
		"&sQCR=" & sQCR & "&sQCR100=" & sQCR100 & "&sQCR1Pg=" & sQCR1Pg &_ 
		"&sQCRWL1Pg=" & sQCRWL1Pg & "&sQCRWT1Pg=" & sQCRWT1Pg &_
		"&sQCRWLE=" & sQCRWLE & "&sQCRWLDPP=" & sQCRWLDPP & _
		"&sWBQCR=" & sWBQCR & "&sMQCR=" &  sMQCR &_
		"&sQCBNJR=" & sQCBNJR & "');")
		Response.Write("window.navigate('reports.asp?sQCNum=" & nlQCNum & "&sRev=" & nlRev & "');")
		Response.Write("</script>")	
end select
		
%>



