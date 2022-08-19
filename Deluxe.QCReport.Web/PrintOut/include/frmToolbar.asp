

<%
Dim sQCType,sqlQCType,rsQCType,strAssetType
sQCNum = Request.QueryString("sQCNum")
sRev = Request.QueryString("sRev")
sqlQCType = "SELECT qc_type,AssetType FROM qcHeader WHERE qcheader.Qcnum= " & clng(sQCNum) & " AND qcheader.subQcnum = " & cint(sRev)
Set rsQCType = server.CreateObject("ADODB.Recordset")
rsQCType.ActiveConnection = cnQCS
rsQCType.Open sqlQCType

''Get the QC Type. This will be used to hide the sections that are not required for Runtime QC
sQCType = rsQCType.Fields("qc_type")
strAssetType = rsQCType.Fields("AssetType")
	
rsQCType.Close
Set rsQCType = Nothing

%>


<LINK rel="stylesheet" type="text/css" href="../css/qcs.css?v=1.8">

<script LANGUAGE="JScript"><!--

	// SET SOME "CONSTANT" VALUES FOR THE SCRIPT
	// MAKES PLAYING WITH LOOK AND FEEL A LOT EASIER

	var sOffBackColor = "#f5f5dc";
	var sOffTextColor = "menutext"
	var sOffBorderColor = "#f5f5dc";
	var sOffPadding = "1px 1px 1px 1px";

	var sOverBackColor = "#f5f5dc";
	var sOverTextColor = "menutext"
	var sOverBorderColor = "threedhighlight threedshadow threedshadow threedhighlight";
	var sOverPadding = "1px 1px 1px 1px";

	var sDownBackColor = "window"
	var sDownTextColor = "menutext"
	var sDownBorderColor = "threedshadow threedhighlight threedhighlight threedshadow";
	var sDownPadding = "2px 0px 0px 2px";

	var sPaneName = "";
	var eActiveButton = null;

	// TWO HELPER FUNCTIONS
	// ONE TO SET BUTTON PADDING AND ONE TO SET BUTTON IMAGE

	function SetButtonPadding(eButton,sPaddingStyle)
	{
		eButton.rows[0].cells[0].style.padding = sPaddingStyle;
		//eButton.rows[0].cells[1].style.padding = sPaddingStyle;
	}
	
	/*function SetButtonImage(eButton,sState)
	{
		var eImg = eButton.rows[0].cells[0].children[0];
		if (eImg) 
		{
			var sImgSrc = eImg.src;
			if (sImgSrc.match(/_(\w+)\.gif/)) 
			{
				eImg.src = sImgSrc.replace(RegExp.$1,sState);
			}
		}
	}*/

	// FOUR EVENT-HANDLER FUNCTIONS

	function button_over(eButton)
	{

		// IF WE'RE JUST MOUSING ABOUT WITHIN THE BUTTON, THEN BAIL

		if (window.event && eButton.contains(window.event.fromElement)) return false;

		// OTHERWISE CHANGE BUTTON STYLE

		eButton.style.backgroundColor = sOverBackColor;
		eButton.style.color = sOverTextColor;
		if (eActiveButton != eButton)
		{
			eButton.style.borderColor = sOverBorderColor;
			//SetButtonImage(eButton,"over");
		}
	}


	function button_out(eButton)
	{
		// IF WE'RE JUST MOUSING ABOUT WITHIN THE BUTTON, THEN BAIL
		
		if (window.event && eButton.contains(window.event.toElement)) return false;

		// OTHERWISE CHANGE BUTTON STYLE

		if (eActiveButton != eButton)
		{
			eButton.style.backgroundColor = sOffBackColor;
			eButton.style.borderColor = sOffBorderColor;
			eButton.style.color = sOffTextColor;
			SetButtonPadding(eButton,sOffPadding);
			//SetButtonImage(eButton,"off")
		}
		else
		{
			eButton.style.backgroundColor = sDownBackColor;
			eButton.style.borderColor = sDownBorderColor;
			eButton.style.color = sDownTextColor;
		}
	}

	function button_down(eButton)
	{
		eButton.style.borderColor = sDownBorderColor;
		SetButtonPadding(eButton,sDownPadding);
	}

	function button_up(eButton)
	{

		// IF ANOTHER BUTTON IS ACTIVE, RESET IT

		if (null != eActiveButton && eButton != eActiveButton)
		{
			eActiveButton.style.backgroundColor = sOffBackColor;
			eActiveButton.style.borderColor = sOffBorderColor;
			eActiveButton.style.color = sOffTextColor;
			//SetButtonImage(eActiveButton,"off");
			SetButtonPadding(eActiveButton,sOffPadding);
			eActiveButton = null; 

			// insert code here for button hiding 
			window.status = window.defaultStatus;
		}

		// IF THE BUTTON WE CLICKED IS NOT THE ACTIVE BUTTON, MAKE IT ACTIVE

		if (eButton != eActiveButton)  
		{
			eActiveButton = eButton;
			eActiveButton.style.borderColor = sDownBorderColor;
			eActiveButton.style.color = sDownTextColor;
			SetButtonPadding(eActiveButton,sDownPadding);
			sPaneName = eActiveButton.id.replace(/tbl(.*)Button/,"$1");

			// insert code here for button showing 
			window.status = "Now showing: " + sPaneName;
		}

		// OTHERWISE, RESET IT

		else  
		{
			eActiveButton.style.backgroundColor = sOverBackColor;
			eActiveButton.style.borderColor = sOverBorderColor;
			eActiveButton.style.color = sOverTextColor;
			SetButtonPadding(eActiveButton,sOverPadding);
			eActiveButton = null;

			// insert code here for button hiding 
			window.status = window.defaultStatus;
		}

	}

	function button_keypress(eButton, sURL)
	{
		if ("13" == window.event.keyCode)
		{
			button_down(eButton);
			button_up(eButton);
			self.navigate(sURL)
		}
	}
	
	function cmdClick(sURL)
	{
	 self.navigate(sURL)
	}
