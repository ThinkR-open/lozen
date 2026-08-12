# Transform project as book with lozen template

Transform project as book with lozen template

## Usage

``` r
create_book_project(
  project_path,
  bookdown_path = system.file("lozendown", package = "lozen"),
  css = NULL,
  footer = NULL,
  logo = NULL,
  index = NULL,
  output_yml = NULL
)
```

## Arguments

- project_path:

  project_path

- bookdown_path:

  a path to a bookdown

- css:

  path(s) for css to copy

- footer:

  path for footer to copy

- logo:

  path for logo to copy

- index:

  path for index to copy

- output_yml:

  path for output_yml to copy

## Value

Side Effect: Transform project as book

## Examples

``` r
withr::with_tempdir({
  project_path <- getwd()
  create_book_project(project_path)
})
#> [-] 5 package(s) removed: dplyr, ggplot2, pagedown, tidyr, pagedown.
#> Warning: Invalid ORCID iD: ‘YOUR-ORCID-ID’.
#> book created
#> You need to follow 'dev_history_book.Rmd' after that for the CI to create the pdf_book.
#> [1] "/tmp/RtmpZIpE1u/file196171662257"
```
