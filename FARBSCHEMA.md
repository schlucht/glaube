# Farbschema - LaTeX-Projekt

## Übersicht

Die Farbdefinitionen und Markierungs-Makros liegen zentral in [src/inc/markierungen.sty](src/inc/markierungen.sty).

Die Datei kennt jetzt drei einheitliche Paletten:

1. Grundfarben
2. Neonfarben
3. Pastellfarben

Zusätzlich unterstützen die Markierungs-Makros eine flexible Optionssyntax für Textfarbe oder Hintergrundmarkierung.

## Paletten

### Grundfarben

```latex
\definecolor{grundgruen}{RGB}{50,205,50}
\definecolor{grundgelb}{RGB}{226,211,85}
\definecolor{grundrot}{RGB}{255,0,0}
\definecolor{grundmagenta}{RGB}{255,0,255}
\definecolor{grundblau}{RGB}{100,100,205}
```

### Neonfarben

```latex
\definecolor{neongruen}{RGB}{57,255,20}
\definecolor{neongelb}{RGB}{255,255,0}
\definecolor{neonpink}{RGB}{255,20,147}
\definecolor{neonblau}{RGB}{77,77,255}
\definecolor{neonorange}{RGB}{255,140,0}
\definecolor{neonlila}{RGB}{199,21,133}
\definecolor{neoncyan}{RGB}{0,255,255}
\definecolor{neonrot}{RGB}{255,36,0}
```

### Pastellfarben

```latex
\definecolor{pastellblau}{RGB}{180,210,255}
\definecolor{pastellrot}{RGB}{255,180,180}
\definecolor{pastellgelb}{RGB}{255,240,180}
\definecolor{pastelllila}{RGB}{220,180,255}
\definecolor{pastellgruen}{RGB}{200,255,200}
\definecolor{pastellrosa}{RGB}{255,200,200}
```

## Kompatibilität

Für bestehende Dokumente bleiben die alten Farbnamen als Alias erhalten.

```latex
\colorlet{gruen}{grundgruen}
\colorlet{gelb}{grundgelb}
\colorlet{rot}{grundrot}
\colorlet{magenta}{grundmagenta}
\colorlet{blau}{grundblau}
\colorlet{hellgruen}{pastellgruen}
\colorlet{hellrot}{pastellrosa}
```

Damit funktionieren alte Makros und ältere Dokumente weiterhin ohne Umstellung.

## Makro-Syntax

Die Markierungs-Makros unterstützen jetzt eine kombinierte Optionssyntax.

### Grundform

```latex
\verbN{Text}
```

Ohne Option wird Textfarbe in der Grundpalette verwendet.

### Optionen

Die Optionen werden als komma-getrennte Liste angegeben:

```latex
\verbN[modus,palette]{Text}
```

#### Modus

```latex
b   % Hintergrundmarkierung
t   % Textfarbe
```

#### Palette

```latex
g        % Grundfarben
grund
n        % Neonfarben
neon
p        % Pastellfarben
pastell
```

### Beispiele

```latex
\verbN{Mein Text}        % Textfarbe in Grundgrün
\verbN[b]{Mein Text}     % Hintergrundmarkierung in Pastellgrün
\verbN[p]{Mein Text}     % Textfarbe in Pastellgrün
\verbN[b,p]{Mein Text}   % Hintergrundmarkierung in Pastellgrün
\verbN[b,n]{Mein Text}   % Hintergrundmarkierung in Neongrün
\verbN[t,g]{Mein Text}   % Textfarbe in Grundgrün
```

Die gleiche Syntax gilt für diese Makros:

```latex
\verbN
\verbI
\verbP
\konj
\ort
\person
\betonung
\info
\lied
\beten
```

## Standardzuordnung

Wenn keine Palette angegeben wird, gilt:

1. Textfarbe verwendet standardmäßig die Grundpalette.
2. Hintergrundmarkierung verwendet standardmäßig die Pastellpalette.

Damit ist `\verbN[b]{Text}` automatisch eine gut lesbare Pastell-Markierung.

## Zuordnung der Makros

| Makro | Grundfarbe | Neonfarbe | Pastellfarbe |
|-------|------------|-----------|--------------|
| `\verbN` | grundgruen | neongruen | pastellgruen |
| `\verbI` | grundgelb | neongelb | pastellgelb |
| `\verbP` | grundgruen | neongruen | pastellgruen |
| `\konj` | grundrot | neonrot | pastellrot |
| `\ort` | grundmagenta | neonpink | pastelllila |
| `\person` | grundblau | neonblau | pastellblau |
| `\betonung` | grundrot | neonrot | pastellrosa |
| `\info` | grundgruen | neongruen | pastellgruen |
| `\lied` | grundgelb | neongelb | pastellgelb |
| `\beten` | grundrot | neonrot | pastellrot |

## Empfehlung

1. Für normalen Fließtext Grundfarben verwenden.
2. Für hervorgehobene Markierungen im Text standardmäßig Pastellfarben verwenden.
3. Neonfarben nur gezielt einsetzen, wenn starke visuelle Hervorhebung gewünscht ist.
4. Neue Farben direkt in [src/inc/markierungen.sty](src/inc/markierungen.sty) ergänzen, nicht verteilt in mehreren Stil-Dateien.

## Beispiel

```latex
\documentclass[12pt]{../../inc/mybib}
\author{OTS}

\setincpath{../../inc/}
\usepackage{markierungen}

\begin{document}

\person{Abraham} \verbN{ging} nach \ort{Ur}.

\verbI[b]{Gehe!}
\verbI[b,n]{Gehe!}
\betonung[p]{Wichtiger Gedanke}
\info[b,p]{Hinweis}

\end{document}
```
