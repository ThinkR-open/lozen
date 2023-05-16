
- <a href="#development" id="toc-development">Development</a>
  - <a href="#tokens" id="toc-tokens">Tokens</a>

<!-- README.md is generated from README.Rmd. Please edit that file -->

## Development

### Tokens

#### GitLab

- Create a personal access token on GitLab, with the rights:
  “read_repository”, “write_repository”, “api”, “read_api”
- Save the token in your `.Renviron` under the name `GITLAB_TOKEN`
- Save the url of your gitlab, if it is not `gitlab.com`, in your
  `.Renviron` under the name `GITLAB_URL`
- Set up your git user email and git user name :

``` r
usethis::use_git_config(scope = "user",
                        user.name = "username", 
                        user.email = "user@email.fr")
```

- To try functions that manipulate connect :
  - You have to set up at `TRUE` the env variable
    `ALLOW_CI_TESTS_ON_GITLAB`
  - Set up a token for connect with `CONNECT_TOKEN`
  - Set up a url for connect with `CONNECT_URL`
  - Set up your username for connect with `CONNECT_USER`

#### GitHub

- Create a personal access token on GitHub

- Save the token in your `.Renviron` under the name `GITHUB_PAT`

- For unit tests, you will have to set up to `TRUE` the env variable
  `ALLOW_PUBLISHING_ON_GITHUB`
