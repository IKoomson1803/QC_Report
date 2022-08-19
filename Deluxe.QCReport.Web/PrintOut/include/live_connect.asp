<%
'*********************************************
'<!--#include file="include/connect.asp"-->
'The following is for an ADO connection to a 
'QCS database on your LAN.  Use this include
'file to set an active connection to your ADO
'Recordsets and Command objects.
'*********************************************
dim cnQCS

Set cnQCS = server.CreateObject ("ADODB.Connection")
						
cnQCS.ConnectionString ="Driver=SQL Server" & _
						";Server=10.100.114.62" & _
						";UID=bward" & _
						";PWD=qcuser" & _
						";Regional=No" & _
						";Language=British" & _
						";DATABASE=QCSUK"
cnQCS.Open

'*********************************************
'Be sure to close out and set this object to 
'nothing when you are finished with the 
'connection.  Example:
'                     cnQCS.Close
'                     set cnQCS = Nothing
'*********************************************
%>
