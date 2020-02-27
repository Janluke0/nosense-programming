@echo off & setlocal
title LA RUBBRRICCA FICA
REM (c) Janluke 2020
REM
REM Da qualche itis con amore:
REM
REM Crea un file batch che permetta di gestire una rubrica di nominativi. Per fare questo, usando Notepad, crea un file di testo in cui sui ogni riga ci siano i dati relativi ad una persona.
REM I dati dovranno essere scritti nel seguente modo e la virgola servirà da separatore tra un dato e il successivo:

REM cognome, nome, città, indirizzo, cap, telefono

REM ESEMPIO:
REM pippo, pippo1, topolinia, via dei matti 6, 21111, 24565474
REM angelo, prova, Castellanza, via dei mille 3, 11111, 96658654
REM pluto, pluto1, topolinia, via fumetti 11, 11112, 234353453

REM Il file batch deve presentare un menù con le seguenti voci:
REM - Aggiungi persona alla rubrica
REM - Visualizza rubrica
REM - Cerca nome
REM - Esci
REM

SET DB=DB.txt
REM - MENU
:Menu 
CLS
echo Cosa vuoi fare?
echo.  
echo 1) Aggiungi persona alla rubrica
echo 2) Visualizza rubrica
echo 3) Cerca nome
echo 4) Esci
echo.
SET /P scelta=Fai la tua scelta:
CLS
IF %scelta%==1 GOTO Add
IF %scelta%==2 GOTO Show
IF %scelta%==3 GOTO Search
IF %scelta%==4 GOTO End

REM Aggiungi persona
:Add
SET /P cognome=Cognome:
SET /P nome=Nome:
SET /P citta=Citta':
SET /P ind=Indirizzo:
SET /P cap=CAP:
SET /P tel=Telefono:
echo %cognome%, %nome%, %citta%, %ind%, %cap%, %tel% >> %DB%
GOTO Menu

REM Leggi e mostra contatti
:Show
FOR /F "delims=♪◙" %%L IN (%DB%) DO (
    FOR /F "tokens=1,2,3,4,5,6 delims=," %%a in ("%%L") DO ( 
        echo Cognome:%%a &ECHO Nome:%%b &ECHO Citta':%%c 
        ECHO Indirizzo:%%d &ECHO CAP:%%e &ECHO Telefono:%%f
        echo.
    )
)

echo.
echo Premere un tasto qualsiasi per tornare al menu
pause > nul
goto menu
:Search
SET /P query=Quale nome vuoi cercare?
FOR /F "delims=♪◙" %%L IN (%DB%) DO (
    FOR /F "tokens=1,2,3,4,5,6 delims=," %%a in ("%%L") DO ( 
        IF %query%==%%b (
            echo Trovato!
            echo.
            echo Cognome:%%a &ECHO Nome:%%b &ECHO Citta':%%c 
            ECHO Indirizzo:%%d &ECHO CAP:%%e &ECHO Telefono:%%f
            echo.
        )
    )
)
echo.
echo Premere un tasto qualsiasi per tornare al menu
pause > nul
goto menu
:End