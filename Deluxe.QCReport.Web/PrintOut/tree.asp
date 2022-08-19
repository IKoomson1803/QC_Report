<%@ Language=VBSCRIPT%>
<% option explicit%>
<% 
On Error Resume Next 
%> 

<HTML>
<HEAD>
    <META NAME="GENERATOR"   Content="DHTML Tree Menu Builder">
    <META NAME="DESCRIPTION"  Content="Tree View Sample">
    <META HTTP-EQUIV="Content-Type" content="text/html; charset=iso-8859-1">
    <LINK rel="stylesheet" type="text/css" href="css/tree.css">
    <TITLE>Tree View</TITLE>
    
    <script language="javascript">
    function OpenCopyQCFrm(url)
	{
		window.open (url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=0,resizable=1,width=300,height=150');
		
	}
    
    </script>
</HEAD>
<%
'********************
'Declarations
'********************
dim rsLastQC, rsQCNum, rsRev, rsCustID, rsClientID
dim sJobNum, sQCNum, sRev, sCustomer, sCustID, sBarcode
dim sQCOp, sFromDate, sToDate, sClientID, sQCUserID
dim sql1, sql2, sqlCustID, sqlLastQC, insQCHeader, insTapeLayout, sqlClientID
dim insQCElement, insQCAudioTC, insQCBVHE, insQCCTISS, updtLastQC
dim j, i
dim sAssetType
'-------------
'Added by Matt Feltham 17/01/2005
Dim strQCType
'-------------
'********************



%>
<STYLE TYPE="text/css"><!--
BODY { font-family:tahoma; font-size: 90%; color: white;}
	
A
{
    COLOR: #99ccff;
    FONT-FAMILY: tahoma;
    TEXT-DECORATION: none
}

A:hover
{
    COLOR: yellow;
    FONT-FAMILY: tahoma;
    TEXT-DECORATION: none
}

A:active
{
    COLOR: yellow;
    FONT-FAMILY: tahoma;
    TEXT-DECORATION: none
}
	
--></STYLE>
<BODY bgcolor=#333399
		LEFTMARGIN=10 
		LANGUAGE = "VBScript"
		onClick = clickHandler
>

<BASE TARGET="cdMain">

<STYLE>
    IMG  { cursor:hand; }
    SPAN { cursor:hand; }
</STYLE>
<!--#include file="include/connect.asp"-->
<!--#include file="include/login.asp"-->

<%


Response.write "User Name: " & sUserName & "<br>"
Response.write "Security Level: " & sLevel & "<br><br>"

''*****************************************************************************************************
''Author: Isaac Koomson
''Created Date: 13/01/2012
''Description: Creates a new QC Report


''*****************************************************************************************************
Sub NewQCReport

        ''Response.write "sJobNum: " & Len(sJobNum) & "<br>"
		''Response.write "sCustomer: " & Len(sCustomer) & "<br>"
		''Response.write "strQCType: " & strQCType & "<br>"
		''Response.write "Len:strQCType: " & Len(strQCType) & "<br>"
		''Response.write "Trim:strQCType: " & Len(Trim(strQCType)) & "<br>"
		''Response.write "nQCUserID: " & Len(nQCUserID) & "<br>"
		''Response.write "sQCFullName: " & Len(sQCFullName) & "<br>"
		''Response.write "Trim:sQCFullName: " & Len(Trim(sQCFullName)) & "<br>"
        ''Response.End
		
        If	Trim(sJobNum) <> "" And Trim(sCustomer) <> "Choose a Customer" and sAssetType <> "" and strQCType <>""  Then
	        Dim cmdNewQCS
		    Set cmdNewQCS = Server.CreateObject("ADODB.Command")
		    Set cmdNewQCS.ActiveConnection = cnQCS
		    cmdNewQCS.CommandText = "bward.sp_NewQCReport"
		    cmdNewQCS.CommandType = 4  '' adCmdStoredProc
		    cmdNewQCS.Parameters.Append cmdNewQCS.CreateParameter("@qcWONumber", 200, 1, 10, Trim(sJobNum)) ''Varchar
		    cmdNewQCS.Parameters.Append cmdNewQCS.CreateParameter("@customer", 200, 1, 50, Trim(sCustomer)) 
		    cmdNewQCS.Parameters.Append cmdNewQCS.CreateParameter("@qcType", 200, 1, 1, Trim(strQCType)) 
		    cmdNewQCS.Parameters.Append cmdNewQCS.CreateParameter("@qcUserId", 3, 1, 4, nQCUserID) ''Int
		    cmdNewQCS.Parameters.Append cmdNewQCS.CreateParameter("@qcFullName", 200, 1, 50, Trim(sQCFullName)) 
			cmdNewQCS.Parameters.Append cmdNewQCS.CreateParameter("@assetType", 200, 1, 255, Trim(sAssetType)) 
		    cmdNewQCS.Execute
		 Else
		  Response.Write "Please supply all the required fields"
	      Response.End
		 End If   
			   
	    '' ''Catch any error and display on the screen
	    If Err.Number <> 0 Then
	      Response.Write (Err.Description & "<br>")
	      Err.Clear
	      Response.End
        End If

End Sub


''*****************************************************************************************************
''Author: Isaac Koomson
''Created Date: 06/01/2012
''Description: Creates a new QC Report with new QC number but same Job Number by copying existing QC Report 
''*****************************************************************************************************
Sub CopyQCReport

           ''Response.write "Copy QC Here!!! <br>"
	      ''Response.write "sJobNum: " & sJobNum & "<br>"
          ''Response.write "sQCNum: " & sQCNum & "<br>"
          ''Response.write "sRev: " &  sRev & "<br>"
          ''Response.End
	    
		  If sJobNum <> ""  Then
		    
			  Dim cmdCopyQCS
			  Set cmdCopyQCS = Server.CreateObject("ADODB.Command")
			  Set cmdCopyQCS.ActiveConnection = cnQCS
			  cmdCopyQCS.CommandText = "bward.sp_CopyQCReport"
			  cmdCopyQCS.CommandType = 4  '' adCmdStoredProc
			  cmdCopyQCS.Parameters.Append cmdCopyQCS.CreateParameter("@qcWONumber", 200, 1, 10, sJobNum) ''Varchar
			  cmdCopyQCS.Parameters.Append cmdCopyQCS.CreateParameter("@qcNumber", 20, 1, 8, sQCNum) '' Big Int
			  cmdCopyQCS.Parameters.Append cmdCopyQCS.CreateParameter("@subQCNumber", 3, 1, 4, sRev) '' int
			  cmdCopyQCS.Execute
			  
			   ''''Set sQCNum = "" for the query to return all the related QC Numbers
			   sQCNum = ""
			  
		   Else
		      Response.Write "Please supply all the required fields"
	          Response.End
		   End If   
		   		   
		  '' ''Catch any error and display on the screen
		   If Err.Number <> 0 Then
		     Response.Write (Err.Description & "<br>")
		     Err.Clear
		     Response.End
	       End If

End Sub

 
	'**********************************
	'Search parameters from frmNewQC
	'**********************************
	sJobNum = Request.Form("txtJobNum")
	sCustomer = Request.Form("selCustomer")
	sQCNum = Request.Form("txtQCNum")
	sRev = Request.Form("txtRev")
	sClientID = Request.QueryString("nClientID")
	sQCUserID = Request.QueryString("nQCUserID")
	sBarcode = Request.QueryString("nBarcode")
	
	'----------------------------
	'Added by Matt Feltham 17/01/2005
	strQCType = Request.Form("rdoQCType")
	If strQCType <> "" Then
		''strQCType = "'" & strQCType & "'"
	Else
		strQCType = ""
	End If
	
	'----------------------------
    if trim(Request.QueryString("sQCNum")) <> "" then
		sQCNum = Request.QueryString("sQCNum")
	end if
	if trim(Request.QueryString("sJobNum")) <> "" then
		sJobNum = trim(Request.QueryString("sJobNum"))
	end if
	
	
	'Added by Isaac Koomson 16/08/2012
	sAssetType = Request.Form("rdoAssetType")
	
	'**********************************
	'Insert For New QC
	''Modified to use Stored Procedure Instead of Inline SQL  - Isaac Koomson 13/01/2012
	'**********************************
	If Request.Form("btnSelect") = "Add New QC" Then
		NewQCReport()
		
	'***************************************************************************************
	'Copy QC
	''New Copy function - Isaac Koomson 06/01/2012
	'***************************************************************************************
	 ElseIf Request.Form("btnSelect") = "Copy QC" Then
	       CopyQCReport()
	 End If
	
	'**********************************
	'Queries from the Select frame
	'**********************************
	Set rsQCNum = server.CreateObject ("ADODB.Recordset")
	Set rsRev = server.CreateObject ("ADODB.Recordset")
	
	if (sJobNum <> "") and (sQCNum = "") then
		sql1 = "SELECT DISTINCT woNum, QCNum, qc_type,AssetType FROM qcHeader " & _
		"WHERE woNum = '" & sJobNum & "' AND Deleted = 0 ORDER BY qcNum"
	else 
		if sQCNum = "" then sQCNum = "0"
		sql1 = "SELECT DISTINCT woNum, QCNum, qc_type,AssetType FROM qcHeader " & _
		"WHERE QCNum = " & sQCNum & " AND Deleted = 0 ORDER BY qcNum"
	end if
	'***********************************************
	'Open search results
	'***********************************************
	
	rsQCNum.ActiveConnection = cnQCS
	rsQCNum.Open sql1
	
	''Get the QC Type. This will be used to hide the sections that are not required for Runtime QC
	strQCType = rsQCNum.Fields("qc_type")
	sAssetType = rsQCNum.Fields("AssetType")
	
	''response.write "strQCType: " & strQCType & "<br/>"
	''response.write "sAssetType: " & sAssetType & "<br/>"
	''response.end

	rsRev.ActiveConnection = cnQCS
	
'************************************************************************************
'Display Tree
'************************************************************************************
If (rsQCNum.BOF = True) and (rsQCNum.EOF = True) then %>
	<DIV STYLE="margin-left:10;">
	<IMG SRC="images/bullet-plus.png" ID=MI-1><SPAN ID=MT-1>QC does not exist.</SPAN><BR>
	<DIV ID=C-1 STYLE="margin-left:15; display:None;">
<%else
	'********************************
	'Job Number - Top of Tree
	'********************************
	if sJobNum <> "" Then %>
		<DIV STYLE="margin-left:10;">
		<IMG SRC="images/bullet-plus.png" ID=MI-1><SPAN ID=MT-1>Job #: <a href="JobDetails/JobDetails.asp?sJobNum=<%=rsQCNum.Fields("wonum")%>" target="main"><%=rsQCNum.fields("woNum")%></a></SPAN><BR>
		<DIV ID=C-1 STYLE="margin-left:15; display:None;">
	<% end if 
	'**************************************************
	'Display top level based on search criteria
	'**************************************************
	if sClientID <> "" then %>
		<DIV STYLE="margin-left:10;">
		<IMG SRC="images/bullet-plus.png" ID=MI-1><SPAN ID=MT-1><%=rsQCNum.fields("CustName")%></SPAN><BR>
		<DIV ID=C-1 STYLE="margin-left:15; display:None;">
	<% end if 	
	if sQCUserID <> "" then %>
		<DIV STYLE="margin-left:10;">
		<IMG SRC="images/bullet-plus.png" ID=MI-1><SPAN ID=MT-1><%=rsQCNum.fields("FullName")%></SPAN><BR>
		<DIV ID=C-1 STYLE="margin-left:15; display:None;">
	<% end if 	
	if sBarcode <> "" then %>
		<DIV STYLE="margin-left:10;">
		<IMG SRC="images/bullet-plus.png" ID=MI-1><SPAN ID=MT-1><%=rsQCNum.fields("Barcode")%>: <a href="JobDetails/JobDetails.asp?sJobNum=<%=rsQCNum.Fields("wonum")%>" target="main"><%=rsQCNum.fields("wonum")%></a></SPAN><BR>
		<DIV ID=C-1 STYLE="margin-left:15; display:None;">
	<% end if 	
	'**************************************************
	j=2
   Do While not rsQCNum.EOF %>
    <IMG SRC="images/bullet-plus.png" ID=MI-<%=j%>><SPAN ID=MT-<%=j%>>QC #: <a href="QCDetails/QCDetails.asp?sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>" target="main"><%=rsQCNum.Fields(1)%></a></SPAN><BR>
    <DIV ID=C-<%=j%> STYLE="margin-left:15; display:None;">
		<% 
			if sRev <> "" Then
				sql2 = "SELECT subQCNum, revised_date FROM qcHeader WHERE qcNum = " & rsQCNum.fields(1) & " AND subQCNum = " & cint(sRev) & " AND Deleted = 0 ORDER BY subQCNum"
			else
				sql2 = "SELECT subQCNum, revised_date FROM qcHeader WHERE qcNum = " & rsQCNum.fields(1) & " AND Deleted = 0 ORDER BY subQCNum"
			end if
			rsRev.open sql2
		
			 j=j+1%>
		<%Do While not rsRev.eof %>
			<IMG SRC="images/bullet-plus.png" ID=MI-<%=j%>>
			<SPAN ID=MT-<%=j%>>Rev: <a href="RevDetails/RevDetails.asp?sFrm=RevDetails&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main"><%=rsRev.Fields(0)%>&nbsp;&nbsp;<%=rsRev.Fields(1)%></a></SPAN><BR>
			<DIV ID=C-<%=j%> STYLE="margin-left:15; display:None;">
			
			    <%If strQCType <> "E" Then   %>
				  <IMG SRC="images/bullet-filler.png"><A HREF="Header/frmHeader.asp?frm=Header&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">Header</A><BR>
				  <IMG SRC="images/bullet-filler.png"><A HREF="History/frmHistory.asp?frm=History&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">History</A><BR>
				<%Else %>
				  <IMG SRC="images/bullet-filler.png"><A HREF="Header/frmHeader_ESI.asp?frm=Header&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">Header</A><BR>
				  <IMG SRC="images/bullet-filler.png"><A HREF="History/frmHistory_ESI.asp?frm=History&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">History</A><BR>
				<% End If   %>
		
				<IMG SRC="images/bullet-filler.png"><A HREF="TapeLayout/frmTapeLayout.asp?frm=TapeLayout&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>&#tcFrm" target="main">Layout</A><BR>
				
				<%If strQCType <> "A" And strQCType <> "L" And strQCType <> "E"  Then   %>
				  <IMG SRC="images/bullet-filler.png"><A HREF="TextInfo/frmTextInfo.asp?frm=TextInfo&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">Text Info</A><BR>
				<% End If   %>
				
				<IMG SRC="images/bullet-filler.png"><A HREF="AudioTC/frmAudioTC.asp?frm=AudioTC&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">Audio and T.C.</A><BR>
				
				 <%If Trim(strQCType) = "E"  Then   %>
				    <IMG SRC="images/bullet-filler.png"><A HREF="Endemol/frmSpecifics.asp?frm=Specifics&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">Specifics</A><BR>
				  <% End If   %>
				
				 <%If Trim(strQCType) <> "E"  Then   %>
				    <IMG SRC="images/bullet-filler.png"><A HREF="IndivSpecs/frmIndivSpecs.asp?frm=IndividualSpecs&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">Individual Specs</A><BR>
					<IMG SRC="images/bullet-filler.png"><A HREF="OverallSpecs/frmOverallSpecs.asp?frm=OverallSpecs&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">Overall Specs</A><BR>
				  <%Elseif  Trim(strQCType) = "E" And Trim(sAssetType) = "File" Then %>
				   <IMG SRC="images/bullet-filler.png"><A HREF="OverallSpecs/frmOverallSpecs_ESI.asp?frm=OverallSpecs&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">Overall Specs</A><BR>
 		    	  <% End If   %>
				  
				
				
				
				<%If strQCType <> "A" Then   %>
				
				     <%If strQCType <> "L"  And strQCType <> "T" And strQCType <> "E"  Then    %>
				        <IMG SRC="images/bullet-filler.png"><A HREF="BVHESpecs/frmBVHESpecs.asp?frm=BVHESpecs&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">BVHE Specs</A><BR>
				        <IMG SRC="images/bullet-filler.png"><A HREF="CTISSSpecs/frmCTISSSpecs.asp?frm=CTISSSpecs&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">CTISS Specs</A><BR>
				    <% End If   %>
				  
				   <%If strQCType <> "T" Then    %>
				        <IMG SRC="images/bullet-filler.png"><A HREF="Log/frmLog.asp?frm=Log&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">Log</A><BR>
				   <% End If   %>
				  
				<% End If   %>
				
				<%If strQCType <> "E" Then   %>
				   <IMG SRC="images/bullet-filler.png"><A HREF="Final/frmFinal.asp?frm=Final&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">Final</A><BR>
				<% Else %>
				    <IMG SRC="images/bullet-filler.png"><A HREF="Final/frmFinal_ESI.asp?frm=Final&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="main">Final</A><BR>
				<% End If   %>
			
				<!-- The Copy functionality (Admin Only) was added to the Tree View - Isaac Koomson 06/01/2012  -->
				<!-- Amended to include Operators - Isaac Koomson 05/09/2019  -->
				<%if sLevel >= 1 then%>
				
				<!--
				<IMG SRC="images/bullet-filler.png"><A HREF="tree.asp?CopyQCReport=True&sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>" target="_self">Copy</A><BR>
				-->
				
			   <IMG SRC="images/bullet-filler.png"><A style="cursor:pointer;cursor:hand" onclick="javascript:OpenCopyQCFrm('CopyQC/frmCopyQCReport.asp?sJobNum=<%=rsQCNum.Fields(0)%>&sQCNum=<%=rsQCNum.Fields(1)%>&sRev=<%=rsRev.Fields(0)%>')">Copy</A><BR>
				
				<%end if%>
				
			</DIV>
			
        <% rsRev.MoveNext
          j=j+1
		loop  %>
	</DIV>
   <%
   rsQCNum.MoveNext
   j=j+1
   rsRev.close
   loop
  end if 
   %>
</DIV>
</DIV>

<%



rsQCNum.Close
Set rsQCNum = Nothing
Set rsRev = Nothing
cnQCS.Close
Set cnQCS = Nothing

%>


<SCRIPT LANGUAGE="VBScript">
    Option Explicit

    Sub clickHandler()

        Dim i
        Dim strParentId
        Dim objChild
        Dim objParentImage
        Dim sDisplay
        Dim sImage

        '== Identify the item clicked
        strParentId = Window.Event.SrcElement.ID
        If Left(strParentId, 1) = "M" Then
            '== Identify child DIV and parent IMG objects
            Set objChild = Document.All("C" & Mid(strParentId, 3))
            Set objParentImage = Document.All("MI" & Mid(strParentId, 3))
            '== manipulate their attributes
            If objChild.Style.Display = "none" Then
                objChild.Style.Display = ""
                objParentImage.Src = "images/bullet-minus.png"
            Else
                objChild.Style.Display = "none"
                objParentImage.Src = "images/bullet-plus.png"
            End If
            Set objChild = Nothing
            Set objParentImage = Nothing
        ElseIf Left(strParentId, 3) = "ALL" Then
            If Mid(strParentId, 4) = "Expand" Then
                sDisplay = ""
                sImage = "images/bullet-minus.png"
            Else
                sDisplay = "none"
                sImage = "images/bullet-plus.png"
            End If
            For i = 0 To Document.All.Length - 1
                If Left(Document.All(i).ID, 1) = "C" Then
                    Document.All(i).Style.Display = sDisplay
                End If
                If Left(Document.All(i).ID, 2) = "MI" Then
                    Document.All(i).Src = sImage
                End If
            Next
        End If

    End Sub


   ' Sub mouseOverHandler()

        'If Window.Event.SrcElement.TagName = "A" Or _
         'Left(Window.Event.SrcElement.ID, 2) = "MT" Or _
         'Left(Window.Event.SrcElement.ID, 3) = "ALL" _
         '  Then
         '   If Window.Event.SrcElement.ID = "EXTERNAL" Then
         '       Window.Event.SrcElement.Style.Color = "LIGHTGREEN"
         '   Else
         '       Window.Event.SrcElement.Style.Color = "YELLOW"
         '   End If
       ' ElseIf Left(Window.Event.SrcElement.ID, 2) = "MI" Then
       '     If Document.All("MT" & Mid(Window.Event.SrcElement.ID, 3)).ID = "EXTERNAL" Then
       '         Document.All("MT" & Mid(Window.Event.SrcElement.ID, 3)).Style.Color = "LIGHTGREEN"
       '     Else
       '         Document.All("MT" & Mid(Window.Event.SrcElement.ID, 3)).Style.Color = "YELLOW"
       '     End If
       ' End If

   ' End Sub

   ' Sub mouseOutHandler()

    '    If Window.Event.SrcElement.TagName = "A" Or _
    '       Left(Window.Event.SrcElement.ID, 2) = "MT" _
    '       Then
    '        Window.Event.SrcElement.Style.Color = "WHITE"
    '    ElseIf Left(Window.Event.SrcElement.ID, 3) = "ALL" Then
    '        Window.Event.SrcElement.Style.Color = "BLACK"
    '    ElseIf Left(Window.Event.SrcElement.ID, 2) = "MI" Then
    '        Document.All("MT" & Mid(Window.Event.SrcElement.ID, 3)).Style.Color = "WHITE"
    '    End If

   ' End Sub

</SCRIPT>

<%If trim(Request.QueryString("sJobNum")) = "" and trim(Request.QueryString("sQCNum")) = "" then%>
<script language="javascript">

self.open("main.asp","main");

</script>
<%end if%>

</BODY>
</HTML>
