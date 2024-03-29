# WARNING - Generated by {fusen} from /dev/flat_init_project_with_all.Rmd: do not edit by hand

test_that("init_project_with_all can be used for package in interactive session", {
  if (interactive()) {
    answer <- readline("Do you want to test if `init_project_with_all()` works for packages on GitLab ? (y/n)")
    if (answer %in% c("n", "no")) {skip()}
    
    init_project_with_all(
      project_name = "newprojecttest", 
      config_path = system.file("thinkr_config_test_amend.yml", package = "lozen"),
      gitlab_namespace_id = 1013)
    
    cat("Manual test: The project should be a R package with CI and pkgdown on GitLab. There are wikis, issues opened, and templates issues. There is a board of issues.",
            "\nAfter that, you can delete the project.")
    answer <- readline("Is the package project correctly initiated and deployed ? (y/n)")
    expect_true(answer %in% c("y", "yes"))
    
    
    answer <- readline("Do you want to test if `init_project_with_all()` works for packages on GitHub ThinkR-open account ? (y/n)")
    if (answer %in% c("n", "no")) {skip()}
    init_project_with_all(
      project_name = "testinitalllozen",
      config_path = system.file("thinkr_config_test_amend_github.yml", package = "lozen")
      )
    
    cat("Manual test: The project should be a R package with CI and pkgdown on GitHub. There are wikis, issues opened, and templates issues. There is a board of issues.",
        "\nAfter that, you can delete the repo and project.")
    answer <- readline("Is the package project correctly initiated ? (y/n)")
    expect_true(answer %in% c("y", "yes"))
    
  }
})

test_that("init_project_with_all can be used for books in interactive session", {
  if (interactive()) {
    answer <- readline("Do you want to test if `init_project_with_all()` works for books? (y/n)")
    if (answer %in% c("n", "no")) {skip()}
    
    init_project_with_all(
      project_name = "newbooktest", 
      config_path = system.file("thinkr_config_book_gitlab.yml", package = "lozen"))
    
    cat("Manual test: The project should be a R bookdown with CI and bookd deployed on GitLab. There are wikis, issues opened, and templates issues. There is a board of issues.",
            "\nAfter that, you can delete the project.")
    answer <- readline("Is the book project correctly initiated and deployed ? (y/n)")
    expect_true(answer %in% c("y", "yes"))
  }
})
