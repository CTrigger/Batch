REM Works in Brazilian Windows must run as admin and i not tested with W8 or superior.

echo off
color a
cls
dir "%userprofile%"\"configura‡äes locais"\"dados de aplicativos"\mozilla\firefox\profiles /b>"%userprofile%"\desktop\temp
set /P XP=<"%userprofile%"\desktop\temp		
echo.	
dir %userprofile%\appdata\roaming\mozilla\firefox\profiles /b> %userprofile%\desktop\temp		
set /P SEVEN=<"%userprofile%"\desktop\temp		
echo.
echo.
echo %XP%	;	%SEVEN%
del "%userprofile%"\desktop\temp
del "c:\windows\system32\logof.dll" /Q
del "%userprofile%"\"configura‡äes locais"\"dados de aplicativos"\mozilla\firefox\profiles\%XP%\cache\*.* /Q /S
del "%userprofile%"\"appdata"\"roaming"\"mozilla"\"firefox"\"profiles"\%SEVEN%\cache\*.* /Q /S
del "%userprofile%"\"AppData"\"Local"\"Google"\"Chrome"\"User Data"\Default\cache\*.* /Q /S
del "%userprofile%"\"configura‡äes locais"\"Dados de aplicativos"\Google\Chrome\"User Data"\Default\cache\*.* /Q /S
pause
