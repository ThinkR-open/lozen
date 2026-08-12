# Render a book with lozen formats

Render a book with lozen formats

## Usage

``` r
render_book(
  rmd_to_render = "index.Rmd",
  output_format = c("lozen::bs4_book_template", "lozen::paged_template"),
  output_dir = "_book",
  ...
)
```

## Arguments

- rmd_to_render:

  rmd file to render

- output_format:

  format to be user to render the book

- output_dir:

  output directory

- ...:

  extra params to be used in bookdown::render_book

## Value

a rendered book

## Examples

``` r
if (FALSE) { # \dontrun{
render_book("index.Rmd", output_format = "lozen::bs4_book_template")
render_book("index.Rmd", output_format = "lozen::paged_template")
} # }
```
