
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cobaltCV}[2023/05/08]


%preliminary declarations (set defaults of already-existing classes)
\newcommand{\headlinecolor}{\normalcolor}
\RequirePackage{xcolor}
\definecolor{slcolor}{HTML}{882B21}

\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{green}{\renewcommand{\headlinecolor}{\color{green}}}
\DeclareOption{red}{\renewcommand{\headlinecolor}{\color{slcolor}}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[twocolumn]{article}



%mandatory components that all LaTeX classes must specify
\renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}
\setlength{\textwidth}{17.5cm}
\setlength{\textheight}{22cm}
\setcounter{secnumdepth}{0}
