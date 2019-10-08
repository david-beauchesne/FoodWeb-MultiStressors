# source('./Code/7-DisturbanceFigure.R')
source('./Code/0-Param.R')
load('./Data/UnivariatePath.RData')
load('./Data/UnivariatePosition.RData')
load('./Data/MultivariatePath.RData')
load('./Data/MultivariatePosition.RData')
# load('./Data/AdditivePath.RData')
# load('./Data/AdditivePosition.RData')


# ------------------------------------------------------------------------------
#                                 FIGURE
# ------------------------------------------------------------------------------
png('./Figures/disturbances.png', width = 2200, height = 1250, res = 200, pointsize = 6)
mat <- matrix(1:4, nrow = 2)
layout(mat)
par(family = 'serif')

# ---------------------------------------
#            Univariate pathways
# ---------------------------------------
# Parameters
# Mean abundances < | > 0.01
th <- .01
dat <- (round(uniPath$Mean,6))
check <- c(any(dat < -th), any(dat > th), any(dat == 0))
if(check[[1]]) id1 <- max(which(dat < -th))
if(check[[2]]) id2 <- min(which(dat > th))
if(check[[3]]) id0 <- range(which(dat == 0))

# Plot
par(mar = c(2,5,2,.5))
plot0(x = c(1,nrow(uniPath)), y = c(-.075, .075))
axis(2, at = seq(-.075,.075,by=.025), labels = seq(-7.5,7.5,by=2.5), las = 2)
mtext(text = 'Rank', side = 1, at = nrow(uniPath), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
mtext(text = TeX('Mean $\\s_{i,j}$ $\\pm$ 95% CI'), side = 2, line = 2, cex = 1)
mtext(text = TeX('Trophic sensitivity ($S_{i,j}$)'), side = 2, line = 3.5, cex = 1.25)
mtext(text = 'Univariate pathways of effect', side = 3, font = 2, line = 0)


# Legend
# Mortality / growth rate
# Attack rate / evasiveness
# Conversion rate / palatability
text(x = u[2]-2.75, y = u[3]+.040, labels = TeX('Mortality / growth rate ($r$, $m$)'), adj = c(1, .5))
text(x = u[2]-2.75, y = u[3]+.035, labels = TeX('Attack rate / predator avoidance ($\\alpha$)'), adj = c(1, .5))
text(x = u[2]-2.75, y = u[3]+.030, labels = TeX('Conversion rate / palatability ($e$)'), adj = c(1, .5))
points(x = u[2]-1.5, y = u[3]+.04025, col = colM[1], bg = '#00000099', pch = 21, lwd = 2, cex = .8)
lines(x = c(u[2]-1, u[2]-2), y = rep(u[3]+.03525, 2), lwd = 2, col = colB[1])
lines(x = c(u[2]-1, u[2]-2), y = rep(u[3]+.03025, 2), lwd = 2, col = colP[1])

# Thresholds
yG <- .0055
if(check[[1]]) {
  lines(x = rep(id1+.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[2])
  polygon(x = c(u[1],id1+.5, id1+.5,u[1]), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = paste0(cols[2], '11'))
  text(x = u[1]+1, y = u[4]-.01, labels = 'Weak entry pathways', adj = c(0,.5), font = 4, cex = 1.25)
}

if(check[[2]]) {
  lines(x = rep(id2-.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[2])
  polygon(x = c(u[2],id2-.5, id2-.5,u[2]), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = paste0(cols[2], '11'))
  text(x = u[2]-1, y = u[4]-.01, labels = 'Weak entry pathways', adj = c(1,.5), font = 4, cex = 1.25)
}

if(check[[3]]) {
  lines(x = rep(id0[1]-.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[1])
  lines(x = rep(id0[2]+.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[1])
  polygon(x = c(id0[1]-.5,id0[2]+.5, id0[2]+.5,id0[1]-.5), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = paste0(cols[1], '11'))
  text(x = mean(id0), y = u[4]-.01, labels = 'Sink pathways', adj = c(.5,.5), font = 4, cex = 1.25)
}

# Data
abline(h = 0, lty = 2)
for(i in 1:nrow(uniPath)) {
  lines(x = c(i,i), y = c(uniPath$Mean[i], uniPath$CIp[i]), col = cols[1])
  lines(x = c(i,i), y = c(uniPath$CIm[i], uniPath$Mean[i]), col = cols[1])
  lines(x = c(i-.2, i+.2), y = c(uniPath$CIp[i], uniPath$CIp[i]), col = cols[1])
  lines(x = c(i-.2, i+.2), y = c(uniPath$CIm[i], uniPath$CIm[i]), col = cols[1])
}
points(uniPath$Mean, col = cols[1], cex = .9, pch = 22, bg = cols[1])

# Add motifs
for(i in seq(1,nrow(uniPath), by = 2)) {
  plotMotifs(motif = uniPath$motif[i], position = uniPath$species[i],
             path = uniPath$pathway[i], x = i, y = -.07, scalingY = .0025,
             add = T, cex = .7, lwd = 1, lwd2 = 1.1, scalingX = 1.4,
             growth = colM[1], attack = colB[1], conversion = colP[1])
}

for(i in seq(2,nrow(uniPath), by = 2)) {
  plotMotifs(motif = uniPath$motif[i], position = uniPath$species[i],
             path = uniPath$pathway[i], x = i, y = -.06, scalingY = .0025,
             add = T, cex = .75, lwd = 1, lwd2 = 1.1, scalingX = 1.4,
             growth = colM[1], attack = colB[1], conversion = colP[1])
}


# ---------------------------------------
#            Univariate motifs
# ---------------------------------------
# Parameters
# Mean abundances < | > 0.01
th <- .01
dat <- (round(uniPos$Mean,6))
check <- c(any(dat < -th), any(dat > th), any(dat == 0))
if(check[[1]]) id1 <- max(which(dat < -th))
if(check[[2]]) id2 <- min(which(dat > th))
if(check[[3]]) id0 <- range(which(dat == 0))

# Plot
# Abundance - Position profile
par(mar = c(2,5,1,.5))
plot0(x = c(1,nrow(uniPos)), y = c(-.04, .04))
axis(2, at = seq(-.04,.04,by=.02), labels = seq(-4,4,by=2), las = 2)
mtext(text = TeX('Mean $\\s_i$ $\\pm$ 95% CI'), side = 2, line = 2, cex = 1)
mtext(text = TeX('Position sensitivity ($S_i$)'), side = 2, line = 3.5, cex = 1.25)

abline(h = 0, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(uniPos), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
for(i in 1:nrow(uniPos)) {
  lines(x = c(i,i), y = c(uniPos$Mean[i], uniPos$CIp[i]), col = cols[1])
  lines(x = c(i,i), y = c(uniPos$CIm[i], uniPos$Mean[i]), col = cols[1])
  lines(x = c(i-.2, i+.2), y = c(uniPos$CIp[i], uniPos$CIp[i]), col = cols[1])
  lines(x = c(i-.2, i+.2), y = c(uniPos$CIm[i], uniPos$CIm[i]), col = cols[1])
}
points(uniPos$Mean, col = cols[1], bg = cols[1], cex = 1.5, pch = 22)

# Thresholds
yG <- .003
if(check[[1]]) {
  lines(x = rep(id1+.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[2])
  polygon(x = c(u[1],id1+.5, id1+.5,u[1]), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = paste0(cols[2], '11'))
  text(x = u[1]+.1, y = u[4]-.0053, labels = 'Weak entry points', adj = c(0,.5), font = 4, cex = 1.25)
}

if(check[[2]]) {
  lines(x = rep(id2-.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[2])
  polygon(x = c(u[2],id2-.5, id2-.5,u[2]), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = paste0(cols[2], '11'))
  text(x = u[2]-.1, y = u[4]-.0053, labels = 'Weak entry points', adj = c(1,.5), font = 4, cex = 1.25)
}

if(check[[3]]) {
  lines(x = rep(id0[1]-.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[1])
  lines(x = rep(id0[2]+.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[1])
  polygon(x = c(id0[1]-.5,id0[2]+.5, id0[2]+.5,id0[1]-.5), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = paste0(cols[2], '11'))
  text(x = mean(id0), y = u[4]-.0053, labels = 'Trophic sinks', adj = c(.5,.5), font = 4, cex = 1.25)
}

# Add motifs
motif <- substr(uniPos$position,1,2)
sp <- substr(uniPos$position,3,3)

for(i in 1:nrow(uniPos)) {
  plotMotifs(motif = motif[i], position = sp[i],
             path = '', x = i, y = -.036, scalingY = .0025, scalingX = .35,
             add = T, cex = 1.25, lwd = 1.15)
}


# ---------------------------------------
#          Multivariate pathways
# ---------------------------------------
# Parameters
# Mean abundances < | > 0.01
th <- .01
dat <- (round(multiPath$Mean,6))
check <- c(any(dat < -th), any(dat > th), any(dat == 0))
if(check[[1]]) id1 <- max(which(dat < -th))
if(check[[2]]) id2 <- min(which(dat > th))
if(check[[3]]) id0 <- range(which(dat == 0))

# Plot
par(mar = c(2,5,2,.5))
plot0(x = c(0,nrow(multiPath)), y = c(-.2, .2))
axis(2, at = seq(-.2,.2,by = .05), labels = seq(-20,20,by = 5), las = 2)
abline(h = 0, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(multiPath), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
polygon(x = c(1:nrow(multiPath), nrow(multiPath):1), y = c(multiPath$CIm, rev(multiPath$CIp)), col = paste0(cols[1], '44'), border = 'transparent')
lines(multiPath$Mean, col = cols[1], lwd = 2)
mtext(text = 'Multivariate pathways of effect', side = 3, font = 2, line = 0)
mtext(text = TeX('Mean $\\s_{i,j}$ $\\pm$ 95% CI'), side = 2, line = 2, cex = 1)
mtext(text = TeX('Trophic sensitivity ($S_{i,j}$)'), side = 2, line = 3.5, cex = 1.25)

# Thresholds
yG <- .015
if(check[[1]]) {
  lines(x = rep(id1+.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[2])
  polygon(x = c(u[1],id1+.5, id1+.5,u[1]), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = paste0(cols[2], '11'))
  text(x = u[1]+20, y = u[4]-.027, labels = 'Weak entry pathways', adj = c(0,.5), font = 4, cex = 1.25)
}

if(check[[2]]) {
  lines(x = rep(id2-.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[2])
  polygon(x = c(u[2],id2-.5, id2-.5,u[2]), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = paste0(cols[2], '11'))
  text(x = u[2]-20, y = u[4]-.027, labels = 'Weak entry pathways', adj = c(1,.5), font = 4, cex = 1.25)
}

if(check[[3]]) {
  lines(x = rep(id0[1]-.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[1])
  lines(x = rep(id0[2]+.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[1])
  polygon(x = c(id0[1]-.5,id0[2]+.5, id0[2]+.5,id0[1]-.5), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = paste0(cols[1], '11'))
  text(x = mean(id0), y = u[4]-.027, labels = 'Sink pathways', adj = c(.5,.5), font = 4, cex = 1.25)
}

# ---------------------------------------
#            Multivariate motifs
# ---------------------------------------
# Parameters
# Mean abundances < | > 0.01
th <- .01
dat <- (round(multiPos$Mean,6))
check <- c(any(dat < -th), any(dat > th), any(dat == 0))
if(check[[1]]) id1 <- max(which(dat < -th))
if(check[[2]]) id2 <- min(which(dat > th))
if(check[[3]]) id0 <- range(which(dat == 0))

# Plot
# Abundance - Position profile
par(mar = c(2,5,.5,.5))
plot0(x = c(1,nrow(multiPos)), y = c(-.08, .08))
axis(2, at = seq(-.08,.08,by=.04), labels = seq(-8,8,by=4), las = 2)
mtext(text = TeX('Mean $\\s_i$ $\\pm$ 95% CI'), side = 2, line = 2, cex = 1)
mtext(text = TeX('Position sensitivity ($S_i$)'), side = 2, line = 3.5, cex = 1.25)
abline(h = 0, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(multiPos), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
for(i in 1:nrow(multiPos)) {
  lines(x = c(i,i), y = c(multiPos$Mean[i], multiPos$CIp[i]), col = cols[1])
  lines(x = c(i,i), y = c(multiPos$CIm[i], multiPos$Mean[i]), col = cols[1])
  lines(x = c(i-.2, i+.2), y = c(multiPos$CIp[i], multiPos$CIp[i]), col = cols[1])
  lines(x = c(i-.2, i+.2), y = c(multiPos$CIm[i], multiPos$CIm[i]), col = cols[1])
}
points(multiPos$Mean, col = cols[1], cex = 1.5, pch = 15)

# Thresholds
yG <- .006
if(check[[1]]) {
  lines(x = rep(id1+.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[2])
  polygon(x = c(u[1],id1+.5, id1+.5,u[1]), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = paste0(cols[2], '11'))
  text(x = u[1]+.1, y = u[4]-.0106, labels = 'Weak entry points', adj = c(0,.5), font = 4, cex = 1.25)
}

if(check[[2]]) {
  lines(x = rep(id2-.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[2])
  polygon(x = c(u[2],id2-.5, id2-.5,u[2]), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = paste0(cols[2], '11'))
  text(x = u[2]-.1, y = u[4]-.0106, labels = 'Weak entry points', adj = c(1,.5), font = 4, cex = 1.25)
}

if(check[[3]]) {
  lines(x = rep(id0[1]-.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[1])
  lines(x = rep(id0[2]+.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = cols[1])
  polygon(x = c(id0[1]-.5,id0[2]+.5, id0[2]+.5,id0[1]-.5), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', paste0(cols[1], '11'))
  text(x = mean(id0), y = u[4]-.0106, labels = 'Trophic sinks', adj = c(.5,.5), font = 4, cex = 1.25)
}

# Add motifs
motif <- substr(multiPos$position,1,2)
sp <- substr(multiPos$position,3,3)

for(i in 1:nrow(multiPos)) {
  plotMotifs(motif = motif[i], position = sp[i],
             path = '', x = i, y = -.072, scalingY = .005, scalingX = .35,
             add = T, cex = 1.25, lwd = 1.15)
}




# # ---------------------------------------
# #          Additivity pathways
# # ---------------------------------------
# # Parameters
# # Mean abundances < | > 0.0001
# th <- .0001
# dat <- (round(addPath$Mean,6))
# check <- c(any(dat < -th), any(dat > th))
# if(check[[1]]) id1 <- max(which(dat < -th))
# if(check[[2]]) id2 <- min(which(dat > th))
#
# # Plot
# par(mar = c(2,5,.5,.5))
# plot0(x = c(0,nrow(addPath)), y = c(-.006, .006))
# axis(2, at = seq(-.006, .006, by = .003), labels = seq(-.6,.6,by = .3), las = 2)
# abline(h = 0, lty = 2, col = '#00000055')
# mtext(text = 'Rank', side = 1, at = nrow(addPath), line = .75)
# u <- par("usr")
# arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
# mtext(text = TeX('$\\delta$ $A_{Joint}$ - $\\delta$$ $A_{Additive}$ (%)'), side = 2, line = 2, cex = .75)
# mtext(text = TeX('Joint - additive model'), side = 2, line = 3.5, cex = 1)
# polygon(x = c(1:nrow(addPath), nrow(addPath):1), y = c(addPath$CIm, rev(addPath$CIp)), col = '#23349922', border = 'transparent')
# lines(addPath$Mean, col = '#233499', lwd = 2)
#
# # Thresholds
# yG <- .00045
# if(check[[1]]) {
#   lines(x = rep(id1+.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = '#668aeb')
#   polygon(x = c(u[1],id1+.5, id1+.5,u[1]), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = '#668aeb22')
#   text(x = u[1]+20, y = u[4]-.00075, labels = 'Biotic multipliers', adj = c(0,.5), font = 4, cex = 1.25)
# }
#
# if(check[[2]]) {
#   lines(x = rep(id2-.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = '#c46a86')
#   polygon(x = c(u[2],id2-.5, id2-.5,u[2]), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = '#c46a8622')
#   text(x = u[2]-20, y = u[4]-.00075, labels = 'Synergistic pathways', adj = c(1,.5), font = 4, cex = 1.25)
# }
#
#
# # ---------------------------------------
# #            Additivity motifs
# # ---------------------------------------
# # Parameters
# # Mean abundances < | > 0.001
# # th <- .001
# dat <- (round(addPos$Mean,6))
# check <- c(any(dat < -th), any(dat > th))
# if(check[[1]]) id1 <- max(which(dat < -th))
# if(check[[2]]) id2 <- min(which(dat > th))
#
# # Plot
# # Abundance - Position profile
# par(mar = c(2,5,.5,.5))
# plot0(x = c(1,nrow(addPos)), y = c(-.0005, .0005))
# axis(2, at = seq(-.0005,.0005,by=.00025), labels = seq(-.05,.05,by=.025), las = 2)
# mtext(text = TeX('Mean $\\delta_A$ (%) $\\pm$ 95% CI'), side = 2, line = 2, cex = .75)
# mtext(text = 'Position profile', side = 2, line = 3.5, cex = 1)
# abline(h = 0, lty = 2, col = '#00000055')
# mtext(text = 'Rank', side = 1, at = nrow(addPos), line = .75)
# u <- par("usr")
# arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
# for(i in 1:nrow(addPos)) {
#   lines(x = c(i,i), y = c(addPos$Mean[i], addPos$CIp[i]), col = '#233499')
#   lines(x = c(i,i), y = c(addPos$CIm[i], addPos$Mean[i]), col = '#233499')
#   lines(x = c(i-.2, i+.2), y = c(addPos$CIp[i], addPos$CIp[i]))
#   lines(x = c(i-.2, i+.2), y = c(addPos$CIm[i], addPos$CIm[i]))
# }
# points(addPos$Mean, col = '#233499', cex = 1.5, pch = 15)
#
# # Thresholds
# yG <- .00004
# if(check[[1]]) {
#   lines(x = rep(id1+.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = '#668aeb')
#   polygon(x = c(u[1],id1+.5, id1+.5,u[1]), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = '#668aeb22')
#   text(x = u[1]+.1, y = u[4]-.000065, labels = 'Biotic sinks', adj = c(0,.5), font = 4, cex = 1.25)
# }
#
# if(check[[2]]) {
#   lines(x = rep(id2-.5,2), y = c(u[3]+yG, u[4]-yG), lty = 4, col = '#c46a86')
#   polygon(x = c(u[2],id2-.5, id2-.5,u[2]), y = c(u[3]+yG, u[3]+yG, u[4]-yG,u[4]-yG), border = 'transparent', col = '#c46a8622')
#   text(x = u[2]-.1, y = u[4]-.000065, labels = 'Biotic multipliers', adj = c(1,.5), font = 4, cex = 1.25)
# }
#
# # Add motifs
# motif <- substr(addPos$position,1,2)
# sp <- substr(addPos$position,3,3)
#
# for(i in 1:nrow(addPos)) {
#   plotMotifs(motif = motif[i], position = sp[i],
#              path = '', x = i, y = -.00045, scalingY = .00003, scalingX = .35,
#              add = T, cex = 1.75, lwd = 1.15)
# }

# ---------------------------------------
#               The end
# ---------------------------------------
dev.off()
