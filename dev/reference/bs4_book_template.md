# Render bookdown bs4book

Render bookdown bs4book

## Usage

``` r
bs4_book_template(
  theme = bs4_book_theme(),
  repo = NULL,
  ...,
  lib_dir = "libs",
  pandoc_args = NULL,
  extra_dependencies = NULL,
  template = "default",
  split_bib = FALSE,
  footnotes_inline = TRUE
)
```

## Arguments

- theme:

  A named list or
  [`bslib::bs_theme()`](https://rstudio.github.io/bslib/reference/bs_theme.html)
  object. The default, `bs4_book_theme()`, resets the base font size to
  1rem to make reading easier and uses a primary colour with greater
  contrast against the background.

- repo:

  Either link to repository where book is hosted, used to generate view
  source and edit buttons or a list with repository `base` link, default
  `branch`, `subdir` and `icon` (see "Specifying the repository" in
  <https://bookdown.org/yihui/bookdown/html.html#bootstrap4-style>).

- lib_dir, pandoc_args, extra_dependencies, split_bib, ...:

  Passed on to
  [`rmarkdown::html_document()`](https://pkgs.rstudio.com/rmarkdown/reference/html_document.html).

- template:

  Pandoc template to use for rendering. Pass `"default"` to use the
  bookdown default template; pass a path to use a custom template. The
  default template should be sufficient for most use cases. For advanced
  user only, in case you want to develop a custom template, we highly
  recommend to start from the default template:
  <https://github.com/rstudio/bookdown/blob/master/inst/templates/bs4_book.html>.
  Otherwise, some feature may not work anymore.

- footnotes_inline:

  By default, footnotes will be set inline and shown on hover. Set to
  `FALSE` to keep footnotes at the bottom of the page with links.

## Value

A pagedown template
