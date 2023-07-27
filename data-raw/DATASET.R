## code to prepare `DATASET` dataset goes here

thinkr_authors <- tibble::tribble(
  ~pseudo,
  ~given,
  ~family,
  ~email,
  ~orcid,
  "sebastien",
  "Sébastien",
  "Rochette",
  "sebastien@thinkr.fr",
  "0000-0002-1565-9313",
  "seb",
  "Sébastien",
  "Rochette",
  "sebastien@thinkr.fr",
  "0000-0002-1565-9313",
  "colin",
  "Colin",
  "Fay",
  "colin@thinkr.fr",
  "0000-0001-7343-1846",
  "vincent",
  "Vincent",
  "Guyader",
  "vincent@thinkr.fr",
  "0000-0003-0671-9270",
  "cervan",
  "Cervan",
  "Girard",
  "cervan@thinkr.fr",
  "0000-0002-4816-4624",
  "margot",
  "Margot",
  "Brard",
  "margot@thinkr.fr",
  "0000-0001-6754-0659",
  "arthur",
  "Arthur",
  "Bréant",
  "arthur@thinkr.fr",
  "0000-0003-1668-0963",
  "antoine",
  "Antoine",
  "Languillaume",
  "antoine@thinkr.fr",
  "0000-0001-9843-5632"
)

# usethis::use_data(thinkr_authors)
# usethis::use_r("datasets")
# Special characters in Names...
readr::write_csv(thinkr_authors, file = "inst/package/thinkr_authors.csv")
