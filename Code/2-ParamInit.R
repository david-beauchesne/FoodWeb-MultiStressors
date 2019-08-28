# Load source code
source('./Code/0-Param.R')

# ---------------------------------------------------------------------------
#                              Tri-trophic food chain
# ---------------------------------------------------------------------------
# Function parameters
nmParam <- names(formals(ttEq))
nParam <- length(nmParam)

# Fixed parameters
lsFixed <- list(r = 1, alpha = .001, mu = .5, omega = .5)
fixed <- unlist(lsFixed)
nmFixed <- names(fixed)
nFix <- length(nmFixed)

# Number of parameters that will vary
nVar <- sum(!nmParam %in% nmFixed)
nmVar <- nmParam[!nmParam %in% nmFixed]

# Number of initial parameters to generate
iter <- 100

# Empty data frames to store initial parameters
df <- matrix(ncol = nVar+nFix+3, nrow = iter, dimnames = list(c(), c(nmFixed, nmVar,'x','y','z')))

# Algorithm
i = 1
cat('   Iteration:', i,'\n')
while(i < (iter+1)) {
  # Simulations
  simul <- SimAnnealing(FUN = ttEq,
                        paramLow = c(.0001, .0001, .01, .01),
                        paramUp = c(.01, .01, .5, .5),
                        optimAbundance = 2:3,
                        fixed = lsFixed,
                        dtemp = .1,
                        temp0 = 100)

  # Save parameters if all species abundances are > 1
  if(all(simul$abundance > 1)) {
    df[i, ] <- c(fixed, simul$param, simul$stability, simul$abundance)
    i <- i+1
    cat('   Iteration:',i,'\n')
  }
}

# Export parameters
ttParam <- df
save(ttParam, file = './Data/ParamInit/ttParam.RData')


# ---------------------------------------------------------------------------
#                                 Omnivory
# ---------------------------------------------------------------------------
# Function parameters
nmParam <- names(formals(omEq))
nParam <- length(nmParam)

# Fixed parameters
lsFixed <- list(r = 1, alpha = .001, mu = .5, omega = .5, nu = .5)
fixed <- unlist(lsFixed)
nmFixed <- names(fixed)
nFix <- length(nmFixed)

# Number of parameters that will vary
nVar <- sum(!nmParam %in% nmFixed)
nmVar <- nmParam[!nmParam %in% nmFixed]

# Number of initial parameters to generate
iter <- 100

# Empty data frames to store initial parameters
df <- matrix(ncol = nVar+nFix+3, nrow = iter, dimnames = list(c(), c(nmFixed, nmVar,'x','y','z')))

# Algorithm
i = 1
cat('   Iteration:', i,'\n')
while(i < (iter+1)) {
  # Simulations
  simul <- SimAnnealing(FUN = omEq,
                        paramLow = c(.0001, .0001, .0001, .01, .01),
                        paramUp = c(.01, .01, .01, .5, .5),
                        fixed = lsFixed,
                        optimAbundance = 2:3,
                        dtemp = .1,
                        temp0 = 100)

  # Save parameters if all species abundances are > 1
  if(all(simul$abundance > 1)) {
    df[i, ] <- c(fixed, simul$param, simul$stability, simul$abundance)
    i <- i+1
    cat('   Iteration:',i,'\n')
  }
}

# Export parameters
omParam <- df
save(omParam, file = './Data/ParamInit/omParam.RData')


# ---------------------------------------------------------------------------
#                             Exploitative competition
# ---------------------------------------------------------------------------
# Function parameters
nmParam <- names(formals(exEq))
nParam <- length(nmParam)

# Fixed parameters
lsFixed <- list(r = 1, alpha_x = .001, alpha_y = .001, alpha_yz = .001,
                alpha_z = .001, alpha_zy = .001, mu = .5, nu = .5)
fixed <- unlist(lsFixed)
nmFixed <- names(fixed)
nFix <- length(nmFixed)


# Number of parameters that will vary
nVar <- sum(!nmParam %in% nmFixed)
nmVar <- nmParam[!nmParam %in% nmFixed]

# Number of initial parameters to generate
iter <- 100

# Empty data frames to store initial parameters
df <- matrix(ncol = nVar+nFix+3, nrow = iter, dimnames = list(c(), c(nmFixed, nmVar,'x','y','z')))

