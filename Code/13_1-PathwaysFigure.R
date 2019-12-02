# source('./Code/13_1-PathwaysFigure.R')
source('./Code/0-Param.R')
library(graphicsutils)
library(tidyverse)
library(latex2exp)

# Thresholds
sensTh <- .01
ampTh <- .0002

# ------------------------------------------------------------------------------
# Sensitivity parameter type
# ------------------------------------------------------------------------------
# Abundance data
load('./Data/DisturbancesAll.RData')

# Absolute values
int <- int %>% mutate(delta = abs(delta))

# Filter out partially connected and disconnected motifs
int <- int %>%
       filter(!int$motif %in% c('pa','di'))

# Summarise
param <- int %>%
         rename(abundance = delta) %>%
         group_by(motif, species, pathway) %>%
         summarise(abundance = mean(abundance)) %>%
         ungroup() %>%
         mutate(wep = ifelse(abundance >= sensTh, 'wepP',
                      ifelse(abundance <= -sensTh, 'wepN', NA))) %>%
         mutate(r = str_detect(pathway, 'r'),
                r_x = str_detect(pathway, 'r_x'),
                r_y = str_detect(pathway, 'r_y'),
                r_z = str_detect(pathway, 'r_z'),
                m_y = str_detect(pathway, 'm_y'),
                m_z = str_detect(pathway, 'm_z'),
                beta = str_detect(pathway, 'beta'),
                delta = str_detect(pathway, 'delta'),
                gamma = str_detect(pathway, 'gamma'),
                mu = str_detect(pathway, 'mu'),
                nu = str_detect(pathway, 'nu'),
                omega = str_detect(pathway, 'omega')) %>%
         mutate(mortality = m_y | m_z | r | r_x | r_y | r_z,
                attack = beta | gamma | delta,
                conversion = mu | nu | omega) %>%
         mutate(M = mortality & !attack & !conversion,
                A = !mortality & attack & !conversion,
                C = !mortality & !attack & conversion,
                MA = mortality & attack & !conversion,
                MC = mortality & !attack & conversion,
                AC = !mortality & attack & conversion,
                MAC = mortality & attack & conversion) %>%
         select(abundance, M, A, C, MA, MC, AC, MAC) %>%
         gather(param, pres, -abundance) %>%
         filter(pres)


# Summarise dataset
sensParam <- param %>%
             group_by(param) %>%
             summarise(Med = median(abundance),
                       Mean = mean(abundance),
                       SD = sd(abundance),
                       SE = SD/sqrt(n()),
                       CIp = Mean + (1.96*SE),
                       CIm = Mean - (1.96*SE),
                       max = max(abundance),
                       freq = n()) %>%
              mutate(n = sum(freq), relFreq = freq/n)


# ------------------------------------------------------------------------------
# Amplification parameter type
# ------------------------------------------------------------------------------
# Amplification data
load('./Data/AdditiveAll.RData')

# Absolute values
intAdd <- intAdd %>% mutate(Int = abs(Int))

# Filter out partially connected and disconnected motifs
intAdd <- intAdd %>%
          filter(!intAdd$motif %in% c('pa','di'))

# Summarise
param <- intAdd %>%
         rename(abundance = Int) %>%
         group_by(motif, species, pathway) %>%
         summarise(abundance = mean(abundance)) %>%
         ungroup() %>%
         mutate(wep = ifelse(abundance >= ampTh, 'ba',
                      ifelse(abundance <= -ampTh, 'bb', NA))) %>%
         mutate(r = str_detect(pathway, 'r'),
                r_x = str_detect(pathway, 'r_x'),
                r_y = str_detect(pathway, 'r_y'),
                r_z = str_detect(pathway, 'r_z'),
                m_y = str_detect(pathway, 'm_y'),
                m_z = str_detect(pathway, 'm_z'),
                beta = str_detect(pathway, 'beta'),
                delta = str_detect(pathway, 'delta'),
                gamma = str_detect(pathway, 'gamma'),
                mu = str_detect(pathway, 'mu'),
                nu = str_detect(pathway, 'nu'),
                omega = str_detect(pathway, 'omega')) %>%
         mutate(mortality = m_y | m_z | r | r_x | r_y | r_z,
                attack = beta | gamma | delta,
                conversion = mu | nu | omega) %>%
         mutate(M = mortality & !attack & !conversion,
                A = !mortality & attack & !conversion,
                C = !mortality & !attack & conversion,
                MA = mortality & attack & !conversion,
                MC = mortality & !attack & conversion,
                AC = !mortality & attack & conversion,
                MAC = mortality & attack & conversion) %>%
         select(abundance, M, A, C, MA, MC, AC, MAC) %>%
         gather(param, pres, -abundance) %>%
         filter(pres)


# Summarise dataset
ampParam <- param %>%
            group_by(param) %>%
            summarise(Med = median(abundance),
                      Mean = mean(abundance),
                      SD = sd(abundance),
                      SE = SD/sqrt(n()),
                      CIp = Mean + (1.96*SE),
                      CIm = Mean - (1.96*SE),
                      max = max(abundance),
                      freq = n()) %>%
             mutate(n = sum(freq), relFreq = freq/n)



# ------------------------------------------------------------------------------
# Combine datasets
# ------------------------------------------------------------------------------
sens <- sensParam
amp <- ampParam
uid <- c('M','A','C','MA','MC','AC','MAC')
sens <- sens[match(uid, sens$param,), ]
amp <- amp[match(uid, amp$param,), ]

