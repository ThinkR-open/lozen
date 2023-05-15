<!-- README.md is generated from README.Rmd. Please edit that file -->

# {lozen} <img src="man/figures/logo.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![R build
status](https://forge.thinkr.fr/thinkr/thinkrverse/lozen/badges/main/pipeline.svg)](https://forge.thinkr.fr/thinkr/thinkrverse/lozen/-/pipelines)
[![coverage
report](https://forge.thinkr.fr/thinkr/thinkrverse/lozen/badges/main/coverage.svg)]()
<!-- badges: end -->

The objective of {lozen} is to centralize project management tools for
Devs and Lead Devs.

## Installation

### Tokens

#### GitLab

- Create a personal access token on GitLab, with the rights:
  “read_repository”, “write_repository”, “api”, “read_api”
- Save the token in your `.Renviron` under the name `GITLAB_TOKEN`
- Save the url of your gitlab, if it is not `gitlab.com`, in your
  `.Renviron` under the name `GITLAB_URL`
- Set up your git user email and git user name:

``` r
usethis::use_git_config(scope = "user",
                        user.name = "username", 
                        user.email = "user@email.fr")
```

#### GitHub

- Create a personal access token on GitHub
- Save the token in your `.Renviron` under the name `GITHUB_PAT`

### Installation

``` r
options(remotes.git_credentials =
          git2r::cred_user_pass("gitlab-ci-token", Sys.getenv("GITLAB_TOKEN")))

remotes::install_git(
  url = "https://forge.thinkr.fr/thinkr/thinkrverse/lozen", 
  ref = "production",
  build_vignettes = TRUE,
  upgrade = "never")
```

## Documentation

### Package website

Access to the pkgdown deployed on Connect:
<https://connect2.thinkr.fr/connect/lozen-pkgdown-website/>

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

## As developper

Please visit the folder dev, you will find a readme that will explain
you how to set up env var to developp {lozen}
