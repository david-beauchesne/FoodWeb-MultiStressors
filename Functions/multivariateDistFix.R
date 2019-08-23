newParamFix <- function(p, s){
  # Generate new parameters either in positive, negative or both directions
  # Data.frame with data to generate
  df <- data.frame(param = p[order(names(p))],
                   space = s[order(names(s))],
                   stringsAsFactors = F)

  # Number of parameters
  nP <- length(p)

  # If number of parameters and space directions are not equal, stop
  if(nP != length(s)) stop('Number of parameters and space directions must be equal')

  # Generate new parameters
  cand <- numeric(nP)
  for(k in 1:nP) {
    if(df$space[k] == 'neg') {
      cand[k] <- df$param[k]*.99 # 1% variation
    } else if(df$space[k] == 'pos') {
      cand[k] <- df$param[k]*1.01
    }
  }

  names(cand) <- rownames(df)

  return(cand)
}

paramFix <- function(FUN, init, fixed, spaceDir, nSol = 1) {

  # Parameters
  init <- init[order(names(init))]
  nmParam <- names(init)
  nParam <- length(nmParam)

  # Fixed parameters
  lsFixed <- split(init[nmParam %in% fixed], fixed)

  # Parameters to explore
  nmVar <- nmParam[!nmParam %in% fixed]
  lsVar <- split(init[names(init) %in% nmVar], nmVar)
  nVar <- length(nmVar)

  # Combinations of parameters to test
  paramCombn <- list()
  for(i in 1:nVar) paramCombn <- c(paramCombn, combn(nmVar, i, simplify = F))
  nComb <- length(paramCombn)
  nmCombn <- unlist(lapply(paramCombn, paste, collapse = '-'))

  # List to store analytical abundances for combinations of parameter disturbances
  paramSpace <- vector('list', nComb)
  names(paramSpace) <- nmCombn

  # Matrices to store analytical solutions
  for(i in 1:nComb) paramSpace[[i]] <- matrix(nrow = nSol,
                                              ncol = length(paramCombn[[i]])+3,
                                              dimnames = list(c(), c(paramCombn[[i]], 'x','y','z')))

  # Explore parameter space
  for(i in 1:nComb) {
    # Parameters to explore in current iteration
    nm <- paramCombn[[i]]
    p <- init[nmParam %in% nm]
    s <- spaceDir[names(spaceDir) %in% nm]

    # Candidate parameters
    pNew <- newParamFix(p, s)

    # Analytical abundances
    lsNew <- split(pNew, names(pNew))
    A <- do.call(FUN, c(lsFixed, lsNew, lsVar[!names(lsVar) %in% nm]))

    paramSpace[[i]][1, ] <- round(c(pNew, A), 6)
  }

  return(paramSpace)
}

#

# source('./Code/0-Param.R')
# load('./Data/ParamInit/ttParam.Rdata')
# FUN = ttEq
# init = ttParam[1, 1:8]
# fixed = c('alpha')
# spaceDir = c(r='neg', beta='neg', delta='neg',
#             m_y='pos', m_z='pos', mu='neg',
#             omega='neg')
# nSol = 1

paramFixAll <- function(FUN, init, fixed, spaceDir, nSol=1) {
  # Parameters
  init <- init[order(names(init))]
  nmParam <- names(init)
  nParam <- length(nmParam)

  # Initial abundances
  lsInit <- split(init, nmParam)
  A1 <- do.call(FUN, lsInit)

  # Fixed parameters
  lsFixed <- split(init[nmParam %in% fixed], fixed)

  # Parameters to explore
  nmVar <- nmParam[!nmParam %in% fixed]
  lsVar <- split(init[names(init) %in% nmVar], nmVar)
  nVar <- length(nmVar)

  # Combinations of parameters to test
  paramCombn <- list()
  for(i in 1:nVar) paramCombn <- c(paramCombn, combn(nmVar, i, simplify = F))
  nComb <- length(paramCombn)
  nmCombn <- unlist(lapply(paramCombn, paste, collapse = '-'))

  # Matrix to store analytical solutions
  paramSpace <- matrix(nrow = 1,
                       ncol = length(paramCombn[[nComb]]),
                       dimnames = list(c(), paramCombn[[nComb]]))

  # Store abundance and delta abundances for later use
  abundances <- deltaA <- vector('list', nComb)
  names(abundances) <- names(deltaA) <- nmCombn
  for(i in 1:nComb) {
    abundances[[i]] <- deltaA[[i]] <- data.frame(x = numeric(nSol),
                                                y = numeric(nSol),
                                                z = numeric(nSol))
  }

  # Explore parameter space
  # Parameters to explore in current iteration
  nm <- paramCombn[[nComb]]
  p <- init[nmParam %in% nm]
  s <- spaceDir[names(spaceDir) %in% nm]

  # Candidate parameters
  pNew <- newParamFix(p, s)

  # Check if all species abundances are > 1 for all combinations of parameters
  # Logical vector to check condition
  check <- logical(nComb)

  for(i in 1:nComb) {
    # Name of parameter(s) to check abundances
    nmCheck <- paramCombn[[i]]
    pCheck <- pNew[nmCheck]

    # Analytical abundances
    lsCheck <- split(pCheck, nmCheck)
    A2 <- do.call(FUN, c(lsFixed, lsCheck, lsVar[!names(lsVar) %in% nmCheck]))
    names(A2) <- c('x','y','z')

    # Check if all abundances are > 1
    check[i] <- all(A2 > 1)

    # Store abundances
    abundances[[i]][1, ] <- round(A2, 6)

    # Delta abundances
    deltaA[[i]][1, ] <- round((A2-A1)/A1, 6)
  }

  # Parameters
  paramSpace[1, ] <- round(pNew, 6)

  # Return
  return(list(param = paramSpace, abundance = abundances, deltaA = deltaA))
}
