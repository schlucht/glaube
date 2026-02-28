# Projekt Organisation - LaTeX Vorlagen

## Verzeichnisstruktur

### `/src/inc/` - Zentrale Stil- und Klassendateien

Dieser Ordner enthält alle wiederverwendbaren LaTeX-Pakete und Klassen für das gesamte Projekt:

#### Hauptklassen
- **`mybib.cls`** - Hauptklasse für Bibelstudienmaterialien (basiert auf scrartcl)
  - Enthält alle grundlegenden Pakete (babel, fontspec, tcolorbox, etc.)
  - Definiert Header/Footer-Layout mit Logo
  - Geometrie-Einstellungen

- **`mybibbook.cls`** - Klasse für längere Buchprojekte

#### Stil-Dateien (.sty)
- **`colors.sty`** ⭐ **NEU** - Zentrale Farbdefinitionen
  - Alle Farbdefinitionen an einem Ort
  - Grammatische Kategorien:
    - Personen: Blau (`personcolor`)
    - Orte: Magenta (`ortcolor`)
    - Verben: Grün (`verbcolor`)
    - Imperativ: Gelb (`verbimperativcolor`)
    - Konjunktiv: Rot (`verbkonjunktivcolor`)
  - Theologische Konzepte (gnade, gericht, heiligkeit, bund, etc.)
  - Standard-Basisfarben (rot, gelb, gruen, blau, magenta, orange, lila, rosa)
  - Hilfsmakros: `\bt{}`, `\btc{}`, `\cbox{}`

- **`bible_style.sty`** - Bibel-spezifische Makros
  - Bibelzitate-Makros (`\bib{}`, `\bibeltext{}`, `\bibelbox{}`)
  - Highlight-Makros
  - Diverse Formatierungshilfen
  - Verwendet `colors.sty` für alle Farben

- **`textanalysis.sty`** ⭐ **NEU**
  - Makros für grammatische Textanalyse (Hebräisch, Griechisch, Deutsch)
  - Verwendet `colors.sty` für standardisierte Farben
  - Farbcodierte grammatische Kategorien:
    - Verben: `\verbstamm{}`, `\verbN{}` (grün), `\verbI{}` (gelb), `\verbP{}` (grün+P), `\verbK{}` (rot)
    - Nomen: `\nomen{}` (orange)
    - Personen: `\pers{}`, `\person{}` (blau)
    - Ortsangaben: `\ort{}` (magenta)
    - Konjunktionen: `\konj{}`, `\bindW{}` (rot)
    - Präpositionen: `\prep{}`, `\partikel{}` (blau)
    - Annotationen: `\annot{}` (grau, klein)

- **`textmakro.sty`** ⭐ **NEU** - Vereinfachte Text-Makros
  - Einfache, übersichtliche Makros mit optionaler Box-/Textfarbe
  - Syntax: `\makro{Text}` (Textfarbe) oder `\makro[b]{Text}` (Box)
  - **Verben**: `\verb{}`, `\verbI{}` (imperativ), `\verbP{}` (passiv)
  - **Nomen**: `\nomen{}`
  - **Konjunktionen**: `\konj{}`
  - **Orte**: `\ort{}`
  - **Personen**: `\person{}`, `\mensch{}`
  - **Theologisch**: `\gott{}`, `\jesus{}`, `\geist{}`, `\israel{}`, `\teufel{}`
  - Dokumentation: [src/inc/dokus/textmakro_anleitung.md](src/inc/dokus/textmakro_anleitung.md)

- **`bibeltext.sty`** ⭐ **NEU**
  - Verwendet `colors.sty` für standardisierte Farben
  - Verstab-System für mehrsprachige Bibelverse
    - `\verstab{Versnummer}{Übersetzung}{Text}`
    - `\setdefault{Übersetzung}` - Hauptübersetzung setzen
    - `\setversions{Liste}` - Zu anzeigende Übersetzungen auswählen
  - Grammatische Makros mit optionalen Farben (per Boolean aktivierbar):
    - Verben: `\verbN{}` (grün), `\verbI{}` (gelb), `\verbP{}` (grün+P), `\verbK{}` (rot)
    - Personen: `\person{}` (blau)
    - Orte: `\ort{}` (magenta)
    - Bindewörter: `\bind{}`, `\bindA{}`, `\bindB{}`, `\bindV{}` (rot)
  - Hilfsmakros: `\hr`, `\lineheight{}`

- **`predigt.sty`** - Predigt-spezifische Makros
  - Verwendet `colors.sty` für standardisierte Farben
  - Hilfsmakros (`\hr`, `\lineheight{}`, `\q{}`)
  - Verweist auf `textanalysis.sty` für grammatische Makros

- **`header.sty`** - Alternative Header/Footer Einstellungen
  - Überschreibt die Standard-Header aus mybib.cls
  - Benutzerdefinierte Kopf- und Fußzeilen

- **`beamerthememnrstyle.sty`** - Beamer-Präsentationsthema

#### Hilfsdateien
- **`bibelbücher.txt`** - Liste aller Bibelbücher

## Verwendung

