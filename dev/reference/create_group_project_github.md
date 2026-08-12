# Create new project on GitHub

Create new project on GitHub

## Usage

``` r
create_group_project_github(repo, owner)
```

## Arguments

- repo:

  name of the project to create

- owner:

  Owner of the repo

## Value

project_id. Side effect: Create a project on GitHub if not exists.

## Examples

``` r
if (FALSE) { # \dontrun{
create_group_project_github(
  repo = "areponame",
  owner = "ghowner"
)
} # }
```
