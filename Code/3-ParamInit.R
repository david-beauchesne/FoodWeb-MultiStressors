# Load source code
source('./Code/0-Param.R')

# ---------------------------------------------------------------------------
#                              Tri-trophic food chain
# ---------------------------------------------------------------------------
# Function parameters
nmParam <- names(formals(ttSt))
nParam <- length(nmParam)

# Fixed parameters
lsFixed <- list(r = 1, alpha = .001)
fixed <- unlist(lsFixed)
nmFixed <- names(fixed)

# Number of parameters that will vary
nVar <- sum(!nmParam %in% nmFixed)
nmVar <- nmParam[!nmParam %in% nmFixed]

# Number of initial parameters to generate
iter <- 100

# Empty data frames to store initial parameters
df <- matrix(ncol = nVar+5, nrow = iter, dimnames = list(c(), c(nmFixed, nmVar,'x','y','z')))

# Algorithm
i = 1
cat('   Iteration:', i,'\n')
while(i < (iter+1)) {
  # Simulations
  simul <- SimAnnealing(FUN = ttEq,
                        paramLow = c(.0001, .01, .0001, .01, .01, .01),
                        paramUp = c(.01, .5, .01, .5, .5, .5),
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
nmParam <- names(formals(omSt))
nParam <- length(nmParam)

# Fixed parameters
lsFixed <- list(r = 1, alpha = .001)
fixed <- unlist(lsFixed)
nmFixed <- names(fixed)

# Number of parameters that will vary
nVar <- sum(!nmParam %in% nmFixed)
nmVar <- nmParam[!nmParam %in% nmFixed]

# Number of initial parameters to generate
iter <- 100

# Empty data frames to store initial parameters
df <- matrix(ncol = nVar+5, nrow = iter, dimnames = list(c(), c(nmFixed, nmVar,'x','y','z')))

# Algorithm
i = 1
cat('   Iteration:', i,'\n')
while(i < (iter+1)) {
  # Simulations
  simul <- SimAnnealing(FUN = omEq,
                        paramLow = c(.0001, .01, .0001, .01, .0001, .01, .01, .01),
                        paramUp = c(.01, .5, .01, .5, .01, .5, .5, .5),
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
nmParam <- names(formals(exSt))
nParam <- length(nmParam)

# Fixed parameters
lsFixed <- list(r = 1, alpha_x = .001, alpha_y = .001, alpha_yz = .001, alpha_z = .001, alpha_zy = .001)
fixed <- unlist(lsFixed)
nmFixed <- names(fixed)

# Number of parameters that will vary
nVar <- sum(!nmParam %in% nmFixed)
nmVar <- nmParam[!nmParam %in% nmFixed]

# Number of initial parameters to generate
iter <- 100

# Empty data frames to store initial parameters
df <- matrix(ncol = nVar+9, nrow = iter, dimnames = list(c(), c(nmFixed, nmVar,'x','y','z')))

# Algorithm
i = 1
cat('   Iteration:', i,'\n')
while(i < (iter+1)) {
  # Simulations
  simul <- SimAnnealing(FUN = exEq,
                        paramLow = c(.0001, .01, .0001, .01, .01, .01),
                        paramUp = c(.01, .5, .01, .5, .5, .5),
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
nmParam <- names(formals(apSt))
nParam <- length(nmParam)

# Fixed parameters
lsFixed <- list(r_x = 1, alpha_x = .001, r_y = 1, alpha_y = .001)
fixed <- unlist(lsFixed)
nmFixed <- names(fixed)

# Number of parameters that will vary
nVar <- sum(!nmParam %in% nmFixed)
nmVar <- nmParam[!nmParam %in% nmFixed]

# Number of initial parameters to generate
iter <- 100

# Empty data frames to store initial parameters
df <- matrix(ncol = nVar+7, nrow = iter, dimnames = list(c(), c(nmFixed, nmVar,'x','y','z')))

# Algorithm
i = 1
cat('   Iteration:', i,'\n')
while(i < (iter+1)) {
  # Simulations
  simul <- SimAnnealing(FUN = apEq,
                        paramLow = c(.0001, .01, .0001, .01, .01),
                        paramUp = c(.01, .5, .01, .5, .5),
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