//-->
</script>



<table ID="tblCoolbar" CELLPADDING="0" CELLSPACING="0" BORDER="0" WIDTH="100%" ONSELECTSTART="return false;">
<tr VALIGN="middle" align="center">

	<td>
	<table TABINDEX="10" ID="tblHeaderButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" 
	ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" 
	ONKEYPRESS="button_keypress(this,'../Header/frmHeader.asp?frm=Header&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="d" TITLE="Header">
	<tr VALIGN="middle" onclick="javascript:cmdClick('../Header/frmHeader.asp?frm=Header&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
		<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="Header" WIDTH="1" HEIGHT="1"></td>-->
		
		
		<td>&nbsp;
		 <%If sQCType <> "E" Then   %>
		  <A HREF="../Header/frmHeader.asp?frm=Header&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20">Hea<u>d</u>er</a>
		<%Else %>
		 <A HREF="../Header/frmHeader_ESI.asp?frm=Header&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20">Hea<u>d</u>er</a>
		<% End If   %>
		&nbsp;
		</td>
		
	</tr>
	</table>
	</td>

	<td>
	<table TABINDEX="10" ID="tblHistoryButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" 
	ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" 
	ONKEYPRESS="button_keypress(this,'../History/frmHistory.asp?frm=History&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="y" TITLE="History">
	<tr VALIGN="middle" onclick="javascript:cmdClick('../History/frmHistory.asp?frm=History&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
		<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="History" WIDTH="1" HEIGHT="1"></td>-->
		<td>&nbsp;
		<%If sQCType <> "E" Then   %>
		   <a href="../History/frmHistory.asp?frm=History&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20">Histor<U>y</U></a>
		<%Else %>
		  <a href="../History/frmHistory_ESI.asp?frm=History&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20">Histor<U>y</U></a>
		<% End If   %>
		&nbsp;
		
		</td>
	</tr>
	</table>
	</td>

	<td>
	<table TABINDEX="10" ID="tblTapeLayoutButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" 
	ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" 
	ONKEYPRESS="button_keypress(this,'../TapeLayout/frmTapeLayout.asp?frm=TapeLayout&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="T" TITLE="Tape Layout">
	<tr VALIGN="middle" onclick="javascript:cmdClick('../TapeLayout/frmTapeLayout.asp?frm=TapeLayout&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
		<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="Tape Layout" WIDTH="1" HEIGHT="1"></td>-->
		<td>&nbsp;<a href="../TapeLayout/frmTapeLayout.asp?frm=TapeLayout&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>&#tcFrm" TABINDEX="20">Layou<u>t</u></a>&nbsp;</td>
	</tr>
	</table>
	</td>

	<%If sQCType <> "A" And sQCType <> "L" And sQCType <> "E" Then    %>
	<td>
	<table TABINDEX="10" ID="tblTextInfoButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" 
	ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" 
	ONKEYPRESS="button_keypress(this,'../TextInfo/frmTextInfo.asp?frm=TextInfo&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="x" TITLE="Text Information">
	<tr VALIGN="middle" onclick="javascript:cmdClick('../TextInfo/frmTextInfo.asp?frm=TextInfo&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
		<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="Text Information" WIDTH="1" HEIGHT="1"></td>-->
		<td>&nbsp;<a href="../TextInfo/frmTextInfo.asp?frm=TextInfo&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>&#tcFrm" TABINDEX="20">Te<u>x</u>t&nbsp;Info</a>&nbsp;</td>
	</tr>
	</table>
	</td>
    <% End If   %>
	
	<td>
	<table TABINDEX="10" ID="tblAudioTCButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" 
	ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" 
	ONKEYPRESS="button_keypress(this,'../AudioTC/frmAudioTC.asp?frm=AudioTC&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="u" TITLE="Audio and T.C.">
	<tr VALIGN="middle" onclick="javascript:cmdClick('../AudioTC/frmAudioTC.asp?frm=AudioTC&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
		<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="Audio and T.C." WIDTH="1" HEIGHT="1"></td>-->
		<td>&nbsp;<a href="../AudioTC/frmAudioTC.asp?frm=AudioTC&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20">A<u>u</u>dio&nbsp;&&nbsp;T.C.</a>&nbsp;</td>
	</tr>
	</table>
	</td>
	
	 <%If Trim(sQCType) = "E"  Then   %>
		<td>
		<table TABINDEX="10" ID="tblSpecificsButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" 
		ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" 
		ONKEYPRESS="button_keypress(this,'../Endemol/frmSpecifics.asp?frm=Specifics&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="S" TITLE="Specifics">
		<tr VALIGN="middle" onclick="javascript:cmdClick('../Endemol/frmSpecifics.asp?frm=Specifics&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
			<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="Audio and T.C." WIDTH="1" HEIGHT="1"></td>-->
			<td>&nbsp;<a href="../Endemol/frmSpecifics.asp?frm=Specifics&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20"><u>S</u>pecifics</a>&nbsp;</td>
		</tr>
		</table>
		</td>
	  
	<% End If   %>
	
	
	<%If sQCType <> "E" Then   %>
		<td>
		<table TABINDEX="10" ID="tblIndividualSpecsButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" 
		ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" 
		ONKEYPRESS="button_keypress(this,'../IndivSpecs/frmIndivSpecs.asp?frm=IndividualSpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="I" TITLE="Individual Specs">
		<tr VALIGN="middle" onclick="javascript:cmdClick('../IndivSpecs/frmIndivSpecs.asp?frm=IndividualSpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
			<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="Individual Specs" WIDTH="1" HEIGHT="1"></td>-->
			<td>&nbsp;<a href="../IndivSpecs/frmIndivSpecs.asp?frm=IndividualSpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20"><u>I</u>ndividual</a>&nbsp;</td>
		</tr>
		</table>
		</td>

	<td>
	<table TABINDEX="10" ID="tblOverallSpecsButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" 
	ONFOCUS="button_over(this);" ONBLUR="button_out(this);" ONKEYPRESS="button_keypress(this,'../OverallSpecs/frmOverallSpecs.asp?frm=OverallSpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="O" TITLE="Overall Specs">
	<tr VALIGN="middle" onclick="javascript:cmdClick('../OverallSpecs/frmOverallSpecs.asp?frm=OverallSpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
		<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="Overall Specs" WIDTH="1" HEIGHT="1"></td>-->
		<td>&nbsp;
		<a href="../OverallSpecs/frmOverallSpecs.asp?frm=OverallSpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20"><u>O</u>verall</a>
		&nbsp;</td>
	</tr>
	</table>
	</td>
	<%Elseif sQCType = "E" And strAssetType = "File" Then %>
	<td>
	<table TABINDEX="10" ID="tblOverallSpecsButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" 
	ONFOCUS="button_over(this);" ONBLUR="button_out(this);" ONKEYPRESS="button_keypress(this,'../OverallSpecs/frmOverallSpecs_ESI.asp?frm=OverallSpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="O" TITLE="Overall Specs">
	<tr VALIGN="middle" onclick="javascript:cmdClick('../OverallSpecs/frmOverallSpecs_ESI.asp?frm=OverallSpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
		<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="Overall Specs" WIDTH="1" HEIGHT="1"></td>-->
		<td>&nbsp;
		<a href="../OverallSpecs/frmOverallSpecs_ESI.asp?frm=OverallSpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20"><u>O</u>verall</a>
		&nbsp;</td>
	</tr>
	</table>
	</td>
	
	  <% End If   %>
	
	
	<%If sQCType <> "A" Then   %>
	
	    <%If sQCType <> "L"  And sQCType <> "T"   And sQCType <> "E" Then    %>
			<td>
			<table TABINDEX="10" ID="tblBVHESpecsButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" 
			ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" 
			ONKEYPRESS="button_keypress(this,'../BVHESpecs/frmBVHESpecs.asp?frm=BVHESpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="B" TITLE="BVHE Specs">
			<tr VALIGN="middle" onclick="javascript:cmdClick('../BVHESpecs/frmBHVESpecs.asp?frm=BHVESpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
				<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="BHVE Specs" WIDTH="1" HEIGHT="1"></td>-->
				<td>&nbsp;<a href="../BVHESpecs/frmBVHESpecs.asp?frm=BVHESpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20"><u>B</u>VHE</a>&nbsp;</td>
			</tr>
			</table>
			</td>
			
			<td>
			<table TABINDEX="10" ID="tblCTISSSpecsButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" ONMOUSEDOWN="button_down(this);" 
			ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" 
			ONKEYPRESS="button_keypress(this,'../CTISSSpecs/frmCTISSSpecs.asp?frm=CTISSSpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="C" TITLE="CTISS Specs">
			<tr VALIGN="middle" onclick="javascript:cmdClick('../CTISSpecs/frmCTISSSpecs.asp?frm=CTISSSpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
				<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="CTISS Specs" WIDTH="1" HEIGHT="1"></td>-->
				<td><a href="../CTISSSpecs/frmCTISSSpecs.asp?frm=CTISSSpecs&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20"><u>C</u>TISS</a>&nbsp;</td>
			</tr>
			</table>
			</td>	
		<% End If   %>
		
		<%If sQCType <> "T" Then    %>
			<td>
			<table TABINDEX="10" ID="tblLogButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" 
			ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" 
			ONKEYPRESS="button_keypress(this,'../Log/frmLog.asp?frm=Log&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="L" TITLE="Log">
			<tr VALIGN="middle" onclick="javascript:cmdClick('../Log/frmLog.asp?frm=Log&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
				<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="Log" WIDTH="1" HEIGHT="1"></td>-->
				<td>&nbsp;<a href="../Log/frmLog.asp?frm=Log&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20"><u>L</u>og</a>&nbsp;</td>
			</tr>
			</table>
			</td>
	   <% End If   %>
	<% End If   %>
	
	<%If sQCType <> "E" Then   %>
	<td>
	<table TABINDEX="10" ID="tblFinalButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" 
	ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" 
	ONKEYPRESS="button_keypress(this,'../Final/frmFinal.asp?frm=Final&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="F" TITLE="Final">
	<tr VALIGN="middle" onclick="javascript:cmdClick('../Final/frmFinal.asp?frm=Final&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
		<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="Final" WIDTH="1" HEIGHT="1"></td>-->
		<td>&nbsp;<a href="../Final/frmFinal.asp?frm=Final&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20"><u>F</u>inal</a>&nbsp;</td>
	</tr>
	</table>
	</td>
	<% Else %>
		<td>
		<table TABINDEX="10" ID="tblFinalButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" 
		ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" 
		ONKEYPRESS="button_keypress(this,'../Final/frmFinal_ESI.asp?frm=Final&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>');" ACCESSKEY="F" TITLE="Final">
		<tr VALIGN="middle" onclick="javascript:cmdClick('../Final/frmFinal_ESI.asp?frm=Final&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>')">
			<!--<td><img HSPACE="1" BORDER="0" SRC="../images/spacer_off.gif" ALT="Final" WIDTH="1" HEIGHT="1"></td>-->
			<td>&nbsp;<a href="../Final/frmFinal_ESI.asp?frm=Final&sJobNum=<%=sJobNum%>&sQCNum=<%=sQCNum%>&sRev=<%=sRev%>" TABINDEX="20"><u>F</u>inal</a>&nbsp;</td>
		</tr>
		</table>
		</td>
	
	<% End If   %>
	
</tr>
</table>
<script LANGUAGE="JScript"><!--

	// OPTIONAL: START WITH CONTENTS BUTTON ACTIVE
	var sFrm = "<%=SFrm%>";
    if (sFrm != "RevDetails")
    {
	button_over(tbl<%=sFrm%>Button);
	button_up(tbl<%=sFrm%>Button);
	button_out(tbl<%=sFrm%>Button);
	}

	// PRELOAD "OVER" IMAGES

	var sImgPath = "../images/";
	var aImgNames = new Array("spacer");
	var aImgs = new Array();
	for (var i=0;i<aImgNames.length;i++)
	{
		aImgs[i] = new Image();
		aImgs[i].src = sImgPath + aImgNames[i] + "_over.gif";
	}

//--></script>



