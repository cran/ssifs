## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE
)

## ----setup, eval=FALSE--------------------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("georgiosseitidis/ssifs")

## -----------------------------------------------------------------------------
library(ssifs)
data("Alcohol", package = "ssifs")

## -----------------------------------------------------------------------------
TE <- Alcohol$TE
seTE <- Alcohol$seTE
study <- Alcohol$studyid
treat1 <- Alcohol$treat1
treat2 <- Alcohol$treat2

## ---- results = "hide"--------------------------------------------------------
set.seed(12)
m <- ssifs(TE = TE, seTE = seTE, studlab = study, treat1 = treat1, treat2 = treat2, ref = "AO-CT")

## -----------------------------------------------------------------------------
m$Posterior_inclusion_probabilities

## -----------------------------------------------------------------------------
head(m$Posterior_Odds)

## -----------------------------------------------------------------------------
m$Bayes_Factor

## ---- eval = FALSE------------------------------------------------------------
#  spike.slab(m)

