# source('./Code/9-PositionFigure.R')
# source('./Code/0-Param.R')
library(graphicsutils)
library(magrittr)
load('./Data/Univariate.RData')
load('./Data/Multivariate.RData')
load('./Data/MultivariateAdditivity.RData')
source('./Functions/plotMotifs.R')

# ------------------------------------------------------------------------------
#                                 FIGURE 3
# ------------------------------------------------------------------------------
# Parameters
pos <- c('ttz','tty','ttx','omz','omy','omx','exz','exx','apz','apx','paz','pax','pay','dix')
sep <- c('ttx','omx','exx','apx','pay')

# Layout
mat <- matrix(nrow = 15, ncol = 5, data = 0)
mat[1,1] <- 1 # Motif
mat[1,2] <- 2 # Position
mat[1,3] <- 3 # Univariate
mat[1,4] <- 4 # Multivariate
mat[1,5] <- 5 # Additivity
mat[2,1] <- 6 # tt
mat[5,1] <- 7 # om
mat[8,1] <- 8 # ex
mat[10,1] <- 9 # ap
mat[12,1] <- 10 # pa
mat[15,1] <- 11 # di
mat[2:15,2] <- 12:25 # positions
mat[2:15,3] <- 26:39 # univariate
mat[2:15,4] <- 40:53 # multivariate
mat[2:15,5] <- 54:67 # additivity
# layout.show(67)

png('./Figures/positions.png', width = 1200, height = 1500, res = 200, pointsize = 6)
layout(mat, widths = c(.55,.35,1,1,1), heights = c(.5,rep(1,14)))
par(family = 'serif')

# Plot 1
par(mar = c(0,0,0,0))
plot0()
text(x = 0, y = 0, labels = 'Motifs', adj = c(.5,.5), cex = 2, font = 1.5)
box2(side=14, lwd=1.25, lty = 2, col = '#00000044')

# Plot 2
plot0()
text(x = 0, y = 0, labels = 'Positions', adj = c(.5,.5), cex = 2, font = 1.5)
box2(side=14, lwd=1.25, lty = 2, col = '#00000044')

# Plot 3
plot0()
text(x = 0, y = 0, labels = 'Univariate\ndisturbance', adj = c(.5,.5), cex = 2, font = 1.5)
box2(side=14, lwd=1.25, lty = 2, col = '#00000044')

# Plot 4
plot0()
text(x = 0, y = 0, labels = 'Multivariate\ndisturbance', adj = c(.5,.5), cex = 2, font = 1.5)
box2(side=14, lwd=1.25, lty = 2, col = '#00000044')

# Plot 5
plot0()
text(x = 0, y = 0, labels = 'Additivity', adj = c(.5,.5), cex = 2, font = 1.5)
box2(side=1, lwd=1.25, lty = 2, col = '#00000044')

# Plot 6:12 - Motifs
motifs <- c('tt','om','ex','ap','pa','di')
lab <- c('Tri-trophic\nchain','Omnivory','Exploitative\ncompetition','Apparent\ncompetition','Partially\nconnected','Disconnected')
for(i in 1:length(motifs)) {
  plot0(x = c(-2,1), y = c(-1,1))
  plotMotifs(motifs[i], scalingY = .65, x = .5, add = T)
  text(x = -1.75, y = .75, labels = lab[i], cex = 1.5, adj = c(0,1))
  box2(side=3, lwd=1.25, lty = 2, col = '#00000044')
}

# Plot 12:25 - Positions
motifs <- c('tt','tt','tt','om','om','om','ex','ex','ap','ap','pa','pa','pa','di')
sp <- c('z','y','x','z','y','x','z','x','z','x','z','x','y','x')
for(i in 1:length(motifs)) {
  par(mar = c(0,0,0,0))
  plot0(x = c(-1,1), y = c(-1,1))
  plotMotifs(motifs[i], sp[i], scalingY = .65, add = T)
  box2(side=24, lwd=1.25, lty = 2, col = '#00000044')
  if(i %in% c(3,6,8,10,13)) box2(side=1, lwd=1.25, lty = 2, col = '#00000044')
}

