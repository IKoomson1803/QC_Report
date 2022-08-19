<%
dim sUserName, rsQcUser, sqlLogin
dim sLevel, nQCUserID, sQCFullName
'********************************************************
'This include checks the database for username and gets
'a security level for the requested user
'********************************************************
sUserName = Request.ServerVariables("LOGON_USER")

If instr(1, sUserName, "\") > 0 then
	sUserName = mid(sUserName, instr(1, sUserName, "\") + 1)
end if

set rsQCUser = server.CreateObject("ADODB.Recordset")
	
sqlLogin = "SELECT qcUserID, SecurityLevel, FullName " & _
			"FROM qcUsers " & _
			"WHERE (Deleted IS NULL OR Deleted = 0) AND UserName = '" & sUserName & "'"
				
rsQcUser.ActiveConnection = cnQCS
rsQcUser.Open sqlLogin



if rsQcUser.BOF = true AND rsQcUser.EOF = true then
sLevel = 0
else
	sLevel = rsQcUser.Fields("SecurityLevel")
	nQCUserID = rsQcUser.Fields("qcUserID")
	sQCFullName = rsQcUser.Fields("FullName")
end if




rsQcUser.Close
set rsQCUser = nothing

%>