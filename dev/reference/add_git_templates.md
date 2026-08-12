# Add MR GitLab or GitHub template and local issue template

Add MR GitLab or GitHub template and local issue template

## Usage

``` r
add_git_templates(
  project_path = ".",
  type = c("commit", "mr"),
  target_dir = ".gitlab"
)
```

## Arguments

- project_path:

  project_path

- type:

  type

- target_dir:

  Directory name where to save templates

## Value

Side effect: template in .gitlab/.github and in .git

## Examples

``` r
if (FALSE) { # \dontrun{
add_git_templates(
  project_path = project_path,
  type = c("commit", "mr")
)
} # }
```
