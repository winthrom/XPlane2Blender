@rem Installation script for Windows NT/2000/XP
@echo off
echo Installing Blender scripts . . .
echo.

rem Remove old versions
set FILES=..\Bpymenus helpXPlane.py uvCopyPaste.py uvResize.py XPlaneExport.py XPlaneExport.pyc XPlaneExport7.py XPlaneExportBodies.py XPlaneImport.py XPlaneImportPlane.py XPlaneImportBodies.py XPlaneUtils.py XPlaneUtils.pyc XPlaneACF.py XPlaneACF.pyc XPlane2Blender.html XPlaneImportPlane.html XPlaneReadme.txt
for %%I in (%FILES%) do if exist "%HOME%\.blender\scripts\%%I" del "%HOME%\.blender\scripts\%%I"
for %%I in (%FILES%) do if exist "%ProgramFiles%\Blender Foundation\Blender\.blender\scripts\%%I" del "%ProgramFiles%\Blender Foundation\Blender\.blender\scripts\%%I"
for %%I in (%FILES%) do if exist "%USERPROFILE%\Application Data\Blender Foundation\Blender\.blender\scripts\%%I" del "%USERPROFILE%\Application Data\Blender Foundation\Blender\.blender\scripts\%%I"

:home
if "%HOME%"=="" goto prog
set DESTDIR=%HOME%\.blender\scripts\
if not exist "%DESTDIR%" goto prog
goto copy

:prog
if "%ProgramFiles%"=="" goto appdata
set DESTDIR=%ProgramFiles%\Blender Foundation\Blender\.blender\scripts\
if not exist "%DESTDIR%" goto appdata
goto copy

:appdata
if "%USERPROFILE%"=="" goto destfail
set DESTDIR=%USERPROFILE%\Application Data\Blender Foundation\Blender\.blender\scripts\
if not exist "%DESTDIR%" goto destfail
goto copy

:destfail
echo Failed to find appropriate location for Blender scripts !!!
goto end

:copy
set FILES=helpXPlane.py uvCopyPaste.py uvResize.py XPlaneExport.py XPlaneExport7.py XPlaneImport.py XPlaneImportPlane.py XPlaneUtils.py XPlaneACF.py XPlane2Blender.html
for %%I in (%FILES%) do copy /v /y %%I "%DESTDIR%" >nul:
for %%I in (%FILES%) do if not exist "%DESTDIR%%%I" goto copyfail
echo Installation successful.
goto end

:copyfail
echo Failed to install scripts in "%DESTDIR%" !!!
goto end

:end
echo.
pause
