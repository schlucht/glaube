\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybibbook}[2026/06/08 Custom Bibel Vorlage – Book]

% ------------------------------------------------
% Optionen weiterreichen
% ------------------------------------------------

\DeclareOption{14pt}{\PassOptionsToClass{fontsize=14pt}{scrbook}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax

% ------------------------------------------------
% Basis-Klasse laden
% ------------------------------------------------

\LoadClass[a4paper]{scrbook}

% ------------------------------------------------
% Pfade definieren
% ------------------------------------------------

\makeatletter
\def\input@path{{../layout/}{../core/}{../modules/}}
\makeatother

% ------------------------------------------------
% KOMA Optionen (für Buch sinnvoll)
% ------------------------------------------------

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