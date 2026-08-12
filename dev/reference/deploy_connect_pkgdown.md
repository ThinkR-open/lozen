# deploy_connect_pkgdown

Before using it, please follow these steps :

## Usage

``` r
deploy_connect_pkgdown(
  connect_url = Sys.getenv("CONNECT_URL"),
  connect_user = Sys.getenv("CONNECT_USER"),
  connect_api_token = Sys.getenv("CONNECT_TOKEN"),
  app_name = NULL,
  deploy_dir = c(file.path(getwd(), "public"), file.path(getwd(), "docs"),
    file.path(getwd(), "inst/site/"), file.path(getwd(), ".")),
  connect_name = Sys.getenv("CONNECT_NAME", unset = "connect"),
  file_to_ignore_regex =
    ".Rprofile$|^.Renviron$|renv/|rstudio_.*/|deliverables/|dev/|data-raw/|dockerfiles/",
  forceUpdate = FALSE,
  lint = FALSE,
  app_primary_doc = "index.html",
  ...
)
```

## Arguments

- connect_url:

  URL of the Connect server

- connect_user:

  User name to use to connect to the Connect server

- connect_api_token:

  API token to use to connect to the Connect server

- app_name:

  Name of the app to deploy

- deploy_dir:

  vectoro Directory path to deploy, the first available with be used.
  default is c(file.path(getwd(), "public"), file.path(getwd(), "docs"),
  file.path(getwd(), "inst/site/"), file.path(getwd(), ".") )

- connect_name:

  Name of the Connect server

- file_to_ignore_regex:

  Regex to use to ignore files

- forceUpdate:

  What should happen if there's no deployment record for the app, but
  there's an app with the same name on the server? If `TRUE`, will
  always update the previously-deployed app. If `FALSE`, will ask the
  user what to do, or fail if not in an interactive context.

  Defaults to `TRUE` when called automatically by the IDE, and `FALSE`
  otherwise. You can override the default by setting option
  `rsconnect.force.update.apps`.

- lint:

  Lint the project before initiating deployment, to identify potentially
  problematic code?

- app_primary_doc:

  If the application contains more than one document, this parameter
  indicates the primary one, as a path relative to appDir. Can be NULL,
  in which case the primary document is inferred from the contents being
  deployed.

- ...:

  Other arguments to pass to rsconnect::deployApp

## Value

used for side effects

## Details

- Ask the Mission Lead Dev for their deployment token on Connect, this
  is the one you will need to use.

- Add the environment variables to your personal ".Renviron" to manually
  deploy to Connect:

  - Add `CONNECT_USER` with username.

  - Add `CONNECT_TOKEN` with the token.

  - Add `CONNECT_URL` with the connect url

TODO

## Examples

``` r
if (FALSE) { # \dontrun{
# We assume that you are working on a R package
# if not done yet, create your pkgdown
pkgdown::build_site(
  pkg = ".",
  override = list(destination = "inst/site/")
)
if (Sys.getenv("CONNECT_URL") != "" &
  Sys.getenv("CONNECT_USER") != "" &
  Sys.getenv("CONNECT_TOKEN") != "") {
  deploy_connect_pkgdown(
    app_name = "titi",
    deploy_dir = file.path(project_path, "inst/site/")
  )
}
} # }
```
