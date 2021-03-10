library(tidyverse)
library(graphicsutils)
library(latex2exp)

load('./Data/vulnerability.RData')

par(mfrow = c(6,3))
par(mar = c(1,1,1,1), family = 'serif')
yR <- c(-.0004,.0004)
xR <- c(-.06, .06)

yR <- c(-.0055,.0055)
xR <- c(-.125, .125)

pos <- c('omx','omy','omz','ttx','tty','ttz','exx',NA,'exz','apx',NA,'apz','pax','pay','paz','dix', NA, NA)

for(i in pos) {
  if (is.na(i)) {
    plot0(x = xR, y = yR)
  } else {
    plot0(x = xR, y = yR)
    ext <- par('usr')
#    axis(1, cex.axis = .9)
#    axis(2, cex.axis = .9)
#    axis(3, cex.axis = .9)
#    axis(4, cex.axis = .9)
    box(lwd = 2)
    abline(h=0, lty = 2, lwd = 1)
    abline(v=0, lty = 2, lwd = 1)

    uid <- vulnerability$Position == i
    points(x = vulnerability$Sensitivity[uid], y = vulnerability$Amplification[uid],
           pch = 20, col = '#52657c33', cex = .75, bg = '#52657c33')

    yM <- mean(vulnerability$Amplification[uid], na.rm = TRUE)
    xM <- mean(vulnerability$Sensitivity[uid], na.rm = TRUE)
    points(x = xM, y = yM, pch = 21, cex = 1.25, bg = '#e98181', col = '#8e4747', lwd = 2.5)
  }
}

# Figure 2
# fig2 <- function() {
  png('./Figures/interaction-control.png', width = 1500, height = 1500, res = 200, pointsize = 12)
  par(mfrow = c(1,1), mar = c(5,5,2,2), family = 'serif')
  yR <- c(-.0055,.0055)
  xR <- c(-.125, .125)
  plot0(x = xR, y = yR)
  ext <- par('usr')
  axis(1, cex.axis = .9)
  axis(2, cex.axis = .9)
  axis(3, cex.axis = .9)
  axis(4, cex.axis = .9)
  box(lwd = 2)
  abline(h=0, lty = 2, lwd = 1)
  abline(v=0, lty = 2, lwd = 1)
  mtext(text = TeX('\\textbf{Trophic sensitivity} ($\\textit{S_i}$)'), side = 1, line = 2.75, cex = 1.25)
  mtext(text = TeX('\\textbf{Trophic amplification} ($\\textit{A_i}$)'), side = 2, line = 3, cex = 1.25)
  text(x = xR[1]+.005, y = .0055, labels = 'Interactions', adj = c(0,.5), cex = 1)
  text(x = xR[1]+.005, y = .005, labels = 'Controls', adj = c(0,.5), cex = 1)
  points(x = xR[1], y = .0055, pch = 20, cex = 1, col = '#52657c33', bg = '#52657c33')
  points(x = xR[1], y = .005, pch = 20, cex = 1, col = '#c4793c', bg = '#c4793c')

  int <- vulnerability$Motif %in% c('om','tt','ex','ap')
  con <- vulnerability$Motif %in% c('pa','di')

  # Interactions
  points(x = vulnerability$Sensitivity[int], y = vulnerability$Amplification[int],
         pch = 20, col = '#52657c33', cex = .75, bg = '#52657c33')

  #yM <- mean(vulnerability$Amplification[int], na.rm = TRUE)
  #xM <- mean(vulnerability$Sensitivity[int], na.rm = TRUE)
  #points(x = xM, y = yM, pch = 21, cex = 1.25, bg = '#e98181', col = '#8e4747', lwd = 2.5)

  # Controls
  points(x = vulnerability$Sensitivity[con], y = vulnerability$Amplification[con],
         pch = 20, col = '#c4793c', cex = 1, bg = '#c4793c')

  #yM <- mean(vulnerability$Amplification[con], na.rm = TRUE)
  #xM <- mean(vulnerability$Sensitivity[con], na.rm = TRUE)
  #points(x = xM, y = yM, pch = 21, cex = 1.25, bg = '#e98181', col = '#8e4747', lwd = 2.5)
  dev.off()
# }

