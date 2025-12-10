# Generates skills entry.

Generates skills entry.

## Usage

``` r
create_skills_entry(coding_languages, ides_platforms, technical_skills)
```

## Arguments

- coding_languages:

  Character ector containing coding languages you have used.

- ides_platforms:

  Character cector containing IDEs/platforms you have used (e.g.,
  RStudio, Python, MySQL, etc)

- technical_skills:

  Character vector containing technicals skills you know (e.g.,
  supervised machine learning).

## Value

A character vector

## Examples

``` r
create_skills_entry(coding_languages = c("Python", "R", "SQL", "\\LaTeX", "Javascript", "HTML", "CSS"),
                    ides_platforms = c("PyCharm", "RStudio", "AWS", "Git", "MySQL"),
                    technical_skills = c("Data visualization (ggplot2, plotnine)",
                                         "Data cleaning (tidyverse, pandas, numpy)",
                                         "Machine learning (e.g., regularized regression, decision
                                          trees, random forests, mixture models)",
                                         "Statistics (e.g., latent variable models, factor analysis,
                                           multilevel modelling)"))
#> \fontsize{8}{8} \selectfont
#>                        \begin{tabularx}{\textwidth}{@{} p{0.25\rightcolumnwidth} p{0.2\rightcolumnwidth} p{0.72\rightcolumnwidth} @{}}
#>                        \textbf{Coding languages}
#>                        \begin{itemize}[noitemsep,topsep=0pt,partopsep=0pt,parsep=0pt,leftmargin=9pt,label=\raisebox{0.04cm}{\fontsize{3pt}{3pt}$\blacksquare$}]
#>                        \setstretch{1.25} \item Python\item R\item SQL\item \LaTeX\item Javascript\item HTML\item CSS\end{itemize}
#>                        %second column
#>                        &
#>                        \textbf{Workflows/platforms}
#>                        \begin{itemize}[noitemsep,topsep=0pt,partopsep=0pt,parsep=0pt,leftmargin=9pt,label=\raisebox{0.04cm}{\fontsize{3pt}{3pt}$\blacksquare$}]\item PyCharm\item RStudio\item AWS\item Git\item MySQL\end{itemize}
#>                       %third column
#>                       &
#>                       \textbf{Technical skills}
#>                       \begin{itemize}[noitemsep,topsep=0pt,partopsep=0pt,parsep=0pt,leftmargin=9pt,label=\raisebox{0.04cm}{\fontsize{3pt}{3pt}$\blacksquare$}]\item Data visualization (ggplot2, plotnine)\item Data cleaning (tidyverse, pandas, numpy)\item Machine learning (e.g., regularized regression, decision
#>                                           trees, random forests, mixture models)\item Statistics (e.g., latent variable models, factor analysis,
#>                                            multilevel modelling)\end{itemize}
#>                       \end{tabularx}\
```
