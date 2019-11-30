# source('./Code/12-SpeciesFigure.R')
# Libraries
library(magrittr)
library(graphicsutils)
library(tidyverse)
source('./Functions/scoreTable.R')

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


# Figures
scoreTable(fwSSL, output = "./Figures/ScoreTableSSL2.png")
scoreTable(fwNSL, output = "./Figures/ScoreTableNSL2.png")
scoreTable(fwESL, output = "./Figures/ScoreTableESL2.png")
