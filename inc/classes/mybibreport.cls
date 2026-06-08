\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybibreport}[2026/06/08 Custom Bibel Vorlage – Report]

% ------------------------------------------------
% Optionen weiterreichen
% ------------------------------------------------

\DeclareOption{14pt}{\PassOptionsToClass{fontsize=14pt}{scrreprt}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions\relax

% ------------------------------------------------ 
% Pfade definieren
% ------------------------------------------------

% \makeatletter
% \def\input@path{
%   {../../inc/layout/}
%   {../../inc/core/}
%   {../../inc/modules/}
%   {../../inc/modules/bible/}
%   {../../inc/modules/formatting/}
% }
% \makeatother

% ------------------------------------------------
% Basis-Klasse laden
% ------------------------------------------------

\LoadClass[a4paper]{scrreprt}

% ------------------------------------------------
% Pfade definieren
% ------------------------------------------------

\makeatletter
\def\input@path{{../layout/}{../core/}{../modules/}}
\makeatother

\KOMAoptions{
  parskip=half
}

% ------------------------------------------------
% Layout laden (Header, Geometry, etc.)
% ------------------------------------------------

\RequirePackage{mybiblayout}

% ------------------------------------------------
% Core laden (Fonts, Bibel, etc.)
% ------------------------------------------------

\RequirePackage{mybibcommon}

% ------------------------------------------------
% Module
% -----------------------------------------------
\RequirePackage{markierungen}
\RequirePackage{bibeltext}
\RequirePackage{bible_style}
