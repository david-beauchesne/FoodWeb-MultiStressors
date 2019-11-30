# source('./Code/5_1-EmpiricalFoodWeb.R')
library(igraph)
source('./Code/0-Param.R')
source('./Functions/triadClassification.R')
source('./Functions/speciesScores.R')

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
stressSources <- list(c('Acidification','DNH','SST','SBT','Shipping','Hunting'),
                      c('Acidification','Hypoxia','Shipping','SBT','SST','DD','PHB','Hunting'),
                      c('Acidification','Hypoxia','Shipping','SBT','SST','DD','PHB','Hunting'))

for(i in 1:3) {
  impact[[i]] <- speciesScores(dat[[i]], stressSources[[i]])
  # impact[[i]] <- speciesScores(dat[[i]], stressSources[[i]], triadFreq = T)
}
# Export
save(impact, file = './Data/SpeciesScores.RData')

# In a list
# spSensitivity <- spAmplification <- vector('list', 3)
# for(i in 1:3) {
#   spSensitivity[[i]] <- impact[[i]]$Sensitivity
#   spAmplification[[i]] <- impact[[i]]$Amplification
#   names(spSensitivity[[i]]) <- names(spAmplification[[i]]) <- impact[[i]]$species
#   spSensitivity[[i]] <- sort(spSensitivity[[i]])
#   spAmplification[[i]] <- sort(spAmplification[[i]])
# }
#
#
# # Species realised sensitivity
# png('./Figures/speciesRealScoresPlot.png', width = 1200, height = 700, res = 200, pointsize = 6)
# par(mfrow = c(2,3), mar = c(3,4,2,.5))
# for(i in 1:3) {
#   plot0(x = c(-10,10), y = c(1,length(spSensitivity[[i]])))
#   points(x = spSensitivity[[i]], y = 1:length(spSensitivity[[i]]), pch = 20, cex = 1.5)
#   axis(2, at = 1:length(spSensitivity[[i]]), labels = names(spSensitivity[[i]]), las = 2, cex.axis = .65)
#   axis(1)
#   abline(v = 0, lty = 2)
#   if(i == 1) mtext(side = 2, text = 'Sensitivity', line = 2.6)
#   mtext(side = 3, text = names(dat)[i], line = 0.25)
# }
#
# for(i in 1:3) {
#   plot0(x = c(-.2,.2), y = c(1,length(spAmplification[[i]])))
#   points(x = spAmplification[[i]], y = 1:length(spAmplification[[i]]), pch = 20, cex = 1.5)
#   axis(2, at = 1:length(spAmplification[[i]]), labels = names(spAmplification[[i]]), las = 2, cex.axis = .5)
#   axis(1)
#   abline(v = 0, lty = 2)
#   if(i == 1) mtext(side = 2, text = 'Amplification', line = 2.6)
# }
# dev.off()
#
#
# # iGraph
# # Add sensitivity and amplification to igraph objects
# maxSens <- max(abs(unlist(spSensitivity)))
# maxAmp <- max(abs(unlist(spAmplification)))
#
# for(i in 1:3) {
#   # Sensitivity data
#   sens <- spSensitivity[[i]]
#   uid <- match(vertex.attributes(dat[[i]])$name, names(sens))
#   sens <- sens[uid]
#
#   # Amplification data
#   amp <- spAmplification[[i]]
#   uid <- match(vertex.attributes(dat[[i]])$name, names(amp))
#   amp <- amp[uid]
#
#   # Add to igraph object
#   dat[[i]] <- dat[[i]] %>% set_vertex_attr("sensitivity", value = sens)
#   dat[[i]] <- dat[[i]] %>% set_vertex_attr("amplification", value = amp)
#
#   # Add color to igraph object
#   # Color palettes
#   pal1 <- colorRampPalette(c('#b4d9fb', '#003260'))
#   pal2 <- colorRampPalette(c('#ff9c9c', '#852e2e'))
#
#   # Sensitivity
#   sensCol <- x <- (abs(sens) / maxSens) * 100
#   sensCol[sens < 0] <- pal2(101)[x[sens < 0] + 1]
#   sensCol[sens == 0] <- '#ffffff'
#   sensCol[sens > 0] <- pal1(101)[x[sens > 0] + 1]
#
#   # Amplification
#   ampCol <- x <- (abs(amp) / maxAmp) * 100
#   ampCol[amp < 0] <- pal1(101)[x[amp < 0] + 1]
#   ampCol[amp == 0] <- '#ffffff'
#   ampCol[amp > 0] <- pal2(101)[x[amp > 0] + 1]
#
#   # Add as vertex attributes
#   dat[[i]] <- dat[[i]] %>% set_vertex_attr("sensCol", value = sensCol)
#   dat[[i]] <- dat[[i]] %>% set_vertex_attr("ampCol", value = ampCol)
# }
#
# # plot igraphs
# png('./Figures/speciesRealisedScores.png', width = 1800, height = 1400,
#     res = 200, pointsize = 6)
# par(mfrow = c(2,3), mar = c(1,1,1,1))
# layGraph <- layout(matrix(1:6, ncol = 3))
# for(i in 1:3) {
#   # Sensitivity
#   lay <- layout.fruchterman.reingold(dat[[i]])
#   x <- NetIndices::TrophInd(mat[[i]])
#   lay[,2] <- x$TL
#   plot(dat[[i]],
#        vertex.size = abs(vertex_attr(dat[[i]], 'sensitivity'))*3,
#        vertex.color = vertex_attr(dat[[i]], 'sensCol'),
#        # vertex.label = '',
#        edge.arrow.size = .25,
#        edge.color = '#cdcccd88',
#        layout = lay)
#   mtext(side = 3, text = names(dat)[i], line = -4, font = 2, cex = 1.25)
#
#   # Amplification
#   plot(dat[[i]],
#        vertex.size = abs(vertex_attr(dat[[i]], 'amplification'))*300,
#        vertex.color = vertex_attr(dat[[i]], 'ampCol'),
#        # vertex.label = '',
#        edge.arrow.size = .25,
#        edge.color = '#cdcccd88',
#        layout = lay)
# }
# dev.off()
#
# # Trophic level and omnivory
# tlom <- vector('list', 3)
# for(i in 1:3) {
#   # Sp names
#   # Trophic level and omnivory evaluation
#   tlom[[i]] <- NetIndices::TrophInd(mat[[i]])
#
#   # # Sensitivity
#   # uid <- match(rownames(tlom[[i]]), names(spSensitivity[[i]]))
#   # tlom[[i]] <- cbind(tlom[[i]], spSensitivity[[i]][uid])
#   #
#   # # Amplification
#   # uid <- match(rownames(tlom[[i]]), names(spAmplification[[i]]))
#   # tlom[[i]] <- cbind(tlom[[i]], spAmplification[[i]][uid])
#
#   # Add rownames as variable
#   tlom[[i]]$name <- rownames(tlom[[i]])
#
#   # Column names
#   # colnames(tlom[[i]]) <- c('TL','OM','Sensitivity','Amplification','name')
#   colnames(tlom[[i]]) <- c('TL','OM','name')
# }
#
# deg <- vector('list', 3)
# for(i in 1:3) {
#   deg[[i]] <- data.frame(inDegree = degree(dat[[i]], mode = 'in'),
#                          outDegree = degree(dat[[i]], mode = 'out'),
#                          degree = degree(dat[[i]], mode = 'total')) %>%
#               mutate(name = rownames(.))
# }
#
# # Join with tlom
# for(i in 1:3) {
#   tlom[[i]] <- left_join(tlom[[i]], deg[[i]], by = 'name') %>%
#                left_join(impact[[i]], by = c('name' = 'species'))
# }
#
#
# # Figure
# cols <- c('#2e53d766','#21944c66','#d18c2c66')
# png('./Figures/TL-OM-Realised.png', width = 2400, height = 800, res = 200, pointsize = 6)
# par(mfrow = c(2,6), family = 'serif', mar = c(4,4,.5,.5))
#   # Sensitivity
#   # Plot 1
#   plot0(x = c(0,5), y = c(-10,10))
#   axis(1);axis(2)
#   mtext(1, text = 'Trophic level', line = 2.25)
#   mtext(2, text = 'Sensitivity score', line = 2.25)
#   abline(h = 0, lty = 2)
#   for(i in 1:3) points(x = tlom[[i]]$TL, y = tlom[[i]]$Sensitivity, pch = 20, col = cols[i], bg = cols[i])
#   text(x = rep(.25,3), y = c(9.5,8.5,7.5), labels = names(dat), adj = c(0,.5), cex = .9)
#   points(x = rep(.1, 3), y = c(9.5,8.5,7.5), cex = 1, col = cols, bg = cols, pch = 20)
#
#   # Plot 2
#   plot0(x = c(0,1), y = c(-10,10))
#   axis(1);axis(2)
#   mtext(1, text = 'Omnivory index', line = 2.25)
#   abline(h = 0, lty = 2)
#   for(i in 1:3) points(x = tlom[[i]]$OM, y = tlom[[i]]$Sensitivity, pch = 20, col = cols[i], bg = cols[i])
#
#   # Plot 2
#   plot0(x = c(0,35), y = c(-10,10))
#   axis(1);axis(2)
#   mtext(1, text = 'In degree', line = 2.25)
#   abline(h = 0, lty = 2)
#   for(i in 1:3) points(x = tlom[[i]]$inDegree, y = tlom[[i]]$Sensitivity, pch = 20, col = cols[i], bg = cols[i])
#
#   # Plot 2
#   plot0(x = c(0,35), y = c(-10,10))
#   axis(1);axis(2)
#   mtext(1, text = 'Out degree', line = 2.25)
#   abline(h = 0, lty = 2)
#   for(i in 1:3) points(x = tlom[[i]]$outDegree, y = tlom[[i]]$Sensitivity, pch = 20, col = cols[i], bg = cols[i])
#
#   # Plot 2
#   plot0(x = c(0,35), y = c(-10,10))
#   axis(1);axis(2)
#   mtext(1, text = 'Degree', line = 2.25)
#   abline(h = 0, lty = 2)
#   for(i in 1:3) points(x = tlom[[i]]$degree, y = tlom[[i]]$Sensitivity, pch = 20, col = cols[i], bg = cols[i])
#
#   # Plot 2
#   plot0(x = c(0,600), y = c(-10,10))
#   axis(1);axis(2)
#   mtext(1, text = 'Number of pathways', line = 2.25)
#   abline(h = 0, lty = 2)
#   for(i in 1:3) points(x = tlom[[i]]$PathwayFrequency, y = tlom[[i]]$Sensitivity, pch = 20, col = cols[i], bg = cols[i])
#
#
#
#   # Amplification
#   # Plot 3
#   plot0(x = c(0,5), y = c(-.2,.2))
#   axis(1);axis(2)
#   mtext(1, text = 'Trophic level', line = 2.25)
#   mtext(2, text = 'Amplification score', line = 2.25)
#   abline(h = 0, lty = 2)
#   for(i in 1:3) points(x = tlom[[i]]$TL, y = tlom[[i]]$Amplification, pch = 20, col = cols[i], bg = cols[i])
#
#   # Plot 4
#   plot0(x = c(0,1), y = c(-.2,.2))
#   axis(1);axis(2)
#   mtext(1, text = 'Omnivory index', line = 2.25)
#   abline(h = 0, lty = 2)
#   for(i in 1:3) points(x = tlom[[i]]$OM, y = tlom[[i]]$Amplification, pch = 20, col = cols[i], bg = cols[i])
#
#   # Plot 4
#   plot0(x = c(0,35), y = c(-.2,.2))
#   axis(1);axis(2)
#   mtext(1, text = 'In degree', line = 2.25)
#   abline(h = 0, lty = 2)
#   for(i in 1:3) points(x = tlom[[i]]$inDegree, y = tlom[[i]]$Amplification, pch = 20, col = cols[i], bg = cols[i])
#
#   # Plot 4
#   plot0(x = c(0,35), y = c(-.2,.2))
#   axis(1);axis(2)
#   mtext(1, text = 'Out degree', line = 2.25)
#   abline(h = 0, lty = 2)
#   for(i in 1:3) points(x = tlom[[i]]$outDegree, y = tlom[[i]]$Amplification, pch = 20, col = cols[i], bg = cols[i])
#
#   # Plot 4
#   plot0(x = c(0,35), y = c(-.2,.2))
#   axis(1);axis(2)
#   mtext(1, text = 'Degree', line = 2.25)
#   abline(h = 0, lty = 2)
#   for(i in 1:3) points(x = tlom[[i]]$degree, y = tlom[[i]]$Amplification, pch = 20, col = cols[i], bg = cols[i])
#
#   # Plot 4
#   plot0(x = c(0,600), y = c(-.2,.2))
#   axis(1);axis(2)
#   mtext(1, text = 'Number of pathways', line = 2.25)
#   abline(h = 0, lty = 2)
#   for(i in 1:3) points(x = tlom[[i]]$PathwayFrequency, y = tlom[[i]]$Amplification, pch = 20, col = cols[i], bg = cols[i])
#
#
# dev.off()
