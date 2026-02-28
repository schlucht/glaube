# textmakro.sty - Schnellreferenz

## Installation

```latex
\usepackage{textmakro}
```

## Verwendung

**Syntax:**
- `\makro{Text}` - Nur Textfarbe
- `\makro[b]{Text}` - Mit Box-Hintergrundfarbe

## Makro-Übersicht

### Verben

| Makro | Farbe | Textfarbe | Box-Farbe |
|-------|-------|-----------|-----------|
| `\verb{ging}` | Grün | \verb{ging} | \verb[b]{ging} |
| `\verbI{Gehe!}` | Gelb | \verbI{Gehe!} | \verbI[b]{Gehe!} |
| `\verbP{wurde gesehen}` | Grün + P | \verbP{wurde gesehen} | \verbP[b]{wurde gesehen} |

**Beispiele:**
```latex
Abraham \verb{ging} nach Ur.
\verbI{Gehe} und \verbI[b]{verkünde}!
Das Wort \verbP{wurde gesprochen}.
```

### Nomen

| Makro | Farbe | Verwendung |
|-------|-------|------------|
| `\nomen{Haus}` | Orange | `\nomen{Haus}` oder `\nomen[b]{Haus}` |

**Beispiel:**
```latex
Das \nomen{Haus} des \nomen[b]{Herrn}.
```

### Konjunktionen

| Makro | Farbe | Verwendung |
|-------|-------|------------|
| `\konj{und}` | Rot | `\konj{und}` oder `\konj[b]{und}` |

**Beispiel:**
```latex
Abraham \konj{und} Sara, \konj[b]{aber} auch Lot.
```

### Orte

| Makro | Farbe | Verwendung |
|-------|-------|------------|
| `\ort{Jerusalem}` | Magenta | `\ort{Jerusalem}` oder `\ort[b]{Jerusalem}` |

**Beispiele:**
```latex
Von \ort{Jerusalem} nach \ort[b]{Bethlehem}.
```

### Personen - Allgemein

| Makro | Farbe | Verwendung |
|-------|-------|------------|
| `\person{Abraham}` | Blau | `\person{Abraham}` oder `\person[b]{Abraham}` |
| `\mensch{Adam}` | Blau | `\mensch{Adam}` oder `\mensch[b]{Adam}` |

**Beispiele:**
```latex
\person{Abraham} war ein \mensch[b]{Mensch} des Glaubens.
```

### Theologische Personen - Gottheit

| Makro | Farbe | RGB | Verwendung |
|-------|-------|-----|------------|
| `\gott{Gott}` | Himmelsblau | rgb(180,210,255) | `\gott{Gott}` oder `\gott[b]{Gott}` |
| `\jesus{Jesus}` | Himmelsblau | rgb(180,210,255) | `\jesus{Jesus}` oder `\jesus[b]{Jesus}` |
| `\geist{Heiliger Geist}` | Himmelsblau | rgb(180,210,255) | `\geist{Heiliger Geist}` oder `\geist[b]{der Geist}` |

**Beispiele:**
```latex
\gott{Gott} sandte \jesus[b]{Jesus}, und der \geist{Heilige Geist} wirkt.
```

### Theologische Personen - Volk Gottes

| Makro | Farbe | RGB | Verwendung |
|-------|-------|-----|------------|
| `\israel{Israel}` | Lila (Bund) | rgb(220,180,255) | `\israel{Israel}` oder `\israel[b]{Israel}` |

**Beispiel:**
```latex
\gott{Gott} erwählte \israel[b]{Israel} als sein Volk.
```

### Theologische Personen - Gegenspieler

| Makro | Farbe | RGB | Verwendung |
|-------|-------|-----|------------|
| `\teufel{Satan}` | Rot (Gericht) | rgb(255,180,180) | `\teufel{Satan}` oder `\teufel[b]{der Teufel}` |

**Beispiel:**
```latex
\teufel{Der Teufel} versucht, \teufel[b]{Satan} widersetzt sich.
```

### Hilfsmakros

| Makro | Beschreibung | Verwendung |
|-------|--------------|------------|
| `\annot{Text}` | Annotation (grau, klein, kursiv) | `\annot{Erklärung}` |

## Vollständiges Beispiel

```latex
\documentclass[12pt]{../../inc/mybib}
\author{OTS}

\setincpath{../../inc/}
\usepackage{bible_style}
\usepackage{textmakro}
\graphicspath{{../../assets/images/}}

\begin{document}

\section{Genesis 12,1-3}

\gott[b]{Der HERR} \verb{sprach} zu \person{Abram}: 

\verbI{Geh} aus deinem Land \konj{und} von deiner Verwandtschaft 
\konj{und} aus dem \nomen{Haus} deines Vaters in das \ort{Land}, 
das ich dir \verb{zeigen} werde.

\konj{Und} ich will dich zu einem großen \nomen{Volk} \verb{machen} 
\konj{und} will dich \verb{segnen} \konj{und} dir einen großen 
\nomen{Namen} \verb{machen}, \konj{und} du sollst ein \nomen{Segen} sein.

\annot{Dies ist der Anfang der Verheißung an Abraham.}

\end{document}
```

