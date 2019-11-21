# source('./Code/13-PathwaysFigure.R')
source('./Code/0-Param.R')
library(graphicsutils)
library(tidyverse)
library(latex2exp)

# ------------------------------------------------------------------------------
# Sensitivity direct & indirect effects
# ------------------------------------------------------------------------------
# Now let's look at the types of parameters
# Abundance data
load('./Data/DisturbancesAll.RData')

# Absolute values
int <- int %>% mutate(delta = abs(delta))

#
int$pathway <- gsub('^r$','r_x', int$pathway)

# Summarise
param <- int %>%
         rename(abundance = delta) %>%
         group_by(motif, species, pathway) %>%
         summarise(abundance = mean(abundance)) %>%
         ungroup() %>%
         mutate(r_x = str_detect(pathway, 'r_x'),
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
         mutate(x = r_x | beta | gamma | mu | nu,
                y = r_y | delta | omega | m_y,
                z = r_z | gamma | delta | nu | omega | m_z,
                pX = species == 'x',
                pY = species == 'y',
                pZ = species == 'z') %>%
         mutate(Dx = x & !y & !z & pX,
                Dy = !x & !y & z & pY,
                Dz = !x & !y & z & pZ,
                Ix = pX & !x & (y | z),
                Iy = pY & !y & (x | z),
                Iz = pZ & !z & (x | y),
                DIx = pX & x & (y | z),
                DIy = pY & y & (x | z),
                DIz = pZ & z & (x | y)) %>%
          mutate(D = Dx | Dy | Dz,
                 I = Ix | Iy | Iz,
                 DI = DIx | DIy | DIz) %>%
          select(abundance, D, I, DI) %>%
          gather(param, pres, -abundance) %>%
          filter(pres)

# Summarise dataset
sensDir <- param %>%
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
# Amplification direct & indirect effects
# ------------------------------------------------------------------------------
# Amplification data
load('./Data/AdditiveAll.RData')

# Absolute values
intAdd <- intAdd %>% mutate(Int = abs(Int))

#
intAdd$pathway <- gsub('^r$','r_x', intAdd$pathway)

# Summarise
param <- intAdd %>%
         rename(abundance = Int) %>%
         group_by(motif, species, pathway) %>%
         summarise(abundance = mean(abundance)) %>%
         ungroup() %>%
         mutate(r_x = str_detect(pathway, 'r_x'),
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
         mutate(x = r_x | beta | gamma | mu | nu,
                y = r_y | delta | omega | m_y,
                z = r_z | gamma | delta | nu | omega | m_z,
                pX = species == 'x',
                pY = species == 'y',
                pZ = species == 'z') %>%
         mutate(Dx = x & !y & !z & pX,
                Dy = !x & !y & z & pY,
                Dz = !x & !y & z & pZ,
                Ix = pX & !x & (y | z),
                Iy = pY & !y & (x | z),
                Iz = pZ & !z & (x | y),
                DIx = pX & x & (y | z),
                DIy = pY & y & (x | z),
                DIz = pZ & z & (x | y)) %>%
         mutate(D = Dx | Dy | Dz,
                I = Ix | Iy | Iz,
                DI = DIx | DIy | DIz) %>%
         select(abundance, D, I, DI) %>%
         gather(param, pres, -abundance) %>%
         filter(pres)

# Summarise dataset
ampDir <- param %>%
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
# Sensitivity parameter type
# ------------------------------------------------------------------------------
# Abundance data
load('./Data/DisturbancesAll.RData')

# Absolute values
int <- int %>% mutate(delta = abs(delta))

# Summarise
param <- int %>%
         rename(abundance = delta) %>%
         group_by(motif, species, pathway) %>%
         summarise(abundance = mean(abundance)) %>%
         ungroup() %>%
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

# Summarise
param <- intAdd %>%
         rename(abundance = Int) %>%
         group_by(motif, species, pathway) %>%
         summarise(abundance = mean(abundance)) %>%
         ungroup() %>%
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
sens <- rbind(sensParam, sensDir)
amp <- rbind(ampParam, ampDir)
uid <- c('M','A','C','MA','MC','AC','MAC','D','I','DI')
sens <- sens[match(uid, sens$param,), ]
amp <- amp[match(uid, amp$param,), ]

# ------------------------------------------------------------------------------
# Figure
# ------------------------------------------------------------------------------
png('./Figures/pathways.png', width = 1000, height = 1000, res = 200, pointsize = 6)

lab <- c('M','A','C','M-A','M-C','A-C','M-A-C','D','I','D-I')
# mat <- matrix(1:3, nrow = 3)
# layout(mat, heights = c(.25,1,1))
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
# axis(4, at = c(-wd, 0), labels = c(0,sens$n[1]), cex.axis = 1, las = 1)
lines(x = c(7.5, 7.5), y = c(-wd, yM), lty = 2, col = '#5e5e5e')

# Legends
mtext(text = TeX('|\\textbf{Trophic sensitivity}|'), side = 2, line = 5, cex = 1.5)
mtext(text = TeX('|Mean $\\s_{i,j}$ $\\pm$ 95% CI|'), side = 2, line = 3.5, cex = 1.25)
mtext(text = 'Pathways', side = 2, line = 0.5, at = -wd*.85, cex = 1.25, las = 1, adj = c(.5,.5), col = '#5e5e5e')
text(x = mean(c(1,7)), y = 0.0725, labels = 'Parameter type\ncombinations', font = 2, adj = c(.5,.5), cex = 1.25)
text(x = mean(c(8,10)), y = 0.0725, labels = 'Direct vs Indirect\neffects', font = 2, adj = c(.5,.5), cex = 1.25)
text(x = rep(.5,5), y = seq(.07, by = -.005, length.out = 5), adj = c(0,.5), cex = 1,
     labels = c('M: mortality','A: attack rate','C: conversion rate','D: direct effect','I: indirect effect'))

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
# polygon(x = c(1-xG,1-xG,10+xG,10+xG), y = c(-wd*1.25,0,0,-wd*1.25), col = '#9c9c9c11', border = '#00000000')
# for(i in 1:nrow(sens)) lines(x = c(i,i), y = c(-wd, freq[i]), lwd = 3, col = paste0(cols[1], '66'))
text(x = 1:10, y = -wd*.85, labels = sens$freq, cex = 1, adj = c(.5,.5), col = '#5e5e5e')

# ~~~~~~~~~~~~~~~~~~~~~~~~
# Amplification
# ~~~~~~~~~~~~~~~~~~~~~~~~
par(mar = c(4,7,2,2))
yM <- .0015
wd <- .1*yM
plot0(x = c(.5,nrow(amp)), y = c(-wd, yM))
axis(2, at = seq(0, yM, by = .0005), las = 2, cex.axis = 1)
axis(1, at = 1:nrow(amp), labels = lab, las = 1, cex.axis = 1)
# axis(4, at = c(-wd, 0), labels = c(0,amp$n[1]), cex.axis = 1, las = 1)
lines(x = c(7.5, 7.5), y = c(-wd, yM), lty = 2, col = '#5e5e5e')
mtext(text = TeX('|\\textbf{Trophic amplification}|'), side = 2, line = 5, cex = 1.5)
mtext(text = TeX('|Mean $\\A_{i,j}$ $\\pm$ 95% CI|'), side = 2, line = 3.5, cex = 1.25)
mtext(text = 'Pathways', side = 2, line = 0.5, at = -wd*.85, cex = 1.25, las = 1, adj = c(.5,.5), col = '#5e5e5e')
# mtext(text = 'Number\nof pathways', side = 2, line = 0.5, at = -wd/1.25, cex = 1.25, las = 1, adj = c(.5,.5))

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
# polygon(x = c(1-xG,1-xG,10+xG,10+xG), y = c(-wd*1.25,0,0,-wd*1.25), col = '#9c9c9c11', border = '#00000000')
# for(i in 1:nrow(sens)) lines(x = c(i,i), y = c(-wd, freq[i]), lwd = 3, col = paste0(cols[1], '66'))
text(x = 1:10, y = -wd*.85, labels = amp$freq, cex = 1, adj = c(.5,.5), col = '#5e5e5e')

dev.off()
