# source('./Code/13-PathwaysFigure.R')
source('./Code/0-Param.R')
library(graphicsutils)
library(tidyverse)
library(latex2exp)

# Thresholds
sensTh <- .01
ampTh <- .0002

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
          # mutate(x = r_x | beta | gamma | mu | nu,
          #        y = r_y | beta | mu | delta | omega | m_y,
          #        z = r_z | gamma | delta | nu | omega | m_z,
          #        xI = r_y | delta | omega | m_y | r_z | m_z,
          #        yI = r_x | r_z | gamma | nu | m_z,
          #        zI = r_x | r_y | m_y | beta | mu,
          #        pX = species == 'x',
          #        pY = species == 'y',
          #        pZ = species == 'z') %>%
          #
          mutate(x = r_x | beta | gamma,
                 y = r_y | beta | mu | delta | m_y,
                 z = r_z | gamma | delta | nu | omega | m_z,
                 xI = r_y | delta | omega | m_y | r_z | m_z | mu | nu,
                 yI = r_x | r_z | gamma | nu | m_z | omega,
                 zI = r_x | r_y | m_y | beta | mu,
                 pX = species == 'x',
                 pY = species == 'y',
                 pZ = species == 'z') %>%

          mutate(Dx = x & !xI & pX,
                 Ix = !x & xI & pX,
                 DIx = x & xI & pX,
                 Dy = y & !yI & pY,
                 Iy = !y & yI & pY,
                 DIy = y & yI & pY,
                 Dz = z & !zI & pZ,
                 Iz = !z & zI & pZ,
                 DIz = z & zI & pZ) %>%
          mutate(D = Dx | Dy | Dz,
                 I = Ix | Iy | Iz,
                 DI = DIx | DIy | DIz) %>%
          # select(abundance, D, I, DI) %>%
          select(motif, species, abundance, wep, D, I, DI) %>%
          # select(motif, species, abundance, D, I, DI) %>%
          # gather(param, pres, -abundance) %>%
          gather(param, pres, -abundance, -motif, -species, -wep) %>%
          filter(pres)

# Summarise dataset
sensDir <- param %>%
           group_by(param) %>%
           group_by(motif, species, param) %>%
           # group_by(motif, species, param, wep) %>%
           summarise(Med = median(abundance),
                     Mean = mean(abundance),
                     SD = sd(abundance),
                     SE = SD/sqrt(n()),
                     CIp = Mean + (1.96*SE),
                     CIm = Mean - (1.96*SE),
                     max = max(abundance),
                     freq = n()) %>%
            mutate(n = sum(freq), relFreq = freq/n)

wepDir <- param %>%
           filter(!is.na(wep)) %>%
           group_by(motif, species, param, wep) %>%
           summarise(Med = median(abundance),
                     Mean = mean(abundance),
                     SD = sd(abundance),
                     SE = SD/sqrt(n()),
                     CIp = Mean + (1.96*SE),
                     CIm = Mean - (1.96*SE),
                     max = max(abundance),
                     freq = n()) %>%
            mutate(n = sum(freq), relFreq = freq/n)

wepNDir <- wepDir %>% filter(wep == 'wepN') %>% rename(wepN = Mean) %>% select(motif, species, param, wepN)
wepPDir <- wepDir %>% filter(wep == 'wepP') %>% rename(wepP = Mean) %>% select(motif, species, param, wepP)

sensDir <- sensDir %>%
           left_join(., wepNDir, by = c('motif','species','param')) %>%
           left_join(., wepPDir, by = c('motif','species','param'))





# plot(1:nrow(sensDir), sensDir$Mean)
# axis(1, labels = paste0(sensDir$motif, '-', sensDir$species,'-', sensDir$param), at = 1:nrow(sensDir), las = 2)

# ------------------------------------------------------------------------------
# Amplification direct & indirect effects
# ------------------------------------------------------------------------------
# Amplification data
load('./Data/AdditiveAll.RData')

# Absolute values
intAdd <- intAdd %>% mutate(Int = abs(Int))

