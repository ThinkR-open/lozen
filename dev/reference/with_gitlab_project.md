# Test gitlab CI workflows

This functions allows its users to launch an expression to initiate a
given gitlab ci workflow within a dummy project on a \#' gitlab
instance.

## Usage

``` r
with_gitlab_project(
  gitlab_url = Sys.getenv("GITLAB_URL", unset = "https://gitlab.com"),
  namespace_id,
  private_token = Sys.getenv("GITLAB_TOKEN"),
  connect_url = Sys.getenv("CONNECT_URL"),
  connect_api_token = Sys.getenv("CONNECT_TOKEN"),
  connect_user = Sys.getenv("CONNECT_USER"),
  connect_name = Sys.getenv("CONNECT_NAME", unset = "connect"),
  project_name = "lozen.test.project",
  branch_focus_for_ci = "main",
  exp
)
```

## Arguments

- gitlab_url:

  A character string. The url of the gilab instance.

- namespace_id:

  An integer. The id of the gitlab group to create the project in.

- private_token:

  A character string. The token to gain access to the gitlab api.

- connect_url:

  A character string. The URL to the Connect server.

- connect_api_token:

  A character string. The token to gain access to the Connect API. The
  token must be granted admin access.

- connect_user:

  A character string. User name on Connect.

- connect_name:

  A character string. Name of the Connect server (default "connect")

- project_name:

  A character string. The name of the project to be created.

- branch_focus_for_ci:

  Name of the branch to be targeted for the CI pipeline.

- exp:

  A valid R expression initializing a project and a gitlab ci workflow.

## Value

A data.frame containing information about jobs of the gitlab project.

## Examples

``` r
if (FALSE) { # \dontrun{
output <- with_gitlab_project(
  gitlab_url = Sys.getenv("GITLAB_URL", unset = "https://gitlab.com"),
  namespace_id = NULL,
  private_token = Sys.getenv("GITLAB_TOKEN"),
  project_name = "bookdown.test.project",
  exp = {
    lozen::create_r_project(
      project_path = getwd(),
      type = "book",
      name_licence = "Bobo",
      type_licence = usethis::use_mit_license
    )
    lozen::use_gitlab_ci(type = "bookdown", bookdown_output_format = "lozen::paged_template")
  }
)
output
} # }
```
