summarize_impacts <- function(ParamInit, ParamImpact, equilibrium, stability, motif) {
  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # Initial conditions (pre-stressor)
  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # Number of parameters in model
  nParam <- length(ParamInit)

  # Names of parameters in model
  nmParam <- names(ParamInit)

  # List of initial parameters
  lsInit <- split(as.matrix(ParamInit), nmParam)

  # Initial abundances
  InitAbundances <- do.call(equilibrium, lsInit)

  # Initial stability
  InitStability <- do.call(stability, lsInit)

  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # Impacted conditions (post-stressor)
  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # Number of impacted parameters
  nImpact <- length(ParamImpact)

  # Names of impacted parameters
  nmImpact <- names(ParamImpact)

  # Pathways of effect
  pathways <- list()
  for(i in 1:nImpact) pathways <- c(pathways, combn(nmImpact, i, simplify = F))

  # Number of integrative pathways of effect (K)
  nK <- length(pathways)

  # Names of integrative pathways of effect
  nmK <- unlist(lapply(pathways, paste, collapse = '-'))

  # Number of parameters in pathways of effect (unitary pathways of effect; k)
  k <- unlist(lapply(pathways, length))

  # Impacted abundances and stability
  ImpactAbundances <- data.frame(Pathways = nmK, nParam = k, Motif = motif,
                                 x = numeric(nK),
                                 y = numeric(nK),
                                 z = numeric(nK),
                                 stringsAsFactors = F, row.names = NULL)

  ImpactStability <- data.frame(Pathways = nmK, nParam = k, Motif = motif,
                                InitStability = InitStability,
                                ImpactStability = numeric(nK),
                                stringsAsFactors = F)

  for(i in 1:nK) {
    # Initial parameters
    param <- ParamInit

    # Replace impacted parameters
    param[, pathways[[i]]] <- ParamImpact[, pathways[[i]]]

    # List of parameters
    lsImpact <- split(as.matrix(param), nmParam)

    # Impacted abundances
    ImpactAbundances[i,c('x','y','z')] <- do.call(equilibrium, lsImpact)

    # Impacted stability
    ImpactStability[i, 'ImpactStability'] <- do.call(stability, lsImpact)
  }

  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # Abundance data
  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  library(dplyr)
  library(magrittr)

  # Gather data
  ImpactAbundances <- gather(ImpactAbundances, 'Species', 'ImpactAbundances',
                             -Pathways, -nParam, -Motif)

  # Add unique position
  ImpactAbundances$Position <- paste0(ImpactAbundances$Motif,
                                      ImpactAbundances$Species)

  # Add initial abundances
  uid <- match(ImpactAbundances$Species, c('x','y','z'))
  ImpactAbundances$InitAbundances <- InitAbundances[uid]

  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # Trophic sensitivity
  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # > We define a species ($m$) trophic sensitivity ($S_{m,K}$) as the net
  # > impact -- *i.e.* the pre- and post-stressors variation in abundance --
  # > resulting from an integrative pathway of effect $K$:
  # >
  # > $$S_{m,K} = \frac{a_{m,K} - a_m}{a_m}$$
  # >
  # > where $a_m$ and $a_{m,K}$ are the pre- and post-stressors abundances of
  # > species $m$, respectively.
  sensitivity <- function(init, impact) (impact - init) / init

  ImpactAbundances$Sensitivity <- sensitivity(ImpactAbundances$InitAbundances,
                                              ImpactAbundances$ImpactAbundances)


  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # Trophic amplification
  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # > We define a species ($m$) trophic amplification ($A_{m,K}$) as the
  # > difference between its trophic sensitivity to an integrative pathway of
  # > effect ($K$) and the sum of its trophic sensitivities to the unitary
  # > pathways of effect forming $K$ ($k \in K$):
  # >
  # > $$A_{m, K} = \sum_{k \in K} S_{m, k} - \frac{1}{|K|} S_{m, K}$$
  # >
  # > where $|K|$ is the number of unitary pathways of effect $k$ forming the
  # > integrative pathway of effect $K$.
  amplification <- function(SK, Sk, n) {
    if (n == 1) {
      NA
    } else {
      int <- (1/n)*SK
      sum(int-Sk)
    }
  }

  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # Variance
  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # > Comparing the effective and expected impacts of a unitary pathway of
  # > effect -- *i.e.* the average impact of an integerative pathways of effect
  # > -- provides a measure of variance associated to trophic sensitivity to an
  # > integrative pathway of effect ($K$):
  # >
  # > $$V_{m, K} = \sum_{k \in K} \left(S_{m, k} - \frac{1}{|K|} S_{m, K} \right)^2$$
  variance <- function(SK, Sk, n) {
    if (n == 1) {
      NA
    } else {
      int <- (1/n)*SK
      sum((int-Sk)^2)
    }
  }

  # Trophic amplification & variance
  ImpactAbundances$Amplification <- NA
  ImpactAbundances$Variance <- NA
  for(i in 1:nrow(ImpactAbundances)) {
    # S_{m,K}
    SK <- ImpactAbundances$Sensitivity[i]

    # |K|
    n <- ImpactAbundances$nParam[i]

    # Sk
    pos <- ImpactAbundances$Species[i]
    k <- unlist(stringr::str_split(ImpactAbundances$Pathways,'-')[i])
    uid <- ImpactAbundances$Pathways %in% k & ImpactAbundances$Species == pos
    Sk <- ImpactAbundances$Sensitivity[uid]

    # Trophic amplification
    ImpactAbundances$Amplification[i] <- amplification(SK, Sk, n)

    # Variance
    ImpactAbundances$Variance[i] <- variance(SK, Sk, n)
  }

  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # Remove abundance data
  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  ImpactAbundances <- select(ImpactAbundances, -InitAbundances, -ImpactAbundances)

  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # Stability data
  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # Calculate a percent variation in stability for now
  StabilityVariation <- function(S1, S2) (S2-S1)/S1

  ImpactStability$StabilityVariation <- StabilityVariation(ImpactStability$InitStability,
                                                           ImpactStability$ImpactStability)

  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # Remove stability data
  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # ImpactStability <- select(ImpactStability, -InitStability, -ImpactStability)

  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  # Return impact summary
  # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
  return(list(ImpactAbundances, ImpactStability))
}