#
intAdd$pathway <- gsub('^r$','r_x', intAdd$pathway)

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
         # mutate(x = r_x | beta | gamma | mu | nu,
         #        y = r_y | beta | mu | delta | omega | m_y,
         #        z = r_z | gamma | delta | nu | omega | m_z,
         #        xI = r_y | delta | omega | m_y | r_z | m_z,
         #        yI = r_x | r_z | gamma | nu | m_z,
         #        zI = r_x | r_y | m_y | beta | mu,
         #        pX = species == 'x',
         #        pY = species == 'y',
         #        pZ = species == 'z') %>%
         mutate(x = r_x | beta | gamma,
                y = r_y | beta | mu | delta | m_y,
                z = r_z | gamma | delta | nu | omega | m_z,
                xI = r_y | delta | omega | m_y | r_z | m_z | mu | nu,
                yI = r_x | r_z | gamma | nu | m_z | omega,
                zI = r_x | r_y | m_y | beta | mu,
                pX = species == 'x',
                pY = species == 'y',
                pZ = species == 'z') %>%

         mutate(Dx = x & !xI & pX,
                Ix = !x & xI & pX,
                DIx = x & xI & pX,
                Dy = y & !yI & pY,
                Iy = !y & yI & pY,
                DIy = y & yI & pY,
                Dz = z & !zI & pZ,
                Iz = !z & zI & pZ,
                DIz = z & zI & pZ) %>%
         mutate(D = Dx | Dy | Dz,
                I = Ix | Iy | Iz,
                DI = DIx | DIy | DIz) %>%
         # select(abundance, D, I, DI) %>%
         # select(motif, species, abundance, D, I, DI) %>%
         select(motif, species, abundance, wep, D, I, DI) %>%
         # gather(param, pres, -abundance) %>%
         # gather(param, pres, -abundance, -motif, -species) %>%
         gather(param, pres, -abundance, -motif, -species, -wep) %>%
         filter(pres)

# Summarise dataset
ampDir <- param %>%
          # group_by(param) %>%
          group_by(motif, species, param) %>%
          summarise(Med = median(abundance),
                    Mean = mean(abundance),
                    SD = sd(abundance),
                    SE = SD/sqrt(n()),
                    CIp = Mean + (1.96*SE),
                    CIm = Mean - (1.96*SE),
                    max = max(abundance),
                    freq = n()) %>%
           mutate(n = sum(freq), relFreq = freq/n)

naDir <- param %>%
           filter(!is.na(wep)) %>%
           group_by(motif, species, param, wep) %>%
           summarise(Med = median(abundance),
                     Mean = mean(abundance),
                     SD = sd(abundance),
                     SE = SD/sqrt(n()),
                     CIp = Mean + (1.96*SE),
                     CIm = Mean - (1.96*SE),
                     max = max(abundance),
                     freq = n()) %>%
            mutate(n = sum(freq), relFreq = freq/n)

baDir <- naDir %>% filter(wep == 'ba') %>% rename(ba = Mean) %>% select(motif, species, param, ba)
bbDir <- naDir %>% filter(wep == 'bb') %>% rename(bb = Mean) %>% select(motif, species, param, bb)

ampDir <- ampDir %>%
           left_join(., baDir, by = c('motif','species','param')) %>%
           left_join(., bbDir, by = c('motif','species','param'))




par(mfrow = c(2,1))
# plot0(x = c(1,nrow(sensDir)), y = c(0,0.1))
plot0(x = c(1,nrow(sensDir)), y = c(-.1,.1))
abline(h = 0, lty = 2)
# for(i in 1:nrow(sensDir)) lines(x = c(i,i), y = c(0, 0.1), lty = 2, col = '#b4b2b455')
for(i in 1:nrow(sensDir)) lines(x = c(i,i), y = c(-.1, .1), lty = 2, col = '#b4b2b455')
for(i in seq(3.5, nrow(sensDir)+.5, by = 3)) lines(x = c(i,i), y = c(-.1, .1), lty = 2, col = '#3e3e3e')
points(1:nrow(sensDir), sensDir$Mean, pch = 20)
points(1:nrow(sensDir), sensDir$wepN, col = '#c25454')
points(1:nrow(sensDir), sensDir$wepP, col = '#476091')
axis(1, labels = paste0(sensDir$motif, '-', sensDir$species,'-', sensDir$param), at = 1:nrow(sensDir), las = 2)
axis(2)
mtext(side = 3, text = 'Sensitivity', font = 2)
text(x = c(1,1), y = c(.1,.075), labels = c('Positive weak entry points','Negative weak entry points'), adj = c(0,.5), cex = .75)
points(x = c(.75,.75), y = c(.1,.075), col = c('#476091','#c25454'))

