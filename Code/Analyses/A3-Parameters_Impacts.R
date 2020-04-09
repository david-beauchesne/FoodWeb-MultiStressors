# Parameters and Functions
source('./Code/0-Param.R')
# ---------------------------------------------------------------------------
#                              Tri-trophic food chain
# ---------------------------------------------------------------------------
# Initial parameters
load('./Data/ParamInit/ttParam.Rdata')

# List to store results for all initial parameters tested
nInit <- nrow(ttParam)
ttImpact <- vector('list', nInit)

# Explore parameter space
for(i in 1:nInit) {
  cat('   Iteration', i, 'of', nInit, '\r')
  ttImpact[[i]] <- candidateParam(FUN = ttEq,
                                 init = ttParam[i, ],
                                 fixed = c('alpha'),
                                 spaceDir = c(r='neg', beta='neg', delta='neg',
                                              m_y='pos', m_z='pos', mu='neg',
                                              omega='neg'))
}

# As data.frame
ttImpact <- bind_rows(ttImpact)

save(ttImpact, file = './Data/ParamImpact/ttImpact.RData')


# ---------------------------------------------------------------------------
#                                  Omnivory
# ---------------------------------------------------------------------------
# Initial parameters
load('./Data/ParamInit/omParam.Rdata')

# List to store results for all initial parameters tested
nInit <- nrow(omParam)
omImpact <- vector('list', nInit)

# Explore parameter space
for(i in 1:nInit) {
  cat('   Iteration', i, 'of', nInit, '\r')
  omImpact[[i]] <- candidateParam(FUN = omEq,
                                 init = omParam[i, ],
                                 fixed = c('alpha'),
                                 spaceDir = c(r='neg', beta='neg', delta='neg',
                                              gamma = 'neg', m_y='pos',m_z='pos',
                                              mu='neg', omega='neg', nu='neg'))
}

# As data.frame
omImpact <- bind_rows(omImpact)

save(omImpact, file = './Data/ParamImpact/omImpact.RData')


# ---------------------------------------------------------------------------
#                           Exploitative competition
# ---------------------------------------------------------------------------
# Initial parameters
load('./Data/ParamInit/exParam.Rdata')

# List to store results for all initial parameters tested
nInit <- nrow(exParam)
exImpact <- vector('list', nInit)

# Explore parameter space
for(i in 1:nInit) {
  cat('   Iteration', i, 'of', nInit, '\r')
  exImpact[[i]] <- candidateParam(FUN = exEq,
                                 init = exParam[i, ],
                                 fixed = c('alpha_x', 'alpha_y','alpha_yz',
                                           'alpha_z', 'alpha_zy'),
                                 spaceDir = c(r='neg', beta='neg', gamma='neg',
                                              m_y='pos', m_z='pos', mu='neg',
                                              nu='neg'))
}

# As data.frame
exImpact <- bind_rows(exImpact)

save(exImpact, file = './Data/ParamImpact/exImpact.RData')


# ---------------------------------------------------------------------------
#                           Apparent competition
# ---------------------------------------------------------------------------
# Initial parameters
load('./Data/ParamInit/apParam.Rdata')

# List to store results for all initial parameters tested
nInit <- nrow(apParam)
apImpact <- vector('list', nInit)

# Explore parameter space
for(i in 1:nInit) {
  cat('   Iteration', i, 'of', nInit, '\r')
  apImpact[[i]] <- candidateParam(FUN = apEq,
                                 init = apParam[i, ],
                                 fixed = c('alpha_x','alpha_y'),
                                 spaceDir = c(r_x='neg', r_y='neg', delta='neg',
                                              gamma='neg', m_z='pos', omega='neg',
                                              nu='neg'))
}

# As data.frame
apImpact <- bind_rows(apImpact)

save(apImpact, file = './Data/ParamImpact/apImpact.RData')


# ---------------------------------------------------------------------------
#                           Partially disconnected
# ---------------------------------------------------------------------------
# Initial parameters
load('./Data/ParamInit/paParam.Rdata')

# List to store results for all initial parameters tested
nInit <- nrow(paParam)
paImpact <- vector('list', nInit)

# Explore parameter space
for(i in 1:nInit) {
  cat('   Iteration', i, 'of', nInit, '\r')
  paImpact[[i]] <- candidateParam(FUN = paEq,
                                 init = paParam[i, ],
                                 fixed = c('alpha_x','alpha_z'),
                                 spaceDir = c(r_x='neg', r_z='neg', beta='neg',
                                              m_y='pos', mu='neg'))
}

# As data.frame
paImpact <- bind_rows(paImpact)

save(paImpact, file = './Data/ParamImpact/paImpact.RData')


# ---------------------------------------------------------------------------
#                                Disconnected
# ---------------------------------------------------------------------------
# Initial parameters
load('./Data/ParamInit/diParam.Rdata')

# List to store results for all initial parameters tested
nInit <- 1
diImpact <- vector('list', nInit)

# Explore parameter space
for(i in 1:nInit) {
  cat('   Iteration', i, 'of', nInit, '\r')
  diImpact[[i]] <- candidateParam(FUN = diEq,
                                 init = diParam,
                                 fixed = c('alpha_x','alpha_y','alpha_z'),
                                 spaceDir = c(r_x='neg', r_y='neg', r_z='neg'))
}

# As data.frame
diImpact <- bind_rows(diImpact)

save(diImpact, file = './Data/ParamImpact/diImpact.RData')
