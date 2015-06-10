@echo off

:again
	tasklist /FI "IMAGENAME eq openvpn.exe" 2>NUL | find /I /N "openvpn.exe">NUL
	if "%ERRORLEVEL%" NEQ "0" (
		echo Programm NOT is running
		::taskkill /f /im uTorrent.exe
		taskkill /f /im qbittorrent.exe
		
	) else (
		echo VPN on, we good
	)
	echo waiting for 1sec
	ping 1.1.1.1 -n 1 -w 500 > nul
goto again