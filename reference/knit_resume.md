# Knits resume and provides option to merge resume with cover letter into one PDF file.

@param merge_resume_cover_letter If TRUE, resume and cover letter files
will be merged into one PDF file.

## Usage

``` r
knit_resume(..., merge_resume_cover_letter = F)
```

## Details

Function needs to be used to overwrite knitr::knit() by using knit:
cobaltResume::knit_resume in the YAML header. @examples knit:
cobaltResume2.0::knit_resume(merge_resume_cover_letter = T)
