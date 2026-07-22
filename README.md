# Stundenplan als Hintergrundbild
Mit diesem ***Powershell-Skript*** [StundenplanHintergrundbildDunkel.ps1](StundenplanHintergrundbildDunkel.ps1)<br>
kannst Du Deinen Stundenplan von ***DSBMobile*** als Deinen<br>
***Windows Hintergrund*** festlegen
und über die ***Aufgabenplanung***<br>
(Systemprogramm unter Windows) automatisch jede Woche<br>
aktualisieren lassen.

## DSBMobile Webseite (anmelden)
Mit ***Google Chrome*** öffnest Du Deinen Stundenplan und drückst<br>
dann `STRG + SHIFT + I`, um die ***Entwicklertools*** zu öffnen.

![DSBMobile Webseite](00_DSBMobile_Webseite.jpg)

## Zoom auf die Entwicklertools
Hier siehst Du in einer Übersicht wo Du Schritt für Schritt klickst,<br>
um an die nötigen Daten zu kommen. Diese Daten gibst Du noch<br>
in dem ***Powershell-Skript*** ein, damit es Deinen individuellen<br>
Stundenplan läd und nicht den meinen. Klicke dazu bitte auf den<br>
Tab `Sources` **①**.

![Übersicht 1bis 4](00_Uebersicht1bis4.jpg)

Mit *Rechtsklick* auf `🗀 data` **②**, um das *Drop Down Menü* zu<br>
öffnen. Dort `Search in folder` auswählen.

![Search folder](02_Search_folder.jpg)

Jetzt wird rechts unten ein Zeile `file:data/` angezeigt **③**:

`file:data/1e7d336d-41c7-4a32-9b08-dde7ad6df345/f440c721-c59b-4a39-8b0a-958ee4215a59`

Diesese beiden Ordner haben lange *Ziffern-Buchstaben-Kom-*<br>
*binationen*, die Du am Besten mit *copy & paste* in **Zeile 9** des<br>
***Powershell-Skripts*** einfügst:

>Meine *Ziffern-Buchstaben-Kombination* ist folgende, Du hast<br>
>wahrscheinlich etwas anderes angezeigt in dem Entwicklertools.<br>
>![Ordnerstruktur unter der Dein Stundenplan liegt](03_Ordnerstruktur.jpg)

Den zweiten Teil der Daten zum Vervollständigen der **Zeile 9** im<br>
***Powershell-Skript*** findest Du unter `🗀 frame` **④**.<br>
In meinem Fall `c00006.htm`.

![c00006.htm Drop Down Menü unter dem Du Deine vierstellige Kursnummer findest](04_c00006htm.jpg)

## ![icon21px](Aufgabenplanung.png) Aufgabenplanung

So fügst Du Dein ***Powershell-Skript*** der ***Aufgabenplanung*** hinzu:

![Aufgabenplanung Anleitung](05_Aufgabenplanung.jpg)

![Aufgabenplanung Anleitung](06_Aufgabenplanung.jpg)

![Aufgabenplanung Anleitung](07_Aufgabenplanung3.jpg)

