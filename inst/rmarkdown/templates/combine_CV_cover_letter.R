
library(easypackages)
packages <- c("rmarkdown", "pdftools")
libraries(packages)



pdf_files <- c("inst/rmarkdown/templates/cobaltCV/skeleton/cobaltCV.pdf",
               "inst/rmarkdown/templates/cobaltCoverLetter/skeleton/cobalt_cover.pdf")
pdf_combine(pdf_files, output = "combined_output.pdf")
# Preview the combined output PDF

# Knit the example.Rmd file and capture the output as a character vector
md <- render("inst/rmarkdown/templates/cobaltCV/skeleton/skeleton_CV.Rmd",
             output_format = "pdf_document",
             quiet = T)

preview_chapter("inst/rmarkdown/templates/cobaltCV/skeleton/skeleton_CV.Rmd")

# Save the PDF output to a temporary file

md <- knitr::knit(input = "inst/rmarkdown/templates/cobaltCV/skeleton/skeleton_CV.Rmd")

# Preview the temporary file in the RStudio Viewer pane
viewer(tmp_file)


# Knit the first skeleton file
knitr::knit("inst/rmarkdown/templates/cobaltCV/skeleton/skeleton_CV.Rmd",
            output = "skeleton_CV.tex")


cv_cobalt <- rmarkdown::render(input = "inst/rmarkdown/templates/cobaltCV/skeleton/skeleton_CV.Rmd",
                  output_format = pdf_document(template = "cobaltCV.tex"))

rmarkdown::render(input = "inst/rmarkdown/templates/cobaltCV/skeleton/skeleton_CV.Rmd",
                  output_file = "skeleton_CV.tex")

# Set the working directory to the directory containing the example.Rmd file
setwd("/path/to/directory")

# Load the rmarkdown package
library(rmarkdown)

# Knit the example.Rmd file to generate a .md file
cv <- render("inst/rmarkdown/templates/cobaltCV/skeleton/skeleton_CV.Rmd")

# Convert the .md file to a .tex file
pandoc("example.md", format = "latex", output = "example.tex")

# Compile the .tex file to generate a .pdf file
tools::texi2dvi("inst/rmarkdown/templates/cobaltCV/skeleton/skeleton_CV.tex", pdf = TRUE)

# Preview the resulting PDF in the system's default PDF viewer
system2(command = "open", "skeleton_CV.pdf")




# Knit the second skeleton file
knitr::knit(input = "inst/rmarkdown/templates/cobaltCoverLetter/skeleton/skeleton.Rmd",
            output = "skeleton_cover_letter.tex")

# Combine the output of both files into a single PDF and preview it
library(pdftools)

# render the child documents and store their PDF filenames in a list
pdf_filenames <- list(
  rmarkdown::render("inst/rmarkdown/templates/cobaltCV/skeleton/skeleton_CV.Rmd", output_format = "pdf_document"),
  rmarkdown::render("inst/rmarkdown/templates/cobaltCoverLetter/skeleton/skeleton_cover.Rmd", output_format = "pdf_document")
)

# merge the PDFs using pdftools::pdf_merge()
merged_pdf_filename <- "merged_output.pdf"
pdftools::pdf_combine(pdf_filenames, output = merged_pdf_filename)
viewer(merged_pdf_filename)
# remove the individual child PDFs
file.remove(unlist(pdf_filenames))
