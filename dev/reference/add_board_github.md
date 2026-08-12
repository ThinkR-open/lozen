# add_board_github

add_board_github

## Usage

``` r
add_board_github(
  owner,
  repo,
  columns = c("Open", "Blocked", "Meta", "Ready", "In Progress", "Review", "Validation")
)
```

## Arguments

- owner:

  Owner of the repository

- repo:

  Repository name

- columns:

  Names of columns to create in the Board

## Examples

``` r
if (FALSE) { # \dontrun{
add_board_github(
  owner = "ghowner",
  repo = "areponame"
)
} # }
```
