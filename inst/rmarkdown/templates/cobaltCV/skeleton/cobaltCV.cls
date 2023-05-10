%% Start of file `cobaltCV.cls'.
% cobaltCV Class File
%
% Author:
% Sebastian Sciarra <seb@sciarra.io>
% http://www.sebastiansciarra.com
%
% Notes:
% 1) This class file defines the structure and layout of the template file (cobaltCV.tex, cobalt_resume.tex).
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%

%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cobaltCV}[2023/05/08]

%-------------------------------------------------------------------------------
%                Class options
%-------------------------------------------------------------------------------

%preliminary declarations (set defaults of already-existing classes)
\LoadClass[]{article}
\RequirePackage{xcolor}



%-------------------------------------------------------------------------------
%                Declarations
%-------------------------------------------------------------------------------
\RequirePackage{multicol}
\RequirePackage{xcolor}

\RequirePackage{geometry}
\geometry{
  left=0.5cm,
  right=2.5cm,
  top=2.5cm,
  bottom=1cm,
}

\RequirePackage{hyperref}
\RequirePackage{tcolorbox} %needed for coloring background of left column of page
\RequirePackage{paracol}
\RequirePackage{background}


\definecolor{bandcolor}{HTML}{002241}
\newlength{\leftcolumnwidth}
\newlength{\rightcolumnwidth}
\setlength{\leftcolumnwidth}{0.4\textwidth}
\setlength{\rightcolumnwidth}{0.6\textwidth}

\backgroundsetup{
    contents={\begin{tikzpicture}[remember picture, overlay]
        \fill [bandcolor] (current page.north west) rectangle ++(0.3\textwidth,-2\textheight);
    \end{tikzpicture}},
    opacity=1,
    scale=1,
    angle=0,
    position={0,0},
    vshift=0pt,
}










%mandatory components that all LaTeX classes must specify
\renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}
\setlength{\textwidth}{17.5cm}
\setlength{\textheight}{22cm}
\setcounter{secnumdepth}{0}
