@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
echo Success: Administrative permissions confirmed.
timeout /t 4
goto InternetChecker
) 
if %errorLevel% == 2 (
echo Failure: Current permissions inadequate.
timeout /t 4
exit
)


:InternetChecker
cls
echo checking internet connection
Ping www.google.nl -n 1 -w 1000
cls


if errorlevel 1 (
echo Please check your Internet connection
timeout /t 4
cls
goto InternetChecker
) else (
echo Your Internet is connected :D
timeout /t 4
cls
goto GetWindowsVersion
)





:GetWindowsVersion


set /p mm=Would you like me to gather your windows version for you?:
if %mm%==y (goto WindowsVersionDetectionAutomatic)
if %mm%==n (goto WindowsVersionDetectionManul)


:WindowsVersionDetectionAutomatic
FOR /F "usebackq tokens=3,4,5" %%i IN (`REG query "hklm\software\microsoft\windows NT\CurrentVersion" /v ProductName`) DO set VERSION=%%i %%j %%k
goto WindowsKeys


:WindowsVersionDetectionManul
echo 1. Windows 10/11 Home
echo 2. Windows 10/11 Home N
echo 3. Windows 10/11 Home Single Language
echo 4. Windows 10/11 Home Country Specific
echo 5. Windows 10/11 Pro
echo 6. Windows 10/11 Pro N
echo 7. Windows 10/11 Pro for Workstation
echo 8. Windows 10/11 Pro for Workstation N
echo 9. Windows 10/11 Education
echo 10. Windows 10/11 Pro Education 
echo 11. Windows 10/11 Pro Education N
echo 12. Windows 10/11 Enterprise
echo 13. Windows 10/11 Enterprise N
echo 14. Windows 10/11 Enterprise G
echo 15. Windows 10/11 Enterprise G N
set /p x=Select a windows version with a number then press ENTER:
set WindowsVersion=%x%
goto ManulOveride


:WindowsKeys
set WindowsVersion=0
if "%VERSION%" == "Windows 10 Home" (set WindowsVersion=1)
if "%VERSION%" == "Windows 10 Home N" (set WindowsVersion=2)
if "%VERSION%" == "Windows 10 Home Single Language" (set WindowsVersion=3)
if "%VERSION%" == "Windows 10 Home Country Specific" (set WindowsVersion=4)
if "%VERSION%" == "Windows 10 Pro" (set WindowsVersion=5)
if "%VERSION%" == "Windows 10 Pro N" (set WindowsVersion=6)
if "%VERSION%" == "Windows 10 Pro For Workstation" (set WindowsVersion=7)
if "%VERSION%" == "Windows 10 Pro For Workstation N" (set WindowsVersion=8)
if "%VERSION%" == "Windows 10 Education" (set WindowsVersion=9)
if "%VERSION%" == "Windows 10 Pro Education" (set WindowsVersion=10)
if "%VERSION%" == "Windows 10 Pro Education N" (set WindowsVersion=11)
if "%VERSION%" == "Windows 10 Enterprise" (set WindowsVersion=12)
if "%VERSION%" == "Windows 10 Enterprise N" (set WindowsVersion=13)
if "%VERSION%" == "Windows 10 Enterprise G" (set WindowsVersion=14)
if "%VERSION%" == "Windows 10 Enterprise G N" (set WindowsVersion=15)

