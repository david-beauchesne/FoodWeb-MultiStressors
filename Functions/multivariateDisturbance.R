multivariateDisturbance <- function(init, disturb) {
  A1 <- round(init[c('x','y','z')], 6)

  # List to store results
  deltaA <- vector('list', length(disturb))
  names(deltaA) <- names(disturb)

  for(i in 1:length(disturb)) {
    # Abundance after disturbance
    A2 <- disturb[[i]][, c('x','y','z')] %>% as.data.frame()


    # Delta abundance
    d <- A2 %>%
         mutate(x = round((x-A1[1]) / A1[1], 4),
                y = round((y-A1[2]) / A1[2], 4),
                z = round((z-A1[3]) / A1[3], 4))

    deltaA[[i]] <- d
  }

  # Return
  return(deltaA)
}



multiDF <- function(init, disturb) {
  # Names of pathways of effects
  nm <- names(disturb)
  nNm <- length(nm)
  nSol <- nrow(disturb[[1]])

  # Calculate delta abundance for all parameter combinations and transform as
  # data.frame
  multi <- multivariateDisturbance(init = init, disturb = disturb) %>%
           bind_rows() %>%
           mutate(pathway = rep(nm, each = nSol))
}
