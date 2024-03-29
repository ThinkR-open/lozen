# WARNING - Generated by {fusen} from dev/flat_create_weekly.Rmd: do not edit by hand

#' Create a weekly issues summary for GitHub (new board)
#'
#'
#' @param date_min Minimal date to look for issues
#' @param date_max Maximal date to look for issues
#' @param user username or company name as shown on GitHub
#' @param repo GitHub repository
#' @param board_url url of the GitHub board.
#' @param github_token token access to graphQL API
#' @param verbose Logical. Whether to return output in the console too.
#'
#' @importFrom lubridate as_date as_datetime format_ISO8601 now
#' @importFrom dplyr select mutate filter rename any_of bind_rows inner_join
#' @importFrom purrr map_dfr map_lgl
#' @importFrom gh gh
#' @importFrom glue glue
#' @importFrom gitlabr multilist_to_tibble

#' @return A Weekly to copy-paste in a Wiki and a tibble
#'
#' @export
#' @examples
#' \dontrun{
#' board_url <- "https://github.com/orgs/ThinkR-open/projects/4/"
#' date_min <- "2022-06-30"
#' date_max <- "2022-06-30"
#' user <- "ThinkR-open"
#' repo <- "example-weekly"
#'
#' if (Sys.getenv("GITHUB_PAT") != "") {
#'   weekly <- gh_create_weekly_new_projects_board(
#'     date_min = date_min,
#'     date_max = date_max,
#'     user = user,
#'     repo = repo,
#'     board_url = board_url,
#'     github_token = Sys.getenv("GITHUB_PAT"),
#'     verbose = FALSE
#'   )
#' }
#' }
#' # Copier dans le presse papier pour copier directement
#' # clipr::write_clip(weekly$weekly_info)
gh_create_weekly_new_projects_board <- function(
  date_min,
  date_max,
  user,
  repo,
  board_url,
  github_token = Sys.getenv("GITHUB_PAT"),
  verbose = FALSE
    ) {
  .Deprecated("lozen::gh_create_weekly_old_and_new_boards()")

  date_min <- as_date(date_min)
  date_max <- as_date(date_max)

  if (date_max < date_min) {
    stop("date_min should be lower or equal to date_max")
  }

  board_content <- graphql_to_tibble(board_url = board_url, github_token = github_token)

  if (nrow(board_content) == 0) {
    stop("The board of the project is empty")
  }

  board_content <- board_content %>%
    rename(
      content_url = url,
      created_at = createdAt,
      updated_at = updatedAt
    ) %>%
    mutate(state = tolower(state)) %>%
    select(-id) %>%
    mutate(content_url = gsub(content_url, pattern = "https://github.com", replacement = "https://api.github.com/repos"))

  # Board columns names
  board_content$board_column

  # Retrieve all issues
  all_issues <- gh(glue("/repos/{user}/{repo}/issues"), state = "all")
  all_issues_tbl <- multilist_to_tibble(all_issues)

  # 1 - Cards from a column - Closed
  cards_tbl_done <- board_content %>%
    filter(grepl("close|closed|a valider|validation|done", tolower(board_column)))

  if (nrow(cards_tbl_done) != 0) {
    cards_tbl_done <- inner_join(
      cards_tbl_done,
      select(all_issues_tbl, id, number, assignees),
      by = "number"
    )

    cards_tbl_done <- cards_tbl_done %>%
      mutate(info = "1 - :heavy_check_mark: Realised") %>%
      filter(
        as_date(as_datetime(updated_at)) >= date_min,
        as_date(as_datetime(updated_at)) <= date_max
      )
  }

  # 2 - Cards from a column - Blocked
  cards_tbl_blocked <- board_content %>%
    filter(grepl("blocked|bloque|bloqu\\\\u00e9", tolower(board_column)))

  if (nrow(cards_tbl_blocked) != 0) {
    cards_tbl_blocked <- inner_join(
      cards_tbl_blocked,
      select(all_issues_tbl, id, number, assignees),
      by = "number"
    )

    cards_tbl_blocked <- cards_tbl_blocked %>%
      mutate(info = "2 - :stop_sign: Blocked")
  }

  # 3 - Cards from a column - Validation
  cards_tbl_valid <- board_content %>%
    filter(grepl("a valider|validation", tolower(board_column)))

  if (nrow(cards_tbl_valid) != 0) {
    cards_tbl_valid <- inner_join(
      cards_tbl_valid,
      select(all_issues_tbl, id, number, assignees),
      by = "number"
    )

    cards_tbl_valid <- cards_tbl_valid %>%
      mutate(info = "3 - :thumbsup: To validate")
  }


  # 4 - Cards from a column - En cours/Review
  cards_tbl_progress <- board_content %>%
    filter(grepl("in progress|en cours|review|revision|r\\\\u00e9vision", tolower(board_column)))

  if (nrow(cards_tbl_progress) != 0) {
    cards_tbl_progress <- inner_join(
      cards_tbl_progress,
      select(all_issues_tbl, id, number, assignees),
      by = "number"
    )


    cards_tbl_progress <- cards_tbl_progress %>%
      mutate(info = "4 - :spiral_notepad: In progress") %>%
      filter(as_date(as_datetime(updated_at)) <= date_max)
  }


  # New issues opened during the week (even if closed)
  # >> DO NOT Change here for new board
  new_issues <- gh(
    glue("/repos/{user}/{repo}/issues"),
    sort = "created",
    since = format_ISO8601(
      as_datetime(
        paste0(date_min, "T00:00:01"),
        tz = lubridate::tz(now())
      ),
      usetz = TRUE
    ),
    state = "all"
  )

  new_issues_all_tbl <- multilist_to_tibble(new_issues)
  # Remove PR as they are listed as issues
  if (any(grepl("pull_request", names(new_issues_all_tbl)))) {
    new_issues_all_tbl <- new_issues_all_tbl %>%
      filter(map_lgl(.[["pull_request"]], is.null))
  }

  if (nrow(new_issues_all_tbl) != 0) {
    new_issues_tbl <- new_issues_all_tbl %>%
      filter(
        as_date(as_datetime(created_at)) >= date_min,
        as_date(as_datetime(created_at)) <= date_max
      ) %>%
      rename(content_url = url) %>%
      select(any_of(
        unique(c(
          "state",
          names(cards_tbl_blocked),
          names(cards_tbl_progress),
          names(cards_tbl_valid),
          names(cards_tbl_done)
        ))
      )) %>%
      mutate(info = "9 - :seedling: New issues opened")
  } else {
    new_issues_tbl <- new_issues_all_tbl
  }

  # Combine cards ----
  list_all_cards <- list(
    cards_tbl_blocked,
    cards_tbl_progress,
    cards_tbl_valid,
    cards_tbl_done,
    new_issues_tbl
  )

  card_is_full <- purrr::map_lgl(list_all_cards, ~ nrow(.x) != 0)
  all_cards_weekly <- bind_rows(list_all_cards[card_is_full])

  all_cards_weekly_text <- all_cards_weekly %>%
    mutate(
      issue_get = gsub("https://api.github.com", "", content_url),
      issue_li = create_issue_li_gh(issue_get)
    )

  all_cards_weekly_text_collapse <- collapse_li(all_cards_weekly_text)

  out <- list(
    weekly_issues = all_cards_weekly_text,
    weekly_info = all_cards_weekly_text_collapse$text_weekly_all
  )

  if (verbose) {
    cat(out$weekly_info)
  }
  return(out)
}