# plot0(x = c(1,nrow(ampDir)), y = c(0,0.0015))
plot0(x = c(1,nrow(ampDir)), y = c(-.00175,.00175))
abline(h = 0, lty = 2)
# for(i in 1:nrow(sensDir)) lines(x = c(i,i), y = c(0, .0015), lty = 2, col = '#b4b2b455')
for(i in 1:nrow(sensDir)) lines(x = c(i,i), y = c(-.00175, .00175), lty = 2, col = '#b4b2b455')
for(i in seq(3.5, nrow(sensDir)+.5, by = 3)) lines(x = c(i,i), y = c(-.00175, .00175), lty = 2, col = '#3e3e3e')
points(1:nrow(ampDir), ampDir$Mean, pch = 20)
points(1:nrow(sensDir), ampDir$ba, col = '#c25454')
points(1:nrow(sensDir), ampDir$bb, col = '#476091')
axis(1, labels = paste0(ampDir$motif, '-', ampDir$species,'-', ampDir$param), at = 1:nrow(ampDir), las = 2)
axis(2)
mtext(side = 3, text = 'Amplification', font = 2)
text(x = c(1,1), y = c(.0015,.0012), labels = c('Biotic buffers','Biotic amplifiers'), adj = c(0,.5), cex = .75)
points(x = c(.75,.75), y = c(.0015,.0012), col = c('#476091','#c25454'))




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
         # select(abundance, M, A, C, MA, MC, AC, MAC) %>%
         # select(abundance, M, A, C, MA, MC, AC, MAC, motif, species) %>%
         select(abundance, M, A, C, MA, MC, AC, MAC, motif, species, wep) %>%
         # gather(param, pres, -abundance) %>%
         # gather(param, pres, -abundance, -motif, -species) %>%
         gather(param, pres, -abundance, -motif, -species, -wep) %>%
         filter(pres)


# Summarise dataset
sensParam <- param %>%
             # group_by(param) %>%
             group_by(,motif, species, param) %>%
             summarise(Med = median(abundance),
                       Mean = mean(abundance),
                       SD = sd(abundance),
                       SE = SD/sqrt(n()),
                       CIp = Mean + (1.96*SE),
                       CIm = Mean - (1.96*SE),
                       max = max(abundance),
                       freq = n()) %>%
              mutate(n = sum(freq), relFreq = freq/n)


wepParam <- param %>%
           filter(!is.na(wep)) %>%
           group_by(motif, species, param, wep) %>%
           summarise(Med = median(abundance),
                     Mean = mean(abundance),
                     SD = sd(abundance),
                     SE = SD/sqrt(n()),
                     CIp = Mean + (1.96*SE),
                     CIm = Mean - (1.96*SE),
                     max = max(abundance),
                     freq = n()) %>%
            mutate(n = sum(freq), relFreq = freq/n)

wepNParam <- wepParam %>% filter(wep == 'wepN') %>% rename(wepN = Mean) %>% select(motif, species, param, wepN)
wepPParam <- wepParam %>% filter(wep == 'wepP') %>% rename(wepP = Mean) %>% select(motif, species, param, wepP)

sensParam <- sensParam %>%
           left_join(., wepPParam, by = c('motif','species','param')) %>%
           left_join(., wepNParam, by = c('motif','species','param'))




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
         # select(abundance, M, A, C, MA, MC, AC, MAC) %>%
         # select(abundance, M, A, C, MA, MC, AC, MAC, motif, species) %>%
         select(abundance, M, A, C, MA, MC, AC, MAC, motif, species, wep) %>%
         # gather(param, pres, -abundance) %>%
         # gather(param, pres, -abundance, -motif, -species) %>%
         gather(param, pres, -abundance, -motif, -species, -wep) %>%
         filter(pres)


# Summarise dataset
ampParam <- param %>%
            # group_by(param) %>%
            group_by(,motif, species, param) %>%
            summarise(Med = median(abundance),
                      Mean = mean(abundance),
                      SD = sd(abundance),
                      SE = SD/sqrt(n()),
                      CIp = Mean + (1.96*SE),
                      CIm = Mean - (1.96*SE),
                      max = max(abundance),
                      freq = n()) %>%
             mutate(n = sum(freq), relFreq = freq/n)


