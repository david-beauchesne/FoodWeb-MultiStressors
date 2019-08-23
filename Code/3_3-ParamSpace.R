# Parameters and Functions
source('./Code/0-Param.R')

# ---------- 1 random solution per parameter combination

# ---------------------------------------------------------------------------
#                              Tri-trophic food chain
# ---------------------------------------------------------------------------
# Initial parameters
load('./Data/ParamInit/ttParam.Rdata')

# List to store results for all initial parameters tested
nInit <- nrow(ttParam)
ttSpace <- vector('list', nInit)

# Explore parameter space
for(i in 1:nInit) {
  cat('   Iteration', i, 'of', nInit, '\r')
  ttSpace[[i]] <- paramFix(FUN = ttEq,
                                 init = ttParam[i, 1:8],
                                 fixed = c('alpha'),
                                 spaceDir = c(r='neg', beta='neg', delta='neg',
                                              m_y='pos', m_z='pos', mu='neg',
                                              omega='neg'))
}
save(ttSpace, file = './Data/ParamSpace/ttSpace1P.RData')


# ---------------------------------------------------------------------------
#                                  Omnivory
# ---------------------------------------------------------------------------
# Initial parameters
load('./Data/ParamInit/omParam.Rdata')

# List to store results for all initial parameters tested
nInit <- nrow(omParam)
omSpace <- vector('list', nInit)

# Explore parameter space
for(i in 1:nInit) {
  cat('   Iteration', i, 'of', nInit, '\r')
  omSpace[[i]] <- paramFix(FUN = omEq,
                                 init = omParam[i, 1:10],
                                 fixed = c('alpha'),
                                 spaceDir = c(r='neg', beta='neg', delta='neg',
                                              gamma = 'neg', m_y='pos',m_z='pos',
                                              mu='neg', omega='neg', nu='neg'))
}
save(omSpace, file = './Data/ParamSpace/omSpace1P.RData')


# ---------------------------------------------------------------------------
#                           Exploitative competition
# ---------------------------------------------------------------------------
# Initial parameters
load('./Data/ParamInit/exParam.Rdata')

# List to store results for all initial parameters tested
nInit <- nrow(exParam)
exSpace <- vector('list', nInit)

# Explore parameter space
for(i in 1:nInit) {
  cat('   Iteration', i, 'of', nInit, '\r')
  exSpace[[i]] <- paramFix(FUN = exEq,
                                 init = exParam[i, 1:12],
                                 fixed = c('alpha_x', 'alpha_y','alpha_yz',
                                           'alpha_z', 'alpha_zy'),
                                 spaceDir = c(r='neg', beta='neg', gamma='neg',
                                              m_y='pos', m_z='pos', mu='neg',
                                              nu='neg'))
}
save(exSpace, file = './Data/ParamSpace/exSpace1P.RData')


# ---------------------------------------------------------------------------
#                           Apparent competition
# ---------------------------------------------------------------------------
# Initial parameters
load('./Data/ParamInit/apParam.Rdata')

# List to store results for all initial parameters tested
nInit <- nrow(apParam)
apSpace <- vector('list', nInit)

# Explore parameter space
for(i in 1:nInit) {
  cat('   Iteration', i, 'of', nInit, '\r')
  apSpace[[i]] <- paramFix(FUN = apEq,
                                 init = apParam[i, 1:9],
                                 fixed = c('alpha_x','alpha_y'),
                                 spaceDir = c(r_x='neg', r_y='neg', delta='neg',
                                              gamma='neg', m_z='pos', omega='neg',
                                              nu='neg'))
}
save(apSpace, file = './Data/ParamSpace/apSpace1P.RData')

# ---------------------------------------------------------------------------
#                           Partially disconnected
# ---------------------------------------------------------------------------
# Initial parameters
load('./Data/ParamInit/paParam.Rdata')

# List to store results for all initial parameters tested
nInit <- nrow(paParam)
paSpace <- vector('list', nInit)

# Explore parameter space
for(i in 1:nInit) { # 79 doesn't work...
# for(i in 80:nInit) {
  cat('   Iteration', i, 'of', nInit, '\r')
  paSpace[[i]] <- paramFix(FUN = paEq,
                                 init = paParam[i, 1:7],
                                 fixed = c('alpha_x','alpha_z'),
                                 spaceDir = c(r_x='neg', r_z='neg', beta='neg',
                                              m_y='pos', mu='neg'))
}
# paSpace[[79]] <- paSpace[[80]] # Just for now
save(paSpace, file = './Data/ParamSpace/paSpace1P.RData')


# ---------------------------------------------------------------------------
#                                Disconnected
# ---------------------------------------------------------------------------
# Initial parameters
load('./Data/ParamInit/diParam.Rdata')

# List to store results for all initial parameters tested
nInit <- nrow(diParam)
diSpace <- vector('list', nInit)

# Explore parameter space
for(i in 1:nInit) {
diSpace[[i]] <- paramFix(FUN = diEq,
                               init = diParam[i, 1:6],
                               fixed = c('alpha_x','alpha_y','alpha_z'),
                               spaceDir = c(r_x='neg', r_y='neg', r_z='neg'))
}
save(diSpace, file = './Data/ParamSpace/diSpace1P.RData')
