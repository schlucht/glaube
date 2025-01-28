\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybiblatex}[2025/01/28 Custom Bibel Vorlage]

\LoadClass[a4paper,12pt]{scrartcl}

% Paket-Imports und Einstellungen
\RequirePackage[automark]{scrlayer-scrpage}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{blindtext}
\RequirePackage[ngerman]{babel}
\RequirePackage{lmodern}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage[most]{tcolorbox}
\RequirePackage{geometry}
\RequirePackage[version=4]{mhchem}
\RequirePackage{bibleref-german}
\RequirePackage{setspace}

% Automatische Anpassung des Seitenlayouts
\setlength{\headheight}{22pt}
\setlength{\topmargin}{-10pt}
\setlength{\textheight}{650pt}
\setlength{\footskip}{80pt}

% Kopf- und Fußzeilen definieren
\clearpairofpagestyles
\ihead{Linker Kopftext}
\chead{Mittiger Kopftext}
\ohead{Rechter Kopftext}
\ifoot{Linker Fußtext}
\cfoot{Seite \thepage}
\ofoot{Rechter Fußtext}

% Definition der Bibelzitate und Makros
\newcommand{\bib}[1]{%
\ifthenelse{\equal{#1}{EI}}{Einheitsübersetzung}{%
    \ifthenelse{\equal{#1}{SchL}}{Schlachter 2000}{%
        \ifthenelse{\equal{#1}{HFA}}{Hoffnung für Alle}{%
            \ifthenelse{\equal{#1}{ELB}}{Elbfelder}{%
                \ifthenelse{\equal{#1}{Gr}}{Griechisch}{%
                    \ifthenelse{\equal{#1}{LuN}}{Luther 2017}{#1}{%
                        \ifthenelse{\equal{#1}{NUE}}{Neue ev. Übersetzung}{#1}%
                   }%%
                }%
            }%
        }%
    }%
}%
}

% Makros für Bibelzitate
\newcommand{\bibtit}[1]{\large\bib{#1}}
\newcommand{\tmpbib}{Hello}

\newenvironment{bibeltext}[3]{%
    \quote \begin{itshape}
	(\bib{#1})\newline	
		\biblerefformat{lang}
		\renewcommand{\tmpbib}{\textbf{\bibleverse{#2}(#3)}}		 
	}{%
	\end{itshape}        
    \endquote		
}

\newenvironment{bibelbox}[3]{%	
        \renewcommand{\tmpbib}{\textbf{\bibleverse{#2}( #3)}}
		\biblerefformat{lang}
        \begin{tcolorbox}[
        title=\tmpbib \hspace{1.5cm} (\bibtit{#1}),
        colback=black!2!white,
        colframe=black!55!black]        
	}{%	
		\newline		
        \end{tcolorbox}	
	\endquote		
}

% Diverse Fontstyles
\newcommand{\aus}[1]{\textcolor{red}{ #1 }} %%Markiert den Text der nicht in den Druck soll
%\renewcommand{\aus}[1]{} %%Kommentar entfernen und der markierte Text wird ausgeblendet
\newcommand{\herr}{HERR}
\newcommand{\lied}[1]{\colorbox{yellow}{\textcolor{blue}{Lied: #1}}}
\newcommand{\beten}{\red{Ich möchte noch beten!}}
\newcommand{\green}[1]{\colorbox{green}{\textcolor{black}{#1}}}
\newcommand{\red}[1]{\colorbox{red}{\textcolor{white}{#1}}}
\newcommand{\hh}[1]{\textsuperscript{#1}}
