# --- Konfiguration ---
# aktuelleWoche + 7 Tage, ich will ja den Stundenplan von nächster Woche laden nicht dieser WOche ich Idiot ...
$aktuelleWoche = (Get-Culture).Calendar.GetWeekOfYear((Get-Date).AddDays(7), [System.Globalization.CalendarWeekRule]::FirstFourDayWeek, [System.DayOfWeek]::Monday)

# falls die Kalenderwoche 1 bis 9 einstellig sein sollten von der Webseite in der URL noch ; "{0:D2}" -f $aktuelleWoche zum Formatieren einfügen, siehe nächste Zeile
# $aktuelleWoche = (Get-Culture).Calendar.GetWeekOfYear((Get-Date).AddDays(7), [System.Globalization.CalendarWeekRule]::FirstFourDayWeek, [System.DayOfWeek]::Monday); "{0:D2}" -f $aktuelleWoche

# für FIS/FIA 2369 liegt der Stundenplan in diesen verschachtelten Ordnern 1e7d336d-41c7-4a32-9b08-dde7ad6df345 und f440c721-c59b-4a39-8b0a-958ee4215a59 kein login und pw für dsmobile nötig c00006 ist der 6te Eintrag von oben als 2369
$targetUrl = "https://dsbmobile.de/data/1e7d336d-41c7-4a32-9b08-dde7ad6df345/f440c721-c59b-4a39-8b0a-958ee4215a59/$aktuelleWoche/c/c00006.htm"

$tempPath = "$HOME\Documents\Stundenplan_Raw_KW$aktuelleWoche.png"
$savePath = "$HOME\Documents\Stundenplan_KW$aktuelleWoche.png"
$edgePath = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
# ---------------------

Write-Host "Lade Stundenplan für KW $aktuelleWoche..." -ForegroundColor Cyan

# zu esrt einmal die alten Edgeinstanzen beenden
Get-Process msedge -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Sleep -Seconds 1

# Screenshot aufnehmen (kleine Auflösung, sonst hängt der Stundenplan oben am Screen und unten ist zu viel Luft, Internet ist grottig, 6 s Wartezeit für die Seite zum Laden einplanen
$processArgs = "--headless", "--disable-gpu", "--window-size=960,540", "--screenshot=`"$tempPath`"", "`"$targetUrl`""
Start-Process -FilePath $edgePath -ArgumentList $processArgs -NoNewWindow
Start-Sleep -Seconds 6
Get-Process msedge -ErrorAction SilentlyContinue | Stop-Process -Force

if (-not (Test-Path $tempPath)) {
    Write-Host "Fehler beim Erstellen des Screenshots." -ForegroundColor Red
    Return
}

Write-Host "Skaliere den Stundenplan doppelt so groß und invertiere Farben in den Dark Mode, um Augenkrebs zu vermeiden..." -ForegroundColor Cyan

# Bild laden, in doppelter Größe anlegen, skalieren und invertieren
Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile($tempPath)

$newWidth = $img.Width * 2
$newHeight = $img.Height * 2

$bmp = New-Object System.Drawing.Bitmap($newWidth, $newHeight)
$graph = [System.Drawing.Graphics]::FromImage($bmp)

# hohe Interpolationsqualität für die Verdopplung erzwingen
$graph.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$graph.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$graph.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality

$srcRect = [System.Drawing.Rectangle]::new(0, 0, $img.Width, $img.Height)
$destRect = [System.Drawing.Rectangle]::new(0, 0, $newWidth, $newHeight)
$graph.DrawImage($img, $destRect, $srcRect, [System.Drawing.GraphicsUnit]::Pixel)

$img.Dispose()
$graph.Dispose()

# alle Pixel des verdoppelten Bildes pixelgenau invertieren
for ($x = 0; $x -lt $bmp.Width; $x++) {
    for ($y = 0; $y -lt $bmp.Height; $y++) {
        $pixel = $bmp.GetPixel($x, $y)
        $newPixel = [System.Drawing.Color]::FromArgb(255, (255 - $pixel.R), (255 - $pixel.G), (255 - $pixel.B))
        $bmp.SetPixel($x, $y, $newPixel)
    }
}

# vergrößertes Hintergrundbild abspeichern
$bmp.Save($savePath, [System.Drawing.Imaging.ImageFormat]::Png)

# er löscht mir die Raw Datei nicht richtig weg, Überschreiben geht, k/A warum löschen nicht geht, muss ich später drüber gucken was hier hängt
$bmp.Dispose()
Remove-Item $tempPath -ErrorAction SilentlyContinue

# Windows Hintergrundbild setzen
if (Test-Path $savePath) {
    Write-Host "Stundenplan erfolgreich verdoppelt und in den Dark Mode invertiert." -ForegroundColor Green

    if (-not ("Wallpaper" -as [type])) {
        Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string pvParam, int fuWinIni);
}
"@
    }
    [Wallpaper]::SystemParametersInfo(20, 0, $savePath, 3)
    
    Write-Host "Hintergrundbild aktualisiert." -ForegroundColor Green
} else {
    Write-Host "Fehler beim Speichern." -ForegroundColor Red
}
