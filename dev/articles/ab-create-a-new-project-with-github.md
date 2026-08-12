# ab - Create a new project with GitHub

``` r

library(lozen)
```

*This flat file is only used to generate a vignette that explains how to
create a new projet with GitHub*. If you need to modify the functions or
the unit tests, please go to the dedicated flat file.

**Please note that Github-related functions are still a WIP**

## Packages

## Define the name of the principal branch

``` bash
git config --global init.defaultBranch main
```

## Connexion to GitHub

- Create environment variable `GITHUB_PAT` with api token on
  <https://github.com/settings/tokens>
  - Store it in `".Renviron"`
  - [`usethis::edit_r_environ()`](https://usethis.r-lib.org/reference/edit.html)

``` r

github_url <- "https://github.com/my_github_profile/"
```

## Create a new project or use an existing project

### Create a new project

Define:

- The name of the project you want to create in `repo` *(choose it as
  for package name. No special character, only dot if needed)*
- The `owner` of the group where you want to create your project

``` r

project_id <- create_group_project_github(
  owner = "owner",
  repo = "repotocreate"
)
```

### Use an existing project

Define:

- The `owner` of the project you want to use
- The name of the project you want to use in `repo`

``` r

owner <- "owner"
repo <- "existingrepo" # Choose as for package name. No special character, only dot if needed.
```

## Manipulate your project and add everything needed

In this section, you will be able to manipulate your project. You will
be able to create the first skeleton of your product, depending if it is
a package, a Shiny app, etc. You will also be able to manage the GitHub
project: create templates, or add new special issues (first issues,
kick-off issue, etc.).

### Define local installation and clone

This code will clone the GitHub project locally, in a temporary
directory.

``` r

project_path <- clone_locally(
  group_url = paste0("https://github.com/", owner),
  project_name = repo,
  open = TRUE
)
```

### Create R project skeleton

- Choose package / golem or book template

``` r

create_r_project(
  project_path,
  type = c("package"),
  name_licence = "Bob",
  type_licence = usethis::use_mit_license
)

create_r_project(
  project_path,
  type = c("golem"),
  name_licence = "Bob",
  type_licence = usethis::use_mit_license
)

create_r_project(
  project_path,
  type = c("book"),
  name_licence = "Bob",
  type_licence = usethis::use_mit_license
)
```

- If R project was already created you can use

``` r

add_kit_project(
  project_path,
  name_licence = "Test",
  type_licence = usethis::use_mit_license
)
add_kit_package(project_path)
```

### Create weekly

``` r

# The file to create weekly
file.copy(
  from = system.file(
    "doc",
    "ae-create-weekly-with-github-or-gitlab.Rmd",
    package = "lozen"
  ),
  to = file.path(
    project_path,
    "dev",
    "lead_dev_create_weekly.Rmd"
  )
)
```

### Manage a calendar

Use your tools or vignette to manage your calendar for this project.

### Add commit templates

``` r

add_git_templates(project_path, type = c("commit", "mr"), target_dir = ".github")
```

> Tell all devs to run this in their own project
> `gert::git_config_set(repo = project_path, name = "commit.template", value = ".github/template_commit")`

### Add issue templates

An issue template will be added for the issues that will be opened on
your project, based on the `type` param it will be :

- A “light” template
- A “full” template that contains all the information required to
  complete the issues

``` r

gh_add_standard_issue(
  project_path = project_path,
  language = "fr" # you can use "en" instead
)
```

### Add CI log check for Code coverage

``` r

# Find the template you need
usethis::use_github_action_check_standard()
```

### Push to server

``` r

push_main(project_path)
```

### Start *main* and create a *production* branch

``` r

create_production(project_path)
```

## Protect branches

``` r

protect_branches(project_id)
# unprotect if wanted
protect_branches(project_id, unprotect = TRUE)
```

## No autoclose issue and coverage regex

``` r

modify_autoclose_and_coverage(project_id, autoclose = TRUE)
```

## Create the board

### Add missing labels

``` r

# add_labels(project_id)
```

### Create the board

This code prepares the *board* for the *issues*

``` r

add_board_github(owner, repo)
```

## Create the wiki pages

This will create a wiki for your project.

``` r

add_wikis_github(owner, repo)
```

## Add some special issues in the board

### Add the first issue for the client

``` r

add_issue_clients_github(
  owner = owner,
  repo = repo
)
```

### Add the issue that will be shown during the kick-off

``` r

add_issue_kickoff_github(
  owner = owner,
  repo = repo
)
```

### Add the todo for the Lead Dev

``` r

add_issue_dev_github(
  owner = owner,
  repo = repo
)
```
