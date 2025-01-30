\newcommand{\bib}[1]{%
    \ifthenelse{\equal{#1}{EI}}{Einheitsübersetzung}{%
        \ifthenelse{\equal{#1}{SCHL}}{Schlachter 2000}{%
            \ifthenelse{\equal{#1}{HFA}}{Hoffnung für Alle}{%
                \ifthenelse{\equal{#1}{ELB}}{Elbfelder}{%
                    \ifthenelse{\equal{#1}{GR}}{Griechisch}{%
                        \ifthenelse{\equal{#1}{LUT}}{Luther 2017}{%
                            \ifthenelse{\equal{#1}{NUE}}{Neue ev. Übersetzung}{#1}%
                        }%
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
    \newline
    \tmpbib
	\end{itshape}        
    \endquote		
}

\newenvironment{bibelbox}[3]{%	
        \renewcommand{\tmpbib}{\textbf{\bibleverse{#2}( #3)}}
		\biblerefformat{lang}
        \begin{tcolorbox}[
            title=\tmpbib \hspace{1.5cm} (\bibtit{#1}),
            colback=black!2!white,
            colframe=black!55!black,
            width=\textwidth,
            halign=justify  
        ]
	}{%	
		\newline		
        \end{tcolorbox}	
	\endquote		
}

\newcommand{\biblezit}[2]{%
	\bib{SCHL} 
	\biblerefformat{lang}
	\bibleverse{#1}(#2)
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