<!-- README.md is generated from README.Rmd. Please edit that file -->

# {lozen} <img src="man/figures/logo.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/ThinkR-open/lozen/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ThinkR-open/lozen/actions/workflows/R-CMD-check.yaml)
[![coverage
report](https://github.com/ThinkR-open/lozen/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/ThinkR-open/lozen/actions/workflows/test-coverage.yaml)
[![codecov](https://codecov.io/gh/ThinkR-open/lozen/branch/main/graph/badge.svg?token=OSIC3VV5NG)](https://codecov.io/gh/ThinkR-open/lozen)
<!-- badges: end -->

The objective of {lozen} is to centralize project management tools for
Devs and Lead Devs.

## Installation

``` r
remotes::install_github(
  repo = "ThinkR-open/lozen",
  ref = "main",
  build_vignettes = TRUE,
  upgrade = "never")
```

## Documentation

### Package website

Access to the pkgdown: <https://thinkr-open.github.io/lozen/>

### Vignettes/articles

*Documentation dedicated to the users (Devs, Lead Devs)*

- `aa - Create a new project with GitLab`: Create a new R project for a
  mission - managed on GitLab, with everything needed (the R project
  skeleton, the init of git, the init of the project on GitLab, etc.)
- `ab - Create a new project with GitHub`: Create a new R project for a
  mission - managed on GitHub, with everything needed (the R project
  skeleton, the init of git, the init of the project on GitLab, etc.)
- `ac - Create Weekly with GitHub or GitLab`: Generate a weekly/daily
  for a mission

*Documentation dedicated to the team who participates to the
develompment of {lozen}*

- `ba - Create the skeleton of the R project (package, app, book)`
- `bb - Manage git tools (branches, commits, etc.)`
- `bc - Manage GitLab projects`
- `bd - Manage GitHub Projects`
- `be - Initilialise GitLab CI`
- `bf - Create special issues`
- `bg - Deploy on Connect`
- `bh - Deploy on Connect through GitLab CI`
- `bi - Move from GitLab to GitHub`
- `ca - Tools miscellaneous`

## Tokens and environement variables

### As user

#### GitLab user

- Create a personal access token on GitLab, with the rights:
  “read_repository”, “write_repository”, “api”, “read_api”
- Open your `.Renviron` file using `usethis::edit_r_environ()`
- Save the token in this file under the name `GITLAB_TOKEN`, e.g
  `GITLAB_TOKEN=somerandomtokengeneratedingitlab`
- Save the url of your gitlab in this file, if it is not `gitlab.com`,
  the name `GITLAB_URL`, e.g `GITLAB_URL=https://mygitlaburl.com`
- Restart your R session
- Set up your git user email and git user name :

``` r
usethis::use_git_config(scope = "user",
                        user.name = "username", 
                        user.email = "user@email.fr")
```

#### GitHub user

- Create a personal access token on GitHub. Please note that if you wish
  to use the function `gh_create_weekly_old_and_new_boards()` the
  `read:project` scope must be provided with your token.
- Open your `.Renviron` file using `usethis::edit_r_environ()`
- Save the token in this file under the name `GITHUB_PAT`, e.g
  `GITHUB_PAT=somerandomtokengeneratedingithub`
- Restart your R session

#### Posit Connect user

- If you wish to use functions deploying content on Posit Connect, the
  following environment variables must be set.
  - CONNECT_TOKEN: Personal access token of your Posit Connect. Please
    follow the [official
    documentation](https://docs.posit.co/connect/user/api-keys/) to
    create it.
  - CONNECT_USER: Your username in your Posit Connect
  - CONNECT_URL : Url of your Posit Connect
  - CONNECT_NAME: Name of your Posit Connect. To know this information,
    please use `rsconnect::accounts()$server`
- Open your `.Renviron` file using `usethis::edit_r_environ()`
- Set the 4 environment variables in this file
- Restart your R session

### As developer

#### To perform unit tests on GitLab

- Create a personal access token on GitLab, with the rights:
  “read_repository”, “write_repository”, “api”, “read_api”
- Open your `.Renviron` file using `usethis::edit_r_environ()`
- Save the token in this file under the name `GITLAB_TOKEN`, e.g
  `GITLAB_TOKEN=somerandomtokengeneratedingitlab`
- Save the url of your gitlab in this file, if it is not `gitlab.com`,
  the name `GITLAB_URL`, e.g `GITLAB_URL=https://mygitlaburl.com`
- If you wish to test functions performing actions on your Gitlab CI:
  please set up to `TRUE` the env variable `ALLOW_CI_TESTS_ON_GITLAB`
- Restart your R session
- Set up your git user email and git user name :

``` r
usethis::use_git_config(scope = "user",
                        user.name = "username", 
                        user.email = "user@email.fr")
```

Please note that unit tests using `{gert}` might show a prompt asking
for your gitlab username and password. For the latter, you must provide
your gitlab password, not a token.

#### To perform unit tests on GitHub

- Create a personal access token on GitHub. Please note that if you wish
  to test the function `gh_create_weekly_old_and_new_boards()` the
  `read:project` scope must be provided with your token.
- Open your `.Renviron` file using `usethis::edit_r_environ()`
- Save the token in this file under the name `GITHUB_PAT`, e.g
  `GITHUB_PAT=somerandomtokengeneratedingithub`
- Restart your R session

#### To perform unit tests on Posit Connect

- If you wish to test functions deploying content on Posit Connect, the
  following environment variables must be set.
  - CONNECT_TOKEN: Personal access token of your Posit Connect. Please
    follow the [official
    documentation](https://docs.posit.co/connect/user/api-keys/) to
    create it.
  - CONNECT_USER: Your username in your Posit Connect
  - CONNECT_URL : Url of your Posit Connect
  - CONNECT_NAME: Name of your Posit Connect. To know this information,
    please use `rsconnect::accounts()$server`
  - `ALLOW_TESTS_TO_DEPLOY_ON_CONNECT` must be set up to `TRUE`
- Open your `.Renviron` file using `usethis::edit_r_environ()`
- Set the 4 environment variables in this file
- Restart your R session