:ManulOveride
if %WindowsVersion% ==1 (
set WindowsKey=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
set WindowsVersionManul="Windows 10/11 Home"
)
if %WindowsVersion% ==2 (
set WindowsKey=3KHY7-WNT83-DGQKR-F7HPR-844BM
set WindowsVersionManul="Windows 10/11 Home N"
)
if %WindowsVersion% ==3 (
set WindowsKey=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH
set WindowsVersionManul="Windows 10/11 Home Single Language"
)
if %WindowsVersion% ==4 (
set WindowsKey=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR
set WindowsVersionManul="Windows 10/11 Home Country Specific"
)
if %WindowsVersion% ==5 (
set WindowsKey=W269N-WFGWX-YVC9B-4J6C9-T83GX
set WindowsVersionManul="Windows 10/11 Pro"
)
if %WindowsVersion% ==6 (
set WindowsKey=MH37W-N47XK-V7XM9-C7227-GCQG9
set WindowsVersionManul="Windows 10/11 Pro N"
)
if %WindowsVersion% ==7 (
set WindowsKey=NRG8B-VKK3Q-CXVCJ-9G2XF-6Q84J
set WindowsVersionManul="Windows 10/11 Pro for Workstation"
)
if %WindowsVersion% ==8 (
set WindowsKey=9FNHH-K3HBT-3W4TD-6383H-6XYWF
set WindowsVersionManul="Windows 10/11 Pro for Workstation N"
)
if %WindowsVersion% ==9 (
set WindowsKey=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
set WindowsVersionManul="Windows 10/11 Education"
)
if %WindowsVersion% ==10 (
set WindowsKey=6TP4R-GNPTD-KYYHQ-7B7DP-J447Y
set WindowsVersionManul="Windows 10/11 Pro Education"
)
if %WindowsVersion% ==11 (
set WindowsKey=YVWGF-BXNMC-HTQYQ-CPQ99-66QFC
set WindowsVersionManul="Windows 10/11 Pro Education N"
)
if %WindowsVersion% ==12 (
set WindowsKey=NPPR9-FWDCX-D2C8J-H872K-2YT43
set WindowsVersionManul="Windows 10/11 Enterprise"
)
if %WindowsVersion% ==13 (
set WindowsKey=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4
set WindowsVersionManul="Windows 10/11 Enterprise N"
)
if %WindowsVersion% ==14 (
set WindowsKey=YYVX9-NTFWV-6MDM3-9PT4T-4M68B
set WindowsVersionManul="Windows 10/11 Enterprise G"
)
if %WindowsVersion% ==15 (
set WindowsKey=44RPN-FTY23-9VTTB-MP9BX-T84FV
set WindowsVersionManul=" Windows 10/11 Enterprise G N"
)

if %mm% ==y (echo Windows Version Detected: %VERSION%) else (echo Windows Version Detected: %WindowsVersionManul% )
echo Windows Key Set : %WindowsKey%
timeout /t 4
cls
goto StartScript


:StartScript

timeout /t 4
cls
REG ADD "HKCU\Control panel\Desktop" /v PaintDesktopVersion /d 4 /f
timeout /t 4
cls
gpupdate /force
timeout /t 4
cls
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\svsvc" /v Start /d 4 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\svsvc\KMS" /v "kms_4" /f
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\svsvc\KMS" /ve /f
gpupdate /force
timeout /t 4
cls
slmgr /ipk %WindowsKey%
timeout /t 4
cls
slmgr /skms kms8.msguides.com
timeout /t 4
cls
slmgr /ato
timeout /t 4
cls
REG ADD "HKCU\Control panel\Desktop" /v PaintDesktopVersion /d 0 /f
gpupdate /force
cls
sfc /scannow
chkdsk
timeout /t 3
cls
sfc /scanfile=c:\windows\system32\ieframe.dll
timeout /t 4
sfc /verifyfile=c:\windows\system32\ieframe.dll
cls
slmgr /ipk %WindowsKey%
timeout /t 4
cls
slmgr /skms kms8.msguides.com
cls
timeout /t 4
slmgr /ato
timeout /t 4
gpupdate /force
cls
echo Thank you for using Windows Activator, Your Computer Will Restart now.
set /p m=Is this ok:
if %m%==y (shutdown /r )
if %m%==yes (shutdown /r )
if %m%==YES (shutdown /r )
if %m%==n (exit)
if %m%==no (exit)
if %m%==NO (exit)

