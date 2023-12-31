#'  Generates profile entry.
#'
#' @param profile_summary Character string containing personal profile.
#' @examples
#' create_profile_entry(profile_summary = "Passionate about coding, machine learning, and statistics. Completed my PhD
#'                     \\href{\\detokenize{https://atrium.lib.uoguelph.ca/server/api/core/bitstreams/8ed1891d-58ca-457b-b0d4-33a015fb2db9/content}}
#'                     {\\textcolor{blue}{dissertation}} at the intersection of these fields to address a practical problem in Industrial-Organizational
#'                     psychology and received the 2022/2023 Canadian Psychological Association Certificate of Academic Excellence for this work.
#'                     In my dissertation, I coded and ran Monte Carlo simulations on an AWS instance to evaluate the performance of nonlinear
#'                     longitudinal models. Writes white papers on machine learning topics at\ \\href{https://sebastiansciarra.com}
#'                     {\\textcolor{blue}{sebastiansciarra.com}}. \\newline")
#' @returns A character vector containing LaTeX code.
#' @export
create_profile_entry <- function(profile_summary) {

  #LaTeX code for resume entry
  education_entry <- cat("\\begin{educationEntry} ", profile_summary, "\\end{educationEntry}", sep = '')

}

