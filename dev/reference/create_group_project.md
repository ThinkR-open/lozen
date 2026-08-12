# Create new project in a group

Create new project in a group

## Usage

``` r
create_group_project(
  project_name,
  namespace_id,
  gitlab_con = "default",
  default_branch = "main"
)
```

## Arguments

- project_name:

  name of the project to create

- namespace_id:

  id of the group in which to add the project

- gitlab_con:

  Connection credentials to GitLab. Better use `set_gitlab_connection()`
  before this function

- default_branch:

  Default branch for the project created. Default to "main".

## Value

project_id. Side effect: Create a project on GitLab if not exists.

## Examples

``` r
if (FALSE) { # \dontrun{
create_group_project(
  project_name = project_name,
  namespace_id = namespace_id,
  default_branch = "main"
)
} # }
```
