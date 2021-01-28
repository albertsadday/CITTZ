@echo off
color 0f
title CITTZ
mode con cols=102 lines=18

:admin
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system" 
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" 
) 
 
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


:CITTZ
echo _____________________________________________________________________________________________________
echo /             ____   ______________ __________ ____________                                         /
echo /            6MMMMb/ `MM'MMMMMMMMMM MMMMMMMMMM MMMMMMMMMMMP         `:ohdNMMMNmdy+-                 /
echo /           8P    YM  MM /   MM   \ /   MM   \ /       dMP       `+dMMMMmhyssyhmMMMNy:              /
echo /          6M      Y  MM     MM         MM            dMP       oNMMmo-   ```   `:sNMMm-            /
echo /          MM         MM     MM         MM           dMP       .NMd:  -odNMMMMNho. `+dd/            /
echo /          MM         MM     MM         MM          dMP             :dMMMNdyydNMMMh.                /
echo /          MM         MM     MM         MM         dMP              mMMh:      :hMM/                /
echo /          MM         MM     MM         MM        dMP                -.  -ydh+   `                  /
echo /          YM      6  MM     MM         MM       dMP                     MMMMM+                     /
echo /           8b    d9  MM     MM         MM      dMP       /              +mMNy`                     /
echo /            YMMMM9  _MM_   _MM_       _MM_    dMMMMMMMMMMM               nMN                       /
echo /                                                                                                   /
echo /                                                                                                   /
echo /                                Guardando claves en claves.txt...                                  /
echo /                                                                                                   /
echo /___________________________________________________________________________________________________/
powershell -ExecutionPolicy ByPass -File CITTZ.ps1 >nul
timeout 1 >nul
cls
echo _____________________________________________________________________________________________________
echo /             ____   ______________ __________ ____________                                         /
echo /            6MMMMb/ `MM'MMMMMMMMMM MMMMMMMMMM MMMMMMMMMMMP         `:ohdNMMMNmdy+-                 /
echo /           8P    YM  MM /   MM   \ /   MM   \ /       dMP       `+dMMMMmhyssyhmMMMNy:              /
echo /          6M      Y  MM     MM         MM            dMP       oNMMmo-   ```   `:sNMMm-            /
echo /          MM         MM     MM         MM           dMP       .NMd:  -odNMMMMNho. `+dd/            /
echo /          MM         MM     MM         MM          dMP             :dMMMNdyydNMMMh.                /
echo /          MM         MM     MM         MM         dMP              mMMh:      :hMM/                /
echo /          MM         MM     MM         MM        dMP                -.  -ydh+   `                  /
echo /          YM      6  MM     MM         MM       dMP                     MMMMM+                     /
echo /           8b    d9  MM     MM         MM      dMP       /              +mMNy`                     /
echo /            YMMMM9  _MM_   _MM_       _MM_    dMMMMMMMMMMM               nMN                       /
echo /                                                                                                   /
echo /                                                                                                   /
echo /                                Claves guardadas en claves.txt                                     /
echo /                                                                                                   /
echo /___________________________________________________________________________________________________/
pause >nul

