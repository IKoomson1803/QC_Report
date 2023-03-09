<!-- Updated to ensure no blank channels are added to the report Isaac Koomson 04/01/2012 -->
<!--<link REL="stylesheet" TYPE="text/css" HREF="../css/qcs.css">-->
<style>
BODY { COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; TEXT-DECORATION: none; }
DIV.PageBreak {break-after: always; page-break-before: always; }
TD {COLOR: #000000; FONT-FAMILY: Tahoma; font-size: 8pt; }

.BanijayRightsProgrammeDetails{
	background-color:#5C013F;
	color: #fff;
	font-size:12px;
	font-weight:bold;
	width:20%;
	text-align:right;
	border-style:none;
}

.BanijayRightsProgrammeLayout{
	background-color:#5C013F;
	color: #fff;
	font-size:12px;
	font-weight:bold;
	text-align:center;
	border-style:none;
}


.BanijayRightsText, .BanijayRightsLable{
	font-size:12px;
}

.BanijayRightsVideoLable, .BanijayRightsLable{
font-weight:bold;
}

.BanijayRightsVideoLable, .BanijayRightsVideoText {
width:12%;
font-size:12px;
}

.SolidBorder{
border: 2px solid black;
}

</style>

<%

''Response.Write "BANIJAY RIGHTS QC REPORT"

%>

   <!--  Header -->
   <!-- #include file="Header_BanijayRights.asp" -->

  <!--  Programme Details -->
   <!-- #include file="ProgrammeDetails_BanijayRights.asp" -->

    <!-- AUDIO -->
	<!-- #include file="FileAudioSpecifications_BanijayRights.asp" -->
	
	<!-- VIDEO -->
   <!-- #include file="Video_BanijayRights.asp" -->
	
	 <!--  PROGRAMME LAYOUT -->
    <!-- #include file="ProgrammeLayout_BanijayRights.asp" -->
   
    <!--  TEXT DETAILS -->
	<!-- #include file="TextDetails_BanijayRights.asp" -->
	
	<!-- FAULTS -->
   <!-- #include file="Faults_BanijayRights.asp" -->
   
   <!-- NOTES -->
   <!-- #include file="Notes_BanijayRights.asp" -->