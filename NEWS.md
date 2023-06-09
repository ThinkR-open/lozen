# lozen 1.1.0.9000

## Major

- Rename all the token
- Some packages go to suggest

## Minor

- Remove get_author fucntion to thinkridentity

# lozen 1.1.0

## Major

- Allow requests on the new GitHub board (GraphQL API)
- Move issues and comments from GitLab to Github with `move_issues_from_gitlab_to_github()` (#118)

## Minor

- Add info in the Lead Dev first issue about the need to think about dev.thinkr.fr for devs
- .onLoad() with the message about envars is temporary deactivated

# lozen 1.0.1

## Hotfix

- Change the name of the vignette to add to create a weekly/daily

# lozen 1.0.0

Use the former version of `{thinkridentity}` as a new basis for `{lozen}` - remove everything related to the management of the design graphic system

## Major

- Use a fusen-style for the package
- Add functions to manage templates of issues in GitLab and GitHub
- Add a function to generate an issue to be presented to the client during the kick-off on the mission
- Remove the function `multilist_to_tibble()` and move it to `{gitlabr}`

## Minor

- Allow weekly/daily to present the issues created and validated today
- Allow url of Connect to not have `/` at the end

----------------------

## Archive: former versions of `{thinkridentity}`

### 0.0.3.9000

#### Breaking changes

* `add_gitlab_templates()` renamed by `add_git_templates()`

#### Major

* Add `add_issue_clients_github()` for the welcome issue on GitHub
* Update instructions for delivery in "dev_history_deliverables.R"
* Add instructions to deploy to connect from CI in "dev_history_connect.R"

### 0.0.3

* Add full template to create a new project on GitLab with associated R code

### 0.0.2

* PDF template creation with `thinkR_pdf_create_header()`  
* YAML header for PDF template with `amend_yaml_pdf_output()`  
* get_author: get infos for ThinkR authors
* Add palettes and ggplot2 scales
* Add gitlab-ci
* Transform as package

### 0.0.1

### jquery 3.3.1
