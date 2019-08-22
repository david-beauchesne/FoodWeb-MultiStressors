additivity <- function(space) {
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
  additivity <- data.frame(xAdd = numeric(nM), yAdd = numeric(nM), zAdd = numeric(nM),
                           xInt = numeric(nM), yInt = numeric(nM), zInt = numeric(nM))
  for(i in 1:nM) {
    # Additive model
    uid <- ind[ind$param %in% multi$param[[i]] & ind$id == multi$id[i], c('x','y','z')] %>% # Individual parameters for solution i
           colSums()

    # Joint minus additive model
    int <- round(multi[i, c('x','y','z')] - uid, 4)

    #
    additivity[i, ] <-  c(uid, int)
  }

  # Add to data
  multi <- cbind(multi, additivity) %>%
           rename(xJoint = x, yJoint = y, zJoint = z)

  # Return
  return(multi)
}
