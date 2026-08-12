# Protect 'main' and 'production' from push on server

Protect 'main' and 'production' from push on server

## Usage

``` r
protect_branches(project_id, unprotect = FALSE)
```

## Arguments

- project_id:

  project_id

- unprotect:

  Logical. Whether to unprotect branches or not.

## Value

Side effect: Branches protected from push on server.

## Examples

``` r
if (FALSE) { # \dontrun{
protect_branches(
  project_id = project_id
)
# unprotect if wanted
# protect_branches(project_id, unprotect = TRUE)
} # }
```
