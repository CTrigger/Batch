color A
echo off
cls
:VERWIN
	cls
	echo por favor efetue uma escolha:
	echo 1 = Windows XP
	echo 2 = Windows Vista ou 7
	echo 3 = Windows 8
	echo. VersÆo do Windows?
	set /p type=  
	if %type% == 1 GOTO IPWXP
	if %type% == 2 GOTO IPWV7
	if %type% == 3 GOTO IPW08

:IPWXP
	set Windows="Windows XP"
	set Entry=ip
	set WinVer="ConexÆo Local"
	set Dns=dns
	cls
	GOTO SETTING
	
:IPWV7
	set Windows="Windows 7"
	set Entry=ipv4
	set WinVer="ConexÆo Local"
	set Dns=dnsservers
	cls
	GOTO SETTING


:IPW08
	set Windows="Windows 8"
	set Entry=ipv4
	set WinVer=Ethernet
	set Dns=dnsservers
	cls
	GOTO SETTING


:SETTING
	cls
	echo selecionado %Windows%
	echo.
	echo Digite o ip:
	set /p iplocal=
	echo Digite a Mascara de sub-rede:
	set /p mascara=
	echo Digite o Gateway padrão:
	set /p	gateway=
	netsh interface %Entry% set address name=%WinVer% source=static %iplocal% %mascara% %gateway% 1
	netsh interface %Entry% set address name=%WinVer% static %iplocal% %mascara% %gateway% 1


:DNS	
	echo 1 = Digitar DNS
	echo 2 = Autom tico do Google
	echo 3 = Autom tico (Sem Configura‡äes)
	set /p type= Necessario Alterar Dns? 
	if %type% == 1 GOTO SETDNS1
	if %type% == 2 GOTO DNSGOOGLE
	if %type% == 3 GOTO SETDNSATC
	

:SETDNS1
	cls
	set CurrentDNS1=Digite o Dns Primario
	set CurrentDNS2=Digite o Dns Secundario
	GOTO DNSSTC


:DNSGOOGLE
	cls
	set CurrentDNS1=8.8.8.8
	set CurrentDNS2=8.8.4.4
	GOTO DNSSTC


:DNSSTC
	cls
	netsh int %Entry% set %Dns% %WinVer% static %CurrentDNS1%
	cls
	netsh int %Entry% add %Dns% %WinVer% %CurrentDNS2%
	cls
	GOTO DNSCHOOSE


:DNSATC
	cls
	netsh int %Entry% set %Dns% %WinVer% dhcp
	cls
	GOTO DNSCHOOSE
	
:DNSCHOOSE
	cls
	echo por favor aguarde 
	@timeout 3
	ipconfig
	echo.
	echo.
	echo 1 = Menu
	echo 2 = Sair
	echo.
	set /p type=O que deseja fazer? 
	if %type% == 1 GOTO MENU
	if %type% == 2 GOTO Exit


