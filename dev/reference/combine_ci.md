# combine CI

Merge two yaml as a list into a combined list

## Usage

``` r
combine_ci(ci1, ci2)
```

## Arguments

- ci1:

  List of initial CI parameters

- ci2:

  List of CI parameters to append to the initial CI

## Value

list list of combined CI parameters

## Examples

``` r
# pkgdown yml
full <- yaml::read_yaml(file = system.file("yaml", ".gitlab-ci-pkg.yml", package = "lozen"))

# shiny yaml
connect <- yaml::read_yaml(file = system.file("yaml", ".gitlab-ci-shiny.yml", package = "lozen"))

ci_list <- combine_ci(ci1 = full, ci2 = connect)
```
