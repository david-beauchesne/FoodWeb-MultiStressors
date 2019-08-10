#' Examples
#' disturb <- data.frame(param = c('r','my','mz','b','d','o','a'),
#'                     rangeMin = c(.3, 1, 1, .3, .3, .3, 1),
#'                     rangeMax = c(1, 1.7, 1.7, 1, 1, 1, 1.7),
#'                     stringsAsFactors = F)
#' disturbance(motif = 'tritrophic', disturb = disturb, n = 1000)
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
                                 total = numeric(n),
                                 stability = numeric(n))

    # New population abundance
    for(j in 1:n) {
      # Default parameters à
      p <- defaultParam(motif)

      # New parameters
      for(k in l[[i]]) p[[k]] <- parameterDisturbance[j, k]

      # New abundances
      xyz <- equilibrium(motif, param = p)

      # New stability
      s <- stability(motif, param = p, xyz = xyz[1:3])

      # Integrate in abundance dataset
      abundance[[i]][j, ] <- c(xyz, s)
    }
  }

  # Evaluate delta abundance and stability in percentage
    # List + data frames to store delta abundance
    # Simply copy abundance list and overwrite
    deltaAbundance <- abundance

    # Equilibrium species abundance and stability
    eqXYZ <- equilibrium(motif, param = defaultParam(motif))
    eqS <- stability(motif, param = defaultParam(motif), xyz = eqXYZ)

    # Calculate delta abundance
    # ((Abundance after disturbance - Equilibrium abundance) / equilibrium abundance) * 100
    for(i in 1:length(deltaAbundance)) {
      for(j in 1:4) {
        deltaAbundance[[i]][, j] <- ((abundance[[i]][,j] - eqXYZ[j]) / eqXYZ[j]) * 100
      }
    }

    # Calculate delta stability
    # ((Abundance after disturbance - Equilibrium abundance) / equilibrium abundance) * 100
    for(i in 1:length(deltaAbundance)) {
      deltaAbundance[[i]][, 5] <- ((abundance[[i]][,5] - eqS) / abs(eqS)) * 100
    }


  # Export
  list(parameterDisturbance = parameterDisturbance,
       parameterCombinations = l,
       abundance = abundance,
       deltaAbundance = deltaAbundance)
}