# Algorithm
i = 1
cat('   Iteration:', i,'\n')
while(i < (iter+1)) {
  # Simulations
  simul <- SimAnnealing(FUN = exEq,
                        paramLow = c(.0001, .0001, .01, .01),
                        paramUp = c(.01, .01, .5, .5),
                        fixed = lsFixed,
                        optimAbundance = 2:3,
                        dtemp = .1,
                        temp0 = 100)

  # Save parameters if all species abundances are > 1
  if(all(simul$abundance > 1)) {
    df[i, ] <- c(fixed, simul$param, simul$stability, simul$abundance)
    i <- i+1
    cat('   Iteration:',i,'\n')
  }
}

# Export parameters
exParam <- df
save(exParam, file = './Data/ParamInit/exParam.RData')



# ---------------------------------------------------------------------------
#                             Apparent competition
# ---------------------------------------------------------------------------
# Function parameters
nmParam <- names(formals(apEq))
nParam <- length(nmParam)

# Fixed parameters
lsFixed <- list(r_x = 1, alpha_x = .001, r_y = 1, alpha_y = .001, omega = .5, nu = .5)
fixed <- unlist(lsFixed)
nmFixed <- names(fixed)
nFix <- length(nmFixed)

# Number of parameters that will vary
nVar <- sum(!nmParam %in% nmFixed)
nmVar <- nmParam[!nmParam %in% nmFixed]

# Number of initial parameters to generate
iter <- 100

# Empty data frames to store initial parameters
df <- matrix(ncol = nVar+nFix+3, nrow = iter, dimnames = list(c(), c(nmFixed, nmVar,'x','y','z')))

# Algorithm
i = 1
cat('   Iteration:', i,'\n')
while(i < (iter+1)) {
  # Simulations
  simul <- SimAnnealing(FUN = apEq,
                        paramLow = c(.0001, .0001, .01),
                        paramUp = c(.01, .01, .5),
                        fixed = lsFixed,
                        optimAbundance = 3,
                        dtemp = .1,
                        temp0 = 100)

  # Save parameters if all species abundances are > 1
  if(all(simul$abundance > 1)) {
    df[i, ] <- c(fixed, simul$param, simul$stability, simul$abundance)
    i <- i+1
    cat('   Iteration:',i,'\n')
  }
}

# Export parameters
apParam <- df
save(apParam, file = './Data/ParamInit/apParam.RData')


# ---------------------------------------------------------------------------
#                              Partically disconnected
# ---------------------------------------------------------------------------
# Function parameters
nmParam <- names(formals(paEq))
nParam <- length(nmParam)

# Fixed parameters
lsFixed <- list(r_x = 1, r_z = 1, alpha_x = .001, alpha_z = .001, mu = .5)
fixed <- unlist(lsFixed)
nmFixed <- names(fixed)
nFix <- length(nmFixed)

# Number of parameters that will vary
nVar <- sum(!nmParam %in% nmFixed)
nmVar <- nmParam[!nmParam %in% nmFixed]

# Number of initial parameters to generate
iter <- 100

# Empty data frames to store initial parameters
df <- matrix(ncol = nVar+nFix+3, nrow = iter, dimnames = list(c(), c(nmFixed, nmVar,'x','y','z')))

# Algorithm
i = 1
cat('   Iteration:', i,'\n')
while(i < (iter+1)) {
  # Simulations
  simul <- SimAnnealing(FUN = paEq,
                        paramLow = c(.0001, .01),
                        paramUp = c(.01, .5),
                        optimAbundance = 2:3,
                        fixed = lsFixed,
                        dtemp = .1,
                        temp0 = 100)

  # Save parameters if all species abundances are > 1
  if(all(simul$abundance > 1)) {
    df[i, ] <- c(fixed, simul$param, simul$stability, simul$abundance)
    i <- i+1
    cat('   Iteration:',i,'\n')
  }
}

# Export parameters
paParam <- df
save(paParam, file = './Data/ParamInit/paParam.RData')


# ---------------------------------------------------------------------------
#                              Disconnected
# ---------------------------------------------------------------------------
# All initial parameters will be the same, since the growth rate and the
# density dependent parameter of the resource were set to r = 1 and alpha =
# .001 for all motifs.

# Function parameters
nmParam <- names(formals(diEq))

# Fixed parameters
lsFixed <- list(r_x = 1, r_y = 1, r_z = 1, alpha_x = .001, alpha_y = .001, alpha_z = .001)
fixed <- unlist(lsFixed)
nmFixed <- names(fixed)

# Abundance
A <- do.call(diEq, lsFixed)

# Matrix to store results
df <- matrix(c(fixed, A), ncol = 9, nrow = 1, dimnames = list(c(), c(nmFixed,'x','y','z')))

# Export parameters
diParam <- df
save(diParam, file = './Data/ParamInit/diParam.RData')
