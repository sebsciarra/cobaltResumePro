#'  Generates skills entry.
#'
#' @param coding_languages Character ector containing coding languages you have used.
#' @param ides_platforms Character cector containing IDEs/platforms you have used (e.g., RStudio, Python, MySQL, etc)
#' @param technical_skills Character vector containing technicals skills you know (e.g., supervised machine learning).
#' @examples
#' create_skills_entry(coding_languages = c("Python", "R", "SQL", "\\LaTeX", "Javascript", "HTML", "CSS"),
#'                     ides_platforms = c("PyCharm", "RStudio", "AWS", "Git", "MySQL"),
#'                     technical_skills = c("Data visualization (ggplot2, plotnine)",
#'                                          "Data cleaning (tidyverse, pandas, numpy)",
#'                                          "Machine learning (e.g., regularized regression, decision
#'                                           trees, random forests, mixture models)",
#'                                          "Statistics (e.g., latent variable models, factor analysis,
#'                                            multilevel modelling)"))

#' @returns A character vector
#' @export
create_skills_entry <- function(coding_languages, ides_platforms, technical_skills) {

  #items for lists
  coding_languages <- paste("\\item", coding_languages)
  ides_platforms <- paste("\\item", ides_platforms)
  technical_skills <- paste("\\item", technical_skills)


  #LaTeX code for resume entry
  skills_entry <- cat("\\fontsize{8}{8} \\selectfont
                       \\begin{tabularx}{\\textwidth}{@{} p{0.25\\rightcolumnwidth} p{0.2\\rightcolumnwidth} p{0.72\\rightcolumnwidth} @{}}
                       \\textbf{Coding languages}
                       \\begin{itemize}[noitemsep,topsep=0pt,partopsep=0pt,parsep=0pt,leftmargin=9pt,label=\\raisebox{0.04cm}{\\fontsize{3pt}{3pt}$\\blacksquare$}]
                       \\setstretch{1.25} ",
                       coding_languages,
                      "\\end{itemize}
                       %second column
                       &
                       \\textbf{IDEs/platforms}
                       \\begin{itemize}[noitemsep,topsep=0pt,partopsep=0pt,parsep=0pt,leftmargin=9pt,label=\\raisebox{0.04cm}{\\fontsize{3pt}{3pt}$\\blacksquare$}]",

                      ides_platforms,
                      "\\end{itemize}
                      %third column
                      &
                      \\textbf{Technical skills}
                      \\begin{itemize}[noitemsep,topsep=0pt,partopsep=0pt,parsep=0pt,leftmargin=9pt,label=\\raisebox{0.04cm}{\\fontsize{3pt}{3pt}$\\blacksquare$}]",
                      technical_skills,
                      "\\end{itemize}
                      \\end{tabularx}", sep = '')
}


