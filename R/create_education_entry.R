#'  Generates education entry.
#'
#' @param degree_type Type of degree (e.g., BSc, MSc, PhD, MD, etc.)
#' @param degree_name Area of study in which degree was obtained
#' @param institution university/colllege where degree was obtained
#' @param start_date start date
#' @param end_date end_date
#' @examples
#'create_education_entry(degree_type = 'PhD', degree_name = 'Industrial-Organizational Psychology',
#'                      institution = 'University of Guelph', start_date = 'Sep. 2018', end_date = 'May 2023')
#' @returns A character vector containing LaTeX code
#' @export
create_education_entry <- function(degree_type, degree_name, institution, start_date, end_date) {

  #LaTeX code for resume entry
  education_entry <- cat("\\begin{educationEntry}   \\fontsize{8}{8}\\selectfont \\textbf{", degree_type, ' \\textbar{} ', degree_name,
                         '} \\newline ', institution, ' \\newline ',
                         start_date, '--', end_date, ' \\newline ',
                         "\\end{educationEntry}", sep = '')

}