## Farbübersicht

| Kategorie | Farbe | RGB |
|-----------|-------|-----|
| **Verben** | Grün | rgb(50,205,50) |
| **Imperativ** | Gelb | rgb(255,255,0) |
| **Nomen** | Orange | rgb(255,140,0) |
| **Konjunktionen** | Rot | rgb(255,0,0) |
| **Orte** | Magenta | rgb(255,0,255) |
| **Personen** | Blau | rgb(100,100,205) |
| **Gott/Jesus/Geist** | Himmelsblau | rgb(180,210,255) |
| **Israel** | Lila | rgb(220,180,255) |
| **Teufel** | Rot (hell) | rgb(255,180,180) |

## Farben Deaktivieren (Boolean-Schalter)

Alle Makros unterstützen Boolean-Schalter, um Farben selektiv zu deaktivieren. Dies ist nützlich für:
- Schwarz-Weiß-Druck
- Vereinfachte Ansichten
- Selektive Hervorhebung einzelner Kategorien

### Verwendung

Fügen Sie diese Zeilen **nach** `\usepackage{textmakro}` in Ihrer Präambel ein:

```latex
\ExplSyntaxOn

% Farben deaktivieren (false) oder aktivieren (true)
\bool_set_false:N \l_color_verb_bool      % Deaktiviert normale Verben
\bool_set_false:N \l_color_verbI_bool     % Deaktiviert Imperative
\bool_set_false:N \l_color_verbP_bool     % Deaktiviert Passiv-Verben
\bool_set_false:N \l_color_nomen_bool     % Deaktiviert Nomen
\bool_set_false:N \l_color_konj_bool      % Deaktiviert Konjunktionen
\bool_set_false:N \l_color_ort_bool       % Deaktiviert Orte
\bool_set_false:N \l_color_person_bool    % Deaktiviert Personen
\bool_set_false:N \l_color_gott_bool      % Deaktiviert Gott
\bool_set_false:N \l_color_jesus_bool     % Deaktiviert Jesus
\bool_set_false:N \l_color_geist_bool     % Deaktiviert Heiliger Geist
\bool_set_false:N \l_color_israel_bool    % Deaktiviert Israel
\bool_set_false:N \l_color_teufel_bool    % Deaktiviert Teufel

\ExplSyntaxOff
```

### Beispiel: Nur theologische Personen hervorheben

```latex
\documentclass[12pt]{../../inc/mybib}
\author{OTS}

\setincpath{../../inc/}
\usepackage{bible_style}
\usepackage{textmakro}

% Alle Farben außer theologischen Personen deaktivieren
\ExplSyntaxOn
\bool_set_false:N \l_color_verb_bool
\bool_set_false:N \l_color_verbI_bool
\bool_set_false:N \l_color_verbP_bool
\bool_set_false:N \l_color_nomen_bool
\bool_set_false:N \l_color_konj_bool
\bool_set_false:N \l_color_ort_bool
\bool_set_false:N \l_color_person_bool
% Gott, Jesus, Geist, Israel, Teufel bleiben aktiviert (true)
\ExplSyntaxOff

\begin{document}
\gott{Gott} sprach zu Abraham...  % Nur Gott wird farbig sein
\end{document}
```

### Beispiel: Schwarz-Weiß-Druck

```latex
\ExplSyntaxOn
% Alle Farben deaktivieren
\bool_set_false:N \l_color_verb_bool
\bool_set_false:N \l_color_verbI_bool
\bool_set_false:N \l_color_verbP_bool
\bool_set_false:N \l_color_nomen_bool
\bool_set_false:N \l_color_konj_bool
\bool_set_false:N \l_color_ort_bool
\bool_set_false:N \l_color_person_bool
\bool_set_false:N \l_color_gott_bool
\bool_set_false:N \l_color_jesus_bool
\bool_set_false:N \l_color_geist_bool
\bool_set_false:N \l_color_israel_bool
\bool_set_false:N \l_color_teufel_bool
\ExplSyntaxOff
```

**Hinweis:** Standardmäßig sind alle Farben aktiviert (`\bool_set_true:N`). Sie müssen nur die Farben deaktivieren, die Sie nicht benötigen.

## Tipps

1. **Konsistenz**: Verwenden Sie entweder nur Textfarben ODER nur Box-Farben in einem Dokument
2. **Lesbarkeit**: Zu viele Box-Farben können überladen wirken - sparsam einsetzen
3. **Kombinationen**: Box-Farben eignen sich gut für wichtige Schlüsselwörter
4. **Annotationen**: Verwenden Sie `\annot{}` für Erklärungen, die nicht Teil des Haupttextes sind
5. **Boolean-Schalter**: Nutzen Sie Boolean-Schalter, um Farben für Druck oder fokussierte Analysen zu deaktivieren
6. **Selektive Hervorhebung**: Deaktivieren Sie alle Farben außer einer Kategorie, um spezifische Aspekte zu analysieren
