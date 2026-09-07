\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybibbeamer}[2026/09/07 MNR Beamer Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}

\makeatletter
\def\input@path{%
    {inc/modules/}%
    {inc/modules/bible/}%
    {inc/modules/formatting/}%
    {../inc/modules/}%
    {../inc/modules/bible/}%
    {../inc/modules/formatting/}%
    {../../inc/modules/}%
    {../../inc/modules/bible/}%
    {../../inc/modules/formatting/}%
    {../../../inc/modules/}%
    {../../../inc/modules/bible/}%
    {../../../inc/modules/formatting/}%
}
\makeatother

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[ngerman]{babel}
\RequirePackage{lmodern}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage{xstring}
\RequirePackage{varwidth}
\RequirePackage[normalem]{ulem}
\RequirePackage{paracol}
\RequirePackage[most]{tcolorbox}
\RequirePackage{bibleref-german}

\RequirePackage{analyse}
\RequirePackage{markierungen}
\RequirePackage{bibeltext}
\RequirePackage{bible_style}

\mode<presentation>{
    \usetheme{default}
    \useinnertheme{rounded}
    \useoutertheme{default}
}

\definecolor{mnrgreen}{HTML}{009640}

\setbeamercolor{background canvas}{bg=black}
\setbeamercolor{normal text}{fg=white,bg=black}
\setbeamercolor{title}{fg=mnrgreen,bg=black}
\setbeamercolor{frametitle}{fg=mnrgreen,bg=black}
\setbeamercolor{structure}{fg=mnrgreen}
\setbeamercolor{subtitle}{fg=white,bg=black}
\setbeamercolor{author}{fg=white,bg=black}
\setbeamercolor{date}{fg=white,bg=black}
\setbeamercolor{item}{fg=mnrgreen}
\setbeamercolor{mnr separator}{bg=mnrgreen}

\hypersetup{
    colorlinks,
    linkcolor=mnrgreen,
    citecolor=mnrgreen,
    urlcolor=mnrgreen
}

\setbeamertemplate{navigation symbols}{}

\newcommand{\mnr}[1]{\textcolor{mnrgreen}{#1}}

\makeatletter
\newcommand{\mnr@currentframetitle}{%
    \ifx\beamer@frametitle\@empty
        \insertshorttitle
    \else
        \beamer@frametitle
    \fi
}
\makeatother

\setbeamertemplate{headline}{%
    \leavevmode
    \begin{beamercolorbox}[wd=\paperwidth,ht=0.95cm,dp=0.15cm]{background canvas}
        \hbox to \paperwidth{%
            \hspace*{0.30cm}%
            \raisebox{-0.05cm}{\includegraphics[height=0.70cm,width=2.2cm,keepaspectratio]{mnr.png}}%
            \hspace*{0.35cm}{\color{mnrgreen}\rule{0.8pt}{0.62cm}}%
            \hspace*{0.35cm}{\color{mnrgreen}\small\bfseries\mnr@currentframetitle}%
            \hfill
            {\color{white}\small\insertsectionhead}%
            \hspace*{0.30cm}%
        }%
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd=\paperwidth,ht=0.4pt,dp=0pt]{mnr separator}\end{beamercolorbox}%
}

\setbeamertemplate{frametitle}{%
    \vspace*{-0.10cm}
    \begin{beamercolorbox}[wd=\paperwidth,leftskip=0.30cm,rightskip=0.30cm,sep=0.12cm]{frametitle}
        \usebeamerfont{frametitle}\insertframetitle
    \end{beamercolorbox}
}

\setbeamertemplate{title page}{%
    \vbox{}
    \vfill
    \begin{center}
        {\usebeamerfont{title}\color{mnrgreen}\inserttitle\par}
        \vspace{0.5em}
        {\usebeamerfont{subtitle}\color{white}\insertsubtitle\par}
        \vspace{2em}
        {\usebeamerfont{author}\color{white}\insertauthor\par}
        \vspace{0.5em}
        {\usebeamerfont{date}\color{white}\insertdate\par}
    \end{center}
    \vfill
}

\setbeamertemplate{footline}{%
    \leavevmode
    \begin{beamercolorbox}[wd=\paperwidth,ht=0.4pt,dp=0pt]{mnr separator}\end{beamercolorbox}%
    \begin{beamercolorbox}[wd=\paperwidth,ht=0.42cm,dp=0.15cm]{background canvas}
        \hbox to \paperwidth{%
            \hspace*{0.30cm}%
            {\color{white}\small\insertshortauthor}%
            \hfill
            {\color{mnrgreen}\small\insertshortdate}%
            \hfill
            {\color{white}\small\insertframenumber/\inserttotalframenumber}%
            \hspace*{0.30cm}%
        }%
    \end{beamercolorbox}
}