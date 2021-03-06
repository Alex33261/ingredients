% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aspect_importance.R
\name{plot_group_variables}
\alias{plot_group_variables}
\title{Plots tree with correlation values}
\usage{
plot_group_variables(x, p, draw_abline = TRUE)
}
\arguments{
\item{x}{hclust object}

\item{p}{correlation value for cutoff level}

\item{draw_abline}{if TRUE, cutoff line will be drawn}
}
\value{
tree plot
}
\description{
Plots tree that illustrates the results of group_variables function.
}
\examples{
library("DALEX")
dragons_data <- dragons[,c(2,3,4,7,8)]
group_variables(dragons_data, p = 0.7, clust_method = "complete",
                draw_tree = TRUE)

}
