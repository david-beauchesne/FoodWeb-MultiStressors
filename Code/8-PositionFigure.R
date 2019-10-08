# source('./Code/8-PositionFigure.R')
source('./Code/0-Param.R')
load('./Data/AdditivePath.RData')
load('./Data/AdditivePosition.RData')
source('./Functions/plotMotifs.R')

# ------------------------------------------------------------------------------
#                                 FIGURE 3
# ------------------------------------------------------------------------------
# Parameters
pos <- c('ttz','tty','ttx','omz','omy','omx','exz','exx','apz','apx','paz','pax','pay','dix')
sep <- c('ttx','omx','exx','apx','pay')

# # Layout
# mat <- matrix(nrow = 15, ncol = 4, data = 0)
# mat[1,1] <- 1 # Motif
# mat[1,2] <- 2 # Position
# mat[1,3] <- 3 # Amplification
# mat[1,4] <- 4 # Mean amplification
# mat[2,1] <- 5 # tt
# mat[5,1] <- 6 # om
# mat[8,1] <- 7 # ex
# mat[10,1] <- 8 # ap
# mat[12,1] <- 9 # pa
# mat[15,1] <- 10 # di
# mat[2:15,2] <- 11:24 # positions
# mat[2:15,3] <- 25:38 # Amplification
# mat[2:15,4] <- 39:52 # Mean values +- 95% CI
# # layout.show(51)

png('./Figures/positions.png', width = 892, height = 1500, res = 200, pointsize = 6)
# layout(mat, widths = c(.55,.35,1,1), heights = c(.5,rep(1,14)))
par(family = 'serif')

cl <- c(0,.55,.9,1,2,3)
rw <- c(0,seq(.5, by = 1, length.out = 16)) %>% rev()

# Plot 1
par(mar = c(0,0,0,0))
plot0(x = c(0,2.9), y = c(.5,15.5))

# -------------------------
#        Titles
# -------------------------
text(x = mean(cl[1:2]), y = rw[1]+.1, labels = 'Motifs', adj = c(.5,.5), cex = 1.25, font = 2)
text(x = mean(cl[2:3]), y = rw[1]+.1, labels = 'Positions', adj = c(.5,.5), cex = 1.25, font = 2)
text(x = mean(cl[4:5]), y = rw[1]+.2, labels = TeX('\\textbf{Trophic amplification} ($A_{i,j}$)'), cex = 1.25, adj = c(.5,.5))
text(x = mean(cl[4:5]), y = rw[1], labels = TeX('Mean $\\A_{i,j}$ $\\pm$ 95% CI'), cex = 1, adj = c(.5,.5))
text(x = mean(cl[5:6]), y = rw[1]+.2, labels = TeX('\\textbf{Position amplification} ($A_i$)'), adj = c(.5,.5), cex = 1.25, font = 2)
text(x = mean(cl[5:6]), y = rw[1], labels = TeX('Mean $\\A_i$ $\\pm$ 95% CI'), adj = c(.5,.5), cex = 1, font = 2)



# -------------------------
#        Motifs
# -------------------------
motifs <- c('tt','om','ex','ap','pa','di')
posY <- c(15,12,9,7,5,2)
lab <- c('Tri-trophic\nchain','Omnivory','Exploitative\ncompetition','Apparent\ncompetition','Partially\nconnected','Disconnected')
for(i in 1:length(motifs)) {
  plotMotifs(motifs[i], scalingY = .3, scalingX = .15, x = cl[2]-.1, y = posY[i]-.5, add = T, cex = 1.5)
  text(x = 0, y = posY[i]-.1, labels = lab[i], cex = 1, adj = c(0,1))
}


# -------------------------
#       Positions
# -------------------------
motifs <- c('tt','tt','tt','om','om','om','ex','ex','ap','ap','pa','pa','pa','di') %>% rev()
sp <- c('z','y','x','z','y','x','z','x','z','x','z','x','y','x') %>% rev()
for(i in 1:length(motifs)) {
  plotMotifs(motifs[i], sp[i], add = T, cex = 1.5,
             scalingY = .3, scalingX = .15,
             x = mean(cl[2:3]), y = i+.5)
}


# -------------------------
#      Amplification
# -------------------------
for(i in 1:length(pos)) {
  k = rev(pos)[i]
  # Parameters
  uid <- addPath$position == k
  dat <- addPath[uid, ]

  # Thresholds - amplification
  th <- .0002
  idA1 <- which(round(dat$Mean,6) <= -th) %>% { if(length(.) > 0) max(.) else NULL }
  idA2 <- which(round(dat$Mean,6) >= th) %>% { if(length(.) > 0) min(.) else NULL }

  # Axes
  xR <- c(cl[4]+.1, cl[5]-.1)
  arrows(xR[1], i+.5, xR[2], i+.5, length = .05, code = 2, xpd = TRUE)
  lines(x = rep(xR[1],2), y = c(i+.1, i+.9), lwd = 1.25)
  y <- seq(i+.1,i+.9,length.out = 5)
  x <- c('-0.0050','-0.0025','0.0000','0.0025','0.0050')
  for(j in 1:5) {
    lines(x = c(xR[1], xR[1]-.02), y = rep(y[j],2), lwd = 1.25)
    text(x = xR[1]-.05, y = y[j], labels = x[j], cex = .75, adj = c(1,.5))
  }

  # Thresholds
  datX <- seq(xR[1]+.05, xR[2]-.05, length.out = nrow(dat))
  if (!is.null(idA1)) {
    lines(x = rep(datX[idA1]+(diff(datX[1:2])/2),2), y = c(i+.1, i+.9), lty = 4, col = cols[1])
    polygon(x = c(datX[1], datX[1], rep(datX[idA1]+(diff(datX[1:2])/2),2)),
            y = c(i+.1, i+.9, i+.9, i+.1), border = 'transparent', col = paste0(cols[1], '11'))
  }
  if (!is.null(idA2)) {
    lines(x = rep(datX[idA2]-(diff(datX[1:2])/2),2), y = c(i+.1, i+.9), lty = 4, col = cols[2])
    polygon(x = c(rep(datX[length(datX)],2), rep(datX[idA2]-(diff(datX[1:2])/2),2)),
            y = c(i+.1, i+.9, i+.9, i+.1), border = 'transparent', col = paste0(cols[2], '11'))
  }

  # Data
  datY <- (dat$Mean/.005)/2+i+.5
  datCIm <- (dat$CIm/.005)/2+i+.5
  datCIp <- (dat$CIp/.005)/2+i+.5
  envelop(x = datX, upper = datCIp, lower = datCIm, col = paste0(cols[1],'44'), border = '#00000000')
  lines(x = datX, y = datY, col = cols[1], lwd = 1.5)
}



