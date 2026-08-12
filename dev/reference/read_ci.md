# read_ci

Import yaml CI files as list

## Usage

``` r
read_ci(path = "./.gitlab-ci.yml")
```

## Arguments

- path:

  Path to the yaml file

## Value

list a list of all CI parameters

## Examples

``` r
yaml_path <- system.file("yaml", ".gitlab-ci-shiny.yml", package = "lozen")
ci_list <- read_ci(path = yaml_path)
```
