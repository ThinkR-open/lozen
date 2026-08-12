# Add necessary files for any R project

Add necessary files for any R project

## Usage

``` r
add_kit_project(project_path = ".", name_licence, type_licence)
```

## Arguments

- project_path:

  project_path

- name_licence:

  Name for the licence

- type_licence:

  should be a function, example : type_licence =
  usethis::use_proprietary_license

## Value

Side Effect, add new files :

- gitattributes

- NEWS.md

## Examples

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
#> ✔ Setting active project to "/tmp/RtmprJwyrI/file1caab217844".
#> ✔ Creating R/.
#> ✔ Writing a sentinel file .here.
#> ☐ Build robust paths within your project via `here::here()`.
#> ℹ Learn more at <https://here.r-lib.org>.
#> ✔ Setting active project to "<no active project>".
#> ✔ Setting active project to "/tmp/RtmprJwyrI/file1caab217844".
#> ✔ Writing LICENSE.
#> ✔ Writing NEWS.md.
#> ✔ Setting active project to "<no active project>".
#> Kit project created
```
