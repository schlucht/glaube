\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{mybibbeamer}[2026/09/07 Beamer für Bibelvorträge] % Optionen weiterreichen 
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}} \ProcessOptions\relax 

% Basis-Klasse 
\LoadClass[aspectratio=169]{beamer} 

% Gemeinsame Makros 
\RequirePackage{mybibcommon} 

\def\input@path{
  %{../inc/layout/}
  %{../inc/core/}
  %{../inc/modules/}
  {../inc/modules/bible/}
  %{../inc/modules/formatting/}
}

% Theme 
\usetheme{Madrid}
\setbeamercolor{structure}{fg=green!60!black}
\setbeamercolor{title}{fg=white!60!black}
\setbeamercolor{frametitle}{fg=green!60!black}

% Navigation entfernen 
\setbeamertemplate{navigation symbols}{} 

% Fusszeile 
\setbeamertemplate{footline} 
{ 
    \leavevmode 
    \hbox{ 
        \begin{beamercolorbox}
            [wd=.9\paperwidth,ht=2.25ex,dp=1ex,leftskip=1em] 
            {author in head/foot} 
            \insertshorttitle 
        \end{beamercolorbox} 
        \begin{beamercolorbox}
            [wd=.1\paperwidth,ht=2.25ex,dp=1ex,center] 
            {date in head/foot} 
            \insertframenumber 
        \end{beamercolorbox} 
    } 
} 

% Titelseite 
\setbeamertemplate{title page} { 
    \vfill 
    {\Huge\bfseries\inserttitle\par} 
    \vspace{0.5cm} 
    {\Large\insertsubtitle\par} 
    \vspace{1cm} 
    {\large\insertauthor\par} 
    \vspace{0.5cm} 
    {\insertdate\par} 
    \vfill 
}

\RequirePackage{bible_style}
\RequirePackage{bibeltext}