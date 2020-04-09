# source('./Code/Figures/F4-Parameter_Type.R')
source('./Code/0-Param.R')
load('./Data/vulnerability.RData')
library(stringr)

# ------------------------------------------------------------------------------
# Parameter types
# ------------------------------------------------------------------------------
# Format data for this figure
vulnerability <- vulnerability %>%
                 filter(!vulnerability$Motif %in% c('pa','di')) %>% # remove partially connected and disconnected motifs
                 select(Pathways, nParam, Sensitivity, Amplification) %>% # keep only pathways, sensitivity and amplification
                 mutate(Sensitivity = abs(Sensitivity),
                        Amplification = abs(Amplification)) # Absolute values

# Identify parameters in pathways of effect
vulnerability <- vulnerability %>%
                 mutate(r = str_detect(Pathways, 'r'),
                        r_x = str_detect(Pathways, 'r_x'),
                        r_y = str_detect(Pathways, 'r_y'),
                        r_z = str_detect(Pathways, 'r_z'),
                        m_y = str_detect(Pathways, 'm_y'),
                        m_z = str_detect(Pathways, 'm_z'),
                        beta = str_detect(Pathways, 'beta'),
                        delta = str_detect(Pathways, 'delta'),
                        gamma = str_detect(Pathways, 'gamma'),
                        mu = str_detect(Pathways, 'mu'),
                        nu = str_detect(Pathways, 'nu'),
                        omega = str_detect(Pathways, 'omega')) %>%
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
                 select(nParam, Sensitivity, Amplification, M, A, C, MA, MC, AC, MAC) %>%
                 gather(Parameters, Presence, -nParam, -Sensitivity, -Amplification) %>%
                 filter(Presence) %>%
                 select(-Presence)

# Summary per parameter type individually for sensitivity and amplification
# Sensitivity
sensitivity <- vulnerability %>%
               select(-Amplification, -nParam) %>%
               group_by(Parameters) %>%
               summarise(Mean = mean(Sensitivity, na.rm = T),
                         SD   = sd(Sensitivity, na.rm = T),
                         SE   = SD/sqrt(n()),
                         CIp  = Mean + (1.96*SE),
                         CIm  = Mean - (1.96*SE),
                         max  = max(Sensitivity, na.rm = T),
                         freq = n()) %>%
               mutate(n = sum(freq), relFreq = freq/n) %>%
               .[match(c('M','A','C','MA','MC','AC','MAC'), .$Parameters,), ]

# Amplification
amplification <- vulnerability %>%
                 select(-Sensitivity) %>%
                 filter(nParam > 1) %>%
                 group_by(Parameters) %>%
                 summarise(Mean = mean(Amplification, na.rm = T),
                           SD   = sd(Amplification, na.rm = T),
                           SE   = SD/sqrt(n()),
                           CIp  = Mean + (1.96*SE),
                           CIm  = Mean - (1.96*SE),
                           max  = max(Amplification, na.rm = T),
                           freq = n()) %>%
                  mutate(n = sum(freq), relFreq = freq/n) %>%
                  .[match(c('M','A','C','MA','MC','AC','MAC'), .$Parameters,), ]

# ------------------------------------------------------------------------------
# Figure
# ------------------------------------------------------------------------------
png('./Figures/paramType.png', width = 1000, height = 1000, res = 200, pointsize = 6)
paramType <- c('M','A','C','MA','MC','AC','MAC')
lab <- c('$\\textit{m}$','$\\alpha$','$\\textit{e}$','$\\textit{m}$,$\\alpha$',
         '$\\textit{m}$,$\\textit{e}$','$\\alpha$,$\\textit{e}$',
         '$\\textit{m}$,$\\alpha$,$\\textit{e}$')
par(mfrow = c(2,1))
par(family = 'serif')

# ~~~~~~~~~~~~~~~~~~~~~~~~
# Sensitivity
# ~~~~~~~~~~~~~~~~~~~~~~~~
par(mar = c(2,7,2,2))
yM <- .075
wd <- .1*yM
plot0(x = c(.5,nrow(sensitivity)), y = c(-wd, yM))
axis(2, at = round(seq(0, yM, by = .025),3), las = 2, cex.axis = 1)
axis(1, at = 1:nrow(sensitivity), labels = TeX(lab), las = 1, cex.axis = 1)
abline(h = 0, lty = 2)

