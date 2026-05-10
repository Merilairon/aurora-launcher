@echo off
@title Aurora Launcher

SET mypath=%~dp0
SET wemodname=Aurora.exe

IF "%mypath:~-5%" == "\src\" (
    SET wemodpath=%mypath:~0,-5%\aurora_data\aurora_bin\%wemodname%
) ELSE (
    SET wemodpath=%mypath:~0,-1%\aurora_data\aurora_bin\%wemodname%
)

SET temptime=%mypath:~0,-1%\.cache\early.tmp
SET returnfile=%mypath:~0,-1%\.cache\return.tmp

echo Hello from the Aurora Launcher, the Aurora bat was started successfully.
echo.
echo Aurora EXE path:
echo %wemodpath%
echo.
echo CWD:
echo %cd%
echo.
echo Command:
echo %*

echo.
echo.

REM Start Aurora.exe and get its PID
echo Starting Aurora by using %wemodname%.
start "" %wemodpath%

set wemodPID=

REM Get the Aurora launcher PID, loop until found, and exit subroutine when found.
set wemodPIDCounter=0

:search
echo Searching for Aurora PID...
REM Check we haven't run this more than 3 times.
if %wemodPIDCounter% GTR 3 (
	echo Aurora not found in process list, defaulting to prevent infinite loop... > %returnfile%
    type %returnfile%
	pause
    goto :discovered
)
for /F "TOKENS=1,2 delims=," %%a in ('C:/windows/system32/tasklist /FO CSV /NH /FI "IMAGENAME eq %wemodname%"') do (
  set wemodPID=%%b
)
if defined wemodPID goto :discovered
echo Continue search for Aurora PID...
set /A wemodPIDCounter+=1
@ping localhost -n 6 >NUL
goto :search

:discovered

echo Aurora found with pid %wemodPID%
echo.

REM start the game and wait for exit
echo Running game "%~1" and waiting for closure..
echo The full command is: %*
start /wait "" %*
echo.
echo The game was closed.

if defined wemodPID (
    if exist %temptime% (
        del %temptime%
        echo Game closed too fast, Game detection may have failed. > %returnfile%
        echo Keep in mind that aurora-launcher usually can`t detect game launchers. >> %returnfile%
        echo Only open an issue IF the game did not start, >> %returnfile%
        echo or IF the game crashed, or IF Aurora exits unexpectedly. >> %returnfile%
        type %returnfile%
        :WaitUser
        @ping localhost -n 2 >NUL
        if exist %returnfile% GOTO WaitUser
    )
    echo Closing Aurora..
    C:/windows/system32/taskkill.exe /PID %wemodPID% /F >NUL
    C:/windows/system32/taskkill.exe /PID %wemodPID% /F >NUL
    echo Killed %wemodname% with pid %wemodPID%
)

echo.
echo Done running bat, closing in 1 second
@ping localhost -n 2 >NUL
echo.
