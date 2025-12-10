# Generates education entry.

Generates education entry.

## Usage

``` r
create_education_entry(
  degree_type,
  degree_name,
  institution,
  start_date,
  end_date
)
```

## Arguments

- degree_type:

  Type of degree (e.g., BSc, MSc, PhD, MD, etc.)

- degree_name:

  Area of study in which degree was obtained

- institution:

  university/colllege where degree was obtained

- start_date:

  start date

- end_date:

  end_date

## Value

A character vector containing LaTeX code

## Examples

``` r
create_education_entry(degree_type = 'PhD', degree_name = 'Industrial-Organizational Psychology',
                     institution = 'University of Guelph', start_date = 'Sep. 2018', end_date = 'May 2023')
#> \begin{educationEntry}   \fontsize{8}{8}\selectfont \textbf{PhD \textbar{} Industrial-Organizational Psychology} \newline University of Guelph \newline Sep. 2018--May 2023 \newline \end{educationEntry}
```
