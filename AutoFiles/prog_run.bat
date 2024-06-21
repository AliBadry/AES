@echo off
REM open the hotkey first as the vsim blocks the batch file
start "" "F:\Aloshka\Collage\post collage material\AES\AutoFiles\keystrokes1.ahk"

REM run questasim for first time to generate the random inputs in a text file
cd "F:/Aloshka/Collage/post collage material/AES/RTL/Verification"
vsim -do "run.do"

REM run matlab to get the reference model output of the system
"C:\Program Files\Polyspace\R2020a\bin\matlab.exe" -r "run('F:\Aloshka\Collage\post collage material\AES\Modeling\floating point script\AES_main_auto_script.m'); exit;"

REM introduce some delay to get the matlab outputs of 50 seconds
timeout /t 50 /nobreak

REM open the hotkey first as the vsim blocks the batch file
start "" "F:\Aloshka\Collage\post collage material\AES\AutoFiles\keystrokes2.ahk"

REM re-run questasim again to compare between RTL and MATLAB outputs
vsim -do "run.do"
