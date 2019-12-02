# source('./Code/13-Biplots.R')
# Libraries
library(magrittr)
library(graphicsutils)
library(tidyverse)

# Data
load('./Data/SpeciesScores.RData') # Realised scores
load('./Data/SpeciesTopoScores.RData') # Realised scores
load('./Data/positionFrequency.RData') # Position frequency
for(i in 1:3) posFreq[[i]] <- as.data.frame(posFreq[[i]]) %>% mutate(Species = rownames(.))
fw <- read.table('./Data/FoodWeb/disturbances0.txt', sep = '\t', header = T, stringsAsFactors = F) # FW

# Build dataset for figure per food web
# Southern St. Lawrence
fwSSL <- fw %>%
         select(-Species) %>%
         left_join(impact[[1]], by = c('Group' = 'species')) %>%
         left_join(scores[[1]], by = c('Group' = 'Species')) %>%
         left_join(posFreq[[1]], by = c('Group' = 'Species')) %>%
         filter(!is.na(Sensitivity)) %>%
         arrange(Sensitivity)

# Northern St. Lawrence
fwNSL <- fw %>%
         select(-Species) %>%
         left_join(impact[[2]], by = c('Group' = 'species')) %>%
         left_join(scores[[2]], by = c('Group' = 'Species')) %>%
         left_join(posFreq[[2]], by = c('Group' = 'Species')) %>%
         filter(!is.na(Sensitivity)) %>%
         arrange(Sensitivity)

# St. Lawrence Estuary
fwESL <- fw %>%
         select(-Species) %>%
         left_join(impact[[3]], by = c('Group' = 'species')) %>%
         left_join(scores[[3]], by = c('Group' = 'Species')) %>%
         left_join(posFreq[[3]], by = c('Group' = 'Species')) %>%
         filter(!is.na(Sensitivity)) %>%
         arrange(Sensitivity)

# Combine data
dat <- data.frame(Sensitivity = c(fwSSL$Sensitivity, fwNSL$Sensitivity, fwESL$Sensitivity),
                  SensitivityTopo = c(fwSSL$SensitivityTopo, fwNSL$SensitivityTopo, fwESL$SensitivityTopo),
                  Amplification = c(fwSSL$Amplification, fwNSL$Amplification, fwESL$Amplification),
                  AmplificationTopo = c(fwSSL$AmplificationTopo, fwNSL$AmplificationTopo, fwESL$AmplificationTopo))


# Biplots
cols <- c('#2e53d766','#21944c66','#d18c2c66')
nm <- c('Southern St. Lawrence (mid-1980s)','Northern St. Lawrence (mid-1980s)',
        'St. Lawrence Estuary (2010s)')
png('./Figures/Biplots.png', res = 900, width = 160, height = 80,units = "mm")
par(mfrow = c(1,2), family = 'serif', mar = c(3,3,1,.5))
# Sensitivity
x = c(-10,5)
y = c(-4,2)
plot0(x,y)
axis(1, cex.axis = .75)
axis(2, cex.axis = .75, las = 2)
mtext(side = 1, 'Realised', cex = 1, line = 2)
mtext(side = 2, 'Topological', cex = 1, line = 2)
mtext(side = 3, 'Sensitivity', font = 2)

points(x = fwSSL$Sensitivity, y = fwSSL$SensitivityTopo, pch = 20, col = cols[1], cex = .75)
points(x = fwNSL$Sensitivity, y = fwNSL$SensitivityTopo, pch = 20, col = cols[2], cex = .75)
points(x = fwESL$Sensitivity, y = fwESL$SensitivityTopo, pch = 20, col = cols[3], cex = .75)
lines(x,y, lty = 2, col = '#000000aa')
lines(x, c(0,0), lty = 3, col = '#00000066')
lines(c(0,0), y, lty = 3, col = '#00000066')

# Legend
y = c(1.75,1.5,1.25)
text(x = rep(-9.25,3), y, labels = nm, adj = c(0,.5), cex = .5)
points(x = rep(-10,3), y, cex = .75, col = cols, bg = cols, pch = 20)

# Amplification
x = c(-.1,.2)
y = c(-.01,.02)
plot0(x,y)
axis(1, cex.axis = .75)
axis(2, cex.axis = .75, las = 2)
mtext(side = 1, 'Realised', cex = 1, line = 2)
mtext(side = 3, 'Amplification', font = 2)

points(x = fwSSL$Amplification, y = fwSSL$AmplificationTopo, pch = 20, col = cols[1], cex = .75)
points(x = fwNSL$Amplification, y = fwNSL$AmplificationTopo, pch = 20, col = cols[2], cex = .75)
points(x = fwESL$Amplification, y = fwESL$AmplificationTopo, pch = 20, col = cols[3], cex = .75)
lines(x,y, lty = 2, col = '#000000aa')
lines(x, c(0,0), lty = 3, col = '#00000066')
lines(c(0,0), y, lty = 3, col = '#00000066')

dev.off()
