# Check initial parameters and remove those that do not provide
# positive abundances for all species after disturbances are applied
# To run after 2.ParamInit.R
source('./Code/0-Param.R')

# Data
# Initial parameters
load('./Data/ParamInit/ttParam.RData')
load('./Data/ParamInit/omParam.RData')
load('./Data/ParamInit/exParam.RData')
load('./Data/ParamInit/apParam.RData')
load('./Data/ParamInit/paParam.RData')
load('./Data/ParamInit/diParam.RData')

# Simulated disturbances
load('./Data/ParamSpace/ttSpace.RData')
load('./Data/ParamSpace/omSpace.RData')
load('./Data/ParamSpace/exSpace.RData')
load('./Data/ParamSpace/apSpace.RData')
load('./Data/ParamSpace/paSpace.RData')
load('./Data/ParamSpace/diSpace.RData')


# Check for negative abundances function
check <- function(space) {
  checkEq <- logical(length(space))
  s <- vector('list', length(space))
  for(i in 1:length(space)) {
    s[[i]] <- bind_rows(space[[i]][[2]])

    # Check if any abundance is < 0
    checkEq[i] <- any(s[[i]] < 0)
  }

  # Return
  !checkEq
}

# Check initial parameters
tt <- check(ttSpace)
om <- check(omSpace)
ex <- check(exSpace)
ap <- check(apSpace)
pa <- check(paSpace)
di <- check(diSpace)


# Subset initial parameters and parameter space to remove those that result in negative abundances with 1% parameter variation
ttParam <- ttParam[tt, ]
omParam <- omParam[om, ]
exParam <- exParam[ex, ]
apParam <- apParam[ap, ]
paParam <- paParam[pa, ]
diParam <- diParam[di, ]
ttSpace <- ttSpace[tt]
omSpace <- omSpace[om]
exSpace <- exSpace[ex]
apSpace <- apSpace[ap]
paSpace <- paSpace[pa]
diSpace <- diSpace[di]

# Export
save(ttParam, file = './Data/ParamInit/ttParam.RData')
save(omParam, file = './Data/ParamInit/omParam.RData')
save(exParam, file = './Data/ParamInit/exParam.RData')
save(apParam, file = './Data/ParamInit/apParam.RData')
save(paParam, file = './Data/ParamInit/paParam.RData')
save(diParam, file = './Data/ParamInit/diParam.RData')
save(ttSpace, file = './Data/ParamSpace/ttSpace.RData')
save(omSpace, file = './Data/ParamSpace/omSpace.RData')
save(exSpace, file = './Data/ParamSpace/exSpace.RData')
save(apSpace, file = './Data/ParamSpace/apSpace.RData')
save(paSpace, file = './Data/ParamSpace/paSpace.RData')
save(diSpace, file = './Data/ParamSpace/diSpace.RData')
