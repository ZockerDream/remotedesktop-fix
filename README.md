# remotedesktop-fix.bat

Setzt einen Registry-Eintrag, der den RDP-Umleitungswarnungsdialog unter Windows deaktiviert.

## Hintergrund

Beim Verbinden über Remote Desktop (RDP) erscheint unter bestimmten Bedingungen eine Warnmeldung zur Geräteumleitung. Dieses Script unterdrückt diesen Dialog dauerhaft über eine Gruppenrichtlinien-kompatible Registry-Einstellung.

## Was das Script macht

Schreibt folgenden Registry-Eintrag:

| Parameter | Wert |
|---|---|
| Pfad | `HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services\Client` |
| Name | `RedirectionWarningDialogVersion` |
| Typ | `REG_DWORD` |
| Wert | `1` |

## Voraussetzungen

- Windows 10 / 11 (oder Windows Server)
- Administratorrechte

## Verwendung

1. Rechtsklick auf `remotedesktop-fix.bat`
2. **„Als Administrator ausführen"** wählen

Das Script prüft selbstständig, ob es mit Adminrechten ausgeführt wird, und bricht andernfalls mit einer Fehlermeldung ab.

## Rückgängig machen

Den gesetzten Eintrag kann man manuell über den Registrierungs-Editor (`regedit`) oder per CMD entfernen:

```cmd
reg delete "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services\Client" /v RedirectionWarningDialogVersion /f
```
