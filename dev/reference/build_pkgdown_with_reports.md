# Build a pkgdown with extra reports tab for testdown and coverage output

Build a pkgdown with extra reports tab for testdown and coverage output

## Usage

``` r
build_pkgdown_with_reports(
  pkg = ".",
  pkgdown_path = "public",
  assets_path = "pkgdown/assets",
  reports = c("coverage", "testdown", "gitdown"),
  git_branch_ref = "main",
  overwrite_assets = TRUE
)
```

## Arguments

- pkg:

  character The path to the package to be build and reported

- pkgdown_path:

  character The relative path inside the package to store the final site

- assets_path:

  character The relative path within the package to store the reports
  outputs

- reports:

  character A vector of reports to be produced, can be any subset of
  `c("testdown","coverage")`

- git_branch_ref:

  character A vector of the git branch to use, 'main' by default

- overwrite_assets:

  logical Whether the assets directory to store reports should be
  overwritten

## Value

None Generate a pkgdown with test and coverage reports

## Examples

``` r
if (FALSE) { # \dontrun{
# build_pkgdown_with_reports(
#    pkg = ".",
#    pkgdown_path = "public",
#    assets_path = "pkgdown/assets",
#    reports = c("testdown","coverage")
} # }
```
