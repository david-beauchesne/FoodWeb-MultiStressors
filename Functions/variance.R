variance <- function(space) {
  # Parameters
  nSol <- nrow(space$deltaA[[1]])
  nmPath <- names(space$deltaA)
  lsParam <- stringr::str_split(nmPath, '-')

  # Delta abundance data.frame
  deltaA <- space$deltaA %>%
            bind_rows() %>%
            mutate(id = rep(1:nSol, nrow(.)/nSol),
                   pathway = rep(nmPath, each = nSol),
                   param = rep(lsParam, each = nSol)) # All parameters

  # Univariate effects
  ind <- lapply(deltaA$param, function(x) length(x) ==  1) %>%
         unlist() %>%
         deltaA[., ]

  # Multivariate effects
  multi <- lapply(deltaA$param, function(x) length(x) >  1) %>%
           unlist() %>%
           deltaA[., ]

  # Additivity
  nM <- nrow(multi)
  varPath <- data.frame(xVar = numeric(nM), yVar = numeric(nM), zVar = numeric(nM))

  for(i in 1:nM) {
    # Variance formula :
    # $$A_{m, K_j} = \sum_{k \in K_j} \left(S_{m, k} - \frac{1}{|K_j|} S_{m, K_j} \right)^2$$

    # Additive model
    unitary <- ind[ind$param %in% multi$param[[i]] & ind$id == multi$id[i], c('x','y','z')] # Individual parameters for solution i

    # Integrative model divided by number of paramters
    intMean <- multi[i, c('x','y','z')] / nrow(unitary)

    # Transform data.frames to matrices
    unitary <- as.matrix(unitary)
    intMean <- as.matrix(intMean)

    # Difference
    unitary <- sweep(unitary, 2, intMean)

    # Squared
    unitary <- unitary^2

    # Variance
    varPath[i,] <- colSums(unitary)
  }

  # Add to data
  multi <- cbind(multi, varPath)

  # Return
  return(multi)
}
