# Define project status for a user

Define project status for a user

## Usage

``` r
project_options(project_id, level = "watch")
```

## Arguments

- project_id:

  project_id

- level:

  The notification levels among disabled, participating, watch, global,
  mention, custom

## Value

Side Effect on GitLab, allow reception of notifications.

## Examples

``` r
if (FALSE) { # \dontrun{
project_options(
  project_id,
  level = "watch"
)
} # }
```
