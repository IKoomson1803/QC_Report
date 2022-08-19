<%@ Language=VBScript %>
<%option explicit%>
<html>
<head>
<!--TOOLBAR_START-->
<!--TOOLBAR_EXEMPT-->
<!--TOOLBAR_END-->
<!--#include file="include/connect.asp"-->
<!--#include file="include/login.asp"-->
<title>QCS Toolbar</title>

<meta NAME="robots" CONTENT="noindex">

</head>

<style TYPE="text/css"><!--

	BODY { font-family:verdana; font-size:80%; }

	TABLE#tblCoolbar { 
		background-color:threedface; padding:1px; color:menutext; 
		border-width:1px; border-style:solid; 
		border-color:threedhighlight threedshadow threedshadow threedhighlight;
	}

	TABLE#tblCoolbar TABLE { 
		font-family:tahoma; font-size:70%; color:menutext; 
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
	
--></style>

<script LANGUAGE="JScript"><!--

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
			self.parent.qcsbody.navigate(sURL)
		}
	}
	
	function cmdClick(sURL)
	{
	 self.parent.qcsbody.navigate(sURL)
	}

	function openBrWindow(theURL,winName,features) { //v2.0
	window.open(theURL,winName,features);
}
//--></script>

<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" bgcolor="threedface">

<table ID="tblCoolbar" CELLPADDING="0" CELLSPACING="0" BORDER="0" WIDTH="100%" ONSELECTSTART="return false;">
<tr VALIGN="middle">

	<td>
	<table TABINDEX="1" ID="tblNavigateButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" ONKEYPRESS="button_keypress(this,'nav.htm');" ACCESSKEY="N" TITLE="Navigate">
	<tr VALIGN="middle" onclick="javascript:cmdClick('nav.htm')">
		<td><img HSPACE="1" BORDER="0" SRC="images/Navigate_off.gif" ALT="Navigate" WIDTH="18" HEIGHT="19"></td>
		<td><a href="Nav.htm" target="qcsbody"><u>N</u>avigate&nbsp;&nbsp;&nbsp;</a></td>
	</tr>
	</table>
	</td>
<% if sLevel = 3 then %>
	<td>
	<table TABINDEX="1" ID="tblAdministrationButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" ONKEYPRESS="button_keypress(this,'admin/default.asp');" ACCESSKEY="A" TITLE="Administration">
	<tr VALIGN="middle" onclick="javascript:cmdClick('admin/default.asp')">
		<td><img HSPACE="1" BORDER="0" SRC="images/Administration_off.gif" ALT="Administration" WIDTH="16" HEIGHT="16"></td>
		<td><a href="admin/default.asp" target="qcsbody"><u>A</u>dministration&nbsp;&nbsp;&nbsp;</a></td>
	</tr>
	</table>
	</td>
<%end if%>
	<!--
	<td>
	<table TABINDEX="1" ID="tblSupportButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" ONKEYPRESS="button_keypress(this,'help/help.htm');" ACCESSKEY="S" TITLE="Support">
	<tr VALIGN="middle" onclick="javascript:cmdClick('help/help.htm')">
		<td><img HSPACE="1" BORDER="0" SRC="images/support_off.gif" ALT="Support" WIDTH="16" HEIGHT="16"></td>
		<td><a href="help/help.htm" target="qcsbody"><u>S</u>upport&nbsp;&nbsp;&nbsp;</a></td>
	</tr>
	</table>
	</td>
	-->
	<td align="right" width="100%">
	<table TABINDEX="1" ID="tblHelpButton" CELLPADDING="0" CELLSPACING="0" BORDER="0" ONMOUSEOVER="button_over(this);" ONMOUSEOUT="button_out(this);" ONMOUSEDOWN="button_down(this);" ONMOUSEUP="button_up(this);" ONFOCUS="button_over(this);" ONBLUR="button_out(this);" ONKEYPRESS="button_keypress(this,'help/help.htm');" ACCESSKEY="H" TITLE="Help">
	<tr VALIGN="middle" onclick="javascript:openBrWindow('help/Help.htm','QCHelp','width=275,height=440')">
		<td><img HSPACE="1" BORDER="0" SRC="images/help_off.gif" ALT="Help" WIDTH="16" HEIGHT="16"></td>
		<td><u>H</u>elp&nbsp;&nbsp;&nbsp;</td>
	</tr>
	</table>
	</td>

</tr>
</table>

<script LANGUAGE="JScript"><!--

	// OPTIONAL: START WITH CONTENTS BUTTON ACTIVE

	button_over(tblNavigateButton);
	button_up(tblNavigateButton);
	button_out(tblNavigateButton);

	// PRELOAD "OVER" IMAGES

	var sImgPath = "images/";
	var aImgNames = new Array("navigate","administration","support","help");
	var aImgs = new Array();
	for (var i=0;i<aImgNames.length;i++)
	{
		aImgs[i] = new Image();
		aImgs[i].src = sImgPath + aImgNames[i] + "_over.gif";
	}

//--></script>

</body>
</html>

