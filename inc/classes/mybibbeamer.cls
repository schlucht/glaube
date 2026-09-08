\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybibbeamer}[2026/09/07 MNR Beamer Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass{beamer}

\makeatletter

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

\mode<presentation>{
    \usetheme{default}
    \useinnertheme[shadow=true]{rounded}
    \useoutertheme{default}
}

\definecolor{mnrgreen}{HTML}{009640}

\setbeamercolor{background canvas}{bg=black}
\setbeamercolor{normal text}{fg=white,bg=black}
\setbeamercolor{title}{fg=mnrgreen,bg=black}
\setbeamercolor{footer}{fg=mnrgreen,bg=mnrgreen!50}
\setbeamercolor{frametitle}{fg=mnrgreen,bg=black}
\setbeamercolor{structure}{fg=mnrgreen}
\setbeamercolor{subtitle}{fg=white,bg=black}
\setbeamercolor{author}{fg=white,bg=black}
\setbeamercolor{date}{fg=white,bg=black}
\setbeamercolor{item}{fg=mnrgreen}
\setbeamercolor{mnr separator}{bg=mnrgreen}

\setbeamertemplate{blocks}[rounded][shadow=false]
\setbeamercolor{block title}{fg=mnrgreen,bg=mnrgreen!5}
\setbeamercolor{block body}{fg=white,bg=black}

\newtcolorbox{mnrblock}[1]{ 
    title=\large\vspace{2mm}{#1}\vspace{2mm},
    colback=green!5, 
    colframe=mnrgreen, 
    colbacktitle=green!50,
    coltitle=black,
    fonttitle=\bfseries,
    boxrule=0.8pt, 
    arc=2mm,
    title style={
        top=4mm, 
        bottom=4mm ,      
    }
}

\hypersetup{
    colorlinks,
    linkcolor=mnrgreen,
    citecolor=mnrgreen,
    urlcolor=mnrgreen
}

\setbeamertemplate{headline}{
    \begin{beamercolorbox}[
        wd=\paperwidth,
        ht=1cm,
        dp=.4cm,
        rightskip=0.5cm,
        leftskip=0.5cm]{footer}    
        \includegraphics[height=0.7cm]{mnr-green.png}
        \hfill
        \large\textcolor{mnrgreen}{\inserttitle}
        \hfill
    \end{beamercolorbox}
    {\color{mnrgreen}\rule{\paperwidth}{1pt}}
}

\setbeamertemplate{frametitle}{

}

\setbeamertemplate{footline}{
    {\color{mnrgreen}\rule{\paperwidth}{1pt}}
    \begin{beamercolorbox}[
        wd=\paperwidth,
        ht=1.5em,
        dp=0.3cm,
        rightskip=0.5cm]{footer}    
    \hspace*{0.5cm}    
    \textcolor{mnrgreen}{\insertpagenumber}\hfill
    \textcolor{mnrgreen}{\inserttitle}\hfill   
    \textcolor{mnrgreen}{\insertauthor}\hfill   
    
    \end{beamercolorbox}
}






