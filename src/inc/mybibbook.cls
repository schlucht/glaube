\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mybibbook}[2025/01/28 Custom Bibel Vorlage]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax

\LoadClass[a4paper]{scrbook}

\makeatletter
\edef\mybibbook@common{\@currpath mybibcommon}
\expandafter\RequirePackage\expandafter{\mybibbook@common}
\makeatother