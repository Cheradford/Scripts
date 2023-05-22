@echo off
Setlocal EnableDelayedExpansion EnableExtensions

set CURRENT_DIR_NAME=%~dp0
set "stroka=Долгих Кирилл Сергеевич 22 ноября 2001 Мирный Республика ^(Саха^) Якутия МБОУ СОШ ^N12"
set "FirstFile=IST021-Dolgikh_LR3_866.txt"
chcp 866 > nul
for /L %%t in (1,1,50000) do (
	echo %stroka% >> IST021-Dolgikh_LR3_866.txt
	echo %stroka% >> IST021-Dolgikh_LR3_All.txt
)
for %%i in (1251 20866 28595 65001) do (
	for /F "delims=" %%a in (%FirstFile%) do (
		chcp %%i > nul
		call :convert "%%a" , "%CURRENT_DIR_NAME%IST021-Dolgikh_LR3_%%i.txt"
		chcp %%i > nul
		call :convert "%%a" , "%CURRENT_DIR_NAME%IST021-Dolgikh_LR3_All.txt"
	)
)
tar -c -f Archive.zip IST021-Dolgikh_LR3_*.txt
pause

:convert
echo %~1>>"%~2%"
chcp 866 > nul