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
# png('./Figures/positionFrequencySL.png', width = 1800, height = 1200,
#     res = 200, pointsize = 6)
# par(mfrow = c(1,3))
# heatmapPos(ssl80, main = 'Southern St. Lawrence (mid-1980s)')
# # heatmapPos(ssl90, main = 'Southern St. Lawrence (mid-1990s)')
# heatmapPos(nsl80, main = 'Northern St. Lawrence(mid-1980s)')
# # heatmapPos(nsl90, main = 'Northern St. Lawrence(mid-1990s)')
# heatmapPos(est, main = 'Lower St. Lawrence Estuary (2008-2010)')
# dev.off()


# Scores
load('./Data/Scores.RData')
dat <- list(ssl80, nsl80, est)
names(dat) <- c('Southern St. Lawrence (mid-1980s)',
                'Northern St. Lawrence (mid-1980s)',
                'St. Lawrence Estuary (2010s)')

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

# Plot
png('./Figures/speciesSensitivityPlot.png', width = 1200, height = 700, res = 200, pointsize = 6)
par(mfrow = c(2,3), mar = c(3,4,2,.5))
for(i in 1:3) {
  plot0(x = c(-4,4), y = c(1,length(spSensitivity[[i]])))
  points(x = spSensitivity[[i]], y = 1:length(spSensitivity[[i]]), pch = 20, cex = 1.5)
  axis(2, at = 1:length(spSensitivity[[i]]), labels = names(spSensitivity[[i]]), las = 2, cex.axis = .65)
  axis(1)
  abline(v = 0, lty = 2)
  if(i == 1) mtext(side = 2, text = 'Sensitivity', line = 2.6)
  mtext(side = 3, text = names(dat)[i], line = 0.25)
}

for(i in 1:3) {
  plot0(x = c(-.02,0.02), y = c(1,length(spAmplification[[i]])))
  points(x = spAmplification[[i]], y = 1:length(spAmplification[[i]]), pch = 20, cex = 1.5)
  axis(2, at = 1:length(spAmplification[[i]]), labels = names(spAmplification[[i]]), las = 2, cex.axis = .5)
  axis(1)
  abline(v = 0, lty = 2)
  if(i == 1) mtext(side = 2, text = 'Amplification', line = 2.6)
}
dev.off()


# iGraph
# Add sensitivity and amplification to igraph objects
maxSens <- max(abs(unlist(spSensitivity)))
maxAmp <- max(abs(unlist(spAmplification)))

for(i in 1:3) {
  # Sensitivity data
  sens <- spSensitivity[[i]]
  uid <- match(vertex.attributes(dat[[i]])$name, names(sens))
  sens <- sens[uid]

  # Amplification data
  amp <- spAmplification[[i]]
  uid <- match(vertex.attributes(dat[[i]])$name, names(amp))
  amp <- amp[uid]

  # Add to igraph object
  dat[[i]] <- dat[[i]] %>% set_vertex_attr("sensitivity", value = sens)
  dat[[i]] <- dat[[i]] %>% set_vertex_attr("amplification", value = amp)

  # Add color to igraph object
  # Color palettes
  pal1 <- colorRampPalette(c('#b4d9fb', '#003260'))
  pal2 <- colorRampPalette(c('#ff9c9c', '#852e2e'))

  # Sensitivity
  sensCol <- x <- (abs(sens) / maxSens) * 100
  sensCol[sens < 0] <- pal2(101)[x[sens < 0] + 1]
  sensCol[sens == 0] <- '#ffffff'
  sensCol[sens > 0] <- pal1(101)[x[sens > 0] + 1]

  # Amplification
  ampCol <- x <- (abs(amp) / maxAmp) * 100
  ampCol[amp < 0] <- pal1(101)[x[amp < 0] + 1]
  ampCol[amp == 0] <- '#ffffff'
  ampCol[amp > 0] <- pal2(101)[x[amp > 0] + 1]

  # Add as vertex attributes
  dat[[i]] <- dat[[i]] %>% set_vertex_attr("sensCol", value = sensCol)
  dat[[i]] <- dat[[i]] %>% set_vertex_attr("ampCol", value = ampCol)
}

