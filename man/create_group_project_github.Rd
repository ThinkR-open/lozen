% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_group_project_github.R
\name{create_group_project_github}
\alias{create_group_project_github}
\title{Create new project on GitHub}
\usage{
create_group_project_github(repo, owner)
}
\arguments{
\item{repo}{name of the project to create}

\item{owner}{Owner of the repo}
}
\value{
project_id. Side effect: Create a project on GitHub if not exists.
}
\description{
Create new project on GitHub
}
\examples{
\dontrun{
create_group_project_github(
  repo = "areponame",
  owner = "ghowner"
)
}
}
