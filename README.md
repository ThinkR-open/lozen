
- <a href="#installation" id="toc-installation">Installation</a>
- <a href="#use-of-the-package-depending-if-you-are-a-user-or-a-developer"
  id="toc-use-of-the-package-depending-if-you-are-a-user-or-a-developer">Use
  of the package, depending if you are a user or a developer</a>
  - <a href="#use-lozen-as-user" id="toc-use-lozen-as-user">Use {lozen} as
    user</a>
  - <a href="#use-lozen-as-developer" id="toc-use-lozen-as-developer">Use
    {lozen} as developer</a>
  - <a
    href="#more-details-about-how-to-create-tokens-and-define-environment-variables"
    id="toc-more-details-about-how-to-create-tokens-and-define-environment-variables">More
    details about how to create tokens and define environment variables</a>
- <a href="#documentation" id="toc-documentation">Documentation</a>

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

To use the package, as user or as developer, you will have to define
some tokens and environment variables. Go to the dedicated section below
“Use {lozen} as user” or “Use {lozen} as developer”.

# Installation

``` r
remotes::install_github(
  repo = "ThinkR-open/lozen",
  ref = "main",
  build_vignettes = TRUE,
  upgrade = "never")
```

# Use of the package, depending if you are a user or a developer

## Use {lozen} as user

You need to use this kind of `.Renviron` file:

    GITLAB_TOKEN="my.token.generated.in.gitlab"
    GITLAB_URL="my.gitlab.url"
    GITHUB_PAT="my.personal.access.token.generated.in.github"
    CONNECT_URL="my.connect.url"
    CONNECT_NAME="my.connect.server.name"
    CONNECT_USER="my.connect.username"
    CONNECT_TOKEN="my.api.key.generated.in.connect"

You can use the command line `usethis::edit_r_environ()` to open a
`.Renviron` file. Save the values inside as mentioned above, and restart
your R session.

Depending on your needs, you will have to set all of them (GitLab,
GitHub and Posit Connect), or just some of them. See the details
sections below to have more information about how to create them.

## Use {lozen} as developer

**Note that unit tests will create and publish some elements on your own
instances (GitLab, GitHub, Posit Connect).** These objects will be
automatically deleted at the end of the tests.

You need to use this kind of `.Renviron` file:

    GITLAB_TOKEN="my.token.generated.in.gitlab"
    GITLAB_URL="my.gitlab.url"
    ALLOW_CI_TESTS_ON_GITLAB="TRUE"
    GITHUB_PAT="my.personal.access.token.generated.in.github"
    CONNECT_URL="my.connect.url"
    CONNECT_NAME="my.connect.server.name"
    CONNECT_USER="my.connect.username"
    CONNECT_TOKEN="my.api.key.generated.in.connect"
    ALLOW_TESTS_TO_DEPLOY_ON_CONNECT="TRUE"

You can use the command line `usethis::edit_r_environ()` to open a
`.Renviron` file. Save the values inside as mentioned above, and restart
your R session.

You will have to set all of them (GitLab, GitHub and Posit Connect), to
be sure all unit tests can be launched. See the details sections below
to have more information about how to create them.

Please note that unit tests using `{gert}` might show a prompt asking
for your gitlab username and password. For the latter, you must provide
your gitlab password, not a token.

## More details about how to create tokens and define environment variables

### GitLab

- `GITLAB_TOKEN`: Create a personal access token on GitLab, with the
  rights: “read_repository”, “write_repository”, “api”, “read_api”
- `GITLAB_URL`: url of your gitlab instance - if this is `gitlab.com`,
  you do not have to specify it, because this is the default value used
  by the package

### GitHub

- `GITHUB_PAT`: Create a personal access token on GitHub - please note
  that if you wish to use the function
  `gh_create_weekly_old_and_new_boards()` the `read:project` scope must
  be provided with your token

### Posit Connect

- `CONNECT_URL`: Url of your Posit Connect
- `CONNECT_NAME`: Name of your Posit Connect server - to know this
  information, please use `rsconnect::accounts()$server`
- `CONNECT_USER`: Your username in your Posit Connect
- `CONNECT_TOKEN`: Personal access token of your Posit Connect - please
  follow the [official
  documentation](https://docs.posit.co/connect/user/api-keys/) to create
  it

# Documentation

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