# Figure 2
# fig2 <- function() {
  png('./Figures/interaction-control-abs.png', width = 1500, height = 1500, res = 200, pointsize = 12)
  par(mfrow = c(1,1), mar = c(5,5,2,2), family = 'serif')
  yR <- c(0,.0055)
  xR <- c(0, .125)
  plot0(x = xR, y = yR)
  ext <- par('usr')
  axis(1, cex.axis = .9)
  axis(2, cex.axis = .9)
  axis(3, cex.axis = .9)
  axis(4, cex.axis = .9)
  box(lwd = 2)
  # abline(h=0, lty = 2, lwd = 1)
  # abline(v=0, lty = 2, lwd = 1)
  mtext(text = TeX('\\textbf{Absolute trophic sensitivity} ($| \\textit{S_i} |$)'), side = 1, line = 2.75, cex = 1.25)
  mtext(text = TeX('\\textbf{Absolute trophic amplification} ($| \\textit{A_i} |$)'), side = 2, line = 3, cex = 1.25)
  text(x = xR[1]+.0025, y = .0055, labels = 'Interactions', adj = c(0,.5), cex = 1)
  text(x = xR[1]+.0025, y = .00525, labels = 'Controls', adj = c(0,.5), cex = 1)
  points(x = xR[1], y = .0055, pch = 20, cex = 1, col = '#52657c66', bg = '#52657c66')
  points(x = xR[1], y = .00525, pch = 20, cex = 1, col = '#c4793c', bg = '#c4793c')

  int <- vulnerability$Motif %in% c('om','tt','ex','ap')
  con <- vulnerability$Motif %in% c('pa','di')

  # Interactions
  points(x = abs(vulnerability$Sensitivity[int]), y = abs(vulnerability$Amplification[int]),
         pch = 20, col = '#52657c66', cex = .75, bg = '#52657c66')

  yM <- mean(abs(vulnerability$Amplification[int]), na.rm = TRUE)
  xM <- mean(abs(vulnerability$Sensitivity[int]), na.rm = TRUE)
  points(x = xM, y = yM, pch = 21, cex = 1.25, bg = '#e98181', col = '#8e4747', lwd = 2.5)

  # Controls
  points(x = abs(vulnerability$Sensitivity[con]), y = abs(vulnerability$Amplification[con]),
         pch = 20, col = '#c4793c', cex = 1, bg = '#c4793c')

  yM <- mean(abs(vulnerability$Amplification[con]), na.rm = TRUE)
  xM <- mean(abs(vulnerability$Sensitivity[con]), na.rm = TRUE)
  points(x = xM, y = yM, pch = 21, cex = 1.25, bg = '#e98181', col = '#8e4747', lwd = 2.5)
  dev.off()
# }


# New figure 1
png('./Figures/unitary-integrative.png', width = 1500, height = 1500, res = 200, pointsize = 12)
par(mfrow = c(1,1), mar = c(5,5,2,2), family = 'serif')
yR <- c(-.125,.125)
xR <- c(0, 9)
plot0(x = xR, y = yR)
ext <- par('usr')
axis(1, cex.axis = .9)
axis(2, cex.axis = .9)
axis(3, cex.axis = .9)
axis(4, cex.axis = .9)
box(lwd = 2)
abline(h=0, lty = 2, lwd = 1)
# abline(v=0, lty = 2, lwd = 1)
mtext(text = TeX('\\textbf{Trophic sensitivity} ($\\textit{S_i}$)'), side = 2, line = 2.75, cex = 1.25)
mtext(text = TeX('\\textbf{Number of parameters}'), side = 1, line = 3, cex = 1.25)
text(x = xR[1]+.1, y = .125, labels = 'Unitary pathways of effect', adj = c(0,.5), cex = 1)
text(x = xR[1]+.1, y = .115, labels = 'Integrative pathways of effect', adj = c(0,.5), cex = 1)
points(x = xR[1], y = .115, pch = 20, cex = 1, col = '#52657c66', bg = '#52657c66')
points(x = xR[1], y = .125, pch = 20, cex = 1, col = '#c4793c', bg = '#c4793c')


uni <- vulnerability$nParam == 1 & vulnerability$Motif %in% c('om','tt','ex','ap')
int <- vulnerability$nParam > 1 & vulnerability$Motif %in% c('om','tt','ex','ap')

# Unitary
points(x = vulnerability$nParam[uni], y = vulnerability$Sensitivity[uni],
       pch = 20, col = '#c4793c', cex = .75, bg = '#c4793c')

# Integrative
points(x = vulnerability$nParam[int], y = vulnerability$Sensitivity[int],
       pch = 20, col = '#52657c66', cex = .75, bg = '#52657c66')
