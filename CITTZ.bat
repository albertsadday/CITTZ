@echo off

REM =====================================
REM Autor: wrrulos
REM CITTZ fue hecho principalmente para recuperar tus claves de wifi en segundos!
REM Version: 1.0
REM Github: https://github.com/wrrulos/cittz
REM Copyright © wrrulos
REM Ultima actualización: 22/10/2020
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

:menu
cd %ubicacion%
color 6
mode con cols=70 lines=30
cls
title %snombre% %sversion% 
echo%di%
echo.
echo    ____  ___  _____  _____  _____            
echo   / ___ ^|_ _^|^|_   _^|^|_   _^|^|__  /        Hecho por wrrulos
echo  ^| ^|     ^| ^|   ^| ^|    ^| ^|    / / 
echo  ^| ^|___  ^| ^|   ^| ^|    ^| ^|   / /_                     
echo   \____^|^|___^|  ^|_^|    ^|_^|  /____^|           %wfyco%
echo.
echo%di%
echo.
echo.
echo   [1] Mostrar clave de una red wifi especifica 
echo   [2] Guardar claves de todas las redes wifi
echo   [3] Generar reporte de WLAN (Necesita permisos de Administrador)
echo.
echo   [4] Github 
echo   [5] Informacion
echo   [6] Salir
echo.
set /p opciones1=# Elije una opcion: 

if %opciones1% == 1 goto opcion1
if %opciones1% == 2 goto opcion2
if %opciones1% == 3 goto opcion3
REM ???
if %opciones1% == 4 goto opcion4
if %opciones1% == 5 goto opcion5
if %opciones1% == 6 exit

cls
color 4
echo%di%
echo.
echo  [x] Elije una opcion valida! (1-6)
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto menu

:opcion1
color a
mode con cols=70 lines=30
cls
title %snombre% %sversion%
echo.
echo  Detectando redes.
ping localhost -n 2 >nul
cls
echo.
echo  Detectando redes..
ping localhost -n 2 >nul
cls
echo.
echo  [#] Hecho.
ping localhost -n 2 >nul
echo.
cls
goto opcion1-1

:opcion1-1
cls
color 6
echo%di%
echo.
echo  Redes WiFi disponibles:
echo.
netsh wlan show profile | findstr /R /C:"[ ]:[ ]"
echo.
echo%di% 
echo.
echo  [@] Escribe el nombre de la red WiFi.
echo  (Ejemplo: WiFi-Gratis)
echo.
echo.
set /p nombre-wifi=# CITTZ: 
cls
color a
echo.
echo  Comprobando el nombre de la red..
ping localhost -n 2 >nul
cls
netsh wlan show profiles name=%nombre-wifi%
if %errorlevel%==1 goto error0
cls
echo.
echo  [#] Hecho
ping localhost -n 2 >nul
goto opcion1-2

:opcion1-2
cls
color 6
echo%di%
echo.
echo ##:    Nombre de la red WiFi  :  %nombre-wifi%
echo.
netsh wlan show profiles name=%nombre-wifi% key=clear | findstr /N /R /C:"[ ]:[ ]" | findstr 33
echo%di%
echo. 
echo.
echo # Guardar resultados en un archivo de texto?
echo.
echo  [1] Si
echo  [2] No
echo.
echo.
set /p guardar-opcion1=# CITTZ: 
echo.
if %guardar-opcion1%==1 goto guardar-opcion1-claves
if %guardar-opcion1%==2 goto menu

cls
color 4
echo%di%
echo.
echo  [x] Elije una opcion valida! (1-2)
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto opcion1-2


:guardar-opcion1-claves
type clave.txt>nul
cls
if %errorlevel%==1 goto guardar-opcion1-1
if %errorlevel%==0 goto error1

:borrar-opcion1
del clave.txt>nul
cls
goto guardar-opcion1-1

:guardar-opcion1-1
echo CITTZ - Hecho por wrrulos >> clave.txt
echo. >> clave.txt
echo%di% >> clave.txt
echo. >> clave.txt
echo ##:    Nombre de la red WiFi  : %nombre-wifi% >> clave.txt
netsh wlan show profiles name=%nombre-wifi% key=clear | findstr /N /R /C:"[ ]:[ ]" | findstr 33 >> clave.txt
echo%di% >> clave.txt
echo.
color a
echo  Guardando..
ping localhost -n 2 >nul
cls
color 6
echo.
echo # Guardado en clave.txt
echo.
echo # Presione una tecla para continuar...
echo.
pause>nul
goto menu

:opcion2
cls
cd %ubicacion%
start o2.bat
color 6
echo.
echo # Las claves fueron guardadas en claves.txt
echo.
echo # Presione una tecla para continuar...
echo.
pause>nul
goto menu

:opcion3
cls
color 6
echo.
echo Esperando..
start o3.vbs
goto menu 

:opcion4
start https://github.com/wrrulos/cittz
goto menu

:opcion5
cls
color b
echo%di%
echo.
echo CITTZ fue hecho principalmente para recuperar tus claves de wifi en   segundos!
echo.
echo Redes sociales del autor (wrrulos):
echo.
echo [1] Instagram
echo [2] Twitter
echo [3] Github
echo.
echo Redes sociales de mi equipo (wfyco)
echo.
echo [4] Instagram
echo [5] Servidor de Discord
echo [6] Github
echo [7] Twitter
echo%di%
echo.
echo [99] Volver al menu
echo.
set /p informacion=# Elije una opcion: 

if %informacion%==1 goto opcion5-1
if %informacion%==2 goto opcion5-2
if %informacion%==3 goto opcion5-3
if %informacion%==4 goto opcion5-4
if %informacion%==5 goto opcion5-5
if %informacion%==6 goto opcion5-6
if %informacion%==7 goto opcion5-7
if %informacion%==99 goto menu

cls
color 4
echo%di%
echo.
echo  [x] Elije una opcion valida! (1-7)
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto opcion5

:opcion5-1
start www.instagram.com/wrrulos 
goto menu

:opcion5-2
start www.twitter.com/wrrulos
goto menu

:opcion5-3
start www.github.com/wrrulos
goto menu

:opcion5-4
start www.instagram.com/wfyco_team
goto menu

:opcion5-5
start https://discord.gg/HtCHzDV
goto menu

:opcion5-6
start www.github.com/wfyco_team
goto menu

:opcion5-7
start www.twtiter.com/wfyco_team
goto menu

:error0
cls
color 4
echo%di%
echo.
echo  [x] La red WiFi ingresada no existe!
echo  Si crees que es un error contacta con el programador.
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto opcion1-1

:error1
color c
echo.
echo  [x] El archivo "clave.txt" ya existe! Desea remplazarlo?
echo.
echo.
echo  [1] Si
echo  [2] No
echo.
set /p error1-1=# CITTZ: 

if %error1-1%==1 goto borrar-opcion1
if %error1-1%==2 goto menu

cls
color 4
echo%di%
echo.
echo  [x] Elije una opcion valida! (1-2)
echo%di% 
echo.
echo  Presione una tecla para continuar...
echo.
pause>nul
goto error1
