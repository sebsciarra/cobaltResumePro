# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'
#' @export
merge_resume_cover_letter <- function(...) {

  #get paths to .Rmd files
  rmd_files <- list.files(pattern = '.Rmd', recursive = TRUE, full.names = TRUE)

  # Check the length of rmd_files
  if (length(rmd_files) > 2) {
    error_message <- "There must be only two .Rmd files: One for the résumé and
    another for the cover letter. Make sure an .Rmd files exists in each template. "
    stop(error_message)
  }


  #identify which .Rmd file is the resume and which is the cover letter by determining which one is in the same folder as
  #the .cls and .tex files
  # Extracting everything up to the second forward slash
  directories <-  ifelse(test = is.na(stringr::str_extract(rmd_files, "^.*?/[^/]+/")),
                         yes = "./",
                         no = stringr::str_extract(rmd_files, "^.*?/[^/]+/"))

  # Check the length of rmd_files
  if (length(directories) != 2 & sum(!is.na(directories)) != 2) {
    error_message <- "There must be only two subfolders: One for the résumé and
    another for the cover letter. Make sure a template folder has been created for the résumé
    and another for the cover letter."
    stop(error_message)
  }

  #the true element is the resume Rmarkdown file
  path_files <- file.path(directories, "cobaltResume.cls", fsep = '')
  file_identifier_ind <- file.exists(path_files)


  #CV and cover letter file paths
  cv_rmd <- rmd_files[file_identifier_ind]
  cover_letter_rmd <- rmd_files[!file_identifier_ind]

  pdf_filenames = list(
    rmarkdown::render(
      input = cv_rmd,
      output_file = "résumé.pdf",
      envir = globalenv(),
      quiet = TRUE),

    rmarkdown::render(
      input = cover_letter_rmd,
      output_file = "cover_letter.pdf",
      envir = globalenv(),
      quiet = TRUE)
  )


  pdftools::pdf_combine(input = unlist(pdf_filenames),
                        output = 'résumé_cover_letter.pdf')

  file.remove(unlist(pdf_filenames))

  #combined PDF path
  resume_cover_letter_pdf_path <- list.files(pattern = 'résumé_cover_letter.pdf', recursive = TRUE, full.names = TRUE)

  rstudioapi::viewer(resume_cover_letter_pdf_path)

}


