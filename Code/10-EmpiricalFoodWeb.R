# source('./Code/5_1-EmpiricalFoodWeb.R')
library(igraph)
source('./Code/0-Param.R')
source('./Functions/triadClassification.R')


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


# Southern St. Lawrence - mid 1990s
# Savenkoff et al. 2004a
  # Savenkoff C.,Bourdages H.,Swain D.P.,Despatie S.-P.,Hanson M.J.,Méthot R.,
  # Morissette L.,Hammill M.O.(2004). Input data and parameter estimates for
  # ecosystem models of the southern Gulf of St. Lawrence (mid-1980s and
  # mid-1990s) Canadian Technical Report of Fisheries and Aquatic Sciences
  # SSL90 <- read.table('./Data/FoodWeb/SouthStLawrence1990.txt', sep = '\t', header = T)
  # ssl90 <- SSL90[, -c(1:3)]  %>% apply(2, as.numeric)
  # ssl90[which(ssl90 > 0)] <- 1
  # rownames(ssl90) <- colnames(ssl90)


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


# Northern St. Lawrence - mid 1990s
# Savenkoff et al. 2004b
  # Savenkoff C.,Bourdages H.,Castonguay M.,Morissette L.,Chabot D.,Hammill M.O.
  # (2004). Input data and parameter estimates for ecosystem models of the
  # northern Gulf of St. Lawrence (mid-1990s) Canadian Technical Report of
  # Fisheries and Aquatic Sciences
  # NSL90 <- read.table('./Data/FoodWeb/NorthStLawrence1980.txt', sep = '\t', header = T)
  # nsl90 <- NSL90[, -c(1:3)]  %>% apply(2, as.numeric)
  # nsl90[which(nsl90 > 0)] <- 1
  # rownames(nsl90) <- colnames(nsl90)


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

# foodWeb <- estG
# mat <- est
# triadProb <- triadProbability(estG, est)

# Triad classification
# triadClass <- triadClassification(est)

# # Triad frequency
# triadFreq <- triadFrequency(est)
#
# # Position frequency
# posFreq <- positionFrequency(est)
#
# Heat map
png('./Figures/positionFrequencySL.png', width = 1800, height = 1200,
    res = 200, pointsize = 6)
par(mfrow = c(1,3))
heatmapPos(ssl80, main = 'Southern St. Lawrence (mid-1980s)')
# heatmapPos(ssl90, main = 'Southern St. Lawrence (mid-1990s)')
heatmapPos(nsl80, main = 'Northern St. Lawrence(mid-1980s)')
# heatmapPos(nsl90, main = 'Northern St. Lawrence(mid-1990s)')
heatmapPos(est, main = 'Lower St. Lawrence Estuary (2008-2010)')
dev.off()


# Scores
load('./Data/Scores.RData')
dat <- list(ssl80, nsl80, est)

# Sensitivity
spSensitivity <- vector('list', length(dat))
for(i in 1:length(dat)) {
  posFreq <- positionFrequency(dat[[i]])
  for(j in 1:ncol(posFreq)) {
  posFreq[, j] <- posFreq[, j] * scores$sensitivity$Mean[scores$sensitivity$position == colnames(posFreq)[j]]
  }
  spSensitivity[[i]] <- rowSums(posFreq) %>% sort()
}

# Amplification
spAmplification <- vector('list', length(dat))
for(i in 1:length(dat)) {
  posFreq <- positionFrequency(dat[[i]])
  for(j in 1:ncol(posFreq)) {
  posFreq[, j] <- posFreq[, j] * scores$amplification$Mean[scores$amplification$position == colnames(posFreq)[j]]
  }
  spAmplification[[i]] <- rowSums(posFreq) %>% sort()
}

# Joint score
scores[[1]] <- arrange(scores[[1]], position)
scores[[2]] <- arrange(scores[[2]], position)
joint <- scores$sensitivity$Mean * scores$amplification$Mean
names(joint) <- scores$sensitivity$position

spJoint <- vector('list', length(dat))
for(i in 1:length(dat)) {
  posFreq <- positionFrequency(dat[[i]])
  for(j in 1:ncol(posFreq)) {
  posFreq[, j] <- posFreq[, j] * joint[names(joint) == colnames(posFreq)[j]]
  }
  spJoint[[i]] <- rowSums(posFreq) %>% sort()
}



