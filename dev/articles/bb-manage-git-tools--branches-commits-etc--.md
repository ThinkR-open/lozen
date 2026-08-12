# bb - Manage git tools (branches, commits, etc.)

``` r

library(lozen)
```

## Define local installation and clone

This code will clone the GitLab project locally, in a temporary
directory.

``` r

project_path <- clone_locally(
  project_name = the_project[["name"]],
  group_url = group_url,
  open = FALSE
)
```

## Push to server

``` r

push_main(
  project_path = project_path
)
```

## Create a *production* branch

``` r

create_production(
  project_path = project_path
)
```

## Protect branches

``` r

protect_branches(
  project_id = project_id
)
```

## No autoclose issue and coverage regex

``` r

modify_autoclose_and_coverage(
  project_id = project_id
)
```

## Add commit templates

``` r

add_git_templates(
  project_path = project_path,
  type = c("commit", "mr")
)
```

> Tell all devs to run this in their own project
> `gert::git_config_set(repo = project_path, name = "commit.template", value = ".gitlab/template_commit")`

## Add issues templates

2 templates will be added for the issues that will be opened on your
project:

- A “light” template
- A “full” template that contains all the information required to
  complete the issues

``` r

gl_add_template_issue(
  project_path = project_path,
  language = "fr" # you can use "en" instead
)
```
