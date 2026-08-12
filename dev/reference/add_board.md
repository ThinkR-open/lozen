# Add board in the correct order

Add board in the correct order

## Usage

``` r
add_board(
  project_id,
  name = "Development",
  labels_order = c("Bloqué", "Prêt", "En cours", "Révision", "Pré-validation",
    "A valider"),
  lg = "fr"
)
```

## Arguments

- project_id:

  project_id

- name:

  Name of the Board

- labels_order:

  Name of the labels already existing in the project

- lg:

  language of the board, "fr" or "en"

## Examples

``` r
if (FALSE) { # \dontrun{
add_board(
  project_id = project_id
)
} # }
```
