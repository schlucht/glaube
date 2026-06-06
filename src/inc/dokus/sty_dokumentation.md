# Dokumentation der .sty-Dateien in src/inc

Stand: 2026-06-06

Diese Datei dokumentiert Zweck, Status und wichtigste Makros der lokalen LaTeX-Stilpakete.

## Kurzuebersicht

- Aktiv und zentral: `mybibcommon.sty`, `markierungen.sty`, `bibeltext.sty`, `bible_style.sty`, `beamerthememnrstyle.sty`
- Kompatibilitaetsschicht: `header.sty`
- Historisch/Legacy (weitgehend auskommentiert): `textmakro.sty`, `textanalysis.sty`, `predigt.sty`, `colors1.sty`

## Wichtigster Einstiegspunkt

### mybibcommon.sty

Rolle:
- Gemeinsame Basis fuer die Klassen `mybib`, `mybibreport`, `mybibbook`
- Laedt Sprach-/Schrift-/Layoutpakete
- Definiert Kopf-/Fusszeile, Geometrie und Standardkonfiguration
- Laedt automatisch `markierungen`, `bibeltext`, `bible_style`

Wichtige Makros:
- `\setincpath{...}`: setzt Suchpfad fuer lokale Includes
- `\setheaderlogo[hoehe]{datei}`: setzt Logo im Header
- `\headerlogo`: aktuelles Header-Logo-Makro
- `block`-Umgebung: einfache Absatz-Blockstruktur

Hinweis:
- Autor in der Fusszeile wird mit `\AtBeginDocument` gesetzt. `\author{...}` sollte in der Praeambel stehen.

## Text- und Bibelarbeit

### markierungen.sty

Rolle:
- Zentrale farbige Markierungen fuer Predigt-/Analysetexte
- Schalter fuer globales Ein-/Ausschalten von Markierungen

Kernmakros:
- `\verbN`, `\verbI`, `\verbP`
- `\konj`, `\ort`, `\person`
- `\betonung`, `\info`, `\lied`, `\beten`
- `\markierungenOff`, `\markierungenOn`
- `\marktext{modus}{farbe}{text}` (intern/fortgeschritten)

Optionen (typisch):
- `[b]` = Hintergrundfarbe
- `[p]` = Pastellpalette
- `[n]` = Neonpalette
- Kombinationen wie `[b,p]`

### bibeltext.sty

Rolle:
- Ausgabe von Versen in Vergleichsdarstellung (mehrere Uebersetzungen)

Kernmakros:
- `\setdefault{SCHL}`
- `\setversions{SCHL,ELB}` oder `\setversions{ALL}`
- `\verstab{versnummer}{kuerzel}{text}`
- `\getdefault`, `\getversions`

Beispiel:
- `\setdefault{SCHL}`
- `\setversions{SCHL,ELB}`
- `\verstab{16}{SCHL}{Denn also hat Gott...}`

### bible_style.sty

Rolle:
- Bibel-Zitatboxen und Uebersetzungskuerzel

Kernmakros/Umgebungen:
- `\bib{SCHL}`: Kuerzel -> Klarname
- `\bibtit{SCHL}`
- `bibeltext`-Umgebung (Zitatdarstellung)
- `bibelbox`-Umgebung (tcolorbox)
- `\biblezit{Buch}{Kap:Vers}`
- `\verslink{Buch}{Kap}{Vers}` (Link auf esrabibel.de)

Wichtiger Hinweis:
- Datei enthaelt `\RequirePackage{colors}`.
- Im Repo existiert aktuell `colors1.sty`, nicht `colors.sty`.
- Falls es dabei zu Paketauflosungsproblemen kommt, sollte entweder
	- `colors1.sty` auf `colors.sty` umbenannt werden, oder
	- `bible_style.sty` auf `\RequirePackage{colors1}` umgestellt werden.

## Header/Kompatibilitaet

### header.sty

Rolle:
- Reines Kompatibilitaetspaket
- Leitet intern auf `mybibcommon.sty` weiter

Empfehlung:
- Neue Dokumente sollten kein `\usepackage{header}` mehr benoetigen,
	wenn `mybib`/`mybibreport`/`mybibbook` genutzt wird.

## Beamer

### beamerthememnrstyle.sty

Rolle:
- Eigenes Beamer-Theme (Farben, Headline/Footline, Titelseite)

Kernmakros:
- `\setmnrTitle{...}`
- `\green{...}`
- `\twocols[links]{inhalt}[rechts]{inhalt}`
- `mnrframe`-Umgebung
- `bibelbox`-Umgebung (beamer-spezifisch)

Hinweis:
- Das Theme setzt dunklen Hintergrund und gruene CI-Farbe (`mnrgreen`).

## Legacy-Dateien

### textmakro.sty
- Historische Makro-Sammlung, nahezu vollstaendig auskommentiert.
- Dient primär als Referenz alter Loesungen.

### textanalysis.sty
- Historische Analysemakros, ebenfalls weitgehend auskommentiert.
- Funktional durch `markierungen.sty`/`bibeltext.sty` ersetzt.

### predigt.sty
- Enthielt frueher Hilfsmakros fuer Predigten.
- Aktuell nur wenige allgemeine Helfer (`\hr`, `\lineheight`, `\q`) plus Legacy-Hinweis.

### colors1.sty
- Historische Farbdefinitionen (auskommentiert).
- Aktuell nicht als aktives Farbpaket im Einsatz.

## Empfohlene Verwendung in neuen Dokumenten

1. Klasse laden, z. B. `\documentclass[fontsize=14pt]{../../inc/mybib}`
2. `\author{...}` in die Praeambel
3. `\setincpath{../../inc/}`
4. Optional `\setheaderlogo{mnr-green.png}`
5. Keine separaten `\usepackage{bible_style}`/`bibeltext`/`markierungen` noetig, da bereits in `mybibcommon` enthalten

## Wartungshinweise

- Neue Makros bevorzugt in `mybibcommon.sty` (global) oder in den fachlichen Paketen (`markierungen`, `bibeltext`, `bible_style`) einbauen.
- Legacy-Dateien nicht weiter ausbauen; besser konsolidieren oder spaeter entfernen.
- Bei Namensaenderungen von Paketen immer alle `\RequirePackage`-Stellen mitpruefen.