# ------------------------------------------------------------------------------
# Figure
# ------------------------------------------------------------------------------
png('./Figures/pathways.png', width = 1000, height = 1000, res = 200, pointsize = 6)

paramType <- c('M','A','C','MA','MC','AC','MAC')
lab <- c('M','A','C','M-A','M-C','A-C','M-A-C')
par(mfrow = c(2,1))
par(family = 'serif')

# ~~~~~~~~~~~~~~~~~~~~~~~~
# Sensitivity
# ~~~~~~~~~~~~~~~~~~~~~~~~
par(mar = c(2,7,2,2))
yM <- .075
wd <- .1*yM
plot0(x = c(.5,nrow(sens)), y = c(-wd, yM))
axis(2, at = round(seq(0, yM, by = .025),3), las = 2, cex.axis = 1)
axis(1, at = 1:nrow(sens), labels = lab, las = 1, cex.axis = 1)

# Legends
mtext(text = TeX('|\\textbf{Trophic sensitivity}|'), side = 2, line = 5, cex = 1.5)
mtext(text = TeX('|Mean $\\s_{i,j}$ $\\pm$ 95% CI|'), side = 2, line = 3.5, cex = 1.25)
mtext(text = 'Pathways', side = 2, line = 0.5, at = -wd*.85, cex = 1.25, las = 1, adj = c(.5,.5), col = '#5e5e5e')
nTot <- sum(sens$freq[sens$param %in% paramType])
mtext(text = paste0('(n = ',nTot,')'), side = 2, line = 0.5, at = -wd*1.55, cex = 1, las = 1, adj = c(.5,.5), col = '#5e5e5e')
text(x = rep(.5,3), y = seq(.07, by = -.005, length.out = 3), adj = c(0,.5), cex = 1,
     labels = c('M: mortality','A: attack rate','C: conversion rate'))

# Data
for(i in 1:nrow(sens)) {
  # All
  lines(x = c(i,i), y = c(sens$Mean[i], sens$CIp[i]), col = cols[1])
  lines(x = c(i,i), y = c(sens$CIm[i], sens$Mean[i]), col = cols[1])
  lines(x = c(i-.1, i+.1), y = c(sens$CIp[i], sens$CIp[i]), col = cols[1])
  lines(x = c(i-.1, i+.1), y = c(sens$CIm[i], sens$CIm[i]), col = cols[1])
}
points(x = 1:nrow(sens), y = sens$Mean, col = cols[1], cex = 1.25, pch = 15)

# Frequency
freq <- -wd + sens$relFreq*wd*.85
xG <- .25
polygon(x = c(1-xG,1-xG,10+xG,10+xG), y = c(-wd*1.25,-wd*.4,-wd*.4,-wd*1.25), col = '#9c9c9c11', border = '#00000000')
text(x = 1:10, y = -wd*.85, labels = sens$freq, cex = 1, adj = c(.5,.5), col = '#5e5e5e')

# ~~~~~~~~~~~~~~~~~~~~~~~~
# Amplification
# ~~~~~~~~~~~~~~~~~~~~~~~~
par(mar = c(4,7,2,2))
yM <- .001
wd <- .1*yM
plot0(x = c(.5,nrow(amp)), y = c(-wd, yM))
axis(2, at = seq(0, yM, by = .0005), las = 2, cex.axis = 1)
axis(1, at = 1:nrow(amp), labels = lab, las = 1, cex.axis = 1)
lines(x = c(7.5, 7.5), y = c(-wd, yM), lty = 2, col = '#5e5e5e')
mtext(text = TeX('|\\textbf{Trophic amplification}|'), side = 2, line = 5, cex = 1.5)
mtext(text = TeX('|Mean $\\A_{i,j}$ $\\pm$ 95% CI|'), side = 2, line = 3.5, cex = 1.25)
mtext(text = 'Pathways', side = 2, line = 0.5, at = -wd*.85, cex = 1.25, las = 1, adj = c(.5,.5), col = '#5e5e5e')
mtext(text = 'Parameter type', side = 1, line = 3, cex = 1.5, font = 2)
nTot <- sum(amp$freq[amp$param %in% paramType])
mtext(text = paste0('(n = ',nTot,')'), side = 2, line = 0.5, at = -wd*1.55, cex = 1, las = 1, adj = c(.5,.5), col = '#5e5e5e')

# Data
for(i in 1:nrow(amp)) {
  # All
  lines(x = c(i,i), y = c(amp$Mean[i], amp$CIp[i]), col = cols[1])
  lines(x = c(i,i), y = c(amp$CIm[i], amp$Mean[i]), col = cols[1])
  lines(x = c(i-.1, i+.1), y = c(amp$CIp[i], amp$CIp[i]), col = cols[1])
  lines(x = c(i-.1, i+.1), y = c(amp$CIm[i], amp$CIm[i]), col = cols[1])
}
points(x = 1:nrow(amp), y = amp$Mean, col = cols[1], cex = 1.25, pch = 15)

# Frequency
freq <- -wd + amp$relFreq*wd*.85
xG <- .25
polygon(x = c(1-xG,1-xG,10+xG,10+xG), y = c(-wd*1.25,-wd*.4,-wd*.4,-wd*1.25), col = '#9c9c9c11', border = '#00000000')
text(x = 1:10, y = -wd*.85, labels = amp$freq, cex = 1, adj = c(.5,.5), col = '#5e5e5e')

dev.off()
