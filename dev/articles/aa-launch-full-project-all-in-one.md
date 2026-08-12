# aa - Launch full project - all in one

``` r

library(lozen)
```

## Init a new project with everything in one command

[`init_project_with_all()`](https://thinkr-open.github.io/lozen/dev/reference/init_project_with_all.md)
will follow the ThinkR recommended configuration to init a new project.
By default, the project is a R package created on <https://gitlab.com/>
in your personal repository.  
After that, you only have to start writing the code !

You can amend the default configuration with your own yaml file. Open
the default one:
`file.edit(system.file("config_default_thinkr_gitlab.yml", package = "lozen"))`.  
Keep only lines that you would like to change, and save your own
configuration where you like it to be.  
Next time you can run
`init_project_with_all(project_name = "my.wonderful.project", config_path = "path/to/my/own/config.yaml")`.

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