dev.off()

# New figure 1
png('./Figures/unitary-integrative-abs.png', width = 1500, height = 1500, res = 200, pointsize = 12)
par(mfrow = c(1,1), mar = c(5,5,2,2), family = 'serif')
yR <- c(0,.125)
xR <- c(0, 9)
plot0(x = xR, y = yR)
ext <- par('usr')
axis(1, cex.axis = .9)
axis(2, cex.axis = .9)
axis(3, cex.axis = .9)
axis(4, cex.axis = .9)
box(lwd = 2)
# abline(h=0, lty = 2, lwd = 1)
# abline(v=0, lty = 2, lwd = 1)
mtext(text = TeX('\\textbf{Absolute trophic sensitivity} ($| \\textit{S_i} |$)'), side = 2, line = 2.75, cex = 1.25)
mtext(text = TeX('\\textbf{Number of parameters}'), side = 1, line = 3, cex = 1.25)
text(x = xR[1]+.1, y = .125, labels = 'Unitary pathways of effect', adj = c(0,.5), cex = 1)
text(x = xR[1]+.1, y = .115, labels = 'Integrative pathways of effect', adj = c(0,.5), cex = 1)
points(x = xR[1], y = .115, pch = 20, cex = 1, col = '#52657c66', bg = '#52657c66')
points(x = xR[1], y = .125, pch = 20, cex = 1, col = '#c4793c', bg = '#c4793c')


uni <- vulnerability$nParam == 1 & vulnerability$Motif %in% c('om','tt','ex','ap')
int <- vulnerability$nParam > 1 & vulnerability$Motif %in% c('om','tt','ex','ap')

# Unitary
points(x = vulnerability$nParam[uni], y = abs(vulnerability$Sensitivity[uni]),
       pch = 20, col = '#c4793c', cex = .75, bg = '#c4793c')

# Integrative
points(x = vulnerability$nParam[int], y = abs(vulnerability$Sensitivity[int]),
       pch = 20, col = '#52657c66', cex = .75, bg = '#52657c66')
dev.off()



# Density distributions
png('./Figures/unitary-integrative-dens.png', width = 1500, height = 1000, res = 200, pointsize = 12)
par(mfrow = c(1,1), mar = c(5,1,1,1), family = 'serif')
xR <- c(-.15,.15)
yR <- c(0,27)
plot0(x = xR, y = yR)
ext <- par('usr')
# axis(1, at = seq(-.15, .15, by = .05), labels = seq(-.15, .15, by = .05), cex.axis = .9)
axis(1, cex.axis = .9)
# axis(2, cex.axis = .9)
# axis(3, cex.axis = .9)
# axis(4, cex.axis = .9)
# box(lwd = 2)
# abline(h=0, lty = 2, lwd = 1)
abline(v=0, lty = 2, lwd = 1)
mtext(text = TeX('\\textbf{Trophic sensitivity} ($\\textit{S_i}$)'), side = 1, line = 2.75, cex = 1.25)
text(x = xR[1]+.01, y = 25, labels = 'Unitary pathways of effect', adj = c(0,.5), cex = 1)
text(x = xR[1]+.01, y = 23, labels = 'Integrative pathways of effect', adj = c(0,.5), cex = 1)
lines(x = c(xR[1],xR[1]+.005), y = c(25,25), lwd = 1.5, col = '#c4793c')
lines(x = c(xR[1],xR[1]+.005), y = c(23,23), lwd = 1.5, col = '#52657c')

# IDs
uni <- vulnerability$nParam == 1 & vulnerability$Motif %in% c('om','tt','ex','ap')
int <- vulnerability$nParam > 1 & vulnerability$Motif %in% c('om','tt','ex','ap')

# Density
datUni <- density(vulnerability$Sensitivity[uni], from = -.15, to = .15)
datInt <- density(vulnerability$Sensitivity[int], from = -.15, to = .15)

# Envelops
envelop(x = datUni$x, upper = datUni$y, lower = rep(0,length(datUni$x)), col = '#c4793c66', border = '#00000000')
envelop(x = datInt$x, upper = datInt$y, lower = rep(0,length(datInt$x)), col = '#52657c66', border = '#00000000')

# Density lines
lines(x = datUni$x, y = datUni$y, lwd = 1.5, col = '#c4793c')
lines(x = datInt$x, y = datInt$y, lwd = 1.5, col = '#52657c')
dev.off()
