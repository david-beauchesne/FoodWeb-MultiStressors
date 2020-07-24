# source('./Code/Figures/F4-Empirical_Food_Webs.R')
# Libraries
source('./Code/0-Param.R')
source('./Code/Functions/scoreTable.R')

# Data
load('./Data/Food_Web_Vulnerability.RData')
load('./Data/Food_Web_Position_Frequency.RData')
fw <- read.table('./Data/FoodWeb/disturbances0.txt', sep = '\t', header = T, stringsAsFactors = F) # FW

# Build dataset for figure per food web
# Southern St. Lawrence
fwSSL <- fw %>%
         select(-Species) %>%
         left_join(foodwebVulnerability[[1]], by = c('Group' = 'species')) %>%
         left_join(posFreq[[1]], by = c('Group' = 'Species')) %>%
         filter(!is.na(Sensitivity)) %>%
         arrange(Sensitivity)

# Northern St. Lawrence
fwNSL <- fw %>%
         select(-Species) %>%
         left_join(foodwebVulnerability[[2]], by = c('Group' = 'species')) %>%
         left_join(posFreq[[2]], by = c('Group' = 'Species')) %>%
         filter(!is.na(Sensitivity)) %>%
         arrange(Sensitivity)

# St. Lawrence Estuary
fwESL <- fw %>%
         select(-Species) %>%
         left_join(foodwebVulnerability[[3]], by = c('Group' = 'species')) %>%
         left_join(posFreq[[3]], by = c('Group' = 'Species')) %>%
         filter(!is.na(Sensitivity)) %>%
         arrange(Sensitivity)


# Figures
scoreTable(fwSSL, output = "./Figures/ScoreTableSSL.png")
scoreTable(fwNSL, output = "./Figures/ScoreTableNSL.png")
scoreTable(fwESL, output = "./Figures/ScoreTableESL.png")