naParam <- param %>%
           filter(!is.na(wep)) %>%
           group_by(motif, species, param, wep) %>%
           summarise(Med = median(abundance),
                     Mean = mean(abundance),
                     SD = sd(abundance),
                     SE = SD/sqrt(n()),
                     CIp = Mean + (1.96*SE),
                     CIm = Mean - (1.96*SE),
                     max = max(abundance),
                     freq = n()) %>%
            mutate(n = sum(freq), relFreq = freq/n)

baParam <- naParam %>% filter(wep == 'ba') %>% rename(ba = Mean) %>% select(motif, species, param, ba)
bbParam <- naParam %>% filter(wep == 'bb') %>% rename(bb = Mean) %>% select(motif, species, param, bb)

ampParam <- ampParam %>%
           left_join(., baParam, by = c('motif','species','param')) %>%
           left_join(., bbParam, by = c('motif','species','param'))



# Figure
par(mfrow = c(2,1), mar = c(5,4,1,.5))
# plot0(x = c(1,nrow(sensParam)), y = c(0,0.1))
plot0(x = c(1,nrow(sensParam)), y = c(-.075,.075))
abline(h = 0, lty = 2)
# for(i in 1:nrow(sensParam)) lines(x = c(i,i), y = c(0, 0.1), lty = 2, col = '#b4b2b455')
for(i in 1:nrow(sensParam)) lines(x = c(i,i), y = c(-.075, .075), lty = 2, col = '#b4b2b455')
for(i in seq(3.5, nrow(sensParam)+.5, by = 3)) lines(x = c(i,i), y = c(-.075, .075), lty = 2, col = '#3e3e3e')
points(1:nrow(sensParam), sensParam$Mean, pch = 20, cex = 1.25)
points(1:nrow(sensParam), sensParam$wepN, col = '#c25454')
points(1:nrow(sensParam), sensParam$wepP, col = '#476091')
axis(1, labels = paste0(sensParam$motif, '-', sensParam$species,'-', sensParam$param), at = 1:nrow(sensParam), las = 2)
axis(2)
mtext(side = 2, text = 'Sensitivity', font = 2, line = 2.5)
text(x = c(1,1), y = c(.07,.05), labels = c('Positive weak entry points','Negative weak entry points'), adj = c(0,.5), cex = .75)
points(x = c(.5,.5), y = c(.07,.05), col = c('#476091','#c25454'))

# plot0(x = c(1,nrow(ampParam)), y = c(0,0.0015))
plot0(x = c(1,nrow(ampParam)), y = c(-.002,.002))
abline(h = 0, lty = 2)
# for(i in 1:nrow(ampParam)) lines(x = c(i,i), y = c(0, .0015), lty = 2, col = '#b4b2b455')
for(i in 1:nrow(ampParam)) lines(x = c(i,i), y = c(-.002, .002), lty = 2, col = '#b4b2b455')
for(i in seq(3.5, nrow(sensParam)+.5, by = 3)) lines(x = c(i,i), y = c(-.002, .002), lty = 2, col = '#3e3e3e')
points(1:nrow(ampParam), ampParam$Mean, pch = 20, cex = 1.25)
points(1:nrow(sensParam), ampParam$ba, col = '#c25454')
points(1:nrow(sensParam), ampParam$bb, col = '#476091')
axis(1, labels = paste0(ampParam$motif, '-', ampParam$species,'-', ampParam$param), at = 1:nrow(ampParam), las = 2)
axis(2)
mtext(side = 2, text = 'Amplification', font = 2, line = 2.5)
text(x = c(1,1), y = c(.0015,.0012), labels = c('Biotic buffers','Biotic amplifiers'), adj = c(0,.5), cex = .75)
points(x = c(.5,.5), y = c(.0015,.0012), col = c('#476091','#c25454'))



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

paramType <- c('M','A','C','MA','MC','AC','MAC')
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
nTot <- sum(sens$freq[sens$param %in% paramType])
mtext(text = paste0('(n = ',nTot,')'), side = 2, line = 0.5, at = -wd*1.55, cex = 1, las = 1, adj = c(.5,.5), col = '#5e5e5e')
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
nTot <- sum(amp$freq[amp$param %in% paramType])
mtext(text = paste0('(n = ',nTot,')'), side = 2, line = 0.5, at = -wd*1.55, cex = 1, las = 1, adj = c(.5,.5), col = '#5e5e5e')
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
