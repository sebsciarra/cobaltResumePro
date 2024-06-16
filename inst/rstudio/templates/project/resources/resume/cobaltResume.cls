%% Start of file `cobaltResume.cls'.
% cobaltResumeClass File
%
% Author:
% Sebastian Sciarra <seb@sciarra.io>
% http://www.sebastiansciarra.com
%
% Notes:
% 1) This class file defines the structure and layout of the template file (cobaltResume.tex).
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%

%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cobaltResume}[2023/05/08]

%-------------------------------------------------------------------------------
%                Class options
%-------------------------------------------------------------------------------

%preliminary declarations (set defaults of already-existing classes)
\LoadClass[]{article}



%-------------------------------------------------------------------------------
%                Declarations
%-------------------------------------------------------------------------------
% suppress warnings about everypage (see https://stackoverflow.com/questions/64921954/how-to-solve-latex-package-warning-for-everypage)
\usepackage{silence}
 % \WarningsOff[everypage]% Suppress warnings related to package everypage


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
\usetikzlibrary{fit}
\RequirePackage{xstring}
\RequirePackage{amsmath}
\RequirePackage{array} %required for right alignment in tabular columns

\RequirePackage{titlesec}
\RequirePackage{amssymb}
\RequirePackage{sectsty}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem}
\RequirePackage{xparse}
\RequirePackage{needspace}
\RequirePackage{xpatch}
\RequirePackage{textcomp}
\renewcommand{\textapprox}{\raisebox{0.5ex}{\texttildelow}}
\RequirePackage{zref-totpages}
\RequirePackage{forloop}


\definecolor{bandcolor}{HTML}{002241}
\definecolor{homecolor}{HTML}{d170c7}
\definecolor{simcolor}{HTML}{C7547D}
\definecolor{techcolor}{HTML}{33c304}
\definecolor{codecolor}{HTML}{e38f01}
\definecolor{resourcescolor}{HTML}{52aafa}
\definecolor{aboutcolor}{HTML}{d4bd04}


%-------------------------------------------------------------------------------
%                Commands and Environments
%-------------------------------------------------------------------------------
\newlength{\rightboxwidth}
\setlength{\rightboxwidth}{0.28\textwidth}
\setlength{\parindent}{0pt} %no paragraph indenting

\newlength{\leftHeaderColumnWidth}
\setlength{\leftHeaderColumnWidth}{0.37\textwidth}

\newlength{\leftcolumnwidth}
\setlength{\leftcolumnwidth}{0.23\textwidth}
\newlength{\rightcolumnwidth}
\setlength{\rightcolumnwidth}{0.77\textwidth}


\newlength{\rightHeaderColumnWidth}
\setlength{\rightHeaderColumnWidth}{0.565\textwidth}

\renewcommand*{\date}[1]{\def\@date{#1}}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\firstName}[1]{\def\@firstName{#1}}
\newcommand*{\lastName}[1]{\def\@lastName{#1}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\skills}[1]{\def\@skills{#1}}
\newcommand*{\citizenship}[1]{\def\@citizenship{#1}}
\newcommand*{\shortDescription}[1]{\def\@shortDescription{#1}}

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
      \href{https://#1}{\textcolor{#3}{\fontsize{9}{9}\selectfont#4}} &
      %\vspace{.6cm}
    \fi
  \fi
}


\newcommand{\dotSubstitute}{%
  \StrSubstitute{\@skills}{,}{\space$\cdot$}
}

\newcommand{\cobaltLastName}{\textcolor{bandcolor}{\@lastName\ $\boldsymbol{\cdot}$ Resume}}


\renewcommand{\section}[1]{%
  \noindent \begin{tikzpicture}
   % Calculate the width based on current column's width
    \pgfmathsetmacro\sectionwidth{0.983\columnwidth}
    \node[font=\fontsize{10}{10}\selectfont\bfseries, inner sep=0pt, text width=\sectionwidth, align=left] (A) {\textbf{#1}};
    \draw[line width = 0.75pt, draw = bandcolor, text width = 0.335cm]([yshift=-0.25ex]A.south west) -- ([yshift=-0.25ex]A.south east) -- +(0em,0em);       %node[inner sep=0pt,outer sep=0pt,font=\tiny, yshift = 0.35ex, text = bandcolor] {$\blacksquare$} -- ++(-0.2\textwidth,0cm) -- cycle;
  \end{tikzpicture}
}




%section header only prints on same page if 4\baselineskip can be fit on same page
\xpretocmd{\section}{\needspace{4\baselineskip}}{}{}



\newcommand{\printValueIfNotEmpty}[1]{%
  \IfValueT{#1}{\if\relax\detokenize{#1}\relax\else\item #1\fi}%
}


\NewDocumentEnvironment{resumeEntry}{m m m o o o o o o}{%
  \needspace{4\baselineskip}% Check for available space
   \begin{tabular}{@{}%
    >{\raggedright\arraybackslash}p{0.9\rightcolumnwidth}%
    >{\raggedleft\arraybackslash}m{0.3175\rightcolumnwidth}%
    @{}%
    } \setstretch{1.1}
      {\fontsize{9}{9}\selectfont\bfseries #1} \newline
      {\fontsize{8}{8}\selectfont\textit{#2}}\par%
      &
      {\color{bandcolor}\fontsize{8}{8}\bfseries #3} \\\\

  \end{tabular}


     \vspace*{-0.35cm}


   \IfValueT{#4}{\if\relax\detokenize{#4}\relax\else
  \begin{itemize}[noitemsep,topsep=0pt,partopsep=0pt,parsep=0pt, leftmargin = 9pt, rightmargin = 9pt,
  label=\raisebox{0.04cm}{\fontsize{3pt}{3pt}$\blacksquare$}]
  \setstretch{1.25}
  \fontsize{8}{8}\selectfont
    \item #4
    \printValueIfNotEmpty{#5}
    \printValueIfNotEmpty{#6}
    \printValueIfNotEmpty{#7}
    \printValueIfNotEmpty{#8}
    \printValueIfNotEmpty{#9}
  \end{itemize}
  \fi
}
      %only add vertical space if not at end of page
  \ifdim\pagetotal=\pagegoal
  \else
    \vspace*{0.25cm}
  \fi
  }%
{}


%placeholder environment that makes later text searching easier
\NewDocumentEnvironment{educationEntry}{%
}{}



%-------------------------------------------------------------------------------
%                Page layout
%-------------------------------------------------------------------------------
%%repeat left band on every page with skills & socials
%%https://tex.stackexchange.com/questions/270195/how-to-repeat-box-every-page
\backgroundsetup{
    scale=1,
    color=black,
    opacity=1,
    angle=0,
    position=current page.east,
    vshift= 12.9cm, % Correct for the top margin
    contents={
     \ifnum\value{page}=1
        \begin{tikzpicture}[remember picture, overlay]
            \fill [bandcolor] (-5.21,0) rectangle ++(\rightboxwidth,-0.104\textheight); % Adjust dimensions as needed
              \node[font=\ttfamily\fontsize{9pt}{9pt}\bfseries\selectfont, text width=\rightboxwidth, align = left]
              (socials)
               at ([xshift = 7.7cm, yshift=\topmargin + 0.5cm ]current page.north)
               {
               \setlength{\tabcolsep}{3pt}
               \renewcommand{\arraystretch}{1.5}
              \begin{tabular}%
              {>{\raggedleft\arraybackslash}p{0.05\rightboxwidth}%
               >{\raggedright\arraybackslash}p{0.95\rightboxwidth}%
              }
              \printIcon{\@email}{\@email}{simcolor}{\faEnvelope} \printSocial{\@email}{\@email}{simcolor} \\
              \printIcon{\@personalWebsite}{\@personalWebsite}{aboutcolor}{\faHome}   \printSocial{\@personalWebsite}{\@personalWebsite}{aboutcolor}  \\
              \printIcon{\@githubLink}{\@githubName}{techcolor}{\faGithubSquare}   \printSocial{\@githubLink}{\@githubName}{techcolor} \\
              \printIcon{\@linkedinLink}{\@linkedinName}{resourcescolor}{\faLinkedin}  \printSocial{\@linkedinLink}{\@linkedinName}{resourcescolor}\\
            \end{tabular}
              };
        \end{tikzpicture}
        \fi
      \ifnum\value{page}>1
        \begin{tikzpicture}[remember picture, overlay]
          \fill [bandcolor] (-20.075,-20.5) rectangle ++(\rightboxwidth,-0.104\textheight); % Adjust dimensions as needed
              \node[font=\ttfamily\fontsize{9pt}{9pt}\bfseries\selectfont, text width=\rightboxwidth, align = left]
              (socials)
               at ([xshift =-7.1cm, yshift=5.1cm]current page.south)
               {
               \setlength{\tabcolsep}{3pt}
               \renewcommand{\arraystretch}{1.5}
              \begin{tabular}%
              {>{\raggedleft\arraybackslash}p{0.05\rightboxwidth}%
               >{\raggedright\arraybackslash}p{0.95\rightboxwidth}%
              }
              \printIcon{\@email}{\@email}{simcolor}{\faEnvelope} \printSocial{\@email}{\@email}{simcolor} \\
              \printIcon{\@personalWebsite}{\@personalWebsite}{aboutcolor}{\faHome}   \printSocial{\@personalWebsite}{\@personalWebsite}{aboutcolor}  \\
              \printIcon{\@githubLink}{\@githubName}{techcolor}{\faGithubSquare}   \printSocial{\@githubLink}{\@githubName}{techcolor} \\
              \printIcon{\@linkedinLink}{\@linkedinName}{resourcescolor}{\faLinkedin}  \printSocial{\@linkedinLink}{\@linkedinName}{resourcescolor}\\
            \end{tabular}
              };
        \end{tikzpicture}
        \fi
      \begin{tikzpicture}[remember picture, overlay]
         \node[font=\fontsize{8pt}{8pt}\color{bandcolor}\selectfont, text width=\leftcolumnwidth, align = left]
        (date)
          at ([xshift = 2.75cm, yshift=-12.65cm]current page.west)
          {{\@date} \\
          {Citizenship: \@citizenship{}}};
       \end{tikzpicture}
    }
}
        %\node[font=\fontsize{10.5pt}{10.5pt}\selectfont, text width=\leftcolumnwidth, align = right]
        %  (skills)
        %   at ([xshift = 2.75cm, yshift=8.28cm]current page.west) %8.08
        %  {\parbox[t][0pt][t]{\linewidth}
        %  {\raggedleft \setstretch{2} \fontsize{14pt}{14pt}\selectfont\underline{Skills} \\ \fontsize{10.5pt}{10.5pt}\selectfont{\dotSubstitute}}};
        %\node[font=\ttfamily\fontsize{12pt}{12pt}\bfseries\selectfont, text width=\leftcolumnwidth, align = right]
        %  (socials)
        %   at ([xshift = 2.75cm, yshift=-6cm]current page.west)
        %   {
        %   \setlength{\tabcolsep}{0pt}
        %   \renewcommand{\arraystretch}{2}
        %  \begin{tabular}%
        %  {>{\raggedleft\arraybackslash}p{0.85\leftcolumnwidth}%
        %   >{\raggedleft\arraybackslash}p{0.15\leftcolumnwidth}%
        %  }
        %    \ifnum\value{page}>1  \printSocial{\@email}{\@email}{simcolor}   \printIcon{\@email}{\@email}{simcolor}{\faEnvelope} \\ \fi
        %    \printSocial{\@personalWebsite}{\@personalWebsite}{aboutcolor}  \printIcon{\@personalWebsite}{\@personalWebsite}{aboutcolor}{\faHome} \\
        %    \printSocial{\@githubLink}{\@githubName}{techcolor}  \printIcon{\@githubLink}{\@githubName}{techcolor}{\faGithubSquare} \\
        %    \printSocial{\@linkedinLink}{\@linkedinName}{resourcescolor}  \printIcon{\@linkedinLink}{\@linkedinName}{resourcescolor}{\faLinkedin} \\
        %  \end{tabular}
        %    };





\usepackage{longfbox}
\newcommand\makesquare[1]{%
  \setlength\unitlength{1pt}%
  \begin{picture}(0,0)% make it occupy no space
    \color{bandcolor}%
    \put(0,#1){$\blacksquare$}%
  \end{picture}%
}



%% Define page style
\fancypagestyle{cobaltHeader}{%
  \fancyhf{}% Clear header/footer
  \renewcommand{\headrulewidth}{0pt}% Remove header rule
  \renewcommand{\footrulewidth}{0pt}% Remove footer rule
   \fancyfoot[R]{\thepage}% Page number in bottom right
  \fancyfoot[C]{\cobaltLastName}%
  \chead{% Centered header
   \setlength{\tabcolsep}{0pt}
    %\begin{tabular}{@{} p{\leftHeaderColumnWidth} p{\rightHeaderColumnWidth} @{}}
      %\vspace*{1.25cm}
      \setstretch{1.5}%

      % Content for the left column
       \raggedright
       \setstretch{2}%
       \vspace*{1.35cm}
       \textcolor{bandcolor}{\fontsize{25}{25}\selectfont\bfseries{\@firstName\ \@lastName}} \\ \vspace*{0.15cm}
       \textcolor{bandcolor}{\fontsize{10}{10}\selectfont\@position}\\ \vspace*{0.3cm}
       %\ttfamily\fontsize{11pt}{11pt}\selectfont\textcolor{simcolor}{\href{\@email}{\@email\ \faEnvelope \hspace*{0.01cm}}}
    %\end{tabular}
  }%
}



\fancypagestyle{cobaltFooter}{%
  %\setlength{\headheight}{0cm}
  \fancyhf{}% Clear header/footer
  \renewcommand{\headrulewidth}{0pt}% Remove header rule
  \renewcommand{\footrulewidth}{0pt}% Remove footer rule
  \fancyfoot[R]{\thepage}% Page number in bottom right
  \fancyfoot[C]{\cobaltLastName}%
}




%mandatory components that all LaTeX classes must specify
\renewcommand{\normalsize}{\fontsize{8}{8}\selectfont}
\setlength{\textwidth}{17.5cm}
\setlength{\textheight}{24cm}
\setcounter{secnumdepth}{0}
\usepackage[]{footnote}  %removes indentation in footnotes


\geometry{
  left=1cm,
  right=1cm,
  top=1cm,
  bottom=1cm,
  includehead = false,
  includefoot = true
}









%default color in document
\color{bandcolor}
