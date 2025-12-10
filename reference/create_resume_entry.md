# Generates resume entries.

Generates resume entries.

## Usage

``` r
create_resume_entry(
  title,
  subtitle = "",
  date,
  first_point = "",
  second_point = "",
  third_point = "",
  fourth_point = "",
  fifth_point = ""
)
```

## Arguments

- title:

  Title of the resume entry.

- subtitle:

  Additional information related to the title.

- date:

  Date of achievement/completion or period of time.

- first_point:

  First point (if necessary)

- second_point:

  Second point (if necessary)

- third_point:

  Third point (if necessary)

- fourth_point:

  Fourth point (if necessary)

- fifth_point:

  Fourth point (if necessary)

## Value

A character vector containin LaTeX code

## Examples

``` r
create_resume_entry(title = "\\href{https://github.com/sebsciarra/smltheory}{smltheory}",
                    subtitle = "Python package", date = "Aug. 2023",
                    first_point = "Package contains nine modules and 30 functions",
                    second_point = "Functions within package simulate data sets and demonstrate propositions
                                     of supervised machine learning propositions (e.g., bias-variance tradeoff,
                                     excess risk decomposition)")
#> \begin{resumeEntry}{\href{https://github.com/sebsciarra/smltheory}{smltheory}}{Python package}{Aug. 2023}[Package contains nine modules and 30 functions][Functions within package simulate data sets and demonstrate propositions
#>                                      of supervised machine learning propositions (e.g., bias-variance tradeoff,
#>                                      excess risk decomposition)][][][]\end{resumeEntry}
```
