@echo off

REM =====================================
REM Autor: wrrulos
REM CITTZ es un script de codigo abierto para recuperar contraseñas de wifi de manera rapida.
REM Version: 1.0
REM Github: https://github.com/wrrulos/cittz
REM
REM Discord: Rulo#9224
REM Instagram: @wrrulos
REM Twitter: @wrrulos
REM
REM =====================================
REM WFYCO - Waiting for you come out
REM
REM Discord: discord.gg/HtCHzDV
REM Instagram: @wfyco_team
REM Twitter: @wfyco_team
REM
REM =====================================

cls

set autor= wrrulos
set snombre= CITTZ
set sversion= 1.0
set github= https://github.com/wrrulos/cittz
set wfyco= wfyco_team 
set di= ______________________________________________________________________
set ubicacion= %cd%

:opcion3
cls
color 6
echo. 
echo  [#] Esperando permisos de administrador..
ping localhost -n 2 >nul
:------------------------------------- 
REM --> Check for permissions 
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system" 
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" 
) 

REM --> If error flag set, we do not have admin. 
if '%errorlevel%' NEQ '0' (
    goto UACPrompt 
) else (goto gotAdmin) 

:UACPrompt 
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs" 
    set params=%* 
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs" 

    "%temp%\getadmin.vbs" 
    del "%temp%\getadmin.vbs" 
    exit /B 

:gotAdmin 
    pushd "%CD%" 
    CD /D "%~dp0" 
:--------------------------------------  
cls
color a
echo.
echo  [#] Hecho.
ping localhost -n 2 >nul
cls
color 6
netsh wlan show wlanreport
echo  Presione una tecla para continuar...
pause>nul
start C:\ProgramData\Microsoft\Windows\WlanReport\wlan-report-latest.html
