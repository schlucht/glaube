\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybiblatex}[2025/01/28 Custom Bibel Vorlage]

\LoadClass[a4paper,12pt]{scrartcl}

% Paket-Imports und Einstellungen
\RequirePackage[automark]{scrlayer-scrpage}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{blindtext}
\RequirePackage{csquotes}
\RequirePackage[ngerman]{babel}
\RequirePackage{lmodern}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage[most]{tcolorbox}
\RequirePackage{geometry}
\RequirePackage[version=4]{mhchem}
\RequirePackage{bibleref-german}
\RequirePackage{setspace}
\RequirePackage{bible_style}
%\RequirePackage{biblatex} %Imports biblatex package
% \RequirePackage[style=authoryear,backend=bibtex]{biblatex}
% \addbibresource{../Biblio/book.bib} %Import the bibliography file
% \bibliographystyle{unsrt}
% Automatische Anpassung des Seitenlayouts
\setlength{\headheight}{22pt}
\setlength{\topmargin}{-10pt}
\setlength{\textheight}{650pt}
\setlength{\footskip}{22pt}

% Linien einfügen
\KOMAoptions{headsepline=true, footsepline=true} % Linien aktivieren
\KOMAoptions{headsepline=0.4pt, footsepline=0.4pt} % Liniendicke anpassen

% Kopf- und Fußzeilen definieren
\clearpairofpagestyles
\ihead{\includegraphics[height=1cm]{../assets/images/logo.png}}
\chead{\headmark}
% \ohead{\today}
\ifoot{\today}
\cfoot{Seite \thepage}
\ofoot{Autor: \makeatletter\@author\makeatother}

% Definition der Bibelzitate und Makros
\include{./bible_style}

