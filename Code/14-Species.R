# source('./Code/14-Species.R')
library(igraph)
library(latex2exp)
source('./Code/0-Param.R')
source('./Functions/triadClassification.R')
source('./Functions/speciesScores.R')

# Topology scores
load('./Data/SpeciesTopoScores.RData') # Realised scores


# DATA
# Southern St. Lawrence - mid 1980s
# Savenkoff et al. 2004a
  # Savenkoff C.,Bourdages H.,Swain D.P.,Despatie S.-P.,Hanson M.J.,Méthot R.,
  # Morissette L.,Hammill M.O.(2004). Input data and parameter estimates for
  # ecosystem models of the southern Gulf of St. Lawrence (mid-1980s and
  # mid-1990s) Canadian Technical Report of Fisheries and Aquatic Sciences
  SSL80 <- read.table('./Data/FoodWeb/SouthStLawrence1980.txt', sep = '\t', header = T)
  ssl80 <- SSL80[, -c(1:3)]  %>% apply(2, as.numeric)
  ssl80[which(ssl80 > 0.1)] <- 1
  rownames(ssl80) <- colnames(ssl80)

# Northern St. Lawrence - mid 1980s
# Morrissette et al. 2003
  # Morissette L.,Despatie S.-P.,Savenkoff C.,Hammill M.O.,Bourdages H.,Chabot D.
  # (2003). Data gathering and input parameters to construct ecosystem models
  # for the northern Gulf of St. Lawrence (mid-1980's) Canadian Technical Report
  # of Fisheries and Aquatic Sciences
  NSL80 <- read.table('./Data/FoodWeb/NorthStLawrence1980.txt', sep = '\t', header = T)
  nsl80 <- NSL80[, -c(1:3)]  %>% apply(2, as.numeric)
  nsl80[which(nsl80 > 0.1)] <- 1
  rownames(nsl80) <- colnames(nsl80)

# St. Lawrence estuary
# Savenkoff 2012
  # Savenkoff, C. 2012. Input data and parameter estimates for ecosystem models
  # of the lower St. Lawrence Estuary (2008–2010). Can. Tech. Rep. Fish. Aquat.
  # Sci. 2999: vii+150 pp.
  EST <- read.table('./Data/FoodWeb/estuary.txt', sep = '\t', header = T)
  est <- EST[, -c(1:3)]  %>% apply(2, as.numeric)
  # Transform data to make sure every column sums to 1
  # nC <- (ncol(est)-2):ncol(est)
  # est[,-nC] <- apply(est[, -nC], 2, function(x) (x/sum(x)))
  # est <- est/100 # Percentage
  rownames(est) <- colnames(est)
  est[which(est > 0.1)] <- 1

# As matrices
  mat <- vector('list', 3)
  mat[[1]] <- ssl80
  mat[[2]] <- nsl80
  mat[[3]] <- est

# Food webs as igraphs
ssl80 <- graph_from_adjacency_matrix(ssl80, mode = 'directed')#, weighted = TRUE)
# ssl90 <- graph_from_adjacency_matrix(ssl90, mode = 'directed')
nsl80 <- graph_from_adjacency_matrix(nsl80, mode = 'directed')
# nsl90 <- graph_from_adjacency_matrix(nsl90, mode = 'directed')
est <- graph_from_adjacency_matrix(est, mode = 'directed')

# Measure trophic impact
dat <- list(ssl80, nsl80, est)
names(dat) <- c('Southern St. Lawrence (mid-1980s)',
                'Northern St. Lawrence (mid-1980s)',
                'St. Lawrence Estuary (2010s)')
impact <- vector('list', 3)
for(i in 1:3) impact[[i]] <- vector('list',7)

stressSources <- list(c('Acidification','Hypoxia','SBT','SST'),
                      c('Shipping'),
                      c('DD','PHB','DNH'),
                      c('Acidification','Hypoxia','SBT','SST','Shipping'),
                      c('Acidification','Hypoxia','SBT','SST','DD','PHB','DNH'),
                      c('Shipping','DD','PHB','DNH'),
                      c('Acidification','Hypoxia','Shipping','SBT','SST','DD','PHB','DNH'))

for(i in 1:3) {
  for(j in 1:7) {
    impact[[i]][[j]] <- speciesScores(dat[[i]], stressSources[[j]])
  }
}



# Data
fw <- read.table('./Data/FoodWeb/disturbances0.txt', sep = '\t', header = T, stringsAsFactors = F) # FW

