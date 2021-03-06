% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotD3_aggregated_profiles.R
\name{plotD3.aggregated_profiles_explainer}
\alias{plotD3.aggregated_profiles_explainer}
\title{Plots Aggregated Ceteris Paribus Profiles in D3 with r2d3 Package.}
\usage{
\method{plotD3}{aggregated_profiles_explainer}(x, ..., size = 2,
  alpha = 1, color = "#46bac2", variable_type = "numerical",
  facet_ncol = 2, scale_plot = FALSE, variables = NULL,
  chart_title = "Aggregated Profiles", label_margin = 60)
}
\arguments{
\item{x}{a aggregated profiles explainer produced with function \code{aggregate_profiles()}}

\item{...}{other explainers that shall be plotted together}

\item{size}{a numeric. Set width of lines}

\item{alpha}{a numeric between 0 and 1. Opacity of lines}

\item{color}{a character.  Set line/bar color}

\item{variable_type}{a character. If "numerical" then only numerical variables will be plotted.
If "categorical" then only categorical variables will be plotted.}

\item{facet_ncol}{number of columns for the \code{\link[ggplot2]{facet_wrap}}}

\item{scale_plot}{a logical. If \code{TRUE}, the height of plot scales with window size. By default it's \code{FALSE}}

\item{variables}{if not \code{NULL} then only \code{variables} will be presented}

\item{chart_title}{a character. Set custom title}

\item{label_margin}{a numeric. Set width of label margins in "categorical" type}
}
\value{
a \code{r2d3} object.
}
\description{
Function \code{\link{plotD3.aggregated_profiles_explainer}} plots an aggregate of ceteris paribus profiles.
It works in a similar way to \code{\link{plotD3.ceteris_paribus_explainer}} but, instead of individual profiles,
show average profiles for each variable listed in the \code{variables} vector.

Find more detailes in \href{https://pbiecek.github.io/PM_VEE/ceterisParibus.html}{Ceteris Paribus Chapter}.
}
\examples{
library("DALEX")
library("randomForest")

titanic_small <- na.omit(titanic[1:500,-5])
model_titanic_rf <- randomForest(survived == "yes" ~ gender + age + embarked + class +
                                   fare + sibsp + parch,  data = titanic_small)

explain_titanic_rf <- explain(model_titanic_rf,
                              data = titanic_small[,-8],
                              y = titanic_small$survived == "yes",
                              label = "Random Forest v7")

selected_passangers <- select_sample(titanic_small, n = 100)
cp_rf <- ceteris_paribus(explain_titanic_rf, selected_passangers)

pdp_rf_p <- aggregate_profiles(cp_rf, type = "partial", variable_type = "numerical")
pdp_rf_p$`_label_` <- "RF_partial"
pdp_rf_c <- aggregate_profiles(cp_rf, type = "conditional", variable_type = "numerical")
pdp_rf_c$`_label_` <- "RF_conditional"
pdp_rf_a <- aggregate_profiles(cp_rf, type = "accumulated", variable_type = "numerical")
pdp_rf_a$`_label_` <- "RF_accumulated"

plotD3(pdp_rf_p, pdp_rf_c, pdp_rf_a, variable_type = "numerical", scale_plot = TRUE)

pdp <- aggregate_profiles(cp_rf, type = "partial", variable_type = "categorical")
pdp$`_label_` <- "RF_partial"

plotD3(pdp, variables = c("gender","class"), variable_type = "categorical", label_margin = 70)

}
\references{
Predictive Models: Visual Exploration, Explanation and Debugging \url{https://pbiecek.github.io/PM_VEE}
}
