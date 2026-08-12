# Add First issue client for GitLab

Add First issue client for GitLab

## Usage

``` r
add_issue_clients(project_id, project_name, group_url)
```

## Arguments

- project_id:

  project_id

- project_name:

  project_name

- group_url:

  group_url

## Value

A tibble with the issue added and GitLab infos

## Examples

``` r
if (FALSE) { # \dontrun{
add_issue_clients(
  project_id = "<get_your_id_project>",
  project_name = "<get_your_project_name>",
  group_url = "<group_url_repo>" # should looks like "https://gitlab.com/cervan.girard/"
)
} # }
```
