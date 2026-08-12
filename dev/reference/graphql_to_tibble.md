# Query GraphQL Github API

This function helps you retrieving the status of a project board within
the organization

## Usage

``` r
graphql_to_tibble(board_url, github_token = Sys.getenv("GITHUB_PAT"))
```

## Arguments

- board_url:

  url of the github project board

- github_token:

  access token to the graphql api

## Value

a tibble

## Examples

``` r
if (FALSE) { # \dontrun{

# Example with board hosted in an organization github account
board_url_organization <- "https://github.com/orgs/ThinkR-open/projects/4/"
github_token <- Sys.getenv("GITHUB_PAT")

graphql_to_tibble(
  board_url = board_url_organization,
  github_token = github_token
)


# Example with board hosted in a user github account
board_url_user <- "https://github.com/users/the-thinkr/projects/1"
github_token <- Sys.getenv("GITHUB_PAT")

graphql_to_tibble(
  board_url = board_url_user,
  github_token = github_token
)
} # }
```
