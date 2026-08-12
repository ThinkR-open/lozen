# Create a weekly issues summary for GitHub (new board)

Create a weekly issues summary for GitHub (new board)

## Usage

``` r
gh_create_weekly_new_projects_board(
  date_min,
  date_max,
  user,
  repo,
  board_url,
  github_token = Sys.getenv("GITHUB_PAT"),
  verbose = FALSE
)
```

## Arguments

- date_min:

  Minimal date to look for issues

- date_max:

  Maximal date to look for issues

- user:

  username or company name as shown on GitHub

- repo:

  GitHub repository

- board_url:

  url of the GitHub board.

- github_token:

  token access to graphQL API

- verbose:

  Logical. Whether to return output in the console too.

## Value

A Weekly to copy-paste in a Wiki and a tibble

## Examples

``` r
if (FALSE) { # \dontrun{
board_url <- "https://github.com/orgs/ThinkR-open/projects/4/"
date_min <- "2022-06-30"
date_max <- "2022-06-30"
user <- "ThinkR-open"
repo <- "example-weekly"

if (Sys.getenv("GITHUB_PAT") != "") {
  weekly <- gh_create_weekly_new_projects_board(
    date_min = date_min,
    date_max = date_max,
    user = user,
    repo = repo,
    board_url = board_url,
    github_token = Sys.getenv("GITHUB_PAT"),
    verbose = FALSE
  )
}
} # }
# Copier dans le presse papier pour copier directement
# clipr::write_clip(weekly$weekly_info)
```