# -------------------------
#    Amplification mean
# -------------------------
xR <- c(cl[5]+.1, cl[6]-.1)
x0 <- xR[1] + diff(xR)*.5

# Axis
lines(x = xR, y = rep(rw[1]-.5,2), lwd = 1)
lines(x = xR, y = rep(1,2), lwd = 1)
lines(x = rep(x0,2), y = c(rw[1]-.5, 1), lty = 2, lwd = 1)
x <- seq(xR[1], xR[2], length.out = 3)
xLab <- c('-0.0005','0.0000','0.0005')
for(j in 1:3) {
  lines(x = rep(x[j], 2), y = c(rw[1]-.5, rw[1]-.45), lwd = 1)
  lines(x = rep(x[j], 2), y = c(1,.95), lwd = 1)
  text(x = x[j], y = rw[1]-.3, labels = xLab[j], cex = .75, adj = c(.5,.5))
  text(x = x[j], y = .8, labels = xLab[j], cex = .75, adj = c(.5,.5))
}

# Thresholds
x1 <- x0 - ((th/.0005) / 2) * diff(xR)
x2 <- x0 + ((th/.0005) / 2) * diff(xR)
lines(x = rep(x1,2), y = c(rw[1]-.5, 1), col = cols[1], lty = 4)
lines(x = rep(x2,2), y = c(rw[1]-.5, 1), col = cols[2], lty = 4)
polygon(x = c(rep(xR[1],2), rep(x1,2)), y = c(rw[1]-.5,1,1,rw[1]-.5),
        border = 'transparent', col = paste0(cols[1], '11'))
polygon(x = c(rep(xR[2],2), rep(x2,2)), y = c(rw[1]-.5,1,1,rw[1]-.5),
        border = 'transparent', col = paste0(cols[2], '11'))

# Data
addPos <- addPos[match(pos, addPos$position), ]
posX <- x0 + ((addPos$Mean/0.0005)/2) * diff(xR)
posCIp <- x0 + ((addPos$CIp/0.0005)/2) * diff(xR)
posCIm <- x0 + ((addPos$CIm/0.0005)/2) * diff(xR)

# Confidence intervals
xG <- .1
for(i in 1:nrow(addPos)) {
  lines(x = c(posX[i], posCIp[i]), y = rep(rw[i+1],2), col = cols[1])
  lines(x = c(posX[i], posCIm[i]), y = rep(rw[i+1],2), col = cols[1])
  lines(x = rep(posCIp[i],2), y = c(rw[i+1]+xG, rw[i+1]-xG), col = cols[1])
  lines(x = rep(posCIm[i],2), y = c(rw[i+1]+xG, rw[i+1]-xG), col = cols[1])
}

# Mean value
points(x = posX, y = rw[2:15], col = cols[1], cex = 1.5, pch = 15)


# -------------------------
#        Legends
# -------------------------
# Trophic amplification
xR <- c(cl[4]+.1, cl[5]-.1)
polygon(x = c(rep(xR[1],2), rep(xR[1]+.15, 2)), y = c(rw[16],rep(rw[16]-.15, 2), rw[16]),
        border = cols[1], lty = 4, col = paste0(cols[1], '11'))
polygon(x = c(rep(xR[1],2), rep(xR[1]+.15, 2)), y = c(rw[16]-.25,rep(rw[16]-.4, 2), rw[16]-.25),
        border = cols[2], lty = 4, col = paste0(cols[2], '11'))
text(x = xR[1]+.2, y = rw[16]-.075, labels = 'Buffer pathway', cex = .8, adj = c(0,.5))
text(x = xR[1]+.2, y = rw[16]-.325, labels = 'Multiplier pathway', cex = .8, adj = c(0,.5))


# Position amplification
xR <- c(cl[5]+.1, cl[6]-.1)
polygon(x = c(rep(xR[1],2), rep(xR[1]+.15, 2)), y = c(rw[16],rep(rw[16]-.15, 2), rw[16]),
        border = cols[1], lty = 4, col = paste0(cols[1], '11'))
polygon(x = c(rep(xR[1],2), rep(xR[1]+.15, 2)), y = c(rw[16]-.25,rep(rw[16]-.4, 2), rw[16]-.25),
        border = cols[2], lty = 4, col = paste0(cols[2], '11'))
text(x = xR[1]+.2, y = rw[16]-.075, labels = 'Trophic buffer', cex = .8, adj = c(0,.5))
text(x = xR[1]+.2, y = rw[16]-.325, labels = 'Trophic multiplier', cex = .8, adj = c(0,.5))


dev.off()
