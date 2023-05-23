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
\ProvidesClass{cobaltCoverLetter}[2023/05/08]

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
\RequirePackage[]{geometry}
\RequirePackage[breaklinks=true, hidelinks]{hyperref}
\RequirePackage{paracol}
\footnotelayout{m} %necessary so that paracol does not cause footnotes to print in the text
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


\renewcommand*{\date}[1]{\def\@date{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\firstName}[1]{\def\@firstName{#1}}
\newcommand*{\lastName}[1]{\def\@lastName{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\skills}[1]{\def\@skills{#1}}
\newcommand*{\citizenship}[1]{\def\@citizenship{#1}}

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

%header variables (i.e., recruiter name, company, address, etc.)
\newcommand*{\recruiterName}[1]{\def\@recruiterName{#1}}
\newcommand*{\organization}[1]{\def\@organization{#1}}
\newcommand*{\organizationStreet}[1]{\def\@organizationStreet{#1}}
\newcommand*{\organizationCityPostal}[1]{\def\@organizationCityPostal{#1}}



\newcommand{\printSocial}[3]{
  \ifx#1\@empty\else
    \ifx#2\@empty\else
      \href{https://#1}{\textcolor{#3}{#2}}
     % \vspace{.6cm}
    \fi
  \fi
}

\newcommand{\printIcon}[4]{
  \ifx#1\@empty\else
    \ifx#2\@empty\else
      \href{https://#1}{\textcolor{#3}{\fontsize{14}{14}\selectfont#4}}
      %\vspace{.6cm}
    \fi
  \fi
}

\usetikzlibrary{fit}
\usepackage{xstring}


\usepackage{amsmath}

\newcommand{\dotSubstitute}{%
  \StrSubstitute{\@skills}{,}{\space$\cdot$}
}

\usepackage{array} %required for right alignment in tabular columns

%%repeat left band on every page with skills & socials
%%https://tex.stackexchange.com/questions/270195/how-to-repeat-box-every-page
\backgroundsetup{
    contents={
      \begin{tikzpicture}[remember picture, overlay]
        \fill [bandcolor] (current page.north west) rectangle ++(\leftcolumnwidth+0.25cm,-2\textheight);
        \node[font=\fontfamily{phv}\fontsize{10pt}{10pt}\selectfont, text width=\leftcolumnwidth, align = right]
          (name)
           at ([xshift = 2.75cm, yshift=6.2cm]current page.west) %
          %header
          {{\fontsize{25pt}{25pt}\selectfont\bfseries
          \rule{1cm}{1pt} \\ \vspace*{0.35cm}
          \@firstName \\ \vspace*{0.4cm}
          \@lastName} \\ \vspace*{0.4cm}
          \@position \\ \vspace*{0.65cm}
          \rule{1cm}{1pt} \\ \vspace*{1.30cm}
          %contact info
          \setlength{\tabcolsep}{0pt}
           \renewcommand{\arraystretch}{2}
           \ttfamily\fontsize{12pt}{12pt}\bfseries\selectfont
          \begin{tabular}%
          {>{\raggedleft\arraybackslash}p{0.85\leftcolumnwidth}%
           >{\raggedleft\arraybackslash}p{0.15\leftcolumnwidth}%
          }
            \printSocial{\@email}{\@email}{simcolor} &  \printIcon{\@email}{\@email}{simcolor}{\faEnvelope} \\
            \printSocial{\@personalWebsite}{\@personalWebsite}{aboutcolor} & \printIcon{\@personalWebsite}{\@personalWebsite}{aboutcolor}{\faHome} \\
            \printSocial{\@githubLink}{\@githubName}{techcolor} & \printIcon{\@githubLink}{\@githubName}{techcolor}{\faGithubSquare} \\
            \printSocial{\@linkedinLink}{\@linkedinName}{resourcescolor} & \printIcon{\@linkedinLink}{\@linkedinName}{resourcescolor}{\faLinkedin} \\
          \end{tabular}};
           \node[font=\fontsize{9pt}{9pt}\selectfont, text width=\leftcolumnwidth, align = right]
          (date)
           at ([xshift = 2.75cm, yshift=-12.65cm]current page.west)
           {Citizenship: \@citizenship};
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
  %\fancyheadoffset[R]{-0.5\textwidth}
  \renewcommand{\headrulewidth}{0pt}% Remove header rule
  \renewcommand{\footrulewidth}{0pt}% Remove footer rule
   \fancyfoot[R]{\thepage}% Page number in bottom right
\lhead{% Left header
  \setstretch{1.5}
  \fontsize{9pt}{9pt}\selectfont
  %{\fontsize{25pt}{25pt}\selectfont\textbf{Cover letter}} \\
  \rule{5cm}{1pt} \\
   \@date \\ [0.5cm]
  {\bfseries \@recruiterName} \\
   \@organization \\
  \@organizationStreet \\
   \@organizationCityPostal \\
  }%
}



%mandatory components that all LaTeX classes must specify
\renewcommand{\normalsize}{\fontsize{8}{8}\selectfont}
\setlength{\textwidth}{17.5cm}
\setlength{\textheight}{24cm}
\setcounter{secnumdepth}{0}
\usepackage[]{footnote}  %removes indentation in footnotes


\geometry{
  left=\leftcolumnwidth + 1.2cm,
  right=1cm,
  top=3.11cm,
  bottom=1cm,
  includehead = true,
  includefoot = true
}




%default color in document
\color{bandcolor}
