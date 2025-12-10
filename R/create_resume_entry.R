#'  Generates resume entries.
#'
#' @param title Title of the resume entry.
#' @param subtitle Additional information related to the title.
#' @param date Date of achievement/completion or period of time.
#' @param first_point First point (if necessary)
#' @param second_point Second point (if necessary)
#' @param third_point Third point (if necessary)
#' @param fourth_point Fourth point (if necessary)
#' @param fifth_point Fourth point (if necessary)
#' @examples
#' create_resume_entry(title = "\\href{https://github.com/sebsciarra/smltheory}{smltheory}",
#'                     subtitle = "Python package", date = "Aug. 2023",
#'                     first_point = "Package contains nine modules and 30 functions",
#'                     second_point = "Functions within package simulate data sets and demonstrate propositions
#'                                      of supervised machine learning propositions (e.g., bias-variance tradeoff,
#'                                      excess risk decomposition)")
#' @returns A character vector containin LaTeX code
#' @export
create_resume_entry <- function(title, subtitle = "", date,
                             first_point = "", second_point = "", third_point = "", fourth_point = "", fifth_point = "") {

  #LaTeX code for resume entry
  resume_entry <- cat("\\begin{resumeEntry}{",
               title, "}{",
               subtitle, "}{",
               date, "}[",
               first_point, "][", second_point, "][", third_point, "][", fourth_point, "][", fifth_point, "]",
               "\\end{resumeEntry}", sep = '')
}

