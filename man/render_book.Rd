% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/render_book.R
\name{render_book}
\alias{render_book}
\title{Render a book with lozen formats}
\usage{
render_book(
  rmd_to_render = "index.Rmd",
  output_format = c("lozen::bs4_book_template", "lozen::paged_template"),
  output_dir = "_book",
  ...
)
}
\arguments{
\item{rmd_to_render}{rmd file to render}

\item{output_format}{format to be user to render the book}

\item{output_dir}{output directory}

\item{...}{extra params to be used in bookdown::render_book}
}
\value{
a rendered book
}
\description{
Render a book with lozen formats
}
\examples{
\dontrun{
render_book("index.Rmd", output_format = "lozen::bs4_book_template")
render_book("index.Rmd", output_format = "lozen::paged_template")
}
}
