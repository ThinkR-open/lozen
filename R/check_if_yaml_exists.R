# WARNING - Generated by {fusen} from dev/flat_init_gitlab_ci.Rmd: do not edit by hand

#' Check if yaml file exist
#'
#' Check if yaml file already exist and ask permission for overwriting
#'
#'
#'
#' @param dir directory to scan
#' @param file_name filename to use .gitlab-ci.yml
#' @param append boolean do we allow to append stage to existing ci file. TRUE by default
#'
#' @export
#' @examples
#' # check_if_yaml_exists()
check_if_yaml_exists <- function(dir = ".",
                                 file_name = ".gitlab-ci.yml",
                                 append = TRUE) {
  path_to_yaml <- file.path(dir, file_name)

  if (
    file.exists(path_to_yaml) &&
      !append
  ) {
    append <- utils::askYesNo(
      glue("The file {path_to_yaml} already exists. Do you want to append the  the Connect CI to existing CI stage(s) ?"),
      default = FALSE
    )
  } else {
    append <- TRUE
  }


  # Stop if file exist and append not permitted
  if (
    file.exists(path_to_yaml) &&
      !append
  ) {
    stop(glue("The file {path_to_yaml} already exists. Please remove it or use the argument append = TRUE"))
  }

  return(path_to_yaml)
}