# Plot 26:39 - Univariate
for(k in pos) {
  # Parameters
  uid <- uni$position == k
  dat <- uni[uid, ]

  # Thresholds
  # Mean abundances < | > 0.1
  id1 <- which(round(dat$Mean,2) <= -.1) %>% { if(length(.) > 0) max(.) else NULL }
  id2 <- which(round(dat$Mean,2) >= .1) %>% { if(length(.) > 0) min(.) else NULL }
  id0 <- which(round(dat$Mean,2) == 0) %>% { if(length(.) > 0) range(.) else NULL }

  # Plot
  par(mar = c(0,3,0,0))
  plot0(x = c(1,nrow(dat)), y = c(-.5, .5))
  u <- par("usr")
  axis(2, las = 2)
  abline(h = 0, lty = 2, col = '#00000088')
  polygon(x = c(1:nrow(dat), nrow(dat):1), y = c(dat$CIm, rev(dat$CIp)), col = '#23349955', border = 'transparent')
  lines(dat$Mean, col = '#233499', lwd = 2)
  box2(side=4, lwd=1.25, lty = 2, col = '#00000044')
  if(k %in% sep) box2(side=1, lwd=1.25, lty = 2, col = '#00000044')

  # Thresholds
  if (!is.null(id1)) {
    abline(v = id1+.5, lty = 4, col = '#c46a86')
    polygon(x = c(u[1],id1+.5, id1+.5,u[1]), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#c46a8622')
  }
  if (!is.null(id2)) {
    abline(v = id2-.5, lty = 4, col = '#c46a86')
    polygon(x = c(u[2],id2-.5, id2-.5,u[2]), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#c46a8622')
  }
  if (!is.null(id0)) {
    abline(v = id0[1]-.5, lty = 4, col = '#668aeb')
    abline(v = id0[2]+.5, lty = 4, col = '#668aeb')
    polygon(x = c(id0[1]-.5,id0[2]+.5, id0[2]+.5,id0[1]-.5), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#668aeb22')
  }
}

# Plot 40:53 - Multivariate
for(k in pos) {
  # Parameters
  uid <- int$position == k
  dat <- int[uid, ]

  # Thresholds
  # Mean abundances < | > 0.1
  id1 <- which(round(dat$Mean,2) <= -.1) %>% { if(length(.) > 0) max(.) else NULL }
  id2 <- which(round(dat$Mean,2) >= .1) %>% { if(length(.) > 0) min(.) else NULL }
  id0 <- which(round(dat$Mean,2) == 0) %>% { if(length(.) > 0) range(.) else NULL }

  # Plot
  par(mar = c(0,3,0,0))
  plot0(x = c(1,nrow(dat)), y = c(-.5, .5))
  u <- par("usr")
  axis(2, las = 2)
  abline(h = 0, lty = 2, col = '#00000088')
  polygon(x = c(1:nrow(dat), nrow(dat):1), y = c(dat$CIm, rev(dat$CIp)), col = '#23349955', border = 'transparent')
  lines(dat$Mean, col = '#233499', lwd = 2)
  box2(side=4, lwd=1.25, lty = 2, col = '#00000044')
  if(k %in% sep) box2(side=1, lwd=1.25, lty = 2, col = '#00000044')

  # Thresholds
  if (!is.null(id1)) {
    abline(v = id1+.5, lty = 4, col = '#c46a86')
    polygon(x = c(u[1],id1+.5, id1+.5,u[1]), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#c46a8622')
  }
  if (!is.null(id2)) {
    abline(v = id2-.5, lty = 4, col = '#c46a86')
    polygon(x = c(u[2],id2-.5, id2-.5,u[2]), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#c46a8622')
  }
  if (!is.null(id0)) {
    abline(v = id0[1]-.5, lty = 4, col = '#668aeb')
    abline(v = id0[2]+.5, lty = 4, col = '#668aeb')
    polygon(x = c(id0[1]-.5,id0[2]+.5, id0[2]+.5,id0[1]-.5), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#668aeb22')
  }
}


# Plot 54:67 - Additivity
for(k in pos) {
  # Parameters
  uid <- intAdd$position == k
  dat <- intAdd[uid, ]

  # Thresholds
  # Additivity
  idA1 <- which(round(dat$Mean,2) <= -.005) %>% { if(length(.) > 0) max(.) else NULL }
  idA2 <- which(round(dat$Mean,2) >= .005) %>% { if(length(.) > 0) min(.) else NULL }

  # Plot
  par(mar = c(0,3,0,0))
  plot0(x = c(1,nrow(dat)), y = c(-.05, .05))
  u <- par("usr")
  axis(2, las = 2)
  abline(h = 0, lty = 2, col = '#00000088')
  polygon(x = c(1:nrow(dat), nrow(dat):1), y = c(dat$CIm, rev(dat$CIp)), col = '#23349955', border = 'transparent')
  lines(dat$Mean, col = '#233499', lwd = 2)
  if(k %in% sep) box2(side=1, lwd=1.25, lty = 2, col = '#00000044')

  # Thresholds
  if (!is.null(idA1)) {
    abline(v = idA1+.5, lty = 4, col = '#668aeb')
    polygon(x = c(u[1],idA1+.5, idA1+.5,u[1]), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#668aeb22')
  }
  if (!is.null(idA2)) {
    abline(v = idA2-.5, lty = 4, col = '#c46a86')
    polygon(x = c(u[2],idA2-.5, idA2-.5,u[2]), y = c(u[3], u[3], u[4],u[4]), border = 'transparent', col = '#c46a8622')
  }
}


dev.off()
