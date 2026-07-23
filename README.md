# Stundenplan als Hintergrundbild
Mit diesem ***Powershell-Skript*** `📄StundenplanHintergrundbildDunkel.ps1`<br>
kannst Du Deinen Stundenplan von ***DSBMobile*** als Deinen<br>
***Windows-Hintergrund*** festlegen
und über die ***Aufgabenplanung***<br>
(Systemprogramm unter Windows) automatisch jede Woche<br>
aktualisieren lassen. Lade Dir das ***Powershell-Skript***<br>
[StundenplanHintergrundbildDunkel.ps1](StundenplanHintergrundbildDunkel.ps1)<br>
auf Deine Festplatte herunter und öffne es mit einem Text-Editor.<br>

## DSBMobile Webseite (anmelden)
Mit ***Google Chrome*** öffnest Du Deinen Stundenplan und drückst<br>
dann `STRG + SHIFT + I`, um die ***Entwicklertools*** zu öffnen.

![DSBMobile Webseite](00_DSBMobile_Webseite.jpg)

## Zoom auf die Entwicklertools
Hier siehst Du in einer Übersicht, wo Du Schritt für Schritt klickst,<br>
um an die nötigen Daten zu kommen. Diese Daten gibst Du noch<br>
in dem ***Powershell-Skript*** ein, damit es Deinen individuellen<br>
Stundenplan lädt und nicht den meinen. Klicke dazu bitte auf den<br>
Tab `Sources` **①**.

![Übersicht 1 bis 4](00_Uebersicht1bis4.jpg)

Mit einem *Rechtsklick* auf `🗀 data` **②** öffnest Du das *Dropdown-Menü*.<br>
Dort wählst Du `Search in folder` aus.

![Search folder](02_Search_folder.jpg)

Jetzt wird rechts unten eine Zeile `file:data/` angezeigt **③**:

`file:data/1e7d336d-41c7-4a32-9b08-dde7ad6df345/f440c721-c59b-4a39-8b0a-958ee4215a59`

Diese beiden Ordner haben lange *Ziffern-Buchstaben-Kombinationen*,<br>
die Du am besten per *Copy & Paste* in **Zeile 9** des<br>
***Powershell-Skripts*** einfügst:

> Meine *Ziffern-Buchstaben-Kombination* ist folgende, Du hast<br>
> wahrscheinlich etwas anderes in den Entwicklertools angezeigt.<br>
> ![Ordnerstruktur, unter der Dein Stundenplan liegt](03_Ordnerstruktur.jpg)

Den zweiten Teil der Daten zum Vervollständigen der **Zeile 9** im<br>
***Powershell-Skript*** findest Du unter `🗀 frame` **④**.<br>
In meinem Fall ist das `c00006.htm`.

![c00006.htm Dropdown-Menü, unter dem Du Deine vierstellige Kursnummer findest](04_c00006htm.jpg)

## ![icon21px](Aufgabenplanung.png) Aufgabenplanung

So fügst Du Dein ***Powershell-Skript*** der ***Aufgabenplanung*** hinzu:<br>
Suche in Windows nach ***Aufgabenplanung*** **⑤** und starte sie.

![Aufgabenplanung Anleitung](05_Aufgabenplanung.jpg)

Klicke dann auf `Einfache Aufgabe erstellen` **⑥**.

![Aufgabenplanung Anleitung](06_Aufgabenplanung.jpg)

Trage in der **Eingabemaske** **⑦** bitte Folgendes ein:

![Aufgabenplanung Anleitung](07_Aufgabenplanung3.jpg)

* `Name`: *StundenplanHintergrundbild*
* `Trigger`: Auf `Wöchentlich` setzen
* `Freitag` um `11:00 Uhr` bietet sich an
* `Aktion`: Auf `Programm starten` setzen
* `Programm/Skript`: *powershell* eintippen
> `Argument hinzufügen (optional)`: Trage hier Folgendes ein<br>
> `-ExecutionPolicy Bypass -WindowStyle Hidden -File "C:\Documents\StundenplanHintergrundbildDunkel.ps1"`
>> **Wichtig:** Hier muss der genaue Dateipfad eingetragen werden,<br>
>> unter dem Du Dein Powershell-Skript abgespeichert hast.

Jetzt musst Du noch zwei Haken setzen: Den ersten bei **⑧**.

![Aufgabenplanung Anleitung](08_Aufgabenplanung4.jpg)

Und den zweiten Haken setzt Du bei **⑨**.

![Aufgabenplanung Anleitung](09_Aufgabenplanung5.jpg)

Fertig eingerichtet!

> PS: Guck noch einmal in das Bild mit der **⑥**.<br>
> Im oberen, mittleren Fenster kannst Du mit einem<br>
> Rechtsklick auf *StundenplanHintergrundbild*<br>
> Deine erstellte Aufgabe auch per Hand starten.
