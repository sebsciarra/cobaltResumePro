#' Creates a directory of folders for the project.
#'
#' @param path Path of current working directory.
#' @export
create_cobalt_pro_project <- function(path = getwd()) {

  # from https://github.com/rstudio/bookdown/blob/master/R/skeleton.R
  # ensure directory exists
  #  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # copy 'resources' folder to path
  resources <- cobalt_file('rstudio', 'templates', 'project', 'resources')

  R.utils::copyDirectory(from = resources,
                         to = path,
                         recursive = TRUE)
}

cobalt_file <- function(...) {

  # from https://github.com/rstudio/bookdown/blob/master/R/utils.R
  system.file(..., package = 'cobaltResumePro', mustWork = TRUE)
}

