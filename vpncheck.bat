@echo off

:again
findstr  "CONNECTED" "C:\Program Files\pia_manager\data\status_file.txt" > nul
if "%ERRORLEVEL%" NEQ "0" (
	echo VPN NOT is connected
	taskkill /f /im qbittorrent.exe		
) else (
	echo File Status = CONNECTED
)
tasklist /FI "IMAGENAME eq openvpn.exe" 2>NUL | find /I /N "openvpn.exe">NUL
if "%ERRORLEVEL%" NEQ "0" (
	echo Programm NOT is running
	::taskkill /f /im uTorrent.exe
	taskkill /f /im qbittorrent.exe
	
) else (
	echo OpenVPN Running
)

::echo %TIME% >> C:\Users\Samwise\HelperScripts\qwert.txt

echo waiting for 1sec
ping 1.1.1.1 -n 1 -w 500 > nul
echo -------------------------
goto again
