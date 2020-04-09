# Parameters and functions
source('./Code/0-Param.R')

# ---------------------------------------------------------------------------
# Tri-trophic food chain
# ---------------------------------------------------------------------------
# Load parameters
load('./Data/ParamInit/ttParam.RData')
load('./Data/ParamImpact/ttImpact.RData')

# Evaluate sensitivity, amplification, variance and stability
nSet <- nrow(ttParam)
tt <- vector('list', nSet)
for(i in 1:nrow(ttParam)) {
  tt[[i]] <- summarize_impacts(ParamInit = ttParam[i,],
                               ParamImpact = ttImpact[i,],
                               equilibrium = ttEq, stability = ttSt,
                               motif = 'tt')
}

# ---------------------------------------------------------------------------
# Omnivory
# ---------------------------------------------------------------------------
# Load parameters
load('./Data/ParamInit/omParam.RData')
load('./Data/ParamImpact/omImpact.RData')

# Evaluate sensitivity, amplification, variance and stability
nSet <- nrow(omParam)
om <- vector('list', nSet)
for(i in 1:nrow(omParam)) {
  om[[i]] <- summarize_impacts(ParamInit = omParam[i,],
                               ParamImpact = omImpact[i,],
                               equilibrium = omEq, stability = omSt,
                               motif = 'om')
}

# ---------------------------------------------------------------------------
# Exploitative competition
# ---------------------------------------------------------------------------
# Load parameters
load('./Data/ParamInit/exParam.RData')
load('./Data/ParamImpact/exImpact.RData')

# Evaluate sensitivity, amplification, variance and stability
nSet <- nrow(exParam)
ex <- vector('list', nSet)
for(i in 1:nrow(exParam)) {
  ex[[i]] <- summarize_impacts(ParamInit = exParam[i,],
                               ParamImpact = exImpact[i,],
                               equilibrium = exEq, stability = exSt,
                               motif = 'ex')
}

# ---------------------------------------------------------------------------
# Apparent competition
# ---------------------------------------------------------------------------
# Load parameters
load('./Data/ParamInit/apParam.RData')
load('./Data/ParamImpact/apImpact.RData')

# Evaluate sensitivity, amplification, variance and stability
nSet <- nrow(apParam)
ap <- vector('list', nSet)
for(i in 1:nrow(apParam)) {
  ap[[i]] <- summarize_impacts(ParamInit = apParam[i,],
                               ParamImpact = apImpact[i,],
                               equilibrium = apEq, stability = apSt,
                               motif = 'ap')
}

# ---------------------------------------------------------------------------
# Partially connected
# ---------------------------------------------------------------------------
# Load parameters
load('./Data/ParamInit/paParam.RData')
load('./Data/ParamImpact/paImpact.RData')

# Evaluate sensitivity, amplification, variance and stability
nSet <- nrow(paParam)
pa <- vector('list', nSet)
for(i in 1:nrow(paParam)) {
  pa[[i]] <- summarize_impacts(ParamInit = paParam[i,],
                               ParamImpact = paImpact[i,],
                               equilibrium = paEq, stability = paSt,
                               motif = 'pa')
}

# ---------------------------------------------------------------------------
# Disconnected
# ---------------------------------------------------------------------------
# Load parameters
load('./Data/ParamInit/diParam.RData')
load('./Data/ParamImpact/diImpact.RData')

# Evaluate sensitivity, amplification, variance and stability
nSet <- nrow(diParam)
di <- vector('list', nSet)
for(i in 1:nrow(diParam)) {
  di[[i]] <- summarize_impacts(ParamInit = diParam[i,],
                               ParamImpact = diImpact[i,],
                               equilibrium = diEq, stability = diSt,
                               motif = 'di')
}

# ---------------------------------------------------------------------------
# Single list
# ---------------------------------------------------------------------------
motifs <- c(tt,om,ex,ap,pa,di)

# ---------------------------------------------------------------------------
# Sensitivity, amplification & variance
# ---------------------------------------------------------------------------
# Bind under the name vulnerability
nSet <- length(motifs)
vulnerability <- vector('list', nSet)
for(i in 1:nSet) vulnerability[[i]] <- motifs[[i]][[1]]
vulnerability <- bind_rows(vulnerability)

# Summarize
vulnerability <- vulnerability %>%
                 group_by(Pathways, nParam, Motif, Species, Position) %>%
                 summarise_all(mean, na.rm = T) %>%
                 ungroup()

# Keep only unique positions
pos <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz','pax','pay','paz','dix')
vulnerability <- vulnerability[vulnerability$Position %in% pos, ]



# ---------------------------------------------------------------------------
# Stability
# ---------------------------------------------------------------------------
# Bind under the name stability
nSet <- length(motifs)
stability <- vector('list', nSet)
for(i in 1:nSet) stability[[i]] <- motifs[[i]][[2]]
stability <- bind_rows(stability)

# Summarize
stability <- stability %>%
             group_by(Pathways, nParam, Motif) %>%
             summarise_all(mean, na.rm = T) %>%
             ungroup()


# -----------------------------------------------------------------------------
# Export data
# -----------------------------------------------------------------------------
save(vulnerability, file = './Data/vulnerability.RData')
save(stability, file = './Data/stability.RData')
