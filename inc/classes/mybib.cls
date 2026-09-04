\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybib}[2026/06/08 Custom Bibel Vorlage – Artikel]

% ------------------------------------------------
% Optionen weiterreichen
% ------------------------------------------------

\DeclareOption{14pt}{\PassOptionsToClass{fontsize=14pt}{scrartcl}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

% ------------------------------------------------ 
% Pfade definieren
% ------------------------------------------------

\makeatletter
\def\input@path{
  {../inc/layout/}
  {../inc/core/}
  {../inc/modules/}
  {../inc/modules/bible/}
  {../inc/modules/formatting/}
}
\makeatother

% ------------------------------------------------
% Basis-Klasse laden
% ------------------------------------------------

\LoadClass[a4paper]{scrartcl}



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

