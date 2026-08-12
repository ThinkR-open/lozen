# Visualise the nature of the developments (conventional commits)

Visualise the nature of the developments (conventional commits)

## Usage

``` r
visualise_commits(
  project_id,
  gitlab_url = Sys.getenv("GITLAB_URL", unset = "https://gitlab.com"),
  private_token = Sys.getenv("GITLAB_TOKEN"),
  path,
  ref = NULL,
  date_min = Sys.Date() - 7,
  date_max = Sys.Date(),
  language = c("fr", "en"),
  conv_tags = c("feat", "fix", "doc", "test", "ci", "refactor", "style", "chore"),
  color = "#15b7d6"
)
```

## Arguments

- project_id:

  Id of the GitLab project

- gitlab_url:

  URL of the GitLab Forge

- private_token:

  Your private GitLab instance token allowed to use the "api".

- path:

  Path of the project if already pulled locally

- ref:

  Branch name (or commit sha) from which to explore commits. By default
  NULL, it use the default branch

- date_min:

  Minimal date to search from. The oldest date.

- date_max:

  Maximal date to search to. The more recent date.

- language:

  Character. Language: 'fr' ou 'en'.

- conv_tags:

  Conventional commits tags

- color:

  blue color for a graph

## Value

A ggplot

## Examples

``` r
if (FALSE) { # \dontrun{

visualise_commits(
  project_id = "<get_your_id_project>",
  gitlab_url = Sys.getenv("GITLAB_URL", unset = "https://gitlab.com"),
  date_min = "2022-09-22",
  date_max = "2022-09-29",
  private_token = Sys.getenv("GITLAB_TOKEN")
)

# Or on project already cloned
tempdir <-
  clone_locally(full_url = "https://gitlab.com/my_name/my_repo", open = FALSE)

visualise_commits(
  path = tempdir,
  date_min = "2022-09-22",
  date_max = "2022-09-29"
)
} # }
```
