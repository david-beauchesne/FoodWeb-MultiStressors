# Load parameters
source('./Code/0-Param.R')


# ---------------------------------------------------------------------------
#                              Tri-trophic food chain
# ---------------------------------------------------------------------------
# Parameter range
disturb <- data.frame(param = c('r','my','mz','b','d','a'),
                      rangeMin = c(.6, 1, 1, .6, .6, 1),
                      rangeMax = c(1, 1.4, 1.4, 1, 1, 1.4),
                      stringsAsFactors = F)

# Motif
motif <- 'tritrophic'

# Disturbances
ttDist <- disturbance(motif = motif, disturb = disturb, n = 1000)

# Exploratory figure (boxplots)
png('./Figures/tritrophicDisturbance.png', width = 1000, height = 1300, res = 300, pointsize = 6)
disturbBoxplot(ttDist)
dev.off()


# ---------------------------------------------------------------------------
#                                   Omnivory
# ---------------------------------------------------------------------------
# Parameter range
disturb <- data.frame(param = c('r','my','mz','b','d','a','g'),
                      rangeMin = c(.6, 1, 1, .6, .6, 1, .6),
                      rangeMax = c(1, 1.4, 1.4, 1, 1, 1.4, 1),
                      stringsAsFactors = F)

# Motif
motif <- 'omnivory'

# Disturbances
omDist <- disturbance(motif = motif, disturb = disturb, n = 1000)

# Exploratory figure (boxplots)
png('./Figures/omnivoryDisturbance.png', width = 1000, height = 1300, res = 300, pointsize = 6)
disturbBoxplot(omDist)
dev.off()


# ---------------------------------------------------------------------------
#                               Exploitative competition
# ---------------------------------------------------------------------------
# Parameter range
disturb <- data.frame(param = c('r','aii','b','g','my','mz'),
                      rangeMin = c(.6, 1, .6, .6, 1, 1),
                      rangeMax = c(1, 1.4, 1, 1, 1.4, 1.4),
                      stringsAsFactors = F)

# Motif
motif <- 'exploitative'

# Disturbances
exDist <- disturbance(motif = motif, disturb = disturb, n = 1000)

# Exploratory figure (boxplots)
png('./Figures/exploitativeDisturbance.png', width = 1000, height = 1300, res = 300, pointsize = 6)
disturbBoxplot(exDist)
dev.off()



# ---------------------------------------------------------------------------
#                               Apparent competition
# ---------------------------------------------------------------------------
# Parameter range
disturb <- data.frame(param = c('rx','ry','ax','ay','g','d','mz'),
                      rangeMin = c(.6, .6, 1, 1, .6, .6, 1),
                      rangeMax = c(1, 1, 1.4, 1.4, 1, 1, 1.4),
                      stringsAsFactors = F)

# Motif
motif <- 'apparent'

# Disturbances
apDist <- disturbance(motif = motif, disturb = disturb, n = 1000)

# Exploratory figure (boxplots)
png('./Figures/apparentDisturbance.png', width = 1000, height = 1300, res = 300, pointsize = 6)
disturbBoxplot(apDist)
dev.off()


# ---------------------------------------------------------------------------
#                              Partially disconnected
# ---------------------------------------------------------------------------
# Parameter range
disturb <- data.frame(param = c('rx','rz','ax','az','b','my'),
                      rangeMin = c(.6, .6, 1, 1, .6, 1),
                      rangeMax = c(1, 1, 1.4, 1.4, 1, 1.4),
                      stringsAsFactors = F)

# Motif
motif <- 'partial'

# Disturbances
paDist <- disturbance(motif = motif, disturb = disturb, n = 1000)

# Exploratory figure (boxplots)
png('./Figures/partiallyDisturbance.png', width = 1000, height = 1300, res = 300, pointsize = 6)
disturbBoxplot(paDist)
dev.off()



# ---------------------------------------------------------------------------
#                                 Disconnected
# ---------------------------------------------------------------------------
# Parameter range
disturb <- data.frame(param = c('rx','ry','rz','ax','ay','az'),
                      rangeMin = c(.6, .6, .6, 1, 1, 1),
                      rangeMax = c(1, 1, 1, 1.4, 1.4, 1.4),
                      stringsAsFactors = F)

# Motif
motif <- 'disconnected'

# Disturbances
diDist <- disturbance(motif = motif, disturb = disturb, n = 1000)

# Exploratory figure (boxplots)
png('./Figures/disconnectedDisturbance.png', width = 1000, height = 1300, res = 300, pointsize = 6)
disturbBoxplot(diDist)
dev.off()