fwSSL <- fw %>%
         select(-Species) %>%
         left_join(impact[[1]][[1]], by = c('Group' = 'species')) %>% rename(C_sen = Sensitivity, C_amp = Amplification) %>%
         left_join(impact[[1]][[2]], by = c('Group' = 'species')) %>% rename(S_sen = Sensitivity, S_amp = Amplification) %>%
         left_join(impact[[1]][[3]], by = c('Group' = 'species')) %>% rename(F_sen = Sensitivity, F_amp = Amplification) %>%
         left_join(impact[[1]][[4]], by = c('Group' = 'species')) %>% rename(CS_sen = Sensitivity, CS_amp = Amplification) %>%
         left_join(impact[[1]][[5]], by = c('Group' = 'species')) %>% rename(CF_sen = Sensitivity, CF_amp = Amplification) %>%
         left_join(impact[[1]][[6]], by = c('Group' = 'species')) %>% rename(SF_sen = Sensitivity, SF_amp = Amplification) %>%
         left_join(impact[[1]][[7]], by = c('Group' = 'species')) %>% rename(CSF_sen = Sensitivity, CSF_amp = Amplification) %>%
         mutate(Region = 'SSL')

fwNSL <- fw %>%
         select(-Species) %>%
         left_join(impact[[2]][[1]], by = c('Group' = 'species')) %>% rename(C_sen = Sensitivity, C_amp = Amplification) %>%
         left_join(impact[[2]][[2]], by = c('Group' = 'species')) %>% rename(S_sen = Sensitivity, S_amp = Amplification) %>%
         left_join(impact[[2]][[3]], by = c('Group' = 'species')) %>% rename(F_sen = Sensitivity, F_amp = Amplification) %>%
         left_join(impact[[2]][[4]], by = c('Group' = 'species')) %>% rename(CS_sen = Sensitivity, CS_amp = Amplification) %>%
         left_join(impact[[2]][[5]], by = c('Group' = 'species')) %>% rename(CF_sen = Sensitivity, CF_amp = Amplification) %>%
         left_join(impact[[2]][[6]], by = c('Group' = 'species')) %>% rename(SF_sen = Sensitivity, SF_amp = Amplification) %>%
         left_join(impact[[2]][[7]], by = c('Group' = 'species')) %>% rename(CSF_sen = Sensitivity, CSF_amp = Amplification) %>%
         mutate(Region = 'NSL')

fwESL <- fw %>%
         select(-Species) %>%
         left_join(impact[[3]][[1]], by = c('Group' = 'species')) %>% rename(C_sen = Sensitivity, C_amp = Amplification) %>%
         left_join(impact[[3]][[2]], by = c('Group' = 'species')) %>% rename(S_sen = Sensitivity, S_amp = Amplification) %>%
         left_join(impact[[3]][[3]], by = c('Group' = 'species')) %>% rename(F_sen = Sensitivity, F_amp = Amplification) %>%
         left_join(impact[[3]][[4]], by = c('Group' = 'species')) %>% rename(CS_sen = Sensitivity, CS_amp = Amplification) %>%
         left_join(impact[[3]][[5]], by = c('Group' = 'species')) %>% rename(CF_sen = Sensitivity, CF_amp = Amplification) %>%
         left_join(impact[[3]][[6]], by = c('Group' = 'species')) %>% rename(SF_sen = Sensitivity, SF_amp = Amplification) %>%
         left_join(impact[[3]][[7]], by = c('Group' = 'species')) %>% rename(CSF_sen = Sensitivity, CSF_amp = Amplification) %>%
         mutate(Region = 'ESL')

# Arrange data
fwSL <- rbind(fwSSL,fwNSL,fwESL) %>%
        select(-Description,-Acidification,-Hypoxia,-SBT,-SST,-Shipping,-DD,-DNH,-PHB,-Hunting) %>%
        gather(key = "Driver_Type", value = "Score", -Group, -Region) %>%
        mutate(Driver = substr(Driver_Type, 1, nchar(Driver_Type)-4),
               ScoreType = substr(Driver_Type, nchar(Driver_Type)-2, nchar(Driver_Type))) %>%
        select(-Driver_Type) %>%
        mutate(x = as.numeric(factor(Driver, levels = c('C','S','F','CS','CF','SF','CSF'))),
               col = as.numeric(factor(Region)))

# Colors
cols <- c('#d18c2cAA','#21944cAA','#2e53d7AA')
fwSL$col[fwSL$col == 1] <- cols[1]
fwSL$col[fwSL$col == 2] <- cols[2]
fwSL$col[fwSL$col == 3] <- cols[3]

