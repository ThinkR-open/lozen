# WARNING - Generated by {fusen} from dev/flat_create_r_project_skeleton.Rmd: do not edit by hand

#' Add files to gitignore
#'
#' @param x vector of filenames
#' @param directory path where to .gitignore should be written
#' @noRd
add_git_ignore <- function(x, directory = ".") {
  git_file <- file.path(directory, ".gitignore")

  if (!file.exists(git_file)) {
    writeLines("", git_file)
  }

  git_ignore <- readLines(git_file)

  to_ignore <- x

  to_ignore <- x[!x %in% git_ignore]

  if (length(to_ignore) != 0) {
    writeLines(enc2utf8(c(git_ignore, to_ignore)), git_file)
  }
}
