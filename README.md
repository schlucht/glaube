# Projektorganisation - LaTeX Vorlagen

## Aktueller Stand

Das Projekt nutzt eine zentrale Klassen-/Paketstruktur in `src/inc`.
Die wichtigste Neuerung ist die gemeinsame Basisdatei `mybibcommon.sty`, die von den Klassen geladen wird.

## Struktur in src/inc

### Klassen

- `mybib.cls` (Basis: `scrartcl`)
- `mybibreport.cls` (Basis: `scrreprt`)
- `mybibbook.cls` (Basis: `scrbook`)

Alle drei Klassen sind schlanke Wrapper und laden die gemeinsame Basis `mybibcommon.sty`.

### Zentrale Pakete

- `mybibcommon.sty`
  - gemeinsames Paket-Setup (Sprache, Fonts, Layout, Kopf-/Fusszeile, Geometrie)
  - definiert `\setincpath{...}`
  - definiert `\setheaderlogo[hoehe]{datei}`
  - lädt automatisch:
    - `markierungen.sty`
    - `bibeltext.sty`
    - `bible_style.sty`

- `markierungen.sty`
  - Markierungs-Makros (z. B. `\verbN`, `\person`, `\info`, `\beten`)
  - Optionen fuer Text-/Hintergrundfarbe und Paletten
  - globale Schalter: `\markierungenOff`, `\markierungenOn`

- `bibeltext.sty`
  - Verstab-System für Übersetzungsvergleich
  - Makros wie `\setdefault`, `\setversions`, `\verstab`

- `bible_style.sty`
  - Bibelzitat-Makros und Boxen (`bibelbox`)
  - Übersetzungskürzel via `\bib{...}`

### Weitere Pakete

- `header.sty`
  - Kompatibilitätspaket, delegiert auf `mybibcommon.sty`
- `beamerthememnrstyle.sty`
  - separates Beamer-Theme

### Legacy/Altbestand

- `textmakro.sty`, `textanalysis.sty`, `predigt.sty`, `colors1.sty`
  - historischer Bestand, teils auskommentiert
  - für neue Dokumente nicht der primäre Einstieg

## Standard-Präambel (neu)

```latex
\documentclass[fontsize=14pt]{../../inc/mybib}
\author{OTS}

\setincpath{../../inc/}
\graphicspath{{../../assets/images/}}

\newcommand{\Name}{Max}
\setheaderlogo{mnr-green.png}

% falls noetig fuer scrlayer-scrpage
\setlength{\footheight}{30.4pt}

\begin{document}
% Inhalt
\end{document}
```

Wichtig:
- `\author{...}` in die Präambel (vor `\begin{document}`).
- `\usepackage{bible_style}`, `\usepackage{bibeltext}`, `\usepackage{markierungen}` sind bei `mybib*`-Klassen normalerweise nicht mehr nötig.

## Logo im Header

Globaler Standard wird in `mybibcommon.sty` gesetzt.
Pro Dokument kann das Logo so überschrieben werden:

```latex
\setheaderlogo{mnr-green.png}
\setheaderlogo[1.2cm]{logo.png}
```

## Dokumentation

- Gesamtübersicht der Pakete:
  - [src/inc/dokus/sty_dokumentation.md](src/inc/dokus/sty_dokumentation.md)

- Kompaktes Cheatsheet für Markierungen:
  - [src/inc/dokus/markierungen_cheatsheet.md](src/inc/dokus/markierungen_cheatsheet.md)

## Hinweise für neue Dateien

1. Klasse aus `src/inc` verwenden (`mybib`, `mybibreport`, `mybibbook`).
2. `\author{...}` immer vor `\begin{document}` setzen.
3. `\setincpath` und `\graphicspath` in der Präambel setzen.
4. Headerlogo bei Bedarf mit `\setheaderlogo` überschreiben.
5. Markierungsmakros direkt verwenden (kommen über `mybibcommon`).
