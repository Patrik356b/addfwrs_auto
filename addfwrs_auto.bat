@echo off
REM      BATCH FILE CREATED BY CHARLES DE HAVILLAND 20/02/2012
REM    MODIFIED BY Patrik356b
REM   SRC: https://sites.google.com/site/mytools4000/home/allow-block-multiple-programs-through-windows-7-firewall

cls
for /f "delims=" %%A in ('cd') do (
     set RULENAME=%%~nxA
)

ECHO Create in/out firewall rules for all *.exe files with the rulename of "%RULENAME%" ?
ECHO.
ECHO.

pause
Echo.
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=in program="%%G" action="block" enable="yes")
FOR /r %%G in ("*.exe") Do (@echo %%G
NETSH advfirewall firewall add rule name="%RULENAME%-%%~nxG" dir=out program="%%G" action="block" enable="yes")
Echo.
Echo done.
Echo.
Echo Batch ended...