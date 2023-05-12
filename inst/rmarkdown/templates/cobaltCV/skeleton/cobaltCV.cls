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



%-------------------------------------------------------------------------------
%                Declarations
%-------------------------------------------------------------------------------
\RequirePackage{multicol}
\RequirePackage{xcolor}
\RequirePackage{geometry}
\RequirePackage[breaklinks=true, hidelinks]{hyperref}
\RequirePackage{paracol}
\RequirePackage{tikz}
\RequirePackage[color=white,opacity=1,angle=0,scale=1]{background}
\RequirePackage{fontawesome5}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{lipsum}
\RequirePackage{calc}


\definecolor{bandcolor}{HTML}{002241}
\definecolor{homecolor}{HTML}{d170c7}
\definecolor{simcolor}{HTML}{C7547D}
\definecolor{techcolor}{HTML}{33c304}
\definecolor{codecolor}{HTML}{e38f01}
\definecolor{resourcescolor}{HTML}{52aafa}
\definecolor{aboutcolor}{HTML}{d4bd04}


\newlength{\leftcolumnwidth}
\setlength{\leftcolumnwidth}{0.35\textwidth}


\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\name}[1]{\def\@name{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\skills}[1]{\def\@skills{#1}}


%Personal website variables
\def\personalWebsite#1{\gdef \@personalWebsite{#1} \@personalWebsitetrue}
\global\let\@personalWebsite\@empty
\newif\if@personalWebsite
\@personalWebsitefalse


%Github variables
\def\githubName#1{\gdef \@githubName{#1} \@githubNametrue}
\global\let\@githubName\@empty
\newif\if@githubName
\@githubNamefalse

\def\githubLink#1{\gdef \@githubLink{#1} \@githubLinktrue}
\global\let\@githubLink\@empty
\newif\if@githubLink
\@githubLinkfalse

%LinkedIn variables
\def\linkedinName#1{\gdef \@linkedinName{#1} \@linkedinNametrue}
\global\let\@linkedinName\@empty
\newif\if@linkedinName
\@linkedinNamefalse

\def\linkedinLink#1{\gdef \@linkedinLink{#1} \@linkedinLinktrue}
\global\let\@linkedinLink\@empty
\newif\if@linkedinLink
\@linkedinLinkfalse


\newcommand{\printSocial}[4]{
  \ifx#1\@empty\else
    \ifx#2\@empty\else
      \href{https://#1}{\textcolor{#3}{#4\ #2}}  \\
      \vspace{.6cm}
    \fi
  \fi
}

\usetikzlibrary{fit}
\usepackage{xstring}

\usepackage{graphicx}
\usepackage{etoolbox}


\usepackage{amsmath}
\newcommand{\dotSubstitute}{%
  \StrSubstitute{\@skills}{,}{\space$\cdot$}
}



%%repeat left band on every page with skills & socials
%%https://tex.stackexchange.com/questions/270195/how-to-repeat-box-every-page
\backgroundsetup{
    contents={
      \begin{tikzpicture}[remember picture, overlay]
        \fill [bandcolor] (current page.north west) rectangle ++(\leftcolumnwidth+0.25cm,-2\textheight);
        \node[font=\ttfamily\fontsize{11.5pt}{11.5pt}\selectfont, text width=\leftcolumnwidth, align = right]
          (skills)
           at ([xshift = 2.75cm, yshift=7.64cm]current page.west)
          {\parbox[t][0pt][t]{\linewidth}
          {\raggedleft \ttfamily\fontsize{14pt}{14pt}\selectfont\bfseries\underline{Skills} \\ \ttfamily\fontsize{10.5pt}{10.5pt}\selectfont{\dotSubstitute}}};
        \node[font=\ttfamily\fontsize{11.5pt}{11.5pt}\selectfont, text width=\leftcolumnwidth, align = right]
          (socials)
           at ([xshift = 2.75cm, yshift=-6cm]current page.west)
           {
            \printSocial{\@personalWebsite}{\@personalWebsite}{homecolor}{\faHome}
            \printSocial{\@githubLink}{\@githubName}{techcolor}{\faGithubSquare}
            \printSocial{\@linkedinLink}{\@linkedinName}{resourcescolor}{\faLinkedin}};
      \end{tikzpicture}},
    opacity=1,
    scale=1,
    angle=0,
    position={0,0},
    vshift=0pt,
}



%% Define page style
\fancypagestyle{cobaltHeader}{%
  \fancyhf{}% Clear header/footer
  \renewcommand{\headrulewidth}{0pt}% Remove header rule
  \renewcommand{\footrulewidth}{0pt}% Remove footer rule
  \chead{% Centered header
     \raggedleft
       \setstretch{2}%
       \textcolor{bandcolor}{\fontfamily{phv}\fontsize{25}{25}\selectfont\bfseries{\@name}} \\
       \textcolor{bandcolor}{\fontfamily{qhv}\fontsize{10}{10}\selectfont\@position}\\
       \ttfamily\fontsize{11pt}{11pt}\selectfont\textcolor{simcolor}{\href{\@email}{\faEnvelope\ \@email}}
  }%
  \setlength{\headheight}{3cm}
}


%mandatory components that all LaTeX classes must specify
\renewcommand{\normalsize}{\fontsize{9}{10}\selectfont}
\setlength{\textwidth}{17.5cm}
\setlength{\textheight}{24cm}
\setcounter{secnumdepth}{0}



\geometry{
  left=\leftcolumnwidth + 1cm,
  right=1cm,
  top=2cm,
  bottom=2.5cm,
  includefoot = true,
  footskip = 3.5cm
}
\columnratio{0.25}


\usepackage{titlesec}
\usepackage{amssymb}
\usepackage{sectsty}
\usepackage[normalem]{ulem}

%\sectionfont{\raggedright\bfseries\sectionrule{0pt}{0pt}{-4pt}{1pt}}


\renewcommand{\section}[1]{%}
\vspace{1cm}
  \noindent \begin{tikzpicture}
    \node[font=\fontfamily{phv}\fontsize{12}{12}\selectfont\bfseries, inner sep=0pt, text width=\textwidth, align=left] (A) {\textbf{#1}};
    \draw[line width = 0.75pt, draw = bandcolor]([yshift=-0.25ex]A.south west) -- ([yshift=-0.25ex]A.south east) -- ++(0em,0em) node[inner sep=0pt,outer sep=0pt,font=\tiny, yshift = 0.28ex, text = bandcolor] {$\blacksquare$} -- ++(-\textwidth,0) -- cycle;
  \end{tikzpicture}\par%
}


%default color in document
\color{bandcolor}
