# clean image

Manage image in yaml

## Usage

``` r
clean_image(ci)
```

## Arguments

- ci:

  List of CI parameters, imported from yaml file

## Value

list the list of CI parameters with a unique docker image

## Examples

``` r
# pkgdown yml
full <- yaml::read_yaml(file = system.file("yaml", ".gitlab-ci-pkg.yml", package = "lozen"))

# shiny yaml
connect <- yaml::read_yaml(file = system.file("yaml", ".gitlab-ci-shiny.yml", package = "lozen"))

ci_list <- combine_ci(ci1 = full, ci2 = connect)
ci_list <- clean_image(ci_list)
```
