# Create a weekly issues summary for GitHub

Create a weekly issues summary for GitHub

## Usage

``` r
gh_create_weekly(
  date_min = Sys.Date() - 7,
  date_max = Sys.Date(),
  user = "thinkr-open",
  repo = "fusen",
  verbose = FALSE,
  board_url
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

- verbose:

  Logical. Whether to return output in the console too.

- board_url:

  url of the GitHub board. If using the "classic" board, which is
  deprecated by GitHub, you may want to use this url:
  `glue("/repos/{user}/{repo}/projects")`

## Value

A Weekly to copy-paste in a Wiki and a tibble

## Examples

``` r
if (FALSE) { # \dontrun{
if (Sys.getenv("GITHUB_PAT") != "") {
  user <- "ThinkR-open"
  repo <- "example-weekly"
  weekly <- gh_create_weekly(
    date_min = "2022-06-30",
    date_max = "2022-06-30",
    user = user,
    repo = repo,
    board_url = glue::glue("/repos/{user}/{repo}/projects")
  )
}
} # }
# Copier dans le presse papier pour copier directement
# clipr::write_clip(weekly$weekly_info)
```
