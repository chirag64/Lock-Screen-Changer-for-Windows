@ECHO OFF
COLOR 0A
IF NOT (%1)==() GOTO LABEL2
:LABEL1
ECHO Welcome to Chiroo's Logon background image changing script (Windows 7)
ECHO.
ECHO To use this script, drag an image on the file name instead of opening it by double-click.
ECHO.
ECHO The image must be in jpg format and must be smaller than 245KiB, and must have one of the following resolutions...
ECHO.
ECHO 768x1280 960x1280 900x1440 1024x768 1024x1280 1280x768 1280x960 1280x1024 1360x768 1440x900 1600x1200 1920x1200
ECHO.
ECHO The program will now exit
ECHO.
PAUSE
GOTO END

:LABEL2
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background" /V OEMBackground /T REG_DWORD /d 00000001 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /V OEMBackground /T REG_DWORD /d 00000001 /f
CD /D C:\WINDOWS\SYSTEM32\
MD oobe
CD oobe
MD info
CD info
MD backgrounds
CD backgrounds
COPY /Y %1 backgroundDefault.jpg || ECHO Some Error Occurred && PAUSE
:END