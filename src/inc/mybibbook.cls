\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybibbook}[2025/01/28 Custom Bibel Vorlage]

\LoadClass[a4paper]{scrbook}
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
% \RequirePackage{biblatex} %Imports biblatex package
% \RequirePackage[style=authoryear,backend=bibtex]{biblatex}
% \addbibresource{../Biblio/book.bib} %Import the bibliography file
% \bibliographystyle{unsrt}
% Automatische Anpassung des Seitenlayouts


% Definition der Bibelzitate und Makros
%\include{./bible_style}