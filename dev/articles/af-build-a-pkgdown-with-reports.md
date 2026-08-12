# af - Build a pkgdown with reports

``` r

library(lozen)
```

## `build_pkgdown_with_reports()` : build a pkgdown with coverage and test reports

This function will generate the pkgdown of the current package using
[pkgdown](https://pkgdown.r-lib.org/), together with the
[covr](https://covr.r-lib.org) and
[testdown](https://github.com/thinkr-open/testdown) reports. These
reports will be embedded inside the pkgdown and accessible through the
navigation bar. It requires the functions
[`covr::report()`](http://covr.r-lib.org/reference/report.md),
[`testdown::test_down`](https://rdrr.io/pkg/testdown/man/test_down.html),
[`gitdown::git_down`](https://thinkr-open.github.io/gitdown/reference/git_down.html)
that are suggested package imports from `{lozen}`.

``` r

#' \dontrun{
# build_pkgdown_with_reports(
#    pkg = ".",
#    pkgdown_path = "public",
#    assets_path = "pkgdown/assets",
#    reports = c("testdown","coverage")
#' }
```
