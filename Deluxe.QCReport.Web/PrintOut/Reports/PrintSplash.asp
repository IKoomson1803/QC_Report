<%@ Language=VBScript %>
<%Option Explicit
dim nlQCNum, nlRev, sBVMaster, sBVTech1, sBVTech2, sBVTech4, sCTISS,sMQCR, sQCR
dim sQCR100, sQCR1Pg, sWBQCR,sQCWLR1Pg,sQCWTR1Pg,sQCWLER

sBVMaster = Request.QueryString("sBVMaster")
sBVTech1 = Request.QueryString("sBVTech1")
sBVTech2 = Request.QueryString("sBVTech2")
sBVTech4 = Request.QueryString("sBVTech4")
sCTISS = Request.QueryString("sCTISS")
sQCR = Request.QueryString("sQCR")
sMQCR = Request.QueryString("sMQCR")  '' Master QC added by Isaac Koomson 25/04/2014
sQCR100 = Request.QueryString("sQCR100")
sQCR1Pg = Request.QueryString("sQCR1Pg")
sQCWLR1Pg = Request.QueryString("sQCWLR1Pg") '' Runtime QC With Log added by Isaac Koomson 13/05/2016
sQCWTR1Pg = Request.QueryString("sQCWTR1Pg") '' Runtime QC With Text Info added by Isaac Koomson 16/05/2016
sQCWLER = Request.QueryString("sQCWLER") '' Runtime QC With Log For ESI added by Isaac Koomson 26/05/2016


'Warner Bros Addition - 16/03/04 - by Matt Feltham
'-----------------
sWBQCR = Request.QueryString("sWBQCR")
'-----------------
nlQCNum = Request.QueryString("sQCNum")
nlRev = Request.QueryString("sRev")

%>
<html>
<head>
<meta NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<title>Printing</title>
</head>
<link REL="stylesheet" TYPE="text/css" HREF="../css/cssforms.css">
<body>

<table width="100%">
	<tr>
		<td>
			<img SRC="../Images/4MCGears.gif" WIDTH="67" HEIGHT="80">		
		</td>
		<td>
			<b><font size=-1>Please Wait While The Selected Report(s) Are Printed...</font></b>
		</td>
	</tr>
</table>

<iframe name="PrintList" height=0 width=0 FrameBorder="0" scrolling="yes" src="PrintMultipleReports.asp?sQCNum=<%=nlQCNum%>&sRev=<%=nlRev%>&sBVMast=<%=sBVMaster%>&sBV1=<%=sBVTech1%>&sBV2=<%=sBVTech2%>&sBV4=<%=sBVTech4%>&sCTISS=<%=sCTISS%>&sQCR=<%=sQCR%>&sQCR100=<%=sQCR100%>&sQCR1Pg=<%=sQCR1Pg%>&sQCWLR1Pg=<%=sQCWLR1Pg%>&sQCWTR1Pg=<%=sQCWTR1Pg%>&sQCWLER=<%=sQCWLER%>&sWBQCR=<%=sWBQCR%>&sMQCR=<%=sMQCR%>">
</iframe>
<!---->
</body>
</html>