# Legends
mtext(text = TeX('| \\textbf{Trophic sensitivity} |'), side = 2, line = 5, cex = 1.5)
mtext(text = TeX('| Mean $\\S_{i,K}$ $\\pm$ 95% CI |'), side = 2, line = 3.5, cex = 1.25)
mtext(text = 'Pathways', side = 2, line = 0.5, at = -wd*.85, cex = 1.25, las = 1, adj = c(.5,.5), col = '#5e5e5e')
nTot <- sum(sensitivity$freq[sensitivity$Parameters %in% paramType])
mtext(text = paste0('(n = ',nTot,')'), side = 2, line = 0.5, at = -wd*1.55, cex = 1, las = 1, adj = c(.5,.5), col = '#5e5e5e')
text(x = rep(.5,3), y = seq(.07, by = -.005, length.out = 3), adj = c(0,.5), cex = 1,
     labels = TeX(c('Mortality: $\\textit{m}$','Attack rate: $\\alpha$','Conversion rate: $\\textit{e}$')))

# Data
for(i in 1:nrow(sensitivity)) {
  # All
  lines(x = c(i,i), y = c(sensitivity$Mean[i], sensitivity$CIp[i]), col = cols[3])
  lines(x = c(i,i), y = c(sensitivity$CIm[i], sensitivity$Mean[i]), col = cols[3])
  lines(x = c(i-.1, i+.1), y = c(sensitivity$CIp[i], sensitivity$CIp[i]), col = cols[3])
  lines(x = c(i-.1, i+.1), y = c(sensitivity$CIm[i], sensitivity$CIm[i]), col = cols[3])
}
points(x = 1:nrow(sensitivity), y = sensitivity$Mean, col = cols[3], cex = 1.25, pch = 15)

# Frequency
freq <- -wd + sensitivity$relFreq*wd*.85
xG <- .25
polygon(x = c(1-xG,1-xG,10+xG,10+xG), y = c(-wd*1.25,-wd*.4,-wd*.4,-wd*1.25), col = '#9c9c9c11', border = '#00000000')
text(x = 1:10, y = -wd*.85, labels = sensitivity$freq, cex = 1, adj = c(.5,.5), col = '#5e5e5e')

# ~~~~~~~~~~~~~~~~~~~~~~~~
# Amplification
# ~~~~~~~~~~~~~~~~~~~~~~~~
par(mar = c(4,7,2,2))
yM <- .001
wd <- .1*yM
plot0(x = c(.5,nrow(amplification)), y = c(-wd, yM))
axis(2, at = seq(0, yM, by = .0005), las = 2, cex.axis = 1)
axis(1, at = 1:nrow(amplification), labels = TeX(lab), las = 1, cex.axis = 1)
abline(h = 0, lty = 2)

lines(x = c(7.5, 7.5), y = c(-wd, yM), lty = 2, col = '#5e5e5e')
mtext(text = TeX('| \\textbf{Trophic amplification} |'), side = 2, line = 5, cex = 1.5)
mtext(text = TeX('| Mean $\\A_{i,K}$ $\\pm$ 95% CI |'), side = 2, line = 3.5, cex = 1.25)
mtext(text = 'Pathways', side = 2, line = 0.5, at = -wd*.85, cex = 1.25, las = 1, adj = c(.5,.5), col = '#5e5e5e')
mtext(text = 'Parameter type', side = 1, line = 3, cex = 1.5, font = 2)
nTot <- sum(amplification$freq[amplification$Parameters %in% paramType])
mtext(text = paste0('(n = ',nTot,')'), side = 2, line = 0.5, at = -wd*1.55, cex = 1, las = 1, adj = c(.5,.5), col = '#5e5e5e')

# Data
for(i in 1:nrow(amplification)) {
  # All
  lines(x = c(i,i), y = c(amplification$Mean[i], amplification$CIp[i]), col = cols[3])
  lines(x = c(i,i), y = c(amplification$CIm[i], amplification$Mean[i]), col = cols[3])
  lines(x = c(i-.1, i+.1), y = c(amplification$CIp[i], amplification$CIp[i]), col = cols[3])
  lines(x = c(i-.1, i+.1), y = c(amplification$CIm[i], amplification$CIm[i]), col = cols[3])
}
points(x = 1:nrow(amplification), y = amplification$Mean, col = cols[3], cex = 1.25, pch = 15)

# Frequency
freq <- -wd + amplification$relFreq*wd*.85
xG <- .25
polygon(x = c(1-xG,1-xG,10+xG,10+xG), y = c(-wd*1.25,-wd*.4,-wd*.4,-wd*1.25), col = '#9c9c9c11', border = '#00000000')
text(x = 1:10, y = -wd*.85, labels = amplification$freq, cex = 1, adj = c(.5,.5), col = '#5e5e5e')

dev.off()
