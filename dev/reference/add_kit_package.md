# Add files necessary for a package, including golem

Add files necessary for a package, including golem

## Usage

``` r
add_kit_package(
  project_path = ".",
  type = c("package", "renv"),
  pkgdown_yml = NULL
)
```

## Arguments

- project_path:

  project_path

- type:

  Type of dev_history. Multiple types possible among "package", "book",
  "renv".

- pkgdown_yml:

  path to yaml conf for pkgdown

## Value

Side Effect, add new files :

- dev/dev_history

- templates for pkgdown if pkgodwn_yml is not null

- testthat

## Examples

``` r
withr::with_tempdir({
  project_path <- getwd()
  usethis::create_package(path = project_path, open = FALSE)
  add_kit_package(project_path, type = c("package", "book", "renv"))
})
#> ✔ Setting active project to "/tmp/RtmpZIpE1u/file19612fa56d".
#> ✔ Creating R/.
#> ✔ Writing DESCRIPTION.
#> Package: file19612fa56d
#> Title: What the Package Does (One Line, Title Case)
#> Version: 0.0.0.9000
#> Authors@R (parsed):
#>     * First Last <first.last@example.com> [aut, cre]
#> Description: What the package does (one paragraph).
#> License: `use_mit_license()`, `use_gpl3_license()` or friends to
#>     pick a license
#> Encoding: UTF-8
#> Roxygen: list(markdown = TRUE)
#> RoxygenNote: 8.1.0
#> ✔ Writing NAMESPACE.
#> ✔ Setting active project to "<no active project>".
#> ✔ Setting active project to "/tmp/RtmpZIpE1u/file19612fa56d".
#> ✔ Adding testthat to Suggests field in DESCRIPTION.
#> ✔ Adding "3" to Config/testthat/edition.
#> ✔ Creating tests/testthat/.
#> ✔ Writing tests/testthat.R.
#> ☐ Call `usethis::use_test()` to initialize a basic test file and open it for
#>   editing.
#> ✔ Writing tests/testthat/test-start.R.
#> ☐ Edit tests/testthat/test-start.R.
#> ✔ Setting active project to "<no active project>".
#> Kit package created
#> [1] "/tmp/RtmpZIpE1u/file19612fa56d"
```
