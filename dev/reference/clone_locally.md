# Clone project locally

Clone project locally

## Usage

``` r
clone_locally(project_name, group_url, full_url, project_path, open = TRUE)
```

## Arguments

- project_name:

  project_name

- group_url:

  group_url

- full_url:

  Full url to the repository. Superseeds group_url and project_name if
  used.

- project_path:

  project_path

- open:

  Logical. Whether to open the RStudio project.

## Value

project_path. Side effect: clone the project.

## Examples

``` r
if (FALSE) { # \dontrun{
project_path <- clone_locally(
  project_name = the_project[["name"]],
  group_url = group_url,
  open = TRUE
)
} # }
```
