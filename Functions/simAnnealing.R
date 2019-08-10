#
# candidateParam <- function(param, paramLow, paramUp, temp, conv=1){
#   # Do while function parameters do not meet inequality conditions
#   ineq <- FALSE
#   count <- 0
#   while(!ineq) {
#     # New parameters as a function of temperature value and parameter range.
#     # As temperature decreases, so does the range of possible parameter values
#     cx <- 1 - exp(-conv*temp)
#     nP <- length(param)
#     paramDiff <- (paramUp - paramLow)
#     newParam <- param + runif(nP, -.5*cx*paramDiff, .5*cx*paramDiff)
#     newParam <- newParam + (newParam < paramLow) * paramDiff - (newParam > paramUp) * paramDiff
#     lsNew <- split(newParam, names(param))
#
#     # Inequality conditions
#     ineq <- ifelse(do.call(ttIneq, lsNew), FALSE, TRUE)
#     count <- count+1
#     cat(count, '\r')
#   }
#   return(newParam)
# }
#

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



# SimAnnealing <- function(FUN1, FUN2, paramLow, paramUp, fixed = NULL, temp0 = 40,
#                          dtemp = 0.01, conv = 1, nrep = 100) {
#
#   # Check parameters
#   nmParam <- names(formals(FUN1))  # Parameter names
#   nParam <- length(nmParam)        # Number of parameters
#   nmVar <- nmParam[!nmParam %in% names(fixed)]
#   nVar <- length(nmVar)
#
#   # Test functions for optimization procedure
#   tst1 <- expression(S2 < S1)
#   tst2 <- expression(all(A2[2:3] > A1[2:3]))
#
#   # Initial parameter values
#   param <- runif(nVar, paramLow, paramUp)
#   names(param) <- nmVar
#   lsParam <- split(param, nmVar)
#   S1 <- do.call(FUN1, c(lsParam, fixed))
#   A1 <- do.call(FUN2, c(lsParam, fixed))
#   temp <- temp0
#
#   # Simulated annealing algorithm
#   while(temp > 0) {
#     # Progress bar
#     cat("\r", "temperature =" , format(temp, digits = 4))
#
#     # Parameter evaluation
#     for (i in 1:nrep){
#       # Draw new parameters and evaluate function
#       param2 <- candidateParam(param, paramLow, paramUp, temp, conv=conv)
#       lsParam2 <- split(param2, nmVar)
#       S2 <- do.call(FUN1, c(lsParam2, fixed))
#       A2 <- do.call(FUN2, c(lsParam2, fixed))
#
#       # Evaluate conditions
#       if (eval(tst1) & eval(tst2)) {
#       # if (eval(tst2)) {
#         # If better, accept new set of parameters
#         S1 <- S2
#         A1 <- A2
#         param <- param2
#         names(param) <- nmVar
#         lsParam <- split(param, nmVar)
#       } else {
#         # Acceptance probability
#         # proba <- exp(-(abs(A1[3]-A2[3]))/temp) # Maybe verify this acceptance probability?
#         proba <- exp(-(abs(S1-S2))/temp) # Maybe verify this acceptance probability?
#         if (runif(1)<proba) {
#           S1 <- S2
#           A1 <- A2
#           param <- param2
#           names(param) <- nmVar
#           lsParam <- split(param, nmVar)
#         }
#       }
#     }
#
#     # Update temperature
#     temp <- temp - dtemp
#   }
#   cat("\n")
#
#   # Object to export
#   x <- list(lsParam = lsParam,
#               param = param,
#               stability = S1,
#               abundance = A1)
#   names(x$stability) <- "Stability"
#   names(x$abundance) <- c('x','y','z')
#
#   # Return
#   return(x)
# }







# -------------------------------------
# source('./Functions/exploitative.R')
# FUN = exEq
# lsFixed <- list(r = 1, alpha_x = .001, alpha_y = .001, alpha_yz = .001, alpha_z = .001, alpha_zy = .001)
# paramLow = c(.0001, .01, .0001, .01, .01, .01)
# paramUp = c(.01, .5, .01, .5, .5, .5)
# fixed = lsFixed
# dtemp = .1
# temp0 = 10
# conv = 1
# nrep = 100
# optimAbundance = 2:3


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
