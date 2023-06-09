# WARNING - Generated by {fusen} from dev/flat_create_weekly.Rmd: do not edit by hand


test_that("graphql_to_tibble fails if problems are shown with the token", {
  board_url <- "https://github.com/orgs/ThinkR-open/projects/4"

  # if the token is missing the function must fail
  expect_error(graphql_to_tibble(board_url = board_url_organization, github_token = ""))

  # if the token has not the right scope the function must fail
  if (Sys.getenv("GITHUB_PAT_NO_ACCESS_TO_GRAPHQL") != "") {
    expect_error(graphql_to_tibble(
      board_url = board_url,
      github_token = Sys.getenv("GITHUB_PAT_NO_ACCESS_TO_GRAPHQL")
    ))
  }
})

test_that("graphql_to_tibble works with an organization board", {
  expect_true(inherits(graphql_to_tibble, "function"))

  board_url_organization <- "https://github.com/orgs/ThinkR-open/projects/4"

  skip_on_ci()
  skip_if_not(isTRUE(Sys.getenv("GITHUB_PAT") != ""))

  graphql_res <- graphql_to_tibble(
    board_url = board_url_organization,
    github_token = Sys.getenv("GITHUB_PAT")
  )

  expect_equal(nrow(graphql_res), 10)

  expect_equal(nrow(dplyr::filter(graphql_res, board_column == "Open")), 1)
  expect_equal(nrow(dplyr::filter(graphql_res, board_column == "Blocked")), 3)
  expect_equal(nrow(dplyr::filter(graphql_res, board_column == "In Progress")), 1)
  expect_equal(nrow(dplyr::filter(graphql_res, board_column == "Review")), 1)
  expect_equal(nrow(dplyr::filter(graphql_res, board_column == "Validation")), 1)
  expect_equal(nrow(dplyr::filter(graphql_res, board_column == "Ready")), 1)
  expect_equal(nrow(dplyr::filter(graphql_res, board_column == "Done")), 2)
})

test_that("graphql_to_tibble works with a user board", {
  expect_true(inherits(graphql_to_tibble, "function"))

  if (Sys.getenv("GITHUB_PAT_THE_THINKR") != "") {
    board_url_user <- "https://github.com/users/the-thinkr/projects/1"

    graphql_res <- graphql_to_tibble(
      board_url = board_url_user,
      github_token = Sys.getenv("GITHUB_PAT_THE_THINKR")
    )

    expect_equal(nrow(graphql_res), 3)

    expect_equal(nrow(dplyr::filter(graphql_res, board_column == "In Progress")), 1)
    expect_equal(nrow(dplyr::filter(graphql_res, board_column == "Todo")), 1)
    expect_equal(nrow(dplyr::filter(graphql_res, board_column == "Done")), 1)
  }
})
