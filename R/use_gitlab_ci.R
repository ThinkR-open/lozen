# WARNING - Generated by {fusen} from dev/flat_init_gitlab_ci.Rmd: do not edit by hand

# Gitlab-CI
#'
#' Set gitlab continuous integration
#'
#' @param image Docker image used as basis. See \url{https://github.com/rocker-org/rocker}
#' @param project_path Path of the project to add CI in.
#' @inheritParams gitlabr::use_gitlab_ci
#'
#' @details See \code{\link[gitlabr]{use_gitlab_ci}}
#'
#' @export
#' @examples
#' withr::with_tempdir({
#'   use_gitlab_ci(image = "r-base")
#' })
#' 
#' withr::with_tempdir({
#'   use_gitlab_ci(
#'     image = "rocker/verse",
#'     repo_name = "https://packagemanager.rstudio.com/all/__linux__/focal/latest",
#'     type = "check-coverage-pkgdown"
#'   )
#' })
use_gitlab_ci <- function(image = "rocker/verse",
                          repo_name = "https://packagemanager.rstudio.com/all/__linux__/focal/latest",
                          project_path = ".",
                          type = "check-coverage-pkgdown") {
  ci_file <- file.path(project_path, ".gitlab-ci.yml")
  gitlabr::use_gitlab_ci(
    image = image,
    repo_name = repo_name,
    path = ci_file,
    type = type
  )

  if (grepl("check", type)) {
    lines <- readLines(ci_file)

    script <- grep('"--as-cran"', lines)
    lines[script] <- gsub(',\\s*"--as-cran"', "", lines[script])
    lines[script] <- gsub('"--as-cran"', "", lines[script])

    writeLines(enc2utf8(lines), ci_file)
  }

  if (grepl("pkgdown", type)) {
    lines <- readLines(ci_file)

    stage <- grep("stage: pkgdown$", lines)
    script <- grep("script", lines)
    renv <- grep("renv::restore", lines)

    if (length(renv) == 0) {
      extra <- script[script > stage][1]
    } else {
      renv_extra <- renv[renv > stage][1]
      extra <- script[script > renv_extra][1]
    }
    lines[extra] <- paste0(
      lines[extra],
      "\n",
      # Add extra line
      '    - Rscript -e \'install.packages("thinkrtemplate", repos = c("thinkropen" = "https://thinkr-open.r-universe.dev"))\''
    )

    writeLines(enc2utf8(lines), ci_file)
  }

  ci_file
}
