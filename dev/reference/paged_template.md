# Render pagedown html_paged

Render pagedown html_paged

## Usage

``` r
paged_template(
  ...,
  css = c("default-fonts", "default-page", "default"),
  theme = NULL,
  template = pkg_resource("html", "paged.html"),
  csl = NULL,
  front_cover = NULL,
  back_cover = NULL
)
```

## Arguments

- ...:

  Arguments passed to
  `bookdown::`[`html_document2`](https://pkgs.rstudio.com/bookdown/reference/html_document2.html).

- css:

  A character vector of CSS and Sass file paths. If a path does not
  contain the `.css`, `.sass`, or `.scss` extension, it is assumed to be
  a built-in CSS file. For example, `default-fonts` means the
  file`pagedown:::pkg_resource('css', 'default-fonts.css')`. To see all
  built-in CSS files, run `pagedown:::list_css()`.

- theme:

  The Bootstrap theme. By default, Bootstrap is not used.

- template:

  The path to the Pandoc template to convert Markdown to HTML.

- csl:

  The path of the Citation Style Language (CSL) file used to format
  citations and references (see the [Pandoc
  documentation](https://pandoc.org/MANUAL.html#citations)).

- front_cover, back_cover:

  Paths or urls to image files to be used as front or back covers.
  Theses images are available through CSS variables (see Details).

## Value

A pagedown template
