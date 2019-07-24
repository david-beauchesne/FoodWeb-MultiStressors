#' Examples
#' param <- data.frame(param = c('r','my','mz','b','d','o','a'),
#'                     rangeMin = c(.3, 1, 1, .3, .3, .3, 1),
#'                     rangeMax = c(1, 1.7, 1.7, 1, 1, 1, 1.7),
#'                     stringsAsFactors = F)
#' disturbance(motif = 'tritrophic', param = param, n = 1000)
#'
#'
#'
#'
#'
#'


disturbance <- function(motif, disturb, n = 100) {
  # Parameter values after disturbance
  # Load default parameters
  p <- defaultParam(motif)

  # Empty matrix to store disturbed parameters (% of default parameter)
  parameterDisturbance <- matrix(ncol = nrow(disturb),
                                 nrow = n,
                                 dimnames = list(c(), disturb$param))

  # Evaluate disturbed parameters
  for(i in 1:nrow(disturb)) {
    pInit <- p[[disturb$param[i]]]        # Default parameter value
    pMin <- disturb$rangeMin[i]           # Minimum parameter range
    pMax <- disturb$rangeMax[i]           # Maximum parameter range
    pNew <- pInit * runif(n, pMin, pMax)  # Random draw from uniform distribution within specified range
    parameterDisturbance[, i] <- pNew     # Store in matrix
  }

  # Combinations of disturbances to test
  l <- list()
  for(i in 1:nrow(disturb)) l <- c(l, combn(disturb$param, i, simplify = F))

  # List to store analytical abundances for combinations of parameter disturbances
  abundance <- vector('list', length(l))

  # Evaluate population abundance after disturbances
  for(i in 1:length(abundance)) {
    # Data frame to store abundances
    abundance[[i]] <- data.frame(x = numeric(n),
                                 y = numeric(n),
                                 z = numeric(n),
                                 total = numeric(n))

    # New population abundance
    for(j in 1:n) {
      p <- defaultParam(motif)
      for(k in l[[i]]) p[[k]] <- parameterDisturbance[j, k]
      abundance[[i]][j, ] <- equilibrium(motif, param = p)
    }
  }

  # Evaluate delta abundance in percentage
    # List + data frames to store delta abundance
    # Simply copy abundance list and overwrite
    deltaAbundance <- abundance

    # Equilibrium species abundance
    eqXYZ <- equilibrium(motif, param = defaultParam(motif))

    # Calculate delta abundance
    # ((Abundance after disturbance - Equilibrium abundance) / equilibrium abundance) * 100
    for(i in 1:length(deltaAbundance)) {
      for(j in 1:4) {
        deltaAbundance[[i]][, j] <- ((abundance[[i]][,j] - eqXYZ[j]) / eqXYZ[j]) * 100
      }
    }


  # Export
  list(parameterDisturbance = parameterDisturbance,
       parameterCombinations = l,
       abundance = abundance,
       deltaAbundance = deltaAbundance)
}
