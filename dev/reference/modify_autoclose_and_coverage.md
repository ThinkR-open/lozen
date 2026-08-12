# modify_autoclose_and_coverage on GitLab

modify_autoclose_and_coverage on GitLab

## Usage

``` r
modify_autoclose_and_coverage(
  project_id,
  autoclose = FALSE,
  build_coverage_regex = "Coverage: \\d+\\.\\d+"
)
```

## Arguments

- project_id:

  project_id

- autoclose:

  Logical. Whether to autoclose issues when merged to main

- build_coverage_regex:

  Character. regex used to retrieve code coverage in Ci logs.

## Value

Side Effect on GitLab

## Examples

``` r
if (FALSE) { # \dontrun{
modify_autoclose_and_coverage(
  project_id = project_id
)
} # }
```
