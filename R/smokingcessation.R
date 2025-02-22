#' Stochastic Search Inconsistency Factor Selection of interventions for smoking cessation
#'
#' @description
#' Stochastic Search Inconsistency Factor Selection for the evaluation of the consistency
#' assumption for the network meta-analysis model.
#'
#' These data are used as an example in Dias et al. (2013).
#'
#' @name smokingcessation
#'
#' @docType data
#'
#' @format
#' A data frame with the following columns:
#' \tabular{rl}{
#' \bold{\emph{event1}}\tab number of individuals with successful
#'   smoking cessation in arm 1 \cr
#' \bold{\emph{n1}}\tab number of individuals in arm 1 \cr
#' \bold{\emph{event2}}\tab number of individuals with successful
#'   smoking cessation in arm 2 \cr
#' \bold{\emph{n2}}\tab number of individuals in arm 2 \cr
#' \bold{\emph{event3}}\tab number of individuals with successful
#'   smoking cessation in arm 3 \cr
#' \bold{\emph{n3}}\tab number of individuals in arm 3 \cr
#' \bold{\emph{treat1}}\tab treatment 1 \cr
#' \bold{\emph{treat2}}\tab treatment 2 \cr \bold{\emph{treat3}}\tab
#'   treatment 3
#' }
#'
#'
#' @source
#' Dias S, Welton NJ, Sutton AJ, Caldwell DM, Lu G and Ades AE (2013):
#' Evidence Synthesis for Decision Making 4: Inconsistency in networks
#' of evidence based on randomized controlled trials.
#' \emph{Medical Decision Making},
#' \bold{33}, 641--56
#'
#' @importFrom meta pairwise
#'
#' @examples
#' data(smokingcessation)
#'
#' # Transform data from arm-based format to contrast-based format
#'
#' smokingcessation$id <- 1:dim(smokingcessation)[1]
#' smoking.pair <- meta::pairwise(
#'   treat = list(treat1, treat2, treat3),
#'   event = list(event1, event2, event3),
#'   n = list(n1, n2, n3),
#'   studlab = id,
#'   data = smokingcessation,
#'   sm = "OR"
#' )
#'
#' TE <- smoking.pair$TE
#' seTE <- smoking.pair$seTE
#' studlab <- smoking.pair$studlab
#' treat1 <- smoking.pair$treat1
#' treat2 <- smoking.pair$treat2
#'
#' # Stochastic Search Inconsistency Factor Selection using as reference treatment A and the
#' # design-by-treatment method for the specification of the Z matrix.
#'
#' m <- ssifs(TE, seTE, treat1, treat2, studlab, ref = "A",
#' M = 1000, B = 100, M_pilot = 1000, B_pilot = 100)
#'
NULL
