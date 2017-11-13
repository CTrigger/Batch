@echo off
color A
:MENU
	cls
	@echo.   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
	@echo. *								*
	@echo. *		Ricardo Kim Script Creator			*
	@echo. *								*
	@echo. *			Email hexadecimal.exe@gmail.com		*
	@echo. *								*
	@echo.   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
	echo.
	echo.
	echo.
	echo.
	echo.	(1)  Units
	echo.	(2)  Pendrive e Midia ROM
	echo.	(3)  Control Panel
	echo.	(4)  Wallpaper
	echo.	(5)  Properties to my Computer
	echo.	(6)  Win Update
	echo.	(7)  Task
	echo.	(8)  Compress
	echo.	(9)  WinR in Start
	echo.	(10) WinClock
	echo.	(11) Messenger
	echo.
	set /p type=Select the option: 
	if %type% == 1 GOTO UNIT
	if %type% == 2 GOTO MIDIA
	if %type% == 3 GOTO PANEL
	if %type% == 4 GOTO WALL
	if %type% == 5 GOTO PROPER
	if %type% == 6 GOTO WINUP
	if %type% == 7 GOTO TASK
	if %type% == 8 GOTO COMPRESS
	if %type% == 9 GOTO WINR
	if %type% == 10 GOTO CLOCK
	if %type% == 11 GOTO MESSENGER
	if %type% == 88 GOTO TEST
	if %type% == 99 GOTO IMPROVE

:UNIT
	echo.	(0) Deny
	echo.	(1) Allow
	echo.
	set /p type=Select the option: 
	if %type% == 0 GOTO DenyUnit
	if %type% == 1 GOTO AllowUnit
	:DenyUnit
		REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDrives /t REG_DWORD /d 120
		GOTO CHOOSE
	:AllowUnit
		REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDrives /t REG_DWORD /d 0
		GOTO CHOOSE

:MIDIA
	echo.	(0) Deny
	echo.	(1) Allow
	echo.
	set /p type=Select the option: 
	if %type% == 0 GOTO DenyPendrive
	if %type% == 1 GOTO AllowPendrive

	:DenyPendrive
		REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v"Start /t REG_DWORD /d 0x00000003 /f
		GOTO DenyCDRoom
	:AllowPendrive
		REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v Start /t REG_DWORD /d 0x00000004 /f
		GOTO AllowCDRoom
	:DenyCDRoom
		GOTO CHOOSE
		REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cdrom" /v Start /t REG_DWORD /d 0X00000004 /f
	:AllowCDRoom
		REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cdrom" /v Start /t REG_DWORD /d 0X00000001 /f
		GOTO CHOOSE

:PANEL
	echo.	(0) Deny
	echo.	(1) Allow
	echo.
	set /p type=Select the option: 
	if %type% == 0 GOTO DenyControlPanel
	if %type% == 1 GOTO AllowControlPanel
	:DenyControlPanel
		REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoControlPanel /t REG_DWORD /d 0x00000001 /f 
		GOTO CHOOSE
	:AllowControlPanel
		REG DELETE "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoControlPanel
		GOTO CHOOSE

:WALL
	echo.	(0) Deny
	echo.	(1) Allow
	echo.
	set /p type=Select the option: 
	if %type% == 0 GOTO DenyWallPaper
	if %type% == 1 GOTO AllowWallPaper
	:DenyWallPaper
		REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDesktopCleanupWizard /t REG_DWORD /d 0x00000001 /f 
		GOTO CHOOSE
	:AllowWallPaper
		REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDesktopCleanupWizard /t REG_DWORD /d 0x00000000 /f 
		GOTO CHOOSE


:PROPER
	echo.	(0) Deny
	echo.	(1) Allow
	echo.
	set /p type=Select the option: 
	if %type% == 0 GOTO DenyPropertiesComp
	if %type% == 1 GOTO AllowPropertiesComp
	:DenyPropertiesComp
		REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoPropertiesMyComputer /t REG_DWORD /d 0x00000001 /f 
		GOTO CHOOSE
	:AllowPropertiesComp
		REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoPropertiesMyComputer /t REG_DWORD /d 0x00000000 /f 
		GOTO CHOOSE

:WINUP
	echo.	(0) Deny
	echo.	(1) Allow
	echo.
	set /p type=Select the option: 
	if %type% == 0 GOTO DenyWUpdate
	if %type% == 1 GOTO AllowWUpdate
	:DenyWUpdate
		REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoAutoUpdate /t REG_DWORD /d 0x00000001 /f 
		GOTO CHOOSE
	:AllowUpdate
		REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoAutoUpdate /t REG_DWORD /d 0x00000000 /f 
		GOTO CHOOSE


