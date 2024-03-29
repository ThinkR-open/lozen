% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/project_options.R
\name{project_options}
\alias{project_options}
\title{Define project status for a user}
\usage{
project_options(project_id, level = "watch")
}
\arguments{
\item{project_id}{project_id}

\item{level}{The notification levels among disabled, participating,
watch, global, mention, custom}
}
\value{
Side Effect on GitLab, allow reception of notifications.
}
\description{
Define project status for a user
}
\examples{
\dontrun{
project_options(
  project_id,
  level = "watch"
)
}
}
