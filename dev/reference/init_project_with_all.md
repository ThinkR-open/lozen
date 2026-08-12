# Init a new project with everything in one command

Init a new project with everything in one command

## Usage

``` r
init_project_with_all(
  project_name,
  project_gitlab_id = NULL,
  config_path,
  project_path = tempfile("clone"),
  ...
)
```

## Arguments

- project_name:

  The name of the project to be created

- project_gitlab_id:

  GitLab ID of the project if it already exist on your Forge

- config_path:

  The path to the yaml configuration file to use with your options to
  modify the default one. See details.

- project_path:

  The path to the project if your want to keep it locally. Default to
  temporary directory.

- ...:

  Any parameter existing in the configuration file that you would like
  to use to override your config files

## Details

By default, the project is a R package created on
<https://gitlab.com/about/> in your personal repository. Use your own
configuration file to amend the default one. The configuration file is a
yaml file with all possible options. You do not have to specify all
options as it will be combined with our default ones. Open the default
one to see what is in it:
`file.edit(system.file("config_default_thinkr_gitlab.yml", package = "lozen"))`

## Examples

``` r
if (interactive()) {
  # Default on GitLab.com
  init_project_with_all(project_name = "newprojectpkg")
  # Change default options with your own config file
  init_project_with_all(project_name = "newprojectpkg", config_path = "<my-config-path>")
  # Add any extra option to override values of your config file once
  init_project_with_all(project_name = "newprojectpkg", config_path = "<my-config-path>", gitlab_namespace_id = "000")
}
```