# plot igraphs
png('./Figures/speciesScores.png', width = 1800, height = 1400,
    res = 200, pointsize = 6)
par(mfrow = c(2,3), mar = c(1,1,1,1))
layGraph <- layout(matrix(1:6, ncol = 3))
for(i in 1:3) {
  # Sensitivity
  lay <- layout.fruchterman.reingold(dat[[i]])
  x <- NetIndices::TrophInd(mat[[i]])
  lay[,2] <- x$TL
  plot(dat[[i]],
       vertex.size = abs(vertex_attr(dat[[i]], 'sensitivity'))*3,
       vertex.color = vertex_attr(dat[[i]], 'sensCol'),
       # vertex.label = '',
       edge.arrow.size = .25,
       edge.color = '#cdcccd88',
       layout = lay)
  mtext(side = 3, text = names(dat)[i], line = -4, font = 2, cex = 1.25)

  # Amplification
  plot(dat[[i]],
       vertex.size = abs(vertex_attr(dat[[i]], 'amplification'))*900,
       vertex.color = vertex_attr(dat[[i]], 'ampCol'),
       # vertex.label = '',
       edge.arrow.size = .25,
       edge.color = '#cdcccd88',
       layout = lay)
}
dev.off()


# Trophic level and omnivory
tlom <- vector('list', 3)
for(i in 1:3) {
  # Trophic level and omnivory evaluation
  tlom[[i]] <- NetIndices::TrophInd(mat[[i]])

  # Sensitivity
  uid <- match(rownames(tlom[[i]]), names(spSensitivity[[i]]))
  tlom[[i]] <- cbind(tlom[[i]], spSensitivity[[i]][uid])

  # Amplification
  uid <- match(rownames(tlom[[i]]), names(spAmplification[[i]]))
  tlom[[i]] <- cbind(tlom[[i]], spAmplification[[i]][uid])

  # Column names
  colnames(tlom[[i]]) <- c('TL','OM','Sensitivity','Amplification')
}


# Figure
cols <- c('#2e53d766','#21944c66','#d18c2c66')
png('./Figures/TL-OM.png', width = 800, height = 800,
    res = 200, pointsize = 6)
par(mfrow = c(2,2), family = 'serif', mar = c(4,4,.5,.5))
  # Sensitivity
  # Plot 1
  plot0(x = c(0,5), y = c(-5,5))
  axis(1);axis(2)
  mtext(1, text = 'Trophic level', line = 2.25)
  mtext(2, text = 'Sensitivity score', line = 2.25)
  abline(h = 0, lty = 2)
  for(i in 1:3) points(x = tlom[[i]]$TL, y = tlom[[i]]$Sensitivity, pch = 20, col = cols[i], bg = cols[i])
  text(x = rep(.25,3), y = c(4.5,4,3.5), labels = names(dat), adj = c(0,.5), cex = .9)
  points(x = rep(.1, 3), y = c(4.5,4,3.5), cex = 1, col = cols, bg = cols, pch = 20)

  # Plot 2
  plot0(x = c(0,1), y = c(-5,5))
  axis(1);axis(2)
  mtext(1, text = 'Omnivory index', line = 2.25)
  abline(h = 0, lty = 2)
  for(i in 1:3) points(x = tlom[[i]]$OM, y = tlom[[i]]$Sensitivity, pch = 20, col = cols[i], bg = cols[i])

  # Amplification
  # Plot 3
  plot0(x = c(0,5), y = c(-0.02,0.02))
  axis(1);axis(2)
  mtext(1, text = 'Trophic level', line = 2.25)
  mtext(2, text = 'Amplification score', line = 2.25)
  abline(h = 0, lty = 2)
  for(i in 1:3) points(x = tlom[[i]]$TL, y = tlom[[i]]$Amplification, pch = 20, col = cols[i], bg = cols[i])

  # Plot 4
  plot0(x = c(0,1), y = c(-0.02,0.02))
  axis(1);axis(2)
  mtext(1, text = 'Omnivory index', line = 2.25)
  abline(h = 0, lty = 2)
  for(i in 1:3) points(x = tlom[[i]]$OM, y = tlom[[i]]$Amplification, pch = 20, col = cols[i], bg = cols[i])
dev.off()
