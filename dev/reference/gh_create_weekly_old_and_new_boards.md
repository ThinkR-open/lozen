# Create a weekly issues summary for GitHub

Create a weekly issues summary for GitHub

## Usage

``` r
gh_create_weekly_old_and_new_boards(
  date_min,
  date_max,
  user,
  repo,
  board_url,
  new_board = TRUE,
  regex_done = "close|closed|done",
  regex_validation = "a valider|validation",
  regex_blocked = "blocked|bloque|bloqu\\\\u00e9",
  regex_inprogress =
    "in progress|en cours|review|revision|r\\\\u00e9vision|r\\\\u00e9-validation",
  regex_ready = "ready|pret|pr\\\\u00eat",
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

  url of the GitHub board. If using the "classic" board, which is
  deprecated by GitHub, you may want to use this url:
  `glue("/repos/{user}/{repo}/projects")` otherwise you may want to use
  this kind of url:
  `"https://github.com/orgs/myorganization/projects/someprojectnumber/" `
  Please not this not mandatory if you are setting `new_board = FALSE`
  since `board_url` can be guessed from `user` and `repo`

- new_board:

  logical. Are you working with the classic board or the new board.

- regex_done:

  Regular expression to detect labels for issues done by developers (and
  potentially awaiting validation by clients)

- regex_validation:

  Regular expression to detect labels for issues waiting for validation

- regex_blocked:

  Regular expression to detect labels for issues blocked (and
  potentially awaiting information by clients)

- regex_inprogress:

  Regular expression to detect labels for issues in progress (and
  potentially awaiting review by lead dev.)

- regex_ready:

  Regular expression to detect labels for issues ready (and potentially
  reorder by lead dev.)

- github_token:

  token access to github API (read:project scope is required for the new
  github board).

- verbose:

  Logical. Whether to return output in the console too.

## Value

A Weekly to copy-paste in a Wiki and a tibble

## Examples

``` r
if (FALSE) { # \dontrun{
user <- "ThinkR-open"
repo <- "example-weekly"
date_min <- "2022-06-30"
date_max <- "2022-06-30"
board_url_old <- glue::glue("/repos/{user}/{repo}/projects")
board_url_new <- "https://github.com/orgs/ThinkR-open/projects/4/"

# old board
weekly_old <- gh_create_weekly_old_and_new_boards(
  date_min = date_min,
  date_max = date_max,
  user = user,
  repo = repo,
  board_url = board_url_old,
  new_board = FALSE,
  verbose = FALSE
)
cat(weekly_old$weekly_info)

# clipr::write_clip(weekly_old$weekly_info)


# new board
weekly_new <- gh_create_weekly_old_and_new_boards(
  date_min = date_min,
  date_max = date_max,
  user = user,
  repo = repo,
  board_url = board_url_new,
  github_token = Sys.getenv("GITHUB_PAT"),
  new_board = TRUE,
  verbose = FALSE
)
cat(weekly_new$weekly_info)
# clipr::write_clip(weekly_new$weekly_info)
} # }
```