# Icons
# Atlantic cod - Gadus morhua
# Milton Tan
# http://phylopic.org/image/bba1800a-dd86-451d-a79b-c5944cfe5231/
cod <- png::readPNG('./img/PhyloPic.bba1800a.Milton-Tan.Gadariae_Gadidae_Gadiformes_Gadinae_Gadus_Gadus-morhua_Zeiogadaria.png', native = T)

# Shrimp
# Phylopic: http://phylopic.org/image/786bbbd0-529d-4e64-a8ac-f54f88194033/
# Author: Maija Karala
# License: https://creativecommons.org/licenses/by-nc-sa/3.0/
# No changes were made
shrimp <- png::readPNG('./img/PhyloPic.786bbbd0.Maija-Karala.Atyidae_Atyinae_Atyoidea_Caridea_Caridina_Caridina-babaulti_Decapoda_Pleocyemata.png', native = T)

# Snow crab
# Phylopic: http://phylopic.org/image/ce70234a-527a-415d-bc1a-e878fccf0e4e/
# Author: Harold N Eyster
# License: https://creativecommons.org/licenses/by/3.0/
# No changes were made
crab <- png::readPNG('./img/PhyloPic.ce70234a.Harold-N-Eyster.Epialtidae_Epialtinae_Majoidea_Pugettia_Pugettia-producta.png', native = T)

# Plot function
plotSpecies <- function(species, scoreType) {
  xR <- c(0,8)
  if(scoreType == 'sen') yR <- c(-10,10)
  if(scoreType == 'amp') yR <- c(-.2,.2)

  plot0(x = xR, y = yR)
  axis(2, line = -.5, cex.axis = 1)
  axis(1, at = 0:8, labels = c('','C','S','F','C-S','C-F','S-F','C-S-F',''), cex.axis = 1)
  lines(x = xR, y = c(0,0), lty = 2)
  mtext(side = 2, text = TeX('\\textbf{Trophic}'), font = 2, line = 3, cex = 1)
  if(scoreType == 'sen') mtext(side = 2, text = TeX('\\textbf{sensitivity} ($\\textit{S_m}$)'), line = 1.5, cex = 1)
  if(scoreType == 'amp') mtext(side = 2, text = TeX('\\textbf{amplification} ($\\textit{A_m}$)'), line = 1.5, cex = 1)

  dat <- fwSL[fwSL$Group == species & fwSL$ScoreType == scoreType, ]
  points(x = dat$x, y = dat$Score, col = dat$col, pch = 20, cex = 2)
}


# Figure
png('./Figures/species.png', width = 1200, height = 900, res = 300, pointsize = 5)
mat <- matrix(c(1:8), nrow = 4, ncol = 2, byrow = T)
mat[4,] <- 7
layout(mat, heights = c(1,1,1,.35))
par(mar = c(3,4.5,.5,.5), family = 'serif')
plotSpecies('LCO','sen')
pchImage(x = .5, y = 9, obj = cod, cex.x = 1.25, cex.y = 1.5, col = '#000000')
plotSpecies('LCO','amp')
# text(x = 8, y = .2, labels = 'Cod', adj = c(1,1), cex = 1.5, font = 2)
plotSpecies('SHR','sen')
pchImage(x = .5, y = 9, obj = shrimp, cex.x = 1.25, cex.y = 1.5, col = '#000000')
plotSpecies('SHR','amp')
# text(x = 8, y = .2, labels = 'Shrimp', adj = c(1,1), cex = 1.5, font = 2)
plotSpecies('LCR','sen')
pchImage(x = .5, y = 8, obj = crab, cex.x = 1.25, cex.y = 2, col = '#000000')
mtext(side = 1, text = 'Stressor groups', font = 2, line = 2.5, cex = 1)
plotSpecies('LCR','amp')
mtext(side = 1, text = 'Stressor groups', font = 2, line = 2.5, cex = 1)
# text(x = 8, y = .2, labels = 'Large crustaceans', adj = c(1,1), cex = 1.5, font = 2)

# Legend
x <- c(-.5, -.156, .31)
par(mar = c(0,0,0,0))
plot0()
points(x = x-.025, y = c(.25, .25, .25), col = cols, pch = 20, cex = 2)
text(x = x, y = c(.25,.25,.25),
     c('St. Lawrence Estuary','Northern Gulf of St. Lawrence','Southern Gulf of St.Lawrence'),
     adj = c(0,.5), font = 1, cex = 1.25)
text(x = 0, y = -.4, 'C: climate change         S: shipping         F: fisheries',
     adj = c(.5,.5), font = 1, cex = 1.25)

dev.off()
