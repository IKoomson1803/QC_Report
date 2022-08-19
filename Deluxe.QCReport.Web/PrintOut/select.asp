<%@ Language=VBSCRIPT%>
<%option explicit%>
<HTML>
<HEAD>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<META NAME="robots" CONTENT="noindex">
<TITLE></TITLE>
</HEAD>
<STYLE TYPE="text/css"><!--

	BODY { font-family:verdana; font-size: 85%; }

	TABLE { font-family:verdana; font-size: 90%; }

	TABLE#tblCoolbar TABLE { 
		font-family:tahoma; font-size:95%; color:menutext; 
		border:1px solid threedface; cursor:hand; padding:1px; 
	}
	
A
{
    COLOR: black;
    FONT-FAMILY: tahoma;
    TEXT-DECORATION: none
}

A:hover
{
    COLOR: #3366ff;
    FONT-FAMILY: tahoma;
    TEXT-DECORATION: none
}
	
--></STYLE>
<SCRIPT LANGUAGE="JScript"><!--

	// SET SOME "CONSTANT" VALUES FOR THE SCRIPT
	// MAKES PLAYING WITH LOOK AND FEEL A LOT EASIER

	var sOffBackColor = "threedface";
	var sOffTextColor = "menutext"
	var sOffBorderColor = "threedface";
	var sOffPadding = "1px 1px 1px 1px";

	var sOverBackColor = "threedface";
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
		eButton.rows[0].cells[1].style.padding = sPaddingStyle;
	}
	
	function SetButtonImage(eButton,sState)
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
	}
	
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
			SetButtonImage(eButton,"over");
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
			SetButtonImage(eButton,"off")
		}
		else
		{
			eButton.style.backgroundColor = sOffBackColor;
			eButton.style.borderColor = sOffBorderColor;
			eButton.style.color = sOffTextColor;
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
			SetButtonImage(eActiveButton,"off");
			SetButtonPadding(eActiveButton,sOffPadding);
			eActiveButton = null; 

			// insert code here for button hiding 
			window.status = window.defaultStatus;
		}

		// IF THE BUTTON WE CLICKED IS NOT THE ACTIVE BUTTON, MAKE IT ACTIVE

		if (eButton != eActiveButton)  
		{
			eActiveButton = eButton;		
			eActiveButton.style.backgroundColor = sOverBackColor;
			eActiveButton.style.borderColor = sOverBorderColor;
			eActiveButton.style.color = sOverTextColor;
			SetButtonPadding(eActiveButton,sOverPadding);
			eActiveButton = null;

			// insert code here for button hiding 
			window.status = window.defaultStatus;
	
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
		if ("13" == window.event.keyCode) or ("32" == window.event.keyCode)
		{
			button_down(eButton);
			button_up(eButton);
			parent("main").navigate(sURL)
		}
	}
function OpenNewQCFrm(url)
	{
		window.open (url,"win",'toolbar=0,location=0,directories=0,status=1,menubar=0,scrollbars=0,resizable=0,width=550,height=380');
	}
function cmdClick(sURL)
	{
	 parent("main").navigate(sURL)
	}
//--></SCRIPT>
<!--#include file="include/connect.asp"-->
<!--#include file="include/login.asp"-->
<BODY rightmargin=0 topmargin=0 leftmargin=0 bgcolor="threedface">

<table width=215 bgcolor="threedface">
<form bgcolor="threedface" action="tree.asp" target="tree" method=post name="frmSelect">
	<tr>
		<td align=right>Job #:</td><td><INPUT type="text" id=txtJobNum name="txtJobNum" size=8></td>
		<td align=center>
			<TABLE ID="tblCoolbar" CELLPADDING="0" CELLSPACING="0" BORDER="0" WIDTH="100%" ONSELECTSTART="return false;">
				<TR VALIGN="middle">

					<TD>
					<TABLE TABINDEX="1" ID="tblSearchButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" ONKEYPRESS="button_keypress(this, 'search/frmSearch.asp');" ACCESSKEY="A" TITLE="Advanced Search">
					<TR VALIGN="middle">
						<TD><IMG HSPACE="1" HEIGHT="19" WIDTH="18" BORDER="0" 
						SRC="images/search_off.gif" ALT="Advanced Search"
						onclick="javascript:cmdClick('search/frmSearch.asp')"></TD>
						<TD><a href="search/frmSearch.asp" target="main" alt="Advanced Search">Advanced</a>&nbsp;&nbsp;&nbsp;</TD>
					</TR>
					</TABLE>
					</TD>

				</TR>
			</TABLE>
		</td>
	</tr>
	<tr>
		<td align=right>QC #:</td><td><INPUT type="text" id=txtQCNum name="txtQCNum" size=8></td>
		<td align=center>Rev: <INPUT type="text" id=txtRev name=txtRev  size=3></td>
	</tr>
</table>
<table width=215 bgcolor="threedface">
	<tr>
		<td><INPUT type="submit" value="Select" id=btnSelect name=btnSelect>&nbsp<INPUT type="reset" value="Reset" id=reset name=reset></td>
<%if sLevel >=1 then%>
		<td align="right"><INPUT type="button" value="New QC" id=btnNewQC name=btnNewQC onclick="javascript:OpenNewQCFrm('NewQC/frmNewQC.asp')"></td>
<%end if%>
	</tr>
</form>
</table>


<SCRIPT LANGUAGE="JScript"><!--

	// OPTIONAL: START WITH CONTENTS BUTTON ACTIVE

	//button_over(tblSearchButton);
	//button_up(tblSearchButton);
	//button_out(tblSearchButton);

	// PRELOAD "OVER" IMAGES

	var sImgPath = "images/";
	var aImgNames = new Array("search");
	var aImgs = new Array();
	for (var i=0;i<aImgNames.length;i++)
	{
		aImgs[i] = new Image();
		aImgs[i].src = sImgPath + aImgNames[i] + "_over.gif";
	}

//--></SCRIPT>
</BODY>
</HTML>
