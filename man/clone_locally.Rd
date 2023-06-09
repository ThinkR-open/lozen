% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clone_locally.R
\name{clone_locally}
\alias{clone_locally}
\title{Clone project locally}
\usage{
clone_locally(project_name, group_url, full_url, project_path, open = TRUE)
}
\arguments{
\item{project_name}{project_name}

\item{group_url}{group_url}

\item{full_url}{Full url to the repository. Superseeds group_url and project_name if used.}

\item{project_path}{project_path}

\item{open}{Logical. Whether to open the RStudio project.}
}
\value{
project_path. Side effect: clone the project.
}
\description{
Clone project locally
}
\examples{
\dontrun{
project_path <- clone_locally(
  project_name = the_project[["name"]],
  group_url = group_url,
  open = TRUE
)
}
}
