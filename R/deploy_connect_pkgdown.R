# WARNING - Generated by {fusen} from dev/flat_deploy_connect.Rmd: do not edit by hand

#' deploy_connect_pkgdown
#'
#' Before using it, please follow these steps :
#'
#' - Ask the Mission Lead Dev for their deployment token on Connect, this is the one you will need to use.
#'
#' - Add the environment variables to your personal ".Renviron" to manually deploy to Connect:
#'   + Add `CONNECT_USER` with username.
#'   + Add `CONNECT_TOKEN` with the token.
#'   + Add `CONNECT_URL` with the connect url
#'
#'
#' @return used for side effects
#'
#' @param connect_url URL of the Connect server
#' @param connect_user User name to use to connect to the Connect server
#' @param connect_api_token API token to use to connect to the Connect server
#' @param app_name Name of the app to deploy
#' @param deploy_dir vectoro Directory path to deploy, the first available with be used.
#' default is c(file.path(getwd(), "public"),
#' file.path(getwd(), "docs"),
#' file.path(getwd(), "inst/site/"),
#' file.path(getwd(), ".")   )
#' @param connect_name Name of the Connect server
#' @param file_to_ignore_regex Regex to use to ignore files
#' @param app_primary_doc If the application contains more than one document,
#'  this parameter indicates the primary one, as a path relative to appDir.
#'  Can be NULL, in which case the primary document is inferred from the
#'  contents being deployed.
#' @param ... Other arguments to pass to rsconnect::deployApp
#' @inheritParams rsconnect::deployApp
#'
#' @details
#' TODO
#'
#' @export
#' @examples
#' \dontrun{
#' # We assume that you are working on a R package
#' # if not done yet, create your pkgdown
#' pkgdown::build_site(
#'   pkg = ".",
#'   override = list(destination = "inst/site/")
#' )
#' if (Sys.getenv("CONNECT_URL") != "" &
#'   Sys.getenv("CONNECT_USER") != "" &
#'   Sys.getenv("CONNECT_TOKEN") != "") {
#'   deploy_connect_pkgdown(
#'     app_name = "titi",
#'     deploy_dir = file.path(project_path, "inst/site/")
#'   )
#' }
#' }
deploy_connect_pkgdown <- function(
  connect_url = Sys.getenv("CONNECT_URL"),
  connect_user = Sys.getenv("CONNECT_USER"),
  connect_api_token = Sys.getenv("CONNECT_TOKEN"),
  app_name = NULL,
  deploy_dir =
  c(
    file.path(getwd(), "public"),
    file.path(getwd(), "docs"),
    file.path(getwd(), "inst/site/"),
    file.path(getwd(), ".")
  ),
  connect_name = Sys.getenv("CONNECT_NAME", unset = "connect"),
  file_to_ignore_regex = ".Rprofile$|^.Renviron$|renv/|rstudio_.*/|deliverables/|dev/|data-raw/|dockerfiles/",
  forceUpdate = FALSE,
  lint = FALSE,
  app_primary_doc = "index.html",
  ...
    ) {
  cli::cat_bullet("Deploying the pkgdown on Connect")

  deploy_dir_to_use <- detect_deploy_dir(deploy_dir)

  if (!dir.exists(deploy_dir_to_use)) {
    stop("Please check that your pkgdown exists and that it is located in the inst/site/ directory")
  }

  deploy_connect(
    connect_url = connect_url,
    connect_user = connect_user,
    connect_api_token = connect_api_token,
    app_name = app_name,
    deploy_dir = deploy_dir_to_use,
    connect_name = connect_name,
    file_to_ignore_regex = file_to_ignore_regex,
    forceUpdate = forceUpdate,
    lint = lint,
    app_primary_doc = app_primary_doc,
    ...
  )
}
