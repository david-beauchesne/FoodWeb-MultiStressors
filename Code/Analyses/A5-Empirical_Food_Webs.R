# source('./Code/Analyses/5-Empirical_Food_Webs.R')
library(igraph)
source('./Code/0-Param.R')
source('./Code/Functions/triadClassification.R')
source('./Code/Functions/speciesVulnerability.R')

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
  rownames(est) <- colnames(est)
  est[which(est > 0.1)] <- 1

# As matrices
  mat <- vector('list', 3)
  mat[[1]] <- ssl80
  mat[[2]] <- nsl80
  mat[[3]] <- est

# Food webs as igraphs
ssl80 <- graph_from_adjacency_matrix(ssl80, mode = 'directed')
nsl80 <- graph_from_adjacency_matrix(nsl80, mode = 'directed')
est <- graph_from_adjacency_matrix(est, mode = 'directed')

# Measure trophic sensitivity and amplification
dat <- list(ssl80, nsl80, est)
names(dat) <- c('Southern St. Lawrence (mid-1980s)',
                'Northern St. Lawrence (mid-1980s)',
                'St. Lawrence Estuary (2010s)')
foodwebVulnerability <- vector('list', 3)
stressSources <- list(c('Acidification','DNH','SST','SBT','Shipping'),
                      c('Acidification','Hypoxia','Shipping','SBT','SST','DD','PHB'),
                      c('Acidification','Hypoxia','Shipping','SBT','SST','DD','PHB'))

for(i in 1:3) {
  foodwebVulnerability[[i]] <- speciesVulnerability(dat[[i]],
                                                    stressSources[[i]])
                                                    # , triadFreq = T)
}

# Export
save(foodwebVulnerability, file = './Data/Food_Web_Vulnerability.RData')

# Measure and export position frequency for each species
posFreq <- vector('list', 3)
names(posFreq) <- names(dat)
for(i in 1:3) posFreq[[i]] <- positionFrequency(dat[[i]])
for(i in 1:3) posFreq[[i]] <- as.data.frame(posFreq[[i]]) %>% mutate(Species = rownames(.))
save(posFreq, file = './Data/Food_Web_Position_Frequency.RData')
