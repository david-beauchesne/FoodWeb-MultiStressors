# source('./Code/8-MultivariateFigure.R')
source('./Code/0-Param.R')
load('./Data/Multivariate.RData')
load('./Data/MultivariateAdditivity.RData')
load('./Data/MultivariateAddPosition.RData')
load('./Data/MultivariateAddPathway.RData')
load('./Data/MultivariatePathway.RData')
load('./Data/MultivariatePosition.RData')

# Parameters
# Mean abundances < | > 0.1
id1 <- max(which(round(int$Mean,2) <= -.1))
id2 <- min(which(round(int$Mean,2) >= .1))
id0 <- range(which(round(int$Mean,2) == 0))

# Additivity
idA1 <- max(which(round(intAdd$Mean,2) <= -.005))
idA2 <- min(which(round(intAdd$Mean,2) >= .005))


# ------------------------------------------------------------------------------
#                                 FIGURE 2
# ------------------------------------------------------------------------------
png('./Figures/multivariateDisturbance.png', width = 1200, height = 780, res = 200, pointsize = 6)
par(mfrow = c(3,2), family = 'serif')

# ------------------------------------------------------------------------------
#                   Abundance - Delta abundance multivariate
# ------------------------------------------------------------------------------
par(mar = c(2,6,2,1))
plot0(x = c(0,nrow(int)), y = c(-1, 1))
axis(2, at = seq(-1,1,by = .5), las = 2)
abline(h = 0, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(int), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
# abline(h = c(-.1,.1), lty = 2, col = '#d0d0d0')
mtext(text = TeX('$\\delta$ $A_{disturb}$ - $\\delta$ $A_{initial} (%)$'), side = 2, line = 3, cex = .75)
mtext(text = TeX('$\\delta$ Abundance ($\\delta_A$)'), side = 2, line = 4.5, cex = 1)
mtext(text = 'Multivariate disturbances - Abundance', side = 3, font = 2)
polygon(x = c(1:nrow(int), nrow(int):1), y = c(int$CIm, rev(int$CIp)), col = '#23349922', border = 'transparent')
lines(int$Mean, col = '#233499', lwd = 2)

# Thresholds
abline(v = id1+.5, lty = 4, col = '#c46a86')
abline(v = id2-.5, lty = 4, col = '#c46a86')
abline(v = id0[1]-.5, lty = 4, col = '#668aeb')
abline(v = id0[2]+.5, lty = 4, col = '#668aeb')
polygon(x = c(u[1],id1+.5, id1+.5,u[1]), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#c46a8622')
polygon(x = c(u[2],id2-.5, id2-.5,u[2]), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#c46a8622')
polygon(x = c(id0[1]-.5,id0[2]+.5, id0[2]+.5,id0[1]-.5), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#668aeb22')
text(x = u[1]+50, y = u[4]-.1, labels = 'Weak entry points', adj = c(0,.5), font = 2)
text(x = u[2]-50, y = u[4]-.1, labels = 'Weak entry points', adj = c(1,.5), font = 2)
text(x = mean(id0), y = u[4]-.1, labels = 'Biotic buffers', adj = c(.5,.5), font = 2)


# ------------------------------------------------------------------------------
# Additivity - Delta abundance of joint model - delta abundance of additive model
# ------------------------------------------------------------------------------
par(mar = c(2,6,2,1))
plot0(x = c(1,nrow(intAdd)), y = c(-.05, .05))
axis(2, at = seq(-.05, .05, by = .025), las = 2)
abline(h = 0, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(intAdd), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
mtext(text = 'Joint - additive model', side = 2, line = 4.5, cex = 1)
mtext(text = TeX('$\\delta$ $A_{Joint}$ - $\\delta$$ $A_{Additive}$ (%)'), side = 2, line = 3, cex = .75)
mtext(text = 'Multivariate disturbances - Additivity', side = 3, font = 2)
polygon(x = c(1:nrow(intAdd), nrow(intAdd):1), y = c(intAdd$CIm, rev(intAdd$CIp)), col = '#23349922', border = 'transparent')
lines(intAdd$Mean, col = '#233499', lwd = 2)

# Thresholds
abline(v = idA1+.5, lty = 4, col = '#668aeb')
abline(v = idA2-.5, lty = 4, col = '#c46a86')
polygon(x = c(u[1],idA1+.5, idA1+.5,u[1]), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#668aeb22')
polygon(x = c(u[2],idA2-.5, idA2-.5,u[2]), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#c46a8622')
text(x = mean(c(idA1,u[1])), y = u[4]-.005, labels = 'Biotic sinks', adj = c(.5,.5), font = 2)
text(x = mean(c(idA2,u[2])), y = u[4]-.005, labels = 'Biotic multipliers', adj = c(.5,.5), font = 2)




# ------------------------------------------------------------------------------
#                                 FIGURE 2
# ------------------------------------------------------------------------------

# Abundance - Position profile
par(mar = c(2,6,1,1))
plot0(x = c(1,nrow(spProf)), y = c(-.5, .5))
axis(2, at = seq(-.5,.5,by=.25), las = 2)
mtext(text = TeX('Mean $\\delta_A$ (%) / Motif position'), side = 2, line = 3, cex = .75)
mtext(text = 'Position profile', side = 2, line = 4.5, cex = 1)
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
             path = '', x = i, y = -.425, scalingY = .05, scalingX = .45,
             add = T, cex = 1, lwd = 1.15, lwd2 = 1.25)
}


# Additivity - Position profile
par(mar = c(2,6,1,1))
plot0(x = c(1,nrow(spProfAdd)), y = c(-.008, .008))
axis(2, at = seq(-.008,.008,by=.004), las = 2)
mtext(text = TeX('Mean ($\\delta_{Aj}$ - $\\delta_{Aa}$) (%) / Motif position'), side = 2, line = 3, cex = .75)
mtext(text = 'Position profile', side = 2, line = 4.5, cex = 1)
abline(h = 0, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(spProfAdd), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
for(i in 1:nrow(spProfAdd)) {
  lines(x = c(i,i), y = c(spProfAdd$Mean[i], spProfAdd$CIp[i]), col = '#233499')
  lines(x = c(i,i), y = c(spProfAdd$CIm[i], spProfAdd$Mean[i]), col = '#233499')
  lines(x = c(i-.2, i+.2), y = c(spProfAdd$CIp[i], spProfAdd$CIp[i]))
  lines(x = c(i-.2, i+.2), y = c(spProfAdd$CIm[i], spProfAdd$CIm[i]))
}
points(spProfAdd$Mean, col = '#233499', cex = .9, pch = 15)

# Add motifs
motif <- substr(spProfAdd$position,1,2)
sp <- substr(spProfAdd$position,3,3)

for(i in 1:nrow(spProfAdd)) {
  plotMotifs(motif = motif[i], position = sp[i],
             path = '', x = i, y = -.007, scalingY = .00075, scalingX = .45,
             add = T, cex = 1, lwd = 1.15, lwd2 = 1.25)
}




# Abundance - Pathway profile
par(mar = c(2,6,.5,1))
plot0(x = c(1,nrow(pProf)), y = c(-.5, .5))
axis(2, at = seq(-.5,.5,by=.25), las = 2)
# axis(1, at = 1:nrow(pProf))#, labels = pProf$position)
mtext(text = TeX('Mean $\\delta_A$ (%) / Pathway of effect'), side = 2, line = 3, cex = .75)
mtext(text = 'Pathway of effect profile', side = 2, line = 4.5, cex = 1)
abline(h = 0, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(pProf), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
# for(i in 1:nrow(pProf)) {
#   lines(x = c(i,i), y = c(pProf$Mean[i], pProf$CIp[i]), col = '#233499')
#   lines(x = c(i,i), y = c(pProf$CIm[i], pProf$Mean[i]), col = '#233499')
#   lines(x = c(i-.2, i+.2), y = c(pProf$CIp[i], pProf$CIp[i]))
#   lines(x = c(i-.2, i+.2), y = c(pProf$CIm[i], pProf$CIm[i]))
# }
polygon(x = c(1:nrow(pProf), nrow(pProf):1), y = c(pProf$CIm, rev(pProf$CIp)), col = '#23349922', border = 'transparent')
lines(pProf$Mean, col = '#233499', cex = .9, pch = 15, lwd = 2)

# Additivity - Pathway profile
par(mar = c(2,6,.5,1))
plot0(x = c(1,nrow(pProfAdd)), y = c(-.015, .015))
axis(2, at = seq(-.015,.015,by=.005), las = 2)
# axis(1, at = 1:nrow(pProfAdd))#, labels = pProfAdd$position)
mtext(text = TeX('Mean ($\\delta_{Aj}$ - $\\delta_{Aa}$) (%) / Pathway of effect'), side = 2, line = 3, cex = .75)
mtext(text = 'Pathway of effect profile', side = 2, line = 4.5, cex = 1)

abline(h = 0, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(pProfAdd), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
# for(i in 1:nrow(pProfAdd)) {
#   lines(x = c(i,i), y = c(pProfAdd$Mean[i], pProfAdd$CIp[i]), col = '#233499')
#   lines(x = c(i,i), y = c(pProfAdd$CIm[i], pProfAdd$Mean[i]), col = '#233499')
#   lines(x = c(i-.2, i+.2), y = c(pProfAdd$CIp[i], pProfAdd$CIp[i]))
#   lines(x = c(i-.2, i+.2), y = c(pProfAdd$CIm[i], pProfAdd$CIm[i]))
# }
polygon(x = c(1:nrow(pProfAdd), nrow(pProfAdd):1), y = c(pProfAdd$CIm, rev(pProfAdd$CIp)), col = '#23349922', border = 'transparent')
lines(pProfAdd$Mean, col = '#233499', cex = .9, pch = 15, lwd = 2)
dev.off()
