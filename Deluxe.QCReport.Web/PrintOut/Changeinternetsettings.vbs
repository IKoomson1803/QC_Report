Dim SH, proxy, override
Set SH = CreateObject("WScript.Shell")


SH.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1001",0,"REG_DWORD"
SH.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1004",0,"REG_DWORD"
SH.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201",0,"REG_DWORD"

SH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201",0,"REG_DWORD"
SH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1004",0,"REG_DWORD"
SH.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201",0,"REG_DWORD"

msgbox "changes Written"


