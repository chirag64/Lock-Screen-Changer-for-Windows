@ECHO OFF
COLOR 1A
CD /D %~dp0
ECHO Please enter your choice from the options below:
ECHO [1] Add/Replace with an image for the lock screen background.
ECHO [2] Remove the customized image previously added in the lock screen background.
SET /P i=Your choice:
CLS
IF %i% EQU 1 (
GOTO LABEL1
)
IF %i% EQU 2 (
GOTO LABEL4
)
ELSE (
ECHO Wrong choice && EXIT
)

:LABEL1
IF EXIST image.jpg GOTO LABEL3
IF EXIST image.jpeg GOTO LABEL3

:LABEL2
ECHO Welcome to Chiroo's Logon background image changing script (Windows 7)
ECHO.
ECHO To use this script, keep a jpg image in the same folder as this and name it as "image.jpg". You will then need to right-click this program and select "Run as Administrator" for it to work correctly
ECHO.
ECHO The image must be in jpg format and must be smaller than 245KiB, and must have one of the following resolutions...
ECHO.
ECHO 768x1280 960x1280 900x1440 1024x768 1024x1280 1280x768 1280x960 1280x1024 1360x768 1440x900 1600x1200 1920x1200
ECHO.
ECHO The program will now exit...
PAUSE > NUL
GOTO END

:LABEL3
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\Background" /V OEMBackground /T REG_DWORD /d 00000001 /f >NUL 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /V OEMBackground /T REG_DWORD /d 00000001 /f >NUL 2>&1
MD C:\WINDOWS\SYSTEM32\oobe\info\backgrounds >NUL 2>&1
IF EXIST image.jpg COPY /Y image.jpg "C:\WINDOWS\SYSTEM32\oobe\info\backgrounds\backgroundDefault.jpg" >NUL 2>&1
IF EXIST image.jpeg COPY /Y image.jpeg "C:\WINDOWS\SYSTEM32\oobe\info\backgrounds\backgroundDefault.jpg" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 ECHO Operation Successful
IF %ERRORLEVEL% EQU 1 ECHO Some error occurred, Try running the program as Administrator.
ECHO Program will now exit
PAUSE > NUL
EXIT

:LABEL4
RD /S /Q C:\WINDOWS\SYSTEM32\oobe\info\ >NUL 2>&1
IF %ERRORLEVEL% EQU 0 ECHO Operation Successful
IF %ERRORLEVEL% EQU 1 ECHO Some error occurred, Try running the program as Administrator.
ECHO Program will now exit
PAUSE > NUL

:END
EXIT