# Farbschema - LaTeX Projekt

## Übersicht

Alle Farbdefinitionen sind jetzt in `src/inc/colors.sty` zentralisiert.

## Standardisiertes Farbschema für grammatische Kategorien

| Kategorie | Farbe | Makro | Beispiel |
|-----------|-------|-------|----------|
| **Personen** | Blau | `\person{Text}` | \person{Abraham} |
| **Orte** | Magenta | `\ort{Text}` | \ort{Jerusalem} |
| **Verben (Normal)** | Grün | `\verbN{Text}` | \verbN{ging} |
| **Verben (Imperativ)** | Gelb | `\verbI{Text}` | \verbI{Gehe!} |
| **Verben (Konjunktiv)** | Rot | `\verbK{Text}` | \verbK{würde gehen} |
| **Verben (Passiv)** | Grün + P | `\verbP{Text}` | \verbP{wurde gegangen} |
| **Konjunktionen** | Rot | `\konj{Text}`, `\bindW{Text}` | \konj{und} |
| **Nomen** | Orange | `\nomen{Text}` | \nomen{Haus} |
| **Präpositionen** | Blau | `\prep{Text}` | \prep{in} |
| **Annotationen** | Grau (klein) | `\annot{Text}` | \annot{Erklärung} |

## RGB-Werte

### Grammatische Kategorien
```latex
\definecolor{personcolor}{RGB}{100,100,205}        % Blau
\definecolor{ortcolor}{RGB}{255,0,255}             % Magenta
\definecolor{verbcolor}{RGB}{50,205,50}            % Grün
\definecolor{verbimperativcolor}{RGB}{255,255,0}   % Gelb
\definecolor{verbkonjunktivcolor}{RGB}{255,0,0}    % Rot
\definecolor{nomencolor}{RGB}{255,140,0}           % Orange
\definecolor{konjunktioncolor}{RGB}{255,0,0}       % Rot
\definecolor{praepositioncolor}{RGB}{0,0,255}      % Blau
\definecolor{annotationcolor}{RGB}{128,128,128}    % Grau
```

### Theologische Konzepte
```latex
\definecolor{gnade}{RGB}{180,210,255}      % sanftes Himmelsblau
\definecolor{gericht}{RGB}{255,180,180}    % mildes Rot
\definecolor{heiligkeit}{RGB}{255,240,180} % warmes Gold
\definecolor{bund}{RGB}{220,180,255}       % Purpur/Lila
\definecolor{infos}{RGB}{200,255,200}      % weiches Grün
\definecolor{betonung}{RGB}{255,200,200}   % zartes Rosa
```

### Standard-Basisfarben
```latex
\definecolor{rot}{RGB}{255,0,0}
\definecolor{gelb}{RGB}{255,255,0}
\definecolor{gruen}{RGB}{50,205,50}
\definecolor{blau}{RGB}{100,100,205}
\definecolor{magenta}{RGB}{255,0,255}
\definecolor{orange}{RGB}{255,140,0}
\definecolor{lila}{RGB}{220,180,255}
\definecolor{rosa}{RGB}{238,153,239}
```

## Verwendung in verschiedenen Paketen

### `textanalysis.sty`
Für grammatische Textanalyse (Josua.tex, etc.)
```latex
\usepackage{textanalysis}

\verbstamm{ging}             % Grün (durch verbcolor)
\verbN{ging}                 % Grün (Colorbox)
\verbI{Gehe}                 % Gelb (Imperativ)
\verbP{wurde gesehen}        % Grün + Superscript P
\verbK{würde gehen}          % Rot (Konjunktiv)
\person{Abraham}             % Blau
\ort{Jerusalem}              % Magenta
\nomen{Haus}                 % Orange
\konj{und}                   % Rot
\prep{in}                    % Blau
\annot{Erklärung}           % Grau, klein
```

### `bibeltext.sty`
Für Bibeltexte mit Versvergleich (AT_Bibeltext.tex, NT_Bibeltext.tex)
```latex
\usepackage{bibeltext}

% Gleiche Makros wie textanalysis.sty, aber mit Boolean-Kontrolle:
\verbN{Text}    % Kann mit \bool_set_false:N \l_color_verbN_bool deaktiviert werden
\verbI{Text}
\verbP{Text}
\verbK{Text}
\person{Text}
\ort{Text}
\bind{Text}     % Basis-Bindewort
\bindA{Text}    % Bindewort + Superscript A
\bindB{Text}    % Bindewort + Superscript B
\bindV{Text}    % Bindewort + Superscript V
```

### `bible_style.sty`
Allgemeine Bibel-Makros
```latex
\usepackage{bible_style}

% Verwendet colors.sty automatisch
\lied{Nr. 123}
\beten
\green{Text}
\rot{Text}
\betonung{Text}
```

## Hilfsmakros

### Farbige Boxen
```latex
% Aus colors.sty:
\cbox{Hintergrundfarbe}{Textfarbe}{Text}
\btc{Hintergrundfarbe}{Textfarbe}{Text}
\bt[Hintergrundfarbe]{Text}

% Beispiele:
\cbox{gruen}{white}{Verb}
\cbox{gelb}{black}{Imperativ}
\cbox{magenta}{white}{Ort}
```

## Migration von alten Dateien

### Alte Farbdefinitionen
Alle alten Farbdefinitionen wurden auskommentiert (nicht gelöscht):
- `bible_style.sty` - Zeilen mit `% \definecolor{...}`
- `textanalysis.sty` - Zeilen mit `% \definecolor{...}`
- `bibeltext.sty` - Zeilen mit `% \definecolor{...}`
- `predigt.sty` - Alte Makros auskommentiert

### Vergleich Alt vs. Neu

#### Alte Definitionen (auskommentiert)
```latex
% textanalysis.sty (alt):
% \definecolor{locationcolor}{RGB}{200,150,255}  % Lila für Ortsangaben

% bibeltext.sty (alt):
% \definecolor{rosa}{RGB}{238,153,239}  % für Orte
```

#### Neue Definitionen (colors.sty)
```latex
\definecolor{ortcolor}{RGB}{255,0,255}  % Magenta für Ortsangaben
```

## Best Practices

1. **Immer `colors.sty` verwenden**: Alle neuen Dokumente sollten `colors.sty` direkt oder indirekt (über andere Pakete) laden
2. **Einheitliche Makros**: Verwenden Sie `\person{}`, `\ort{}`, `\verbN{}` etc. statt direkte `\textcolor{}` Aufrufe
3. **Keine neuen Farbdefinitionen**: Neue Farben nur in `colors.sty` hinzufügen
4. **Boolean-Kontrolle**: In `bibeltext.sty` können Farben mit Booleans ein-/ausgeschaltet werden

## Beispiel-Dokument

```latex
\documentclass[12pt]{../../inc/mybib}
\author{OTS}

\setincpath{../../inc/}
\usepackage{bible_style}      % Lädt colors.sty automatisch
\usepackage{textanalysis}     % Lädt colors.sty automatisch
\graphicspath{{../../assets/images/}}

\begin{document}

\section{Textanalyse}

\person{Abraham} \verbN{ging} nach \ort{Ur}, \konj{und} 
\person{Gott} \verbI{sprach} zu ihm.

\annot{Dies ist eine Erklärung.}

\end{document}
```
