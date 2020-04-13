candidateParam <- function(param, paramLow, paramUp, temp, conv=1){
  # New parameters as a function of temperature value and parameter range.
  # As temperature decreases, so does the range of possible parameter values
  cx <- 1 - exp(-conv*temp)
  nP <- length(param)
  paramDiff <- (paramUp - paramLow)
  newParam <- param + runif(nP, -.5*cx*paramDiff, .5*cx*paramDiff)
  newParam <- newParam + (newParam < paramLow) * paramDiff - (newParam > paramUp) * paramDiff
  return(newParam)
}


SimAnnealing <- function(FUN, paramLow, paramUp, optimAbundance = 1:3,
                         fixed = NULL, temp0 = 100, dtemp = 0.1, conv = 1,
                         nrep = 100) {

  # Check parameters
  nmParam <- names(formals(FUN))  # Parameter names
  nParam <- length(nmParam)        # Number of parameters
  nmVar <- nmParam[!nmParam %in% names(fixed)]
  nVar <- length(nmVar)

  # Test functions for optimization procedure
  tst <- expression(all(A2[optimAbundance] > A1[optimAbundance]) & all(A2[optimAbundance] > 1))

  # Initial parameter values
  param <- runif(nVar, paramLow, paramUp)
  names(param) <- nmVar
  lsParam <- split(param, nmVar)
  A1 <- do.call(FUN, c(lsParam, fixed))
  temp <- temp0

  # Simulated annealing algorithm
  while(temp > 0) {
    # Progress bar
    cat("\r", "temperature =" , format(temp, digits = 4))

    # Parameter evaluation
    for (i in 1:nrep){
      # Draw new parameters and evaluate function
      param2 <- candidateParam(param, paramLow, paramUp, temp, conv=conv)
      lsParam2 <- split(param2, nmVar)
      A2 <- do.call(FUN, c(lsParam2, fixed))

      # Evaluate conditions
      if (eval(tst)) {
        # If better, accept new set of parameters
        A1 <- A2
        param <- param2
        names(param) <- nmVar
        lsParam <- split(param, nmVar)
      } else {
        # Acceptance probability
        # Percent difference between resource abundance between two sets of parameters
        diff <- (abs((A1[1]-A2[1]) / max(c(A1[1],A2[1]))) * 100)
        proba <- exp(-diff/temp)
        if (runif(1)<proba) {
          A1 <- A2
          param <- param2
          names(param) <- nmVar
          lsParam <- split(param, nmVar)
        }
      }
    }

    # Update temperature
    temp <- temp - dtemp
  }
  cat("\n")

  # Object to export
  x <- list(lsParam = lsParam,
              param = param,
              abundance = A1)
  names(x$abundance) <- c('x','y','z')

  # Return
  return(x)
}
