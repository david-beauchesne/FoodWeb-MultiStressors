univariateDisturbance <- function(FUN, param, percent) {
  # Parameters to use
  p <- param
  nP <- length(p)
  nmP <- names(p)

  # Matrix to store resuts
  mat <- matrix(nrow = 3, ncol = nP, dimnames = list(c('x','y','z'), nmP))

  # Initial abundances
  A1 <- do.call(FUN, p)

  # Parameters for which disturbances are an increase in parameter value
  dirPos <- c('m_y','m_z','alpha','alpha_x','alpha_y','alpha_z','alpha_yz','alpha_zy')

  # Disturbances equal to 10% of the initial parameter value
  for(j in nmP) {
    # Disturbance
    pD <- p
    if(j %in% dirPos) {
      pD[j][[1]] <- pD[j][[1]] * (1+percent)
    } else {
      pD[j][[1]] <- pD[j][[1]] * (1-percent)
    }

    # Updated abundances
    A2 <- do.call(FUN, pD)

    # Delta abundance
    d <- (A2 - A1) / A1

    # Store in matrix
    mat[,j] <- d

    # Transform as data.frame
    mat <- as.data.frame(mat)
  }

  # Return
  return(mat)
}