### Standard-Dokument
```latex
\documentclass[12pt]{../../inc/mybib}
\author{Ihr Name}

\setincpath{../../inc/}
\usepackage{bible_style}
\graphicspath{{../../assets/images/}}

\begin{document}
% Ihr Inhalt
\end{document}
```

### Textanalyse-Dokument 
```latex
\documentclass[12pt]{../../inc/mybib}
\author{OTS}

\setincpath{../../inc/}
\usepackage{bible_style}
\usepackage{textanalysis}  % Für grammatische Analyse
\graphicspath{{../../assets/images/}}

% Absatzformatierung (optional)
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}

\begin{document}
\section{Textanalysen}
\konj{Denn} das Wort \pers{Gottes} \verbstamm{ist} lebendig...
\end{document}
```

### Predigt-Dokument
```latex
\documentclass[12pt]{../../inc/mybib}
\author{Lothar Schmid}

\setincpath{../../inc/}
\usepackage{bible_style}
\usepackage{header}    % Alternative Header-Einstellungen
\usepackage{predigt}   % Predigt-Makros
\graphicspath{{../../assets/images/}}

\begin{document}
% Predigt-Inhalt
\end{document}
```

### Bibeltext-Dokument (z.B. AT_Bibeltext.tex, NT_Bibeltext.tex)
```latex
\documentclass[14pt]{../../inc/mybib}
\author{OTS}

\setincpath{../../inc/}
\usepackage{bible_style}
\usepackage{bibeltext}  % Verstab-System und grammatische Makros
\graphicspath{{../../assets/images/}}
\usepackage{header}
\usepackage{changepage}

% Absatzformatierung
\setlength{\parindent}{0pt}
\setlength{\parskip}{0.4em}

% Konfiguration für Versvergleich
\setdefault{SCHL}           % Schlachter als Hauptversion
\setversions{SCHL,ELB,GR}   % Zeige diese Übersetzungen an
% \setversions{ALL}         % oder: zeige alle Übersetzungen

\begin{document}
% Mehrsprachige Verse
\verstab{1}{SCHL}{Im Anfang war das Wort...}
\verstab{1}{ELB}{Im Anfang war das Wort...}
\verstab{1}{GR}{Ἐν ἀρχῇ ἦν ὁ λόγος...}

% Grammatische Markierungen (mit optionalen Farben)
\verbN{sprach} \person{Gott} zu \person{Abraham} in \ort{Ur}
\end{document}
```

## Projektbereiche

### `/src/EBTC/` - EBTC Studienmaterialien
- **3A/** - Textanalysen (nutzt textanalysis.sty)
- **GnGP/** - Gott nach Gottes Plan
- **Hg1/**, **Hg2/** - Hermeneutik
- **Substitution/** - Substitutionstheorie

### `/src/Predigten/` - Predigtmanuskripte
- **Vorlage/** - Predigtvorlagen
- Verschiedene Predigtreihen (Philipper, Psalm63, etc.)

### `/src/Bibel/` - Bibelkommentare
- **AT/** - Altes Testament
- **NT/** - Neues Testament

### `/src/Vorträge/` - Präsentationen und Vorträge

### `/src/Briefe/` - Briefvorlagen

## Änderungsprotokoll

### 28.02.2026
- ✅ Neue Datei `textanalysis.sty` erstellt
- ✅ Grammatische Makros von `Josua.tex` nach `textanalysis.sty` verschoben
- ✅ `Josua.tex` bereinigt und `textanalysis.sty` eingebunden
- ✅ Neue Datei `bibeltext.sty` erstellt
- ✅ Verstab-System und grammatische Makros von `AT_Bibeltext.tex` und `NT_Bibeltext.tex` nach `bibeltext.sty` verschoben
- ✅ `AT_Bibeltext.tex` bereinigt und `bibeltext.sty` eingebunden
- ✅ `NT_Bibeltext.tex` bereinigt und `bibeltext.sty` eingebunden
- ✅ **Neue Datei `colors.sty` erstellt** - Zentrale Farbdefinitionen
- ✅ **Farbdefinitionen zentralisiert**: Alle Farben aus `bible_style.sty`, `textanalysis.sty`, `bibeltext.sty` und `predigt.sty` nach `colors.sty` verschoben
- ✅ **Standardisierte Farbschema**:
  - Personen = Blau
  - Orte = Magenta
  - Verben = Grün
  - Imperativ = Gelb
  - Konjunktiv = Rot
  - Verben Passiv = Grün + Superscript "P"
- ✅ **Alte Farbdefinitionen auskommentiert** (nicht gelöscht) zum Vergleich
- ✅ **Makros vereinheitlicht**: `\verbN`, `\verbI`, `\verbP`, `\verbK`, `\person`, `\ort`, `\bindW` in allen Dateien konsistent
- 📝 Bessere Trennung zwischen projektweiten Stilen (inc/) und dokumentspezifischen Einstellungen

## Best Practices

1. **Wiederverwendbare Makros** gehören in `/src/inc/*.sty` Dateien
2. **Dokumentspezifische Einstellungen** bleiben in den `.tex` Dateien
3. **Relative Pfade** nutzen: `../../inc/mybib`
4. **Standardautor** kann in der Dokumentklasse überschrieben werden
5. **Bilder** zentral in `/src/assets/images/` ablegen
