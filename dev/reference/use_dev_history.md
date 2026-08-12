# Une a dev histroy file

Une a dev histroy file

Une a dev histroy file

## Usage

``` r
use_dev_history(path = ".", type = c("package", "renv"))

use_dev_history(path = ".", type = c("package", "renv"))
```

## Arguments

- path:

  Path to project to add dev_history in

- type:

  Type of dev_history. Multiple types possible among "package", "book",
  "renv".

## Examples

``` r
withr::with_tempdir({
  use_dev_history(path = ".", type = c("package", "book", "renv"))
})
withr::with_tempdir({
  use_dev_history(path = ".", type = c("package", "book", "renv"))
})
```
