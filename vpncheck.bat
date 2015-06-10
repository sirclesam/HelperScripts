@echo off

:again
findstr  "CONNECTED" "F:\Program Files\pia_manager\data\status_file.txt" > nul
if "%ERRORLEVEL%" NEQ "0" (
	echo VPN NOT is connected
	taskkill /f /im qbittorrent.exe		
) else (
	echo VPN on, we good
)
echo waiting for 1sec
ping 1.1.1.1 -n 1 -w 500 > nul
goto again