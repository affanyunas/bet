@echo off
setlocal enabledelayedexpansion

:loop
set /p bet="Masukkan jumlah Bet : "
set /p lose="Masukkan jumlah Lose : "
set /p persenlose="Masukkan persentase Lose : "

set hasil=!bet!

:calculate
if %lose% leq 0 goto end

set /a hasil=!hasil! + (!hasil! * %persenlose:/=%% / 100)
set /a lose-=1
goto calculate

:end

:: Mengubah format hasil akhir dengan pemisahan ribuan seperti Excel (contoh: Rp 21.600)
setlocal enabledelayedexpansion
set "formattedResult="
set "result=!hasil!"
set "count=0"

:formatResult
set /a "count+=1"
set "digit=!result:~-1!"
set "result=!result:~0,-1!"
set "formattedResult=!digit!!formattedResult!"

if not "!result!"=="" (
  if !count! equ 3 (
    set "formattedResult=.!formattedResult!"
    set "count=0"
  )
  goto formatResult
)

if %count% gtr 0 (
  set "formattedResult=!formattedResult!"
)

set hasilFormatted=Rp !formattedResult!
echo Hasil akhir: %hasilFormatted%

set /p choice="Mau menghitung lagi? (y/n): "
if "%choice%" == "n" goto exit
if "%choice%" == "y" goto loop

:exit
