library(psych)
library(readr)
library(dplyr)
library(readxl)
library(PerformanceAnalytics)

source('../common/misc.R')
source('../common/correlation-analysis.R')
source('../common/latex-translator.R')

participants <- read_csv('data/SignedUpParticipants.csv')

info_src <- list(
  "difScore" = list(
    sheed = "data", dv = "difScore", wid = "UserID"
    , dv.name = "Diference in Scores"
    , filename = "report/learning-outcomes/scr-signedup-participants/ParametricAnalysis.xlsx")
  
  , "IntrinsicMotivation" = list(
    sheed = "data", dv = "Intrinsic Motivation", wid = "UserID"
    , filename = "report/motivation/scr-signedup-participants/intrinsic-motivation/by-Type/ParametricAnalysis.xlsx")
  , "InterestEnjoyment" = list(
    sheed = "data", dv = "Interest/Enjoyment", wid = "UserID"
    , filename = "report/motivation/scr-signedup-participants/interest-enjoyment/by-Type/ParametricAnalysis.xlsx")
  , "PerceivedChoice" = list(
    sheed = "data", dv = "Perceived Choice", wid = "UserID"
    , filename = "report/motivation/scr-signedup-participants/perceived-choice/by-Type/ParametricAnalysis.xlsx")
  , "PressureTension" = list(
    sheed = "data", dv = "Pressure/Tension", wid = "UserID"
    , filename = "report/motivation/scr-signedup-participants/pressure-tension/by-Type/ParametricAnalysis.xlsx")
  , "EffortImportance" = list(
    sheed = "data", dv = "Effort/Importance", wid = "UserID"
    , filename = "report/motivation/scr-signedup-participants/effort-importance/by-Type/ParametricAnalysis.xlsx")
  
  , "LevelMotivation" = list(
    sheed = "data", dv = "Level of Motivation", wid = "UserID"
    , filename = "report/motivation/scr-signedup-participants/level-of-motivation/by-Type/ParametricAnalysis.xlsx")
  , "Attention" = list(
    sheed = "data", dv = "Attention", wid = "UserID"
    , filename = "report/motivation/scr-signedup-participants/attention/by-Type/ParametricAnalysis.xlsx")
  , "Relevance" = list(
    sheed = "data", dv = "Relevance", wid = "UserID"
    , filename = "report/motivation/scr-signedup-participants/relevance/by-Type/ParametricAnalysis.xlsx")
  , "Satisfaction" = list(
    sheed = "data", dv = "Satisfaction", wid = "UserID"
    , filename = "report/motivation/scr-signedup-participants/satisfaction/by-Type/ParametricAnalysis.xlsx")
)

corr_pair_mods <- get_corr_pair_mods(
  participants, iv = "Type", wid = "UserID", between = c('Type', 'CLRole')
  , corr_var = list(
    dv1=c('difScore')
    , dv2=c('IntrinsicMotivation', 'InterestEnjoyment', 'PerceivedChoice', 'PressureTension', 'EffortImportance'
            , 'LevelMotivation', 'Attention', 'Relevance', 'Satisfaction')
  )
  , info_src = info_src
  , include.subs = TRUE
  , method = "spearman"
)

corr_matrix_mods <- get_corr_matrix_mods(
  participants, corr_pair_mods
  , dvs = list(
    "Diference in Scores and Motivation" = c(
      'Diference in Scores', 'Intrinsic Motivation'
      , 'Interest/Enjoyment', 'Perceived Choice', 'Pressure/Tension', 'Effort/Importance'
      , 'Level of Motivation', 'Attention', 'Relevance', 'Satisfaction')
  )
  , wid = "UserID"
  , method = "spearman"
)

## Write report
write_corr_matrix_report(
  corr_matrix_mods
  , filename = "report/correlation/scr-signedup-participants/CorrMatrixAnalysis.xlsx"
  , override = TRUE
)

write_corr_pair_report(
  corr_pair_mods
  , path = "report/correlation/scr-signedup-participants/"
  , override = TRUE
)

## Write plots
write_corr_matrix_plots(
  corr_matrix_mods
  , path = "report/correlation/scr-signedup-participants/corr-matrix-plots/"
  , override = TRUE
)

write_corr_chart_plots(
  corr_pair_mods
  , path =  "report/correlation/scr-signedup-participants/corr-chart-plots/"
  , override = TRUE
)

write_scatter_plots(
  corr_pair_mods, override = T
  , path = "report/correlation/scr-signedup-participants/corr-scatter-plots/"
)

#############################################################################
## Translate latex resume                                                  ##
#############################################################################
write_summary_corr_matrix_mods_in_latex(
  corr_matrix_mods
  , filename = "report/latex/correlation-scr-signedup-analysis.tex"
  , in_title = paste("between participants' motivation and learning outcomes"
                     ,"in the third empirical study")
)

