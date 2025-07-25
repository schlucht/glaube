\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybiblatex}[2025/01/28 Custom Bibel Vorlage]

% Weitergabe aller Optionen an die geladene Klasse
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

% Standardklasse mit übergebenen Optionen laden
\LoadClass{scrartcl}

% Paket-Imports und Einstellungen
\RequirePackage[automark]{scrlayer-scrpage}
\RequirePackage{iftex}

\ifPDFTeX
  % pdfLaTeX Konfiguration
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[ngerman]{babel}
\else
  % XeLaTeX oder LuaLaTeX Konfiguration
  \RequirePackage{fontspec}
  \RequirePackage{polyglossia}

  \setdefaultlanguage{german}
  \setotherlanguage{greek}
  \setotherlanguage{hebrew}

  \setmainfont{Linux Libertine O}
  \newfontfamily\greekfont{Gentium Plus}
  \newfontfamily\hebrewfont{Ezra SIL}
\fi

\RequirePackage{blindtext}
\RequirePackage{csquotes}
\RequirePackage{numprint}
% \RequirePackage[ngerman]{babel}
\RequirePackage{lmodern}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage[most]{tcolorbox}
\RequirePackage{geometry}
\RequirePackage[version=4]{mhchem}
\RequirePackage{bibleref-german}
\RequirePackage{setspace} % Für zusätzliche Zeilenabstandoptionen
\RequirePackage{import}
\RequirePackage{microtype}
\RequirePackage{xstring}
%\RequirePackage{biblatex} %Imports biblatex package
% \RequirePackage[style=authoryear,backend=bibtex]{biblatex}
% \addbibresource{../Biblio/book.bib} %Import the bibliography file
% \bibliographystyle{unsrt}
% Automatische Anpassung des Seitenlayouts
\setlength{\headheight}{30pt}
\setlength{\topmargin}{-10pt}
\setlength{\textheight}{650pt}
\setlength{\footskip}{22pt}

% Linien einfügen
\KOMAoptions{headsepline=true, footsepline=true} % Linien aktivieren
\KOMAoptions{headsepline=0.4pt, footsepline=0.4pt} % Liniendicke anpassen

% Kopf- und Fußzeilen definieren
\clearpairofpagestyles
\graphicspath{{../assets/images}}
\ihead{\includegraphics[height=1cm]{logo.png}}
\chead{\headmark}
% \ohead{\today}
\ifoot{\today}
\cfoot{Seite \thepage}
\ofoot{Autor: \makeatletter\@author\makeatother}

\geometry{
   left=25mm,
   right=20mm,
   top=25mm,
   bottom=25mm,
   textwidth=8cm,
   marginpar=3cm
   }
% Definition der Bibelzitate und Makros

\newcommand{\setincpath}[1]{%
  \makeatletter
  \def\input@path{{#1}}%
  \makeatother
}

\biblerefstyle{Lutherbibel}
\biblerefformat{lang}