# Plot
par(mfrow = c(3,3), mar = c(3,3,.5,.5))
for(i in 1:3) {
  plot0(x = c(2,6), y = c(1,length(spSensitivity[[i]])))
  points(x = spSensitivity[[i]], y = 1:length(spSensitivity[[i]]), pch = 20, cex = 1.5)
  axis(2, at = 1:length(spSensitivity[[i]]), labels = names(spSensitivity[[i]]), las = 2, cex.axis = .5)
  axis(1)
  if(i == 2) mtext(side = 3, text = 'Sensitivity', line = -1)
}

for(i in 1:3) {
  plot0(x = c(0.95,1.2), y = c(1,length(spAmplification[[i]])))
  points(x = spAmplification[[i]], y = 1:length(spAmplification[[i]]), pch = 20, cex = 1.5)
  axis(2, at = 1:length(spAmplification[[i]]), labels = names(spAmplification[[i]]), las = 2, cex.axis = .5)
  axis(1)
  if(i == 2) mtext(side = 3, text = 'Amplification', line = -1)
}


for(i in 1:3) {
  plot0(x = c(2,6), y = c(1,length(spJoint[[i]])))
  points(x = spJoint[[i]], y = 1:length(spJoint[[i]]), pch = 20, cex = 1.5)
  axis(2, at = 1:length(spJoint[[i]]), labels = names(spJoint[[i]]), las = 2, cex.axis = .5)
  axis(1)
  if(i == 2) mtext(side = 3, text = 'Joint', line = -1)
}


# iGraph
# Add sensitivity to igraph objects
for(i in 1:3) {
  # Sensitivity data
  x <- spJoint[[i]]
  uid <- match(vertex.attributes(dat[[i]])$name, names(x))
  x <- x[uid]

  # Add to igraph object
  dat[[i]] <- dat[[i]] %>% set_vertex_attr("joint", value = x)

  # Add color to igraph object
  x <- (x/max(x))*100
  pal <- colorRampPalette(slmeta::slmetaPal('platform'))
  cols <- pal(101)[x+1]
  dat[[i]] <- dat[[i]] %>% set_vertex_attr("color", value = cols)
}

# plot igraphs
png('./Figures/speciesSensitivity.png', width = 1800, height = 700,
    res = 200, pointsize = 6)
par(mfrow = c(1,3), mar = c(1,1,1,1))
nm <- c('Southern St. Lawrence','Northern St. Lawrence','St. Lawrence Estuary')
for(i in 1:3) {
  lay <- layout.fruchterman.reingold(dat[[i]])
  x <- NetIndices::TrophInd(mat[[i]])
  lay[,2] <- x$TL
  plot(dat[[i]],
       vertex.size = vertex_attr(dat[[i]], 'joint')*3,
       vertex.color = vertex_attr(dat[[i]], 'color'),
       # vertex.label = '',
       edge.arrow.size = .25,
       edge.color = '#cdcccd88')
  mtext(side = 3, text = nm[i], line = -4, font = 2, cex = 1.25)
}
dev.off()


# Trophic level and omnivory
png('./Figures/TL-OM.png', width = 800, height = 800,
    res = 200, pointsize = 6)
par(mfrow = c(3,2), family = 'serif', mar = c(4,4,.5,.5))
for(i in 1:3) {
  x <- NetIndices::TrophInd(mat[[i]])
  uid <- match(names(spJoint[[i]]), rownames(x))
  x <- x[uid, ]
  sens = spJoint[[i]]
  y <- cbind(x, sens)

  # Plot 1
  plot0(x = c(0,7), y = c(0,7))
  axis(1);axis(2)
  points(x = y$TL, y = y$sens, pch = 20, col = '#d49145')
  mtext(1, text = 'Trophic level', line = 2.25)
  mtext(2, text = 'Sensitivity score', line = 2.25)

  # Plot 2
  plot0(x = c(0,1), y = c(0,7))
  axis(1);axis(2)
  points(x = y$OI, y = y$sens, pch = 20, col = '#d49145')
  mtext(1, text = 'Omnivory index', line = 2.25)
  mtext(2, text = 'Sensitivity score', line = 2.25)
}
dev.off()
