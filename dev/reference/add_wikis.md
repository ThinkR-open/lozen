# Add Wiki

Add Wiki

## Usage

``` r
add_wikis(
  project_id,
  project_name,
  group_url,
  group = basename(group_url),
  type = c("home", "cr", "keys")
)
```

## Arguments

- project_id:

  project_id

- project_name:

  project_name

- group_url:

  group_url

- group:

  group

- type:

  type

## Value

Tibble with wikis and GitLab infos.

## Details

Types:

- home: Home Page

- cr: Comptes-rendus

- keys: Key dates of the project

## Examples

``` r
if (FALSE) { # \dontrun{
add_wikis(
  project_id = project_id,
  project_name = project_name,
  group_url = group_url,
  group = basename(group_url)
)
} # }
```
