# Cheatsheet: Markierungen

Stand: 2026-06-06
Datei: src/inc/markierungen.sty

## Schnellstart

Wenn du eine Klasse wie mybib/mybibreport/mybibbook nutzt, ist markierungen.sty bereits geladen.

Direkt verwendbar:
- \verbN{...}
- \verbI{...}
- \verbP{...}
- \konj{...}
- \ort{...}
- \person{...}
- \betonung{...}
- \info{...}
- \lied{...}
- \beten{...}

## Bedeutung der Makros

- \verbN: Verb (normal), Gruen
- \verbI: Verb (Imperativ), Gelb
- \verbP: Verb (Passiv), Gruen + hochgestelltes P
- \konj: Konjunktion, Rot
- \ort: Ort/Geografie, Magenta
- \person: Person, Blau
- \betonung: Betonung, Rot/Pastellrosa
- \info: Information, Gruen/Pastellgruen
- \lied: Liedhinweis (typisch als Box)
- \beten: Gebetshinweis (typisch als Box)

## Optionen

Jedes Makro kann optional mit [..] aufgerufen werden.

- b = Hintergrund markieren (statt nur Textfarbe)
- t = Textfarbe (Standard)
- g = Grundpalette
- p = Pastellpalette
- n = Neonpalette

Kombinationen:
- [b,p] = Hintergrund + Pastell
- [b,n] = Hintergrund + Neon
- [t,g] = Textfarbe + Grund

Wenn keine Palette angegeben ist:
- bei Textfarbe wird Grundpalette verwendet
- bei Hintergrund wird Pastellpalette verwendet

## Sofortbeispiele

```tex
% Verben
\verbN{geht}
\verbI{Geht!}
\verbP{wurde gerettet}

% Satzteile
\konj{und}
\ort{Jerusalem}
\person{Petrus}

% Hervorhebung
\betonung[b,p]{Wichtig}
\info[b,p]{Hinweis fuer die Gemeinde}
\lied[b]{Lied 123}
\beten[b,p]{Gebet}
```

## Typische Muster im Gottesdienstblatt

```tex
\begin{itemize}
  \item[] \beten[b,p]{Beten zur Begruessung}
  \item[] \lied[b]{Du bist das Licht der Welt}
  \item[] \info[b,p]{Naechster Gottesdienst: ...}
\end{itemize}
```

## Global Ein/Aus

- \markierungenOff: alle Markierungen deaktivieren
- \markierungenOn: alle Markierungen wieder aktivieren

Beispiel:

```tex
\markierungenOff
Text ohne visuelle Markierungen.
\markierungenOn
\verbN{Ab hier wieder farbig.}
```

## Technische Hinweise

- \lied und \beten nutzen bei [b]-Modus Boxdarstellung (mehrzeilig robust).
- \verbP fuegt immer ein hochgestelltes P an.
- Fuer sehr viele Markierungen in einem Dokument ist \markierungenOff praktisch fuer Druckversionen.

## Mini-Referenz (eine Zeile)

\verbN / \verbI / \verbP / \konj / \ort / \person / \betonung / \info / \lied / \beten + Optionen [b|t] und [g|p|n].
