# source('./Code/3_2-UnivariateFigure.R')
source('./Code/0-Param.R')
load('./Data/Univariate1P.RData')
load('./Data/UnivariatePosition1P.RData')

# Parameters
# Mean abundances < | > 0.1
id1 <- max(which(uni$Mean <= -.01))
id2 <- min(which(uni$Mean >= .01))
id0 <- range(which(uni$Mean == 0))

# ------------------------------------------------------------------------------
#                                 FIGURE 1
# ------------------------------------------------------------------------------
png('./Figures/univariateDisturbance1P.png', width = 1400, height = 1250, res = 200, pointsize = 6)
par(mfrow = c(2,1))

# Plot 1
par(mar = c(2,5,.5,.5), family = 'serif')
plot0(x = c(1,nrow(uni)), y = c(-.075, .075))
axis(2, at = round(seq(-.075,.075,by=.025),3), las = 2)
mtext(text = 'Rank', side = 1, at = nrow(uni), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
# mtext(text = TeX(lab)[seq(1,nrow(uni), by = 2)], 1, at = seq(1,nrow(uni), by = 2), line = .75)
# mtext(text = TeX(lab)[seq(2,nrow(uni), by = 2)], 1, at = seq(2,nrow(uni), by = 2), line = 1.75)
mtext(text = TeX('Mean $\\delta_A$ (%) $\\pm$ 95% CI'), side = 2, line = 3, cex = .75)
mtext(text = 'Disturbed abundance - initial abundance', side = 2, line = 4, cex = 1)


# Legend
# Mortality / growth rate
# Attack rate / evasiveness
# Conversion rate / palatability
text(x = u[2]-5, y = u[3]+.035, labels = TeX('Mortality / growth rate ($r$, $m$)'), adj = c(1, .5))
text(x = u[2]-5, y = u[3]+.030, labels = TeX('Attack rate / predator avoidance ($\\beta$, $\\gamma$, $\\delta$)'), adj = c(1, .5))
text(x = u[2]-5, y = u[3]+.025, labels = TeX('Conversion rate / palatability ($\\mu$, $\\nu$, $\\omega$)'), adj = c(1, .5))
points(x = u[2]-3.5, y = u[3]+.03525, col = '#db5656', bg = '#00000099', pch = 21, lwd = 2, cex = 1)
lines(x = c(u[2]-3, u[2]-4), y = rep(u[3]+.03025, 2), lwd = 2, col = '#db5656')
lines(x = c(u[2]-3, u[2]-4), y = rep(u[3]+.02525, 2), lwd = 2, col = '#53998e')

# Thresholds
abline(v = id1+.5, lty = 4, col = '#c46a86')
abline(v = id2-.5, lty = 4, col = '#c46a86')
abline(v = id0[1]-.5, lty = 4, col = '#668aeb')
abline(v = id0[2]+.5, lty = 4, col = '#668aeb')
polygon(x = c(u[1],id1+.5, id1+.5,u[1]), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#c46a8622')
polygon(x = c(u[2],id2-.5, id2-.5,u[2]), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#c46a8622')
polygon(x = c(id0[1]-.5,id0[2]+.5, id0[2]+.5,id0[1]-.5), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#668aeb22')
text(x = mean(c(id1,u[1])), y = u[4]-.01, labels = 'Weak entry points', adj = c(.5,.5), font = 2)
text(x = mean(c(id2,u[2])), y = u[4]-.01, labels = 'Weak entry points', adj = c(.5,.5), font = 2)
text(x = mean(id0), y = u[4]-.01, labels = 'Biotic buffers', adj = c(.5,.5), font = 2)

# Data
abline(h = 0, lty = 2)
for(i in 1:nrow(uni)) {
  lines(x = c(i,i), y = c(uni$Mean[i], uni$CIp[i]), col = '#233499')
  lines(x = c(i,i), y = c(uni$CIm[i], uni$Mean[i]), col = '#233499')
  lines(x = c(i-.2, i+.2), y = c(uni$CIp[i], uni$CIp[i]))
  lines(x = c(i-.2, i+.2), y = c(uni$CIm[i], uni$CIm[i]))
}
points(uni$Mean, col = '#233499', cex = .9, pch = 15)

# Add motifs
for(i in seq(1,nrow(uni), by = 2)) {
  plotMotifs(motif = uni$motif[i], position = uni$species[i],
             path = uni$parameters[i], x = i, y = -.075, scalingY = .0025,
             add = T, cex = .6, lwd = 1, lwd2 = 1.1)
}

for(i in seq(2,nrow(uni), by = 2)) {
  plotMotifs(motif = uni$motif[i], position = uni$species[i],
             path = uni$parameters[i], x = i, y = -.065, scalingY = .0025,
             add = T, cex = .6, lwd = 1, lwd2 = 1.1)
}


# Plot 2
# Abundance - Position profile
par(mar = c(2,5,.5,.5))
plot0(x = c(1,nrow(spProf)), y = c(-.05, .05))
axis(2, at = seq(-.05,.05,by=.025), las = 2)
# text(x = 1:nrow(spProf), y = -.5, labels = spProf$position)
mtext(text = TeX('Mean $\\delta_A$ (%) $\\pm$ 95% CI'), side = 2, line = 3, cex = .75)
mtext(text = 'Position profile', side = 2, line = 4, cex = 1)
abline(h = 0, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(spProf), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
for(i in 1:nrow(spProf)) {
  lines(x = c(i,i), y = c(spProf$Mean[i], spProf$CIp[i]), col = '#233499')
  lines(x = c(i,i), y = c(spProf$CIm[i], spProf$Mean[i]), col = '#233499')
  lines(x = c(i-.2, i+.2), y = c(spProf$CIp[i], spProf$CIp[i]))
  lines(x = c(i-.2, i+.2), y = c(spProf$CIm[i], spProf$CIm[i]))
}
points(spProf$Mean, col = '#233499', cex = .9, pch = 15)

# Add motifs
motif <- substr(spProf$position,1,2)
sp <- substr(spProf$position,3,3)

for(i in 1:nrow(spProf)) {
  plotMotifs(motif = motif[i], position = sp[i],
             path = '', x = i, y = -.0475, scalingY = .0025, scalingX = .35,
             add = T, cex = 1, lwd = 1.15)
}

dev.off()
