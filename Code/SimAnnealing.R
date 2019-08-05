
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


SimAnnealing <- function(FUN, paramLow, paramUp, temp0 = 40, dtemp = 0.01,
                         conv = 1, nrep = 100, maximize = FALSE) {

  # Check parameters
  nmParam <- names(formals(FUN))  # Parameter names
  nParam <- length(nmParam)       # Number of parameters

  # Test function for optimization procedure
  tst <- ifelse(maximize, expression(E2>E1), expression(E2<E1))

  # Initial parameter values
  param <- runif(nParam, paramLow, paramUp)
  lsParam <- split(param, nmParam)
  E1 <- do.call(FUN, lsParam)
  temp <- temp0

  # Simulated annealing algorithm
  while(temp > 0) {
    # Progress bar
    cat("\r", "temperature =" , format(temp, digits = 4))

    # Parameter evaluation
    for (i in 1:nrep){
      # Draw new parameters and evaluate function
      param2 <- candidateParam(param, paramLow, paramUp, temp, conv=conv)
      lsParam2 <- split(param2, nmParam)
      E2 <- do.call(FUN, lsParam2)

      # Evaluate conditions
      if (eval(tst)) {
        # If better, accept new set of parameters
        E1 <- E2
        param <- param2
        lsParam <- split(param, nmParam)
      } else {
        # Acceptance probability
        proba <- exp(-(abs(E1-E2))/temp)
        if (runif(1)<proba) {
          E1 <- E2
          param <- param2
          lsParam <- split(param, nmParam)
        }
      }
    }

    # Update temperature
    temp <- temp - dtemp
  }
  cat("\n")
  return(list(lsParam=lsParam, cost_values=E2))
}
