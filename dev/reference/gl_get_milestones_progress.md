# Visualise the progress of the milestones for GitLab

Visualise the progress of the milestones for GitLab

## Usage

``` r
gl_get_milestones_progress(
  project_id,
  language = c("fr", "en"),
  gitlab_url = Sys.getenv("GITLAB_URL", unset = "https://gitlab.com"),
  private_token = Sys.getenv("GITLAB_TOKEN"),
  color = "#f15522"
)
```

## Arguments

- project_id:

  Id of the GitLab project

- language:

  Character. Language: 'fr' ou 'en'.

- gitlab_url:

  URL of the GitLab Forge

- private_token:

  Your private GitLab instance token allowed to use the "api".

- color:

  by defaut, warning color

## Value

A ggplot

## Examples

``` r
if (FALSE) { # \dontrun{
gl_get_milestones_progress(
  project_id = "<get_your_id_project>",
  private_token = Sys.getenv("GITLAB_TOKEN")
)
} # }
```
