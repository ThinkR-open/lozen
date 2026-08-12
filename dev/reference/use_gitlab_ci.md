# Set gitlab continuous integration

Set gitlab continuous integration

## Usage

``` r
use_gitlab_ci(
  image = "rocker/verse",
  project_path = ".",
  type = "check-coverage-pkgdown",
  bookdown_output_format = c("lozen::paged_template", "lozen::bs4_book_template"),
  overwrite = TRUE
)
```

## Arguments

- image:

  Docker image used as basis. See <https://github.com/rocker-org/rocker>

- project_path:

  Path of the project to add CI in.

- type:

  type of the CI template to use

- bookdown_output_format:

  If type="bookdown" it corresponds to the function used to output the
  bookdown

- overwrite:

  whether to overwrite existing GitLab CI yml file

## Details

See
[`use_gitlab_ci`](https://thinkr-open.github.io/gitlabr/reference/use_gitlab_ci.html)

## Examples

``` r
withr::with_tempdir({
  use_gitlab_ci(image = "r-base")
})
#> ℹ There is no ./.gitlab-ci.yml in your project, a new one will be created.
#> GitLab CI file created at ./.gitlab-ci.yml
#> [1] "./.gitlab-ci.yml"

withr::with_tempdir({
  use_gitlab_ci(
    image = "rocker/verse",
    type = "check-coverage-pkgdown"
  )
})
#> ℹ There is no ./.gitlab-ci.yml in your project, a new one will be created.
#> GitLab CI file created at ./.gitlab-ci.yml
#> [1] "./.gitlab-ci.yml"
```
