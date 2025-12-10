# Generates selected white papers entry.

Generates selected white papers entry.

## Usage

``` r
create_white_paper_entry(links, titles, dates)
```

## Arguments

- links:

  Links to published papers/blogs.

- titles:

  Titles of published papers/blogs

- dates:

  Publication dates of papers/blogs.

## Value

A character vector

## Examples

``` r
links = c("https://sebastiansciarra.com/technical_content/understanding_ml/",
          "https://sebastiansciarra.com/technical_content/em/",
          "https://sebastiansciarra.com/technical_content/mle/")
titles = c("The Game of Supervised Machine Learning: Understanding the Setup, Players, and Rules",
           "The Expectation-Maximization Algorithm: A Method for Modelling
            Mixtures of Distributions",
           "Probability, Likelihood, and Maximum Likelihood Estimation")
dates = c("10 August 2023",
          "28 April 2023",
          "19 March 2023")
create_white_paper_entry(links = links, titles = titles, dates = dates)
#> \fontsize{8}{8}\selectfont \href{https://sebastiansciarra.com/technical_content/understanding_ml/}{\textbf{The Game of Supervised Machine Learning: Understanding the Setup, Players, and Rules} \newline {\fontsize{6.5}{6.5}\selectfont Published \newline \textit{10 August 2023}}} \newline \newline \fontsize{8}{8}\selectfont \href{https://sebastiansciarra.com/technical_content/em/}{\textbf{The Expectation-Maximization Algorithm: A Method for Modelling
#>             Mixtures of Distributions} \newline {\fontsize{6.5}{6.5}\selectfont Published \newline \textit{28 April 2023}}} \newline \newline \fontsize{8}{8}\selectfont \href{https://sebastiansciarra.com/technical_content/mle/}{\textbf{Probability, Likelihood, and Maximum Likelihood Estimation} \newline {\fontsize{6.5}{6.5}\selectfont Published \newline \textit{19 March 2023}}} \newline \newline
```
