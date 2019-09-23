# source('./Code/12-SpeciesFigure.R')
# Libraries
library(magrittr)
library(graphicsutils)
library(tidyverse)
source('./Functions/plotMotifs.R')

# Data
load('./Data/SpeciesScores.RData') # Scores
fw <- read.table('./Data/FoodWeb/disturbances.txt', sep = '\t', header = T, stringsAsFactors = F) # FW

# Build dataset for figure
fw <- fw %>%
      select(-Species) %>%
      left_join(impact[[1]], by = c('Group' = 'species')) %>%
      rename(SensSSL = Sensitivity, AmpSSL = Amplification) %>%
      left_join(impact[[2]], by = c('Group' = 'species')) %>%
      rename(SensNSL = Sensitivity, AmpNSL = Amplification) %>%
      left_join(impact[[3]], by = c('Group' = 'species')) %>%
      rename(SensESL = Sensitivity, AmpESL = Amplification)

# Add mean value for sensitivity and amplification
fw$SensMean <- rowMeans(fw[, c('SensSSL', 'SensNSL', 'SensESL')], na.rm = T)

# Sort table by mean sensitivity value
fw <- arrange(fw, SensMean)

# Parameters
nSp <- nrow(fw)
textCex <- .5
headCex <- .65

# Graph
png("./Figures/ScoreTable.png", res = 900, width = 260, height = 180,units = "mm")
par(mar = rep(0.6, 4), xaxs = "i", yaxs = "i", lend = 1, family = "serif")
plot0(c(-12.2, 12.2), c(-1.2, nSp+4.2))

# Background
for (i in 0:25 * 2 + 2) {
  rect(-12, i - 0.5, 12, i + 0.5, col = "grey95", border = NA)
}

# Species accronyms and description
  # Headers
  nm <- c('Id', 'Functional groups')
  posX <- c(-12, -11.25)
  text(x = posX, y = nSp+1.5, labels = nm, cex = headCex, adj = c(0,.5), font = 2)

  # Text
  for(i in 1:nSp) {
    text(x = rep(posX[1], nSp), y = 1:nSp, labels = fw$Group, adj = c(0,.5), cex = textCex)
    text(x = rep(posX[2], nSp), y = 1:nSp, labels = fw$Description, adj = c(0,.5), cex = textCex)
  }

# Region
  # Header
  text(x = -7.5, y = nSp+1.5, labels = 'Regions', cex = headCex, adj = c(.5,.5), font = 2)


# Pathways of effect
  # Headers
  nm <- c('Mortality','Behaviour','Physiology')
  posX <- seq(-6,-3,by=1.5)
  text(x = posX, y = nSp+1.5, labels = nm, cex = headCex, adj = c(.5,.5), font = 2)

  # Text
  # ...

# Motifs
  # Headers
  motifs <- c('tt','tt','tt','om','om','om','ex','ex','ap','ap')
  pos <- c('x','y','z','x','y','z','x','z','x','z')
  xPos <- seq(-2.15, by = .4, length.out = 10)
  for(i in 1:length(pos)) {
    plotMotifs(motifs[i], pos[i], x = xPos[i], y = nSp+1.5, add = T,
               cex = .4, scalingX = .3, scalingY = .5, lwd = 1.2, lwd2 = 1.2)
  }


# Sensitivity scores
  # Header
  xR <- c(2,5.75)
  x0 <- xR[1] + diff(xR)*.66
  text(x = mean(xR), y = nSp+2.75, labels = 'Sensitivity score', cex = headCex, adj = c(.5,.5), font = 2)

  # Axis

  lines(x = xR, y = rep(nSp+1,2), lwd = 1.25)
  lines(x = xR, y = rep(0,2), lwd = 1.25)
  lines(x = rep(x0,2), y = c(0,nSp+1), lty = 2, lwd = 1)
  x <- seq(xR[1], xR[2],by = 1.25)
  for(i in x) lines(x = rep(i, 2), y = c(nSp+.95, nSp+1.3), lwd = 2)
  for(i in x) lines(x = rep(i, 2), y = c(0.05, -.3), lwd = 2)
  text(x = x, y = rep(nSp+1.75, 4), labels = c(-10, -5, 0, 5), cex = textCex, adj = c(.5,.5))
  text(x = x, y = rep(-.75, 4), labels = c(-10, -5, 0, 5), cex = textCex, adj = c(.5,.5))

  # Data
  nm <- c('SensSSL','SensNSL','SensESL')
  yG <- c(.25,.5,.75)
  cols <- c('#2e53d7','#21944c','#d18c2c')
  for(j in 1:3) {
    dat <- ((fw[, nm[j]] / 10) * 2.5) + x0
    for(i in 1:length(dat)) {
      if(!is.na(dat[i])) {
        lines(x = c(x0, dat[i]), y = rep(i+yG[j]-.5, 2), lwd = 2, col = cols[j])
      } else {
        next
      }
    }
   }

# Amplification scores
  # Header
  xR <- c(6.25,10)
  x0 <- xR[1] + diff(xR)*.33
  text(x = mean(xR), y = nSp+2.75, labels = 'Amplification score', cex = headCex, adj = c(.5,.5), font = 2)

  # Axis
  lines(x = xR, y = rep(nSp+1,2), lwd = 1.25)
  lines(x = xR, y = rep(0,2), lwd = 1.25)
  lines(x = rep(x0,2), y = c(0,nSp+1), lty = 2, lwd = 1)
  x <- seq(xR[1], xR[2],by = 1.25)
  for(i in x) lines(x = rep(i, 2), y = c(nSp+.95, nSp+1.3), lwd = 2)
  for(i in x) lines(x = rep(i, 2), y = c(0.05, -.3), lwd = 2)
  text(x = x, y = rep(nSp+1.75, 4), labels = c(-0.1, 0, 0.1, 0.2), cex = textCex, adj = c(.5,.5))
  text(x = x, y = rep(-.75, 4), labels = c(-0.1, 0, 0.1, 0.2), cex = textCex, adj = c(.5,.5))

  # Data
  nm <- c('AmpSSL','AmpNSL','AmpESL')
  for(j in 1:3) {
    dat <- ((fw[, nm[j]] / .2) * 2.5) + x0
    for(i in 1:length(dat)) {
      if(!is.na(dat[i])) {
        lines(x = c(x0, dat[i]), y = rep(i+yG[j]-.5, 2), lwd = 2, col = cols[j])
      } else {
        next
      }
    }
   }


dev.off()
