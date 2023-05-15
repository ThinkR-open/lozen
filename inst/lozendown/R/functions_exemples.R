# Les dependances
library(dplyr)

#' Affichage beau tableau de la section à réviser
#'
#' @param x le tableau
#' @param caption le legende du tableau
affiche_tableau <- function(x, caption) {
  knitr::kable(x, caption = caption)
}
