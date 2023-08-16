#'  Generates selected white papers entry.
#'
#' @param links Links to published papers/blogs.
#' @param titles Titles of published papers/blogs
#' @param dates Publication dates of papers/blogs.
#' @examples
#' links = c("https://sebastiansciarra.com/technical_content/understanding_ml/",
#'           "https://sebastiansciarra.com/technical_content/em/",
#'           "https://sebastiansciarra.com/technical_content/mle/")
#' titles = c("The Game of Supervised Machine Learning: Understanding the Setup, Players, and Rules",
#'            "The Expectation-Maximization Algorithm: A Method for Modelling
#'             Mixtures of Distributions",
#'            "Probability, Likelihood, and Maximum Likelihood Estimation")
#' dates = c("10 August 2023",
#'           "28 April 2023",
#'           "19 March 2023")
#' create_white_paper_entry(links = links, titles = titles, dates = dates)
#' @returns A character vector
#' @export
create_white_paper_entry <- function(links, titles, dates) {

  #LaTeX code for resume entry
  paper_list <- list(links = links,
                     titles = titles,
                     dates = dates)

  papers_entry <- cat(paste("\\fontsize{8}{8}\\selectfont \\href{", paper_list$links, "}{\\textbf{", paper_list$titles,
                            "} \\newline {\\fontsize{6.5}{6.5}\\selectfont Published \\newline \\textit{", paper_list$dates,
                            "}}} \\newline \\newline", sep=''))
}


