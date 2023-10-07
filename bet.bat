@echo off
setlocal enabledelayedexpansion

:loop
set /p bet="Masukkan jumlah bet : "
set /p lose="Masukkan jumlah lose : "
set /p persenlose="Masukkan persentase lose : "

set hasil=!bet!

:calculate
if %lose% leq 0 goto end

set /a hasil=!hasil! + (!hasil! * %persenlose:/=%% / 100)
set /a lose-=1
goto calculate

:end
echo Hasil akhir: %hasil%

choice /c yn /m "Mau menghitung lagi? (y/n): "
if errorlevel 2 goto exit
if errorlevel 1 goto loop

:exit
@echo off
setlocal enabledelayedexpansion

:loop
set /p bet="Masukkan jumlah bet (misal: 100): "
set /p lose="Masukkan jumlah lose (misal: 1): "
set /p persenlose="Masukkan persentase lose (misal: 500%): "

set hasil=!bet!

:calculate
if %lose% leq 0 goto end

set /a hasil=!hasil! + (!hasil! * %persenlose:/=%% / 100)
set /a lose-=1
goto calculate

:end
echo Hasil akhir: %hasil%

set /p choice="Mau menghitung lagi? (y/n): "
if "%choice%" == "n" goto exit
if "%choice%" == "y" goto loop

:exit
