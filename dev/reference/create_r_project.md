# Create a R project with full content skeleton

Create a R project with full content skeleton

## Usage

``` r
create_r_project(
  project_path,
  type = c("package", "golem", "book"),
  name_licence,
  type_licence
)
```

## Arguments

- project_path:

  project_path

- type:

  type

- name_licence:

  name for the licence

- type_licence:

  type of the licence, should be a function like
  usethis::use_mit_licence

## Value

Side Effect: Transform project as package or book:

- With package, golem or book skeleton

- git necessary files

- pkgdown or book template

- GitLab CI

## Examples

``` r
if (FALSE) { # \dontrun{
# path to your local project
project_path <- tempfile("my.local.project")

### R package skeleton
create_r_project(
  project_path = project_path,
  type = c("package"),
  name_licence = "Bob",
  type_licence = usethis::use_proprietary_license
)

### Shiny app
create_r_project(
  project_path = project_path,
  type = c("golem"),
  name_licence = "Bob",
  type_licence = usethis::use_proprietary_license
)

### Bookdown
create_r_project(
  project_path = project_path,
  type = c("book"),
  name_licence = "Bob",
  type_licence = usethis::use_proprietary_license
)
} # }
```
