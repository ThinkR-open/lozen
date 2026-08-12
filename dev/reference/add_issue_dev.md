# Create issue for developers to initiate the project

Create issue for developers to initiate the project

## Usage

``` r
add_issue_dev(project_id, project_name, group_url)
```

## Arguments

- project_id:

  project_id

- project_name:

  project_name

- group_url:

  group_url

## Value

Side effect: new issue on GitLab

## Examples

``` r
# exemple nécessite des opérations sur gitlab : à voir
if (FALSE) { # \dontrun{
add_issue_dev(
  project_id = "<get_your_id_project>",
  project_name = "<get_your_project_name>",
  group_url = "<group_url_repo>" # should looks like "https://gitlab.com/cervan.girard/"
)
} # }
```
