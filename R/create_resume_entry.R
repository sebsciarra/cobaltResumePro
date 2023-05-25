#'  Generates résumé entries.
#'
#' @param title Title of the résumé entry.
#' @param subtitle Additional information related to the title.
#' @param date Date of achievement/completion or period of time.
#' @param first_point First point (if necessary)
#' @param second_point Second point (if necessary)
#' @param third_point Third point (if necessary)
#' @param fourth_point Fourth point (if necessary)
#' @examples
#' create_resume_entry(title = "PhD, Industrial-Organizational Psychology",
#' subtitle = "University of Guelph",
#' date = "Sep. 2018--May 2023",
#' first_point = "Thesis title: \\textbf{Is Timing Everything? The Effects of Measurement Timing on the \\newline Performance of Nonlinear Longitudinal Models}",
#' second_point = "Conducted Monte Carlo simulation experiments using R on an Amazon Web Services (AWS) instance to evaluate the performance of structured latent growth curve models under several conditions",
#' third_point = "My thesis can be viewed  \\href{\\detokenize{https://atrium.lib.uoguelph.ca/xmlui/bitstream/handle/10214/27543/Sciarra_Sebastian_202304_PhD.pdf?sequence=1&isAllowed=y}}{\\textcolor{blue}{here}}")
#' @returns A character vector
#' @export
create_resume_entry <- function(title, subtitle = "", date,
                             first_point = "", second_point = "", third_point = "", fourth_point = "") {

  #LaTeX code for resume entry
  resume_entry <- cat("\\begin{resumeEntry}{",
               title, "}{",
               subtitle, "}{",
               date, "}[",
               first_point, "][", second_point, "][", third_point, "][", fourth_point, "]",
               "\\end{resumeEntry}", sep = '')
}

