# source('./code/figures/F4-density_boxplot.R')
library(tidyverse)
library(graphicsutils)
library(latex2exp)

load('./Data/vulnerability.RData')

# Figure
png('./Figures/density_boxplot.png', width = 1500, height = 2000, res = 200, pointsize = 12)
par(mfrow = c(2,1), mar = c(5,5,1,1), family = 'serif')

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Density distributions
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
xR <- c(-.15,.15)
yR <- c(0,27)
plot0(x = xR, y = yR)
ext <- par('usr')
# axis(1, at = seq(-.15, .15, by = .05), labels = seq(-.15, .15, by = .05), cex.axis = .9)
axis(1, cex.axis = .9)
axis(2, cex.axis = .9)
# axis(3, cex.axis = .9)
# axis(4, cex.axis = .9)
# box(lwd = 2)
# abline(h=0, lty = 2, lwd = 1)
abline(v=0, lty = 2, lwd = 1)
mtext(text = TeX('\\textbf{Trophic sensitivity} ($\\textit{S_i}$)'), side = 1, line = 2.75, cex = 1.25)
mtext(text = TeX('\\textbf{Density}'), side = 2, line = 2.75, cex = 1.25)
text(x = xR[1]+.01, y = 25, labels = 'Unitary pathways of effect (n=76)', adj = c(0,.5), cex = .95)
text(x = xR[1]+.01, y = 23, labels = 'Integrative pathways of effect (n=2346)', adj = c(0,.5), cex = .95)
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

# Letter
text(labels = TeX('\\textbf{A}'), x = xR[2], y = yR[2], adj = c(1,0), cex = 1.5)
# ---------------------------------------------------------------------------

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Box plot
#
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# New figure 1
par(mar = c(5,5,1,1), family = 'serif')
yR <- c(0,.15)
xR <- c(0.5, 9.5)
plot0(x = xR, y = yR)
axis(1, cex.axis = .9, at = 1:9, labels = 1:9, line = 1)
axis(2, cex.axis = .9, at = seq(0,0.15,by=.025), labels = seq(0,.15,by=.025))
mtext(text = TeX('\\textbf{Trophic sensitivity} ($\\textit{S_i}$)'), side = 2, line = 2.75, cex = 1.25)
mtext(text = TeX('\\textbf{Number of parameters}'), side = 1, line = 3.5, cex = 1.25)
text(x = xR[1]+.4, y = .145, labels = 'Positive trophic sensitivity', adj = c(0,.5), cex = .95)
text(x = xR[1]+.4, y = .135, labels = 'Negative trophic sensitivity', adj = c(0,.5), cex = .95)
polygon(x = c(xR[1], rep(xR[1]+.3, 2), xR[1]), y = c(.1475,.1475,.1425,.1425), col = '#52657c66', bg = '#52657c66')
polygon(x = c(xR[1], rep(xR[1]+.3, 2), xR[1]), y = c(.1375,.1375,.1325,.1325), col = '#db9f3866', bg = '#db9f3866')
# points(x = xR[1], y = .115, pch = 20, cex = 1,
# points(x = xR[1], y = .125, pch = 20, cex = 1, col = '#c4793c', bg = '#c4793c')

# Positive and negative values
pos <- vulnerability[vulnerability$Sensitivity >= 0, ]
neg <- vulnerability[vulnerability$Sensitivity < 0, ]

for(i in 1:8) {
  # Positive boxplots
  uid <- pos$nParam == i & pos$Motif %in% c('om','tt','ex','ap')
  boxplot(pos$Sensitivity[uid], add = TRUE, at = i-.15, frame = FALSE, range = 3,
          col = '#4B789466', boxwex=0.5, axes=FALSE)
  np <- sum(uid)

  # Negative boxplots
  uid <- neg$nParam == i & neg$Motif %in% c('om','tt','ex','ap')
  boxplot(abs(neg$Sensitivity[uid]), add = TRUE, at = i+.15, frame = FALSE, range = 3,
          col = '#db9f3866', boxwex=0.5, axes=FALSE)
  np <- paste0('n=',np + sum(uid))

  # Number of pathways of effects
  mtext(side = 1, at = i, line = -.25, text = np,cex = .8)
}

# Positive points for last
uid <- pos$nParam == 9 & pos$Motif %in% c('om','tt','ex','ap')
points(x = rep(9-.15, sum(uid)), pos$Sensitivity[uid],
       pch = 20, col = '#4B7894', cex = 1.25, bg = '#4B7894')

# Negative points
uid <- neg$nParam == 9 & neg$Motif %in% c('om','tt','ex','ap')
points(x = rep(9+.15, sum(uid)), abs(neg$Sensitivity[uid]),
       pch = 20, col = '#db9f38', cex = 1.25, bg = '#db9f38')

# Number of pathways of effects
mtext(side = 1, at = 9, line = -.25, text = 'n=3',cex = .8)

# Letter
text(labels = TeX('\\textbf{B}'), x = xR[2], y = yR[2]-.005, adj = c(1,0), cex = 1.5)

# ---------------------------------------------------------------------------

dev.off()
