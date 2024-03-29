# WARNING - Generated by {fusen} from dev/flat_create_weekly.Rmd: do not edit by hand

## 04-05-2023 On skip pour des raisons d'auth sur le CI
## 03-08-2023
test_that("visualise_commits works", {
  skip_on_ci()

  skip_if_not(Sys.getenv("GITLAB_TOKEN") != "")

  gitlab_url <-
    Sys.getenv("GITLAB_URL", unset = "https://gitlab.com")

  the_token <- Sys.getenv("GITLAB_TOKEN")

  # GitLab con
  my_gitlab <- gitlabr::gl_connection(
    gitlab_url = gitlab_url,
    private_token = the_token
  )

  # Set the connection for the session
  gitlabr::set_gitlab_connection(my_gitlab)

  # Get user infos
  user_info <- gitlabr::gitlab(req = paste0("user"), verb = httr::GET)
  user_name <- user_info |> dplyr::pull(username)

  project_name <- "lozenexemplecommits"

  # Get user namespace (= group_id)
  # namespace_id <- gitlabr::gitlab(req = "namespaces", search = user_name)[["id"]]
  group_url <- user_info[["web_url"]]

  # create_group_project ----
  project_id <-
    lozen::create_group_project(project_name, namespace_id = NULL)

  withr::with_tempdir({
    tempdir <-
      lozen::clone_locally(
        full_url = paste0(group_url, "/", project_name),
        open = FALSE
      )

    setwd(tempdir)
    file_to_add <- tempfile(tmpdir = tempdir)
    writeLines(letters[1:6], file_to_add)

    gert::git_config_set("user.name", "Jerry")
    gert::git_config_set("user.email", "jerry@gmail.com")
    gert::git_add(".")
    gert::git_commit("random file")
    gert::git_push()
  })

  on.exit({
    gitlabr::gitlab(
      req = paste0("projects/", project_id),
      verb = httr::DELETE
    )
  })

  expect_true(inherits(lozen::visualise_commits, "function"))
  yesterday <- lubridate::today() - 1
  repart_commit_test <-
    lozen::visualise_commits(
      project_id = project_id,
      gitlab_url = Sys.getenv("GITLAB_URL", unset = "https://gitlab.com"),
      date_min = yesterday,
      date_max = lubridate::today(),
      private_token = Sys.getenv("GITLAB_TOKEN")
    )

  expect_true(inherits(repart_commit_test, c("gg", "ggplot")))


  expect_message(
    repart_commit_not_ok <- lozen::visualise_commits(
      project_id = project_id,
      gitlab_url = Sys.getenv("GITLAB_URL", unset = "https://gitlab.com"),
      date_min = yesterday - 100,
      date_max = lubridate::today() - 100,
      private_token = Sys.getenv("GITLAB_TOKEN")
    ),
    "There are no commits for this period in the repository"
  )

  expect_null(repart_commit_not_ok)
})
