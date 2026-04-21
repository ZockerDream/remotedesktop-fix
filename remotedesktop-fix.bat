```
@echo off
:: Setzt RedirectionWarningDialogVersion in der Registry (RDP-Umleitungswarnung deaktivieren)

:: Admin-Check: Abbruch wenn kein erhöhtes Token vorhanden ist
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo FEHLER: Dieses Script muss als Administrator ausgefuehrt werden.
    echo Rechtsklick auf die Datei -^> "Als Administrator ausfuehren", dann erneut versuchen.
    timeout /t 5
    exit /b 1
)

set REG_PATH=HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services\Client

echo Wechsle in den Pfad: %REG_PATH%

echo Setze Registry-Eintrag: RedirectionWarningDialogVersion = 1 (REG_DWORD)

reg add "%REG_PATH%" /v RedirectionWarningDialogVersion /t REG_DWORD /d 1 /f >nul 2>&1

if %errorlevel% equ 0 (
    echo Fertig. Eintrag wurde erfolgreich gesetzt.
) else (
    echo FEHLER: Registry-Eintrag konnte nicht gesetzt werden.
    timeout /t 10
    exit /b 1
)

timeout /t 5
exit
```