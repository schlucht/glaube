# glaube
```go

package main

import (
    "bufio"
    "encoding/json"
    "errors"
    "flag"
    "fmt"
    "os"
    "regexp"
    "strconv"
    "strings"
)

type Chapter struct {
    Title  string  `json:"title"`
    Verses []Verse `json:"verses"`
}

type Verse struct {
    Number int    `json:"number"`
    Source string `json:"source"`
    Text   string `json:"text"`
}

var (
    // \subsection*{Kapitel 7}
    reSubsection = regexp.MustCompile(`^\\subsection\*\{([^}]*)\}`)
    // optional: \addcontentsline{toc}{subsection}{Kapitel 7}
    reAddContents = regexp.MustCompile(`^\\addcontentsline\{toc\}\{subsection\}\{([^}]*)\}`)
    // \verstab{1}{Schlachter}{Text …}
    // Gruppiert: (1) Versnummer, (2) Quelle, (3) Text
    reVerstab = regexp.MustCompile(`^\\verstab\{(\d+)\}\{([^}]*)\}\{(.*)\}\s*$`)
)

func parseTex(path string) (Chapter, error) {
    file, err := os.Open(path)
    if err != nil {
        return Chapter{}, err
    }
    defer file.Close()

    var chap Chapter
    scanner := bufio.NewScanner(file)
    lineNo := 0

    for scanner.Scan() {
        line := scanner.Text()
        lineNo++

        // Trim BOM (falls vorhanden) und Whitespace
        line = strings.TrimSpace(strings.TrimPrefix(line, "\uFEFF"))
        if line == "" {
            continue
        }

        // Kapitel-Titel (erste Übereinstimmung gewinnt)
        if chap.Title == "" {
            if m := reSubsection.FindStringSubmatch(line); m != nil {
                chap.Title = latexUnescape(m[1])
                continue
            }
            if m := reAddContents.FindStringSubmatch(line); m != nil {
                chap.Title = latexUnescape(m[1])
                continue
            }
        }

        // Verse
        if m := reVerstab.FindStringSubmatch(line); m != nil {
            num, err := strconv.Atoi(m[1])
            if err != nil {
                return chap, fmt.Errorf("ungültige Versnummer in Zeile %d: %v", lineNo, err)
            }
            source := latexUnescape(m[2])
            text := latexUnescape(m[3])

            chap.Verses = append(chap.Verses, Verse{
                Number: num,
                Source: source,
                Text:   text,
            })
            continue
        }
    }

    if err := scanner.Err(); err != nil {
        return chap, err
    }

    if chap.Title == "" && len(chap.Verses) == 0 {
        return chap, errors.New("keine passenden LaTeX-Strukturen gefunden (\n  erwartet: \\subsection*{…} oder \\verstab{…}{…}{…}\n)")
    }
    return chap, nil
}

// latexUnescape nimmt einfache LaTeX-Formattokens aus dem Fließtext raus.
// Erweiterbar je nach Bedarf (z.B. \emph{}, \"a, \, etc.)
func latexUnescape(s string) string {
    // Entferne einfache Umbrüche am Ende (z.B. \\)
    s = strings.TrimSpace(s)

    // Gängige LaTeX-Entities (minimale Behandlung)
    replacements := map[string]string{
        `---`: "—",
        `--`:  "–",
        `\%`:  "%",
        `\_`:  "_",
        `\#`:  "#",
        `\&`:  "&",
        `\,`:  " ",
        `~`:   " ",
    }

    for k, v := range replacements {
        s = strings.ReplaceAll(s, k, v)
    }

    // Entferne einfache Formatkommandos wie \emph{...}, \textbf{...}
    // Grob: \cmd{...} -> ...
    reCmdBraces := regexp.MustCompile(`\\[a-zA-Z]+\{([^}]*)\}`)
    for {
        if !reCmdBraces.MatchString(s) {
            break
        }
        s = reCmdBraces.ReplaceAllString(s, `$1`)
    }

    // Entferne verbleibende Backslashes vor normalen Buchstaben, z.B. \"a -> ä (minimal, deutsch)
    // Hier sehr rudimentär – für echte Umlaute könntest du eine vollständige Mapping-Tabelle einführen.
    // Beispielhafte Ersetzungen:
    umlaut := map[string]string{
        `\"a`: "ä", `\"A`: "Ä",
        `\"o`: "ö", `\"O`: "Ö",
        `\"u`: "ü", `\"U`: "Ü",
        `\'a`: "á", `\'e`: "é", `\'i`: "í", `\'o`: "ó", `\'u`: "ú",
        "\`a": "à", "\`e": "è", "\`i": "ì", "\`o": "ò", "\`u": "ù",
        `\^a`: "â", `\^e`: "ê", `\^i`: "î", `\^o`: "ô", `\^u`: "û",
    }
    for k, v := range umlaut {
        s = strings.ReplaceAll(s, k, v)
    }

    // Entferne sonstige Backslashes, die vor normalen Zeichen stehen
    s = regexp.MustCompile(`\\([{}])`).ReplaceAllString(s, `$1`)

    return s
}

func main() {
    in := flag.String("in", "", "Pfad zur LaTeX-Datei (UTF-8)")
    out := flag.String("out", "", "Ausgabedatei (JSON). Leer = stdout")
    flag.Parse()

    if *in == "" {
        fmt.Fprintln(os.Stderr, "Bitte mit -in <file.tex> aufrufen")
        os.Exit(1)
    }

    chapter, err := parseTex(*in)
    if err != nil {
        fmt.Fprintln(os.Stderr, "Fehler:", err)
        os.Exit(1)
    }

    enc := json.NewEncoder(os.Stdout)
    enc.SetIndent("", "  ")

    if *out == "" {
        if err := enc.Encode(chapter); err != nil {
            fmt.Fprintln(os.Stderr, "JSON-Fehler:", err)
            os.Exit(1)
        }
        return
    }

    f, err := os.Create(*out)
    if err != nil {
        fmt.Fprintln(os.Stderr, "Kann Ausgabedatei nicht erstellen:", err)
        os.Exit(1)
    }
    defer f.Close()

    enc = json.NewEncoder(f)
    enc.SetIndent("", "  ")
    if err := enc.Encode(chapter); err != nil {
        fmt.Fprintln(os.Stderr, "JSON-Fehler:", err)
        os.Exit(1)
    }
}

```