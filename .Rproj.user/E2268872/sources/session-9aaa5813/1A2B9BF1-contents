#'  Merges résumé and cover letter into one PDF file.
#'
#'  Function can be used to overwrite knitr::knit() by using knit: cobaltResume::merge_resume_cover_letter in the YAML header.
#' @export
merge_resume_cover_letter <- function(...) {

  #get paths to .Rmd files
  rmd_files <- list.files(path = here::here(),
                          pattern = '.Rmd', recursive = TRUE, full.names = TRUE)

  # Check the length of rmd_files
  if (length(rmd_files) > 2) {
    error_message <- "There must be only two .Rmd files: One for the résumé and
    another for the cover letter. Make sure an .Rmd files exists in each template. "
    stop(error_message)
  }


  #identify which .Rmd file is the resume and which is the cover letter by determining which one is in the same folder as
  #the .cls and .tex files
  #folder paths that contain each .Rmd file
  directories <-  dirname(rmd_files)

  # Check the length of rmd_files
  if (length(directories) != 2 & sum(!is.na(directories)) != 2) {
    error_message <- "There must be only two subfolders: One for the résumé and
    another for the cover letter. Make sure a template folder has been created for the résumé
    and another for the cover letter."
    stop(error_message)
  }

  #Create two paths with target file (cobaltResume.cls) and see which one is true.
  #the true element is the resume Rmarkdown file
  rmd_files <- list.files(path = here::here(),
                          pattern = '.Rmd', recursive = TRUE, full.names = TRUE)
  directories <-  dirname(rmd_files)
  path_files <- file.path(directories, "cobaltResume.cls", fsep = '/')
  file_identifier_ind <- file.exists(path_files)

 ##CV and cover letter file paths
 resume_rmd <- rmd_files[file_identifier_ind]
 cover_letter_rmd <- rmd_files[!file_identifier_ind]

 pdf_filenames = list(
   rmarkdown::render(
     input = resume_rmd,
     output_file = "resume.pdf",
     envir = globalenv(),
     quiet = T),
   rmarkdown::render(
     input = cover_letter_rmd,
     output_file = "cover_letter.pdf",
     envir = globalenv(),
     quiet = T)
 )

 pdftools::pdf_combine(input = unlist(pdf_filenames),
                       output = 'resume_cover_letter.pdf')



 file.remove(unlist(pdf_filenames))

 #combined PDF path
 resume_cover_letter_pdf_path <- list.files(path = here::here(),
                                            pattern = 'resume_cover_letter.pdf', recursive = TRUE, full.names = TRUE)

 system(paste0("open ", resume_cover_letter_pdf_path))

}


