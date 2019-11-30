# Parameters and functions
source('./Code/0-Param.R')
load('./Data/DisturbancesAll.RData')

# Score position
sensitivity <- int %>%
               mutate(sensitivity = (int$delta) * 100) %>%
               group_by(position) %>%
               summarise(Med = median(sensitivity),
                         Mean = mean(sensitivity),
                         SD = sd(sensitivity),
                         SE = SD/sqrt(n()),
                         CIp = Mean + (1.96*SE),
                         CIm = Mean - (1.96*SE)) %>%
               arrange(Mean)


# Additivity
load('./Data/AdditiveAll.RData')

# Score position
amplification <- intAdd %>%
                 mutate(amplification = (Int * 100)) %>%
                 group_by(position) %>%
                 summarise(Med = median(amplification),
                           Mean = mean(amplification),
                           SD = sd(amplification),
                           SE = SD/sqrt(n()),
                           CIp = Mean + (1.96*SE),
                           CIm = Mean - (1.96*SE)) %>%
                 arrange(Mean)

# List
scores <- list(sensitivity = sensitivity, amplification = amplification)

# Export
save(scores, file = './Data/Scores.RData')
