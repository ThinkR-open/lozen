# Create a Weekly/Daily summary of what happened in your GitLab Board

Create a Weekly/Daily summary of what happened in your GitLab Board

## Usage

``` r
gl_create_weekly(
  project_id,
  date_min = Sys.Date() - 7,
  date_max = Sys.Date(),
  language = c("fr", "en"),
  gitlab_url = Sys.getenv("GITLAB_URL", unset = "https://gitlab.com"),
  private_token = Sys.getenv("GITLAB_TOKEN"),
  verbose = FALSE,
  regex_done = "close|closed|done",
  regex_validation = "a valider|validation",
  regex_blocked = "blocked|bloque|bloqu\\\\u00e9",
  regex_inprogress =
    "in progress|en cours|review|revision|r\\\\u00e9vision|r\\\\u00e9-validation",
  regex_ready = "ready|pret|pr\\\\u00eat",
  daily = FALSE,
  date_daily = Sys.Date(),
  max_page_opened = 10,
  max_page_closed = 5
)

gl_create_daily(...)
```

## Arguments

- project_id:

  Id of the GitLab project

- date_min:

  Minimal date to search from. The oldest date.

- date_max:

  Maximal date to search to. The more recent date.

- language:

  Character. Language: 'fr' ou 'en'.

- gitlab_url:

  URL of the GitLab Forge

- private_token:

  Your private GitLab instance token allowed to use the "api".

- verbose:

  Logical. Whether to show the outputs in the console.

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

- daily:

  Logical. Create the daily issues summary for GitLab

- date_daily:

  Date to search from.

- max_page_opened:

  a numeric. The maximum number of pages to retrieve for open issues.
  Defaults to 10.

- max_page_closed:

  a numeric. The maximum number of pages to retrieve for close issues.
  Defaults to 5.

- ...:

  Additional arguments

## Value

A Weekly to copy-paste in a Wiki and a tibble
