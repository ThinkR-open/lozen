# Install dependencies on CI
# https://github.com/r-lib/remotes/issues/604
# The only remotes installation correctly working with GitLab.
#   cf. https://github.com/r-lib/remotes/pull/608


if (is.null(getOption("repos")) | "@CRAN@" %in% getOption("repos")){
  options(repos = c(CRAN = "https://cloud.r-project.org"))
}

if (!requireNamespace("git2r")) {install.packages("git2r")}
if (!requireNamespace("usethis")) {install.packages("usethis")}
if (!requireNamespace("remotes")) {install.packages("remotes")}
if (!requireNamespace("attachment")) {install.packages("attachment")}

# For fonts
# remotes::install_version("Rttf2pt1", version = "1.3.8")

if (!file.exists("DESCRIPTION")) {usethis::use_description()}

# Find dependencies
imports <- unique(c(
  "pagedown", "bookdown",
  # Calls in `r code`
  "knitr",
  attachment::att_from_rmds(".", recursive = FALSE),
  attachment::att_from_rscripts("R", recursive = FALSE)
  ))
# update DESCRIPTION file
if (utils::packageVersion("attachment") >= "0.2.4") {
  attachment::att_to_desc_from_is(path.d = "DESCRIPTION", imports = imports, must.exist = FALSE)
} else {
  attachment::att_to_desc_from_is(path.d = "DESCRIPTION", imports = imports)
}

# Define variable to install private GitLab package
# Sys.setenv(GITLAB_PAT = Sys.getenv("GITLAB_TOKEN"))
options(remotes.git_credentials =
          git2r::cred_user_pass("gitlab-ci-token", Sys.getenv("GITLAB_TOKEN")))

print("install_deps")
remotes::install_deps(dependencies = TRUE)


# If you want to avoid multiple downloads
# remotes::install_deps(upgrade = "never")
