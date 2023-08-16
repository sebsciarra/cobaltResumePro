#'  Knits resume and provides option to merge resume with cover letter into one PDF file.
#'
#'  @param merge_resume_cover_letter If TRUE, resume and cover letter files will be merged into one PDF file.
#'
#'  Function needs to be used to overwrite knitr::knit() by using knit: cobaltResume::knit_resume in the YAML header.
#'  @examples
#' knit: cobaltResume2.0::knit_resume(merge_resume_cover_letter = T)
#' @export
knit_resume <- function(..., merge_resume_cover_letter = F) {

  #get paths to .Rmd files
  rmd_files <- list.files(path = here::here(),
                          pattern = '.Rmd', recursive = TRUE, full.names = TRUE)[1:2]


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
  path_files <- file.path(directories, "cobaltResume.cls", fsep = '/')
  file_identifier_ind <- file.exists(path_files)

  ##CV and cover letter file paths
  resume_rmd <- rmd_files[file_identifier_ind]
  cover_letter_rmd <- rmd_files[!file_identifier_ind]

  remove_metadata_tex()
  ##note that I want to work with the .tex file produced by rmarkdown::render()
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

  #modify resume.tex and rerender it
  #get paths to .tex files
  resume_tex_path <- list.files(path = here::here(),
                                pattern = 'resume.tex', recursive = TRUE, full.names = TRUE)

  #render PDF
  resume_pdf_path <-  list.files(path = here::here(),
                                 pattern = 'resume.pdf', recursive = TRUE, full.names = TRUE)

  rerender_resume_tex(resume_tex_path = resume_tex_path, resume_pdf_path = resume_pdf_path)

  #merge documents if desired
  if (merge_resume_cover_letter){
    pdftools::pdf_combine(input = unlist(pdf_filenames),
                          output = 'resume_cover_letter.pdf')

    file.remove(unlist(pdf_filenames))

    #combined PDF path
    resume_cover_letter_pdf_path <- list.files(path = here::here(),
                                               pattern = 'resume_cover_letter.pdf', recursive = TRUE, full.names = TRUE)

    system(paste0("open ", resume_cover_letter_pdf_path))
  }

  else{
    system(paste0("open ", resume_pdf_path))
  }
}

rerender_resume_tex <- function(resume_tex_path, resume_pdf_path){

  remove_metadata_tex()

  #load resume.tex file
  tex_content <- readChar(con = resume_tex_path, nchars = file.info(resume_tex_path)$size)

  #1) Select entire sections
  #set dotall=T so that newline characters and any white spaces are matched
  pattern_total_section <- stringr::regex(pattern = "\\\\hypertarget.*?(?=(\\\\hypertarget|\\\\end\\{document))", dotall = TRUE)
  section_total <- unlist(stringr::str_extract_all(string = tex_content, pattern = pattern_total_section))

  #2) Extract section names from content in \hypertarget{}
  pattern_name <- "\\\\hypertarget\\{\\s*(.*?)\\s*\\}"
  section_names <- stringr::str_match(string = section_total, pattern = pattern_name)[ ,2]

  #3) Remove entire sections from .tex file
  tex_content <- stringr::str_remove_all(string = tex_content, pattern = pattern_total_section)

  #4) Remove \hypertarget and \label{}} from section totals
  ##only remove \\hypertarget{} before \\section
  pattern_hypertarget <- "\\\\hypertarget\\{.*?\\}\\{\\%\\s+(?=\\\\section\\{\\\\texorpdfstring\\{[^}]+\\}\\{[^}]+\\}\\}\\\\label\\{[^}]+\\})"
  section_total <- stringr::str_remove_all(string = section_total, pattern = pattern_hypertarget)

  ##only remove \\label after a section
  pattern_label <- "(?!\\\\section\\{\\\\texorpdfstring\\{[^}]+\\}\\{[^}]+\\}\\}\\\\label\\{[^}]+\\})\\\\label\\{.*?\\}\\}"
  section_total <- stringr::str_remove_all(string = section_total, pattern = pattern_label)


  #5)Create metadata tags (insert <%*section_name> + pattern_section + <*section_name> into metadata.tex)
  metadata_tags <- paste(paste0("%<*",section_names, ">"),
                         section_total,
                         paste0("%</", section_names, ">"), sep = '\n')

  #get corrects paths for files
  resume_dir <- dirname(path = resume_pdf_path)
  metadata_path <- paste0(resume_dir, "/metadata.tex")

  #make sure metadata.tex file is blank
  readr::write_lines(x = metadata_tags, file = metadata_path)
  readr::write_lines(x = tex_content, file = resume_tex_path)

  setwd(dir = resume_dir)

  tools::texi2pdf(file = resume_tex_path)
}

remove_metadata_tex <- function(){

  #remove metadata.tex file if it exists
  metadata_tex_path <- list.files(path = here::here(),
                                  pattern = 'metadata.tex', recursive = TRUE, full.names = TRUE)
  file.remove(metadata_tex_path)
}
