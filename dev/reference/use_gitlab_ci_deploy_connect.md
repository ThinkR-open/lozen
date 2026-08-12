# Add a job to deploy a something on Connect

This function creates a file .gitlab-ci.yml that will deploy something
on Connect using a `lozen::deploy_connect_*` functions.

## Usage

``` r
use_gitlab_ci_deploy_connect(
  deploy_function = c("deploy_connect_shiny", "deploy_connect_pkgdown",
    "deploy_connect_bookdown"),
  stage_name = "deploy_connect",
  image = "rocker/verse:latest",
  dir = ".",
  append = TRUE,
  file_name = ".gitlab-ci.yml",
  ...
)

use_gitlab_ci_deploy_connect_bookdown(...)

use_gitlab_ci_deploy_connect_pkgdown(...)

use_gitlab_ci_deploy_connect_shiny(...)
```

## Arguments

- deploy_function:

  string caracter name of the `deploy_connect_*` functions to use.

- stage_name:

  name of the CI stage (need to be unique in the .gitlab-ci.yml file)

- image:

  Docker image to use

- dir:

  Directory to deploy

- append:

  append the file .gitlab-ci.yml if it already exists

- file_name:

  Name of the yaml file

- ...:

  param to pass to deploy_function

## Value

used for side effects

## Details

Before using it, please follow these steps :

- Ask the Mission Lead Dev for their deployment token on Connect, this
  is the one you will need to use.

- Add the environment variables in the private variable hidden in the
  GitLab repository: Settings \> CI/CD \> Variables \> Expand \> Add
  variable /!\\ if you check "Protected" when you create the variable,
  then it will be active only for protected branches

  - Add `CONNECT_USER` with username.

  - Add `CONNECT_TOKEN` with the token.

If you want to deploy an app Be sure to have an app.R to deploy at the
root of the folder, (if needed: use
[`golem::add_positconnect_file()`](https://thinkr-open.github.io/golem/reference/rstudio_deploy.html))

NB: The environment variable `CONNECT_URL` is already defined
generically on forge (only for group "thinkr").

## Examples

``` r
#
use_gitlab_ci_deploy_connect_bookdown()
#> ! There is no _book directory at the root of your package. You should probably compile your book with `lozen::render_book("index.Rmd", output_format = "lozen::bs4_book_template")` or `lozen::render_book("index.Rmd", output_format = "lozen::paged_template")` first.
#> ! Once this is done, please ensure your _book directory is not listed in your .gitignore file !
#> ℹ There is no ./.gitlab-ci.yml in your project, a new one will be created.
#> [1] "./.gitlab-ci.yml"
# Exemple avec pkgdown
deployed_pkgdown <- tempfile(pattern = "pkgdown")
dir.create(deployed_pkgdown)
# rstudioapi::filesPaneNavigate(deployed_pkgdown)
withr::with_dir(deployed_pkgdown, {
  use_gitlab_ci(type = "check-coverage-pkgdown")
  use_gitlab_ci_deploy_connect_pkgdown()
})
#> ℹ There is no ./.gitlab-ci.yml in your project, a new one will be created.
#> GitLab CI file created at ./.gitlab-ci.yml
#> ℹ Appending new stages in ./.gitlab-ci.yml
#> [1] "./.gitlab-ci.yml"
deployed_shiny <- tempfile(pattern = "shiny")
dir.create(deployed_shiny)
# rstudioapi::filesPaneNavigate(deployed_shiny)
# Exemple avec shiny
withr::with_dir(deployed_shiny, {
  use_gitlab_ci(type = "check-coverage-pkgdown")
  use_gitlab_ci_deploy_connect_shiny()
})
#> ℹ There is no ./.gitlab-ci.yml in your project, a new one will be created.
#> GitLab CI file created at ./.gitlab-ci.yml
#> ! There is no app.R at the root of your package. You should probably run `golem::add_positconnect_file()` to create this file.
#> ℹ Appending new stages in ./.gitlab-ci.yml
#> [1] "./.gitlab-ci.yml"
```
