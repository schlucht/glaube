\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybibreport}[2025/01/28 Custom Bibel Vorlage]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}
\ProcessOptions\relax

\LoadClass[a4paper]{scrreprt}

\makeatletter
\edef\mybibreport@common{\@currpath mybibcommon}
\expandafter\RequirePackage\expandafter{\mybibreport@common}
\makeatother
