# Create issue content for client

Generate text for client first issue in gitlab

## Usage

``` r
create_issue_content_clients(project_name, group_url)
```

## Arguments

- project_name:

  name of the project

- group_url:

  url to gitlab website

## Value

character vector of the issue content

## Examples

``` r
if (FALSE) { # \dontrun{
create_issue_content_clients(
  project_name = "<get_your_project_name>",
  group_url = "<group_url_repo>" # should looks like "https://gitlab.com/cervan.girard/"
)
} # }
```