:TASK
	echo.	(0) Deny
	echo.	(1) Allow
	echo.
	set /p type=Select the option: 
	if %type% == 0 GOTO DenyTask
	if %type% == 1 GOTO AllowTask
	:DenyTask
		REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 0x00000001 /f 
		GOTO CHOOSE
	:AllowTask
		REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 0x00000000 /f 
		GOTO CHOOSE


:COMPRESS
	echo.	(0) Deny
	echo.	(1) Allow
	echo.
	set /p type=Select the option: 
	if %type% == 0 GOTO DelCompressOldFiles
	if %type% == 1 GOTO RestCompressldFiles
	:DelCompressOldFiles
		REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Compress old files" /f 
		GOTO CHOOSE
	:RestCompressOldFiles
		REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Compress old files" /f 
		GOTO CHOOSE

:WINR
	echo.	(0) Deny
	echo.	(1) Allow
	echo.
	set /p type=Select the option: 
	if %type% == 0 GOTO DenyExecIni
	if %type% == 1 GOTO AllowExecIni
	:DenyExecIni
		REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoRun /t REG_DWORD /d 0x00000001 /f 
		GOTO CHOOSE
	:AllowExecIni
		REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoRun /t REG_DWORD /d 0x00000000 /f 
		GOTO CHOOSE

:CLOCK
	echo.	(0) Deny
	echo.	(1) Allow
	echo.
	set /p type=Select the option: 
	if %type% == 0 GOTO DenyWindowsClock
	if %type% == 1 GOTO AllowWindowsClock
	:DenyWindowsClock
		REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideClock /t REG_DWORD /d 0x00000001 /f 
		GOTO CHOOSE
	:AllowWindowsClock
		REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideClock /t REG_DWORD /d 0x00000000 /f 
		GOTO CHOOSE


:MESSENGER
	echo.	(0) Deny
	echo.	(1) Allow
	echo.
	set /p type=Select the option: 
	if %type% == 0 GOTO DenyWMsg
	if %type% == 1 GOTO AllowWMsg
	:DenyWMsg
		REG ADD "HKLM\Software\Policies\Microsoft\Messenger\Client" /v PreventRun /t REG_DWORD /d 0x00000001 /f 
		GOTO CHOOSE
	:AllowWMsg
		REG ADD "HKLM\Software\Policies\Microsoft\Messenger\Client" /v PreventRun /t REG_DWORD /d 0x00000000 /f 
		GOTO CHOOSE





:IMPROVE
	REG ADD "HKCU\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2 /f 
	REG ADD "HKU\.DEFAULT\Control Panel\Desktop" /v InitialKeyboardIndicators /t REG_SZ /d 2 /fboardIndicators /t REG_SZ /d 2 /f 
	REG ADD "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 100 /f 
	REG ADD "HKU\.DEFAULT\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 100 /f 
	REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisableThumbnailCache /t REG_SZ /d 1 /f 
	REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Cache" /v Persistent /t REG_DWORD /d 0x00000000 /f 
	REG ADD "HKLM\Software\Microsoft\Security Center" /v UpdatesDisableNotify /t REG_DWORD /d 0x00000001 /f 
	REG ADD "HKLM\System\CurrentControlSet\Control\Terminal Server" /v AllowTSConnections /t REG_DWORD /d 0x00000001 /f 
	REG ADD "HKLM\System\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0x00000001 /f 
	REG ADD "HKLM\System\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 0x00000001 /f 
	GOTO CHOOSE
:TEST
	REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoSimpleStartMenu /t REG_DWORD /d 0x00000001 /f 
	REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /v Use FormSuggest /t REG_SZ /d no /f 
	REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /v FormSuggest Passwords /t REG_SZ /d no /f 
	REG ADD "HKCU\Software\Microsoft\Internet Explorer\Main" /v FormSuggest PW Ask /t REG_SZ /d no /f 
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v CacheHashTableBucketSize /t REG_DWORD /d 0x00000001 /f 
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v CacheHashTableSize /t REG_DWORD /d 0x00000180 /f 
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v MaxCacheEntryTtLimit /t REG_DWORD /d 0x0000fa00 /f 
	REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v MaxSOACacheEntryTtLimit /t REG_DWORD /d 0x0000012d /f 
	REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Cache" /v Persistent /t REG_DWORD /d 0x00000000 /f 
	REG ADD "HKLM\Software\Microsoft\Security Center" /v FirewallDisableNotify /t REG_DWORD /d 0x00000001 /f 
	REG ADD "HKCU\Control Panel\Desktop" /v PaintDesktopVersion /t REG_DWORD /d 0x00000001 /f 
	GOTO CHOOSE

:CHOOSE
	echo.
	echo.
	echo.	(1) Menu
	echo.	(2) Exit
	echo.
	set /p type=Ready Select the next Step: 
	if %type% == 1 GOTO MENU
	if %type% == 2 GOTO EXIT

:EXIT
	cls
	echo. Exiting in
	timeout 3
	exit
