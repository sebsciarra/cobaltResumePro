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
merge_CV_cover_letter <- function(input, ...) {

    pdf_filenames = list(
      rmarkdown::render(
        input = input,
        output_file = "CV.pdf",
        envir = globalenv(),
        quiet = TRUE),

      rmarkdown::render(
        input = here::here("inst/rmarkdown/templates/cobaltCoverLetter/skeleton/skeleton_cover.Rmd"),
        output_file = "cover_letter.pdf",
        envir = globalenv(),
        quiet = TRUE)
    )

    pdftools::pdf_combine(input = c("CV.pdf",
                                    here::here("inst/rmarkdown/templates/cobaltCoverLetter/skeleton/cover_letter.pdf")),
                          output = 'CV_cover_letter.pdf')

    file.remove(unlist(pdf_filenames))


    rstudioapi::viewer(here::here("inst/rmarkdown/templates/cobaltCV/skeleton/CV_cover_letter.pdf"))

}


