# Title

Title

## Usage

``` r
create_deploy_ci_stage(
  image,
  deploy_function,
  stage_name = deploy_function,
  ...
)
```

## Arguments

- image:

  image#'

- deploy_function:

  deploy_function

- stage_name:

  stage_name

- ...:

  dots not used

## Examples

``` r
create_deploy_ci_stage(
  image = "rocker/verse",
  deploy_function = "deploy_connect_shiny"
)
#> $image
#> [1] "rocker/verse"
#> 
#> $variables
#> $variables$GIT_DEPTH
#> [1] 10
#> 
#> $variables$REPO_NAME
#> [1] "https://packagemanager.rstudio.com/all/__linux__/focal/latest"
#> 
#> $variables$R_LIBS_USER
#> [1] "ci/lib"
#> 
#> 
#> $cache
#> $cache$key
#> [1] "global-cache"
#> 
#> $cache$paths
#> $cache$paths[[1]]
#> [1] "${R_LIBS_USER}"
#> 
#> 
#> 
#> $stages
#> $stages[[1]]
#> [1] "deploy_connect_shiny"
#> 
#> 
#> $deploying
#> $deploying$stage
#> [1] "deploy_connect_shiny"
#> 
#> $deploying$script
#> [1] "echo \"Library path for packages :\" $R_LIBS_USER"                                                                                                                                                                                                                               
#> [2] "mkdir -p $R_LIBS_USER"                                                                                                                                                                                                                                                           
#> [3] "Rscript -e 'install.packages(c(\"git2r\"));install.packages(\"gitlabr\", repos = c(\"https://thinkr-open.r-universe.dev\", \"https://cloud.r-project.org\"))'"                                                                                                                   
#> [4] "Rscript -e 'install.packages(\"lozen\", repos = c(\"https://thinkr-open.r-universe.dev\", \"https://cran.rstudio.com\"))'"                                                                                                                                                       
#> [5] "Rscript -e 'remotes::install_local(dependencies = TRUE)'"                                                                                                                                                                                                                        
#> [6] "Rscript -e 'lozen::deploy_connect_shiny(forceUpdate=TRUE, connect_url = Sys.getenv(\"CONNECT_URL\"),connect_user = Sys.getenv(\"CONNECT_USER\"),connect_api_token = Sys.getenv(\"CONNECT_TOKEN\"),app_name = Sys.getenv(\"APP_NAME\", unset = Sys.getenv(\"CI_PROJECT_NAME\")))'"
#> 
#> 
```
