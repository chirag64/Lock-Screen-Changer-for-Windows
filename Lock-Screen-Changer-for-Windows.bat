@ECHO OFF
COLOR 0A
CD /D %~dp0
IF EXIST image.jpg GOTO LABEL2
:LABEL1
ECHO Welcome to Chiroo's Logon background image changing script (Windows 7)
ECHO.
ECHO To use this script, keep a jpg image in the same folder as this and name it as "image.jpg". You will then need to right-click this program and select "Run as Administrator" for it to work correctly
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
MD C:\WINDOWS\SYSTEM32\oobe
MD C:\WINDOWS\SYSTEM32\oobe\info
MD C:\WINDOWS\SYSTEM32\oobe\info\backgrounds
COPY /Y image.jpg "C:\WINDOWS\SYSTEM32\oobe\info\backgrounds\backgroundDefault.jpg"
ECHO.
IF ERRORLEVEL 0 ECHO Operation Successful
IF ERRORLEVEL 1 ECHO Some error occurred, Program will now exit
PAUSE > NUL
:END