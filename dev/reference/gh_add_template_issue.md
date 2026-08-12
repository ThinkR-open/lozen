# Create the template for standard issue on gitlab

Create the template for standard issue on gitlab

## Usage

``` r
gh_add_template_issue(
  project_path = ".",
  language = c("fr", "en"),
  type = c("full", "light")
)
```

## Arguments

- project_path:

  Path to the project

- language:

  Language. Should be one of 'fr' or 'en'

- type:

  Verbosity of comments in the template. Should be 'full' or 'light'.

## Value

Side effect: create the template

## Examples

``` r
# Try with a temp project
## Create temp dir and file
project_path <- tempfile("myproject")
dir.create(project_path)

## Add the full template in french
gh_add_template_issue(project_path, language = "fr", type = "full")
#> Issue template added, find it when creating a new issue on the graphical interface

## Add the full template in english
gh_add_template_issue(project_path, language = "en", type = "full")
#> Issue template added, find it when creating a new issue on the graphical interface

## Add the light template in french
gh_add_template_issue(project_path, language = "fr", type = "light")
#> Issue template added, find it when creating a new issue on the graphical interface

## Add the light template in english
gh_add_template_issue(project_path, language = "en", type = "light")
#> Issue template added, find it when creating a new issue on the graphical interface

# suppress tmp folder
unlink(project_path, recursive = TRUE)
```
