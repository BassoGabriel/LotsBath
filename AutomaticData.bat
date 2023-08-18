@Echo Off
Color 2
TITLE INVENTARIO AUTOMATICO
CLS

Set caminho="c:\users\%username%\desktop"
REM set ano=%date:~6,4%
REM set mes=%date:~3,2%
REM set dia=%date:~0,2%


REM REM DEFININDO OS MESES CONFORME OS NÚMEROS

REM if  %mes% equ 01 (set mes="01 JAN") else (
	REM if  %mes% equ 02 (set mes="0 FEV") else (
		REM if  %mes% equ 03 (set mes="03 MAR") else (
			REM if  %mes% equ 04 (set mes="04 ABR") else (
				REM if  %mes% equ 05 (set mes="05 MAI") else (
					REM if  %mes% equ 06 (set mes="06 JUN") else (
						REM if  %mes% equ 07 (set mes="07 JUL") else (
							REM if  %mes% equ 08 (set mes="08 AGO") else (
								REM if  %mes% equ 09 (set mes="09 SET") else (
									REM if  %mes% equ 10 (set mes="10 OUT") else (
										REM if  %mes% equ 11 (set mes="11 NOV") else (
											REM if  %mes% equ 12 (set mes="12 DEZ")
											REM )
										REM )
									REM )
								REM )
							REM )
						REM )
					REM )
				REM )
			REM )
		REM )
	REM )
	
	
REM REM VERIFICANDO A EXISTÊNCIA DA	PASTA POR ANO, MÊS, DIA

REM if not exist %caminho%\%ano% md %caminho%\%ano%
REM if not exist %caminho%\%ano%\%mes% md %caminho%\%ano%\%mes%
REM if not exist %caminho%\%ano%\%mes%\%dia% md %caminho%\%ano%\%mes%\%dia%

rem Set caminho=%caminho%\%ano%\%mes%\%dia%\%username%.csv

Set caminho=%caminho%\%username%.csv

chcp 1252 > nul
for /f "Delims=" %%a in ('"wmic bios get manufacturer,serialnumber /format:list"') do for /f "tokens=1,2 delims==" %%b in ("%%a") do (
if /i "%%b"=="manufacturer" set Fabr=%%c
if /i "%%b"=="serialnumber" set ST=%%c
)

chcp 1252 > nul
for /f "Delims=" %%a in ('"wmic cpu get name /format:list"') do for /f "tokens=1,2 delims==" %%b in ("%%a") do (
if /i "%%b"=="name" set Processador=%%c
)

chcp 1252 > nul
for /f "Delims=" %%a in ('"wmic csproduct get name /format:list"') do for /f "tokens=1,2 delims==" %%b in ("%%a") do (
if /i "%%b"=="name" set modelo=%%c
)

chcp 1252 > nul
for /f "Delims=" %%a in ('"WMIC diskdrive Get Size /format:list"') do for /f "tokens=1,2 delims==" %%b in ("%%a") do (
if /i "%%b"=="Size" set HD=%%c
)

echo usuario;%username% > %caminho%
echo marca;%Fabr%>> %caminho%
echo modelo;%modelo% >> %caminho%
echo "nome maquina";%computername% >> %caminho%
echo disco;%HD% >> %caminho%
echo processador;%Processador% >> %caminho%
echo ST;%ST% >> %caminho%
Echo. >> %caminho%
Echo IP >> %caminho%
@IPCONFIG/ALL | FIND "IPv4" >> %caminho%

Echo. >> %caminho%
ECHO MEMORIA RAM >> %caminho%
WMIC MEMORYCHIP GET CAPACITY >> %caminho%
