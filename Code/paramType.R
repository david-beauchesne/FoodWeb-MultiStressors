# source('./Code/paramType.R')
# source('./Code/0-Param.R')
library(graphicsutils)
library(tidyverse)
library(latex2exp)

# ------------------------------------------------------------------------------
#                                 FIGURE 2
# ------------------------------------------------------------------------------
# Now let's look at the types of parameters
# Abundance data
load('./Data/DisturbancesAll.RData')

# Absolute values
int <- int %>% mutate(delta = abs(delta))

# Summarise
param <- int %>%
         rename(abundance = delta) %>%
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
         mutate(growth = r | r_x | r_y | r_z,
                mortality = m_y | m_z,
                attack = beta | gamma | delta,
                conversion = mu | nu | omega) %>%
         mutate(M = mortality & !attack & !conversion & !growth,
                A = !mortality & attack & !conversion & !growth,
                C = !mortality & !attack & conversion & !growth,
                G = !mortality & !attack & !conversion & growth,
                MA = mortality & attack & !conversion & !growth,
                MC = mortality & !attack & conversion & !growth,
                MG = mortality & !attack & !conversion & growth,
                AC = !mortality & attack & conversion & !growth,
                AG = !mortality & attack & !conversion & growth,
                CG = !mortality & !attack & conversion & growth,
                MAC = mortality & attack & conversion & !growth,
                MAG = mortality & attack & !conversion & growth,
                MCG = mortality & !attack & conversion & growth,
                ACG = !mortality & attack & conversion & growth,
                MACG = mortality & attack & conversion & growth)

# Gather
dat1 <- param %>%
        select(abundance, M, A, C, G, MA, MC, MG, AC, AG, CG, MAC, MAG, MCG, ACG, MACG) %>%
        gather(param, pres, -abundance) %>%
        filter(pres)

dat <- dat1 %>%
       group_by(param) %>%
       summarise(Med = median(abundance),
                 Mean = mean(abundance),
                 SD = sd(abundance),
                 SE = SD/sqrt(n()),
                 CIp = Mean + (1.96*SE),
                 CIm = Mean - (1.96*SE),
                 max = max(abundance)) %>%
        arrange(Mean)


# Plot
png('./Figures/paramType.png', width = 1200, height = 1000, res = 200, pointsize = 6)
par(mfrow = c(2,2), family = 'serif')

# Plot
par(mar = c(2,5,.5,.5))
plot0(x = c(0,nrow(dat)+1), y = c(0, .075))
axis(2, at = round(seq(0, .075, by = .025),3), las = 2)
axis(1, at = 1:15, labels = dat$param, las = 2)
mtext(text = TeX('Mean $\\delta_A$ (%) $\\pm$ 95% CI'), side = 2, line = 3, cex = .75)
mtext(text = 'Disturbed abundance - initial abundance', side = 2, line = 4, cex = 1)
# Data
# abline(h = 0, lty = 2)
for(i in 1:nrow(dat)) {
  # All
  lines(x = c(i,i), y = c(dat$Mean[i], dat$CIp[i]), col = '#233499')
  lines(x = c(i,i), y = c(dat$CIm[i], dat$Mean[i]), col = '#233499')
  lines(x = c(i-.2, i+.2), y = c(dat$CIp[i], dat$CIp[i]))
  lines(x = c(i-.2, i+.2), y = c(dat$CIm[i], dat$CIm[i]))
}
points(x = 1:15, y = dat$Mean, col = '#233499', cex = .9, pch = 15)

# Boxplot
boxplot(dat1$abundance ~ dat1$param, xlab = 'Parameter type', ylab = 'Delta abundance', cex = .5, pch = 20, las = 2)



# Additivity data
load('./Data/AdditiveAll.RData')

# Absolute values
intAdd <- intAdd %>% mutate(Int = abs(Int))

# Summarisse
param <- intAdd %>%
         rename(abundance = Int) %>%
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
         mutate(growth = r | r_x | r_y | r_z,
                mortality = m_y | m_z,
                attack = beta | gamma | delta,
                conversion = mu | nu | omega) %>%
         mutate(M = mortality & !attack & !conversion & !growth,
                A = !mortality & attack & !conversion & !growth,
                C = !mortality & !attack & conversion & !growth,
                G = !mortality & !attack & !conversion & growth,
                MA = mortality & attack & !conversion & !growth,
                MC = mortality & !attack & conversion & !growth,
                MG = mortality & !attack & !conversion & growth,
                AC = !mortality & attack & conversion & !growth,
                AG = !mortality & attack & !conversion & growth,
                CG = !mortality & !attack & conversion & growth,
                MAC = mortality & attack & conversion & !growth,
                MAG = mortality & attack & !conversion & growth,
                MCG = mortality & !attack & conversion & growth,
                ACG = !mortality & attack & conversion & growth,
                MACG = mortality & attack & conversion & growth)

#
# Gather
dat1 <- param %>%
        select(abundance, M, A, C, G, MA, MC, MG, AC, AG, CG, MAC, MAG, MCG, ACG, MACG) %>%
        gather(param, pres, -abundance) %>%
        filter(pres)

dat <- dat1 %>%
       group_by(param) %>%
       summarise(Med = median(abundance),
                 Mean = mean(abundance),
                 SD = sd(abundance),
                 SE = SD/sqrt(n()),
                 CIp = Mean + (1.96*SE),
                 CIm = Mean - (1.96*SE),
                 max = max(abundance)) %>%
        arrange(Mean)


# Plot
par(mar = c(4,5,.5,.5))
plot0(x = c(0,nrow(dat)+1), y = c(0, .0015))
axis(2, at = seq(0, .0015, by = .0005), las = 2)
axis(1, at = 1:15, labels = dat$param, las = 2)
mtext(text = 'Additivity', side = 2, line = 4, cex = 1)
# Data
# abline(h = 0, lty = 2)
for(i in 1:nrow(dat)) {
  lines(x = c(i,i), y = c(dat$Mean[i], dat$CIp[i]), col = '#233499')
  lines(x = c(i,i), y = c(dat$CIm[i], dat$Mean[i]), col = '#233499')
  lines(x = c(i-.2, i+.2), y = c(dat$CIp[i], dat$CIp[i]))
  lines(x = c(i-.2, i+.2), y = c(dat$CIm[i], dat$CIm[i]))
}
points(x = 1:15, y = dat$Mean, col = '#233499', cex = .9, pch = 15)
# text(x = 1, y = -.00005, labels = TeX('M: Mortality / growth rate ($r$, $m$)'), adj = c(0, .5))
# text(x = 1, y = -.0001, labels = TeX('A: Attack rate / predator avoidance ($\\beta$, $\\gamma$, $\\delta$)'), adj = c(0, .5))
# text(x = 1, y = -.00015, labels = TeX('C: Conversion rate / palatability ($\\mu$, $\\nu$, $\\omega$)'), adj = c(0, .5))

# Boxplot
boxplot(dat1$abundance ~ dat1$param, xlab = 'Parameter type', ylab = 'Delta abundance', cex = .5, pch = 20, las = 2)

dev.off()
