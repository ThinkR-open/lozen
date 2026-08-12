# Create issue content for devs

Generate text for devs first issue in gitlab

## Usage

``` r
create_issue_content_dev(project_id, group_url, project_name)
```

## Arguments

- project_id:

  project_id

- group_url:

  group_url

- project_name:

  project_name

## Value

character vector of the issue content

## Examples

``` r
if (FALSE) { # \dontrun{
create_issue_content_dev(
  project_id = "<get_your_id_project>",
  project_name = "<get_your_project_name>",
  group_url = "<group_url_repo>" # should looks like "https://gitlab.com/cervan.girard/"
)
} # }
```
