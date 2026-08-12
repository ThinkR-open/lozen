# ac - Create the skeleton of the R project (package, app, book)

``` r

library(lozen)
```

## `create_r_project()`: Create a R project with full content skeleton

``` r

#' \dontrun{
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
#' }
```

## Transform project as book with lozen template with `create_book_project()`

``` r

withr::with_tempdir({
  project_path <- getwd()
  create_book_project(project_path)
})
```

## `add_kit_project()`: Add necessary files for any R project

``` r

withr::with_tempdir({
  project_path <- getwd()
  usethis::create_project(path = project_path, open = FALSE)
  add_kit_project(
    project_path,
    name_licence = "Bob",
    type_licence = usethis::use_proprietary_license
  )
})
```

## `add_kit_package()`: Add files necessary for a package, including {golem}

``` r

withr::with_tempdir({
  project_path <- getwd()
  usethis::create_package(path = project_path, open = FALSE)
  add_kit_package(project_path, type = c("package", "book", "renv"))
})
```

## Add files to buildignore : `add_build_ignore()`

## Add files to gitignore : `add_git_ignore()`

## Use a dev history file

[`use_dev_history()`](https://thinkr-open.github.io/lozen/dev/reference/use_dev_history.md)
creates `dev_history.Rmd` files:

- “dev_history_package”: Instructions to create and develop a R package
- “dev_history_renv”: Instructions to init renv

This function will put the file into your “dev” folder.

``` r

withr::with_tempdir({
  use_dev_history(path = ".", type = c("package", "book", "renv"))
})
```
