\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybib}[2025/01/28 Custom Bibel Vorlage]

% Weitergabe aller Optionen an die geladene Klasse
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

% Standardklasse mit übergebenen Optionen laden
\LoadClass{scrartcl}

\makeatletter
\edef\mybib@common{\@currpath mybibcommon}
\expandafter\RequirePackage\expandafter{\mybib@common}
\makeatother


