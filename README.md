# Stundenplan als Hintergrundbild setzen
Mit diesem ***Powershell-Skript*** (`StundenplanHintergrundDunkel.ps1`) kannst Du Deinen Stundenplan
von ***DSBMobile*** als Deinen ***Windows Hintergrund*** festlegen
und über die ***Aufgabenplanung*** (Systemprogramm unter Windows) automatisch jede Woche aktualisieren
lassen.

## Auf DSBMobile Webseite anmelden
Mit ***Google Chrome*** öffnest Du Deinen Stundenplan und drückst dann
`STRG + SHIFT + I`, um die ***Entwicklertools*** zu öffnen.

![DSBMobile Webseite](00_DSBMobile_Webseite.jpg)

## Zoom auf die Entwicklertools
Hier siehst Du in einer Übersicht wo Du Schritt für Schritt klickst, um an die
nötigen Daten zu kommen. Diese Daten gibst Du noch in dem
***Powershell-Skript*** ein, damit es Deinen individuellen Stundenplan läd und
nicht den meinen. Klicke dazu auf den Tab `Sources` **①**.

![Übersicht 1bis 4](00_Uebersicht1bis4.jpg)

Mit *Rechtsklick* auf `🗀 data` **②**, um das *Drop Down Menü*
zu öffnen. Dort `Search in folder` auswählen.

![Search folder](02_Search_folder.jpg)

Jetzt werden rechts unten ein Zeile in folgendem Format `file:data/` angezeigt **③**:

`file:data/1e7d336d-41c7-4a32-9b08-dde7ad6df345/f440c721-c59b-4a39-8b0a-958ee4215a59`

![Ordnerstruktur unter der Dein Stundenplan liegt](03_Ordnerstruktur.jpg)

sadf

![c00006.htm Drop Down Menü unter dem Du Deine vierstellige Kursnummer findest](04_c00006htm.jpg)

