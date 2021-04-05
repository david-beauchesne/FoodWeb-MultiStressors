# source('./Code/Figures/FX2-Position.R')
source('./Code/0-Param.R')
source('./Code/Functions/plotMotifs.R')
load('./Data/vulnerability.RData')

# Summarize by position
vulnerability <- vulnerability %>%
                 select(-Pathways, -nParam, -Variance) %>%
                 group_by(Motif, Species, Position) %>%
                 summarise_all(mean, na.rm = T) %>%
                 ungroup()


# Plot
png('./Figures/FR5-position.png', width = 2500, height = 2500, res = 200, pointsize = 12)
mat <- matrix(0, nrow = 5, ncol = 5)
mat[1, ] <- 2:6
mat[2, ] <- c(7,1,1,1,16)
mat[3, ] <- c(8,1,1,1,9)
mat[4, ] <- c(10,1,1,1,0)
mat[5, ] <- 11:15
layout(mat)


# Mean values per position
par(mar = c(4,4,4,4), family = 'serif')
yR <- c(-.15,.15)
xR <- c(-.7, .7)
plot0(x = xR, y = yR)
ext <- par('usr')
axis(1, cex.axis = 1.3)
axis(2, cex.axis = 1.3)
axis(3, cex.axis = 1.3)
axis(4, cex.axis = 1.3)
box(lwd = 2)
abline(h=0, lty = 2, lwd = 2)
abline(v=0, lty = 2, lwd = 2)

# Buffers, amplifiers, weak entry points
# polygon(x = ext[c(1,2,2,1)], y = c(rep(-sensTh,2), ext[c(3,3)]), col = paste0(cols[1], '22'), border = 'transparent') # WEP-
# polygon(x = ext[c(1,2,2,1)], y = c(rep(sensTh,2), ext[c(4,4)]), col = paste0(cols[2], '22'), border = 'transparent') # WEP+
# polygon(y = ext[c(3,4,4,3)], x = c(rep(ampTh,2), ext[c(4,4)]), col = paste0(cols[4], '22'), border = 'transparent') # BA
# polygon(y = ext[c(3,4,4,3)], x = c(rep(-ampTh,2), ext[c(3,3)]), col = paste0(cols[3], '22'), border = 'transparent') # BB
# abline(v = ampTh, lty = 4, col = cols[4], lwd = 2) # BA
# abline(v = -ampTh, lty = 4, col = cols[3], lwd = 2) # BB
# abline(h = sensTh, lty = 4, col = cols[2], lwd = 2) # WEP+
# abline(h = -sensTh, lty = 4, col = cols[1], lwd = 2) # WEP-
# text(x = ext[1]-ext[1]*.025, y = sensTh+sensTh*.1, adj = c(0,0), labels = 'Weak entry points +', cex = .8, col = cols[2], font = 2)
# text(x = ext[1]-ext[1]*.025, y = -sensTh-sensTh*.1, adj = c(0,1), labels = 'Weak entry points -', cex = .8, col = cols[1], font = 2)
# text(x = ampTh+ampTh*.05, y = ext[4]-ext[4]*.025, adj = c(0,1), labels = 'Biotic amplifiers', cex = .8, col = cols[4], font = 2)
# text(x = -ampTh-ampTh*.05, y = ext[4]-ext[4]*.025, adj = c(1,1), labels = 'Biotic buffers', cex = .8, col = cols[3], font = 2)

# Axes title
# mtext(text = TeX('Mean $\\s_i$ $\\pm$ 95% CI'), side = 2, line = 2.25, cex = 1)
# mtext(text = TeX('Mean $\\A_i$ $\\pm$ 95% CI'), side = 1, line = 2.25, cex = 1)
mtext(text = TeX('\\textbf{Mean trophic sensitivity} ($\\textit{S_i}$)'), side = 1, line = 3, cex = 1.25)
mtext(text = TeX('\\textbf{Mean trophic amplification} ($\\textit{A_i}$)'), side = 2, line = 3, cex = 1.25)

# Data
# Motifs
# Data frame to position motif on figure
dat <- data.frame(motif = vulnerability$Motif,
                  position = vulnerability$Species,
                  x = vulnerability$Sensitivity, y = vulnerability$Amplification,
                  xM = 0, yM = 0, xL = 0, yL = 0,
                  stringsAsFactors = F)

# This'll be ugly!
# X
dat$yM[1] <- dat$y[1] - .000025
dat$yM[2] <- dat$y[2] - .00006
dat$yM[3] <- dat$y[3] + .00005
dat$yM[4] <- dat$y[4] - .00006
dat$yM[5] <- dat$y[5] - .00006
dat$yM[6] <- dat$y[6] + .00004
dat$yM[7] <- dat$y[7] + .00005
dat$yM[8] <- dat$y[8] - .00006
dat$yM[9] <- dat$y[9] + .00007
dat$yM[10] <- dat$y[10] - .00006
dat$yM[11] <- dat$y[11] + .00005
dat$yM[12] <- dat$y[12] - .00005
dat$yM[13] <- dat$y[13] - .00004
dat$yM[14] <- dat$y[14] - .00005

# Y
dat$xM[1] <- dat$x[1] + .01
dat$xM[2] <- dat$x[2] - .004
dat$xM[3] <- dat$x[3] - .007
dat$xM[4] <- dat$x[4] + .003
dat$xM[5] <- dat$x[5] - .006
dat$xM[6] <- dat$x[6] - .008
dat$xM[7] <- dat$x[7] + .002
dat$xM[8] <- dat$x[8] - .001
dat$xM[9] <- dat$x[9] + .002
dat$xM[10] <- dat$x[10] + .002
dat$xM[11] <- dat$x[11] + .002
dat$xM[12] <- dat$x[12] - .002
dat$xM[13] <- dat$x[13] - .005
dat$xM[14] <- dat$x[14] + .004

# Colors

colmotif <- data.frame(motif = c('om','ap','pa','di','tt','ex'),
                       cols = colsPos[c(1,2,5,5,3,4)])
dat <- left_join(dat, colmotif, by = 'motif')

for(i in 1:nrow(dat)) {
  # Encircle
  coords <- coordMotifs(motif = dat$motif[i],
                        x = dat$xM[i], y = dat$yM[i],
                        scalingX = .006, scalingY = .000025)
  coords <- rbind(coords, c(vulnerability$Sensitivity[i],vulnerability$Amplification[i]))
  encircle(x = coords$x, y = coords$y, off.set = .55, border = '#00000044', col = '#00000011')

  # Motifs
  plotMotifs(motif = dat$motif[i], position = dat$position[i],
             x = dat$xM[i], y = dat$yM[i],
             scalingX = .006, scalingY = .000025,
             posCol = dat$cols[i], colLine = '#afacac',
             cex = 1.5, lwd2 = 3, lwd = .75, add = T)
}

# Mean position values
# points(x = vulnerability$Sensitivity, y = vulnerability$Amplification, pch = 21, cex = 1.8, bg = '#e98181', col = '#8e4747', lwd = 2.5)
points(x = vulnerability$Sensitivity, y = vulnerability$Amplification, pch = 21,
       cex = 2, bg = paste0(dat$cols,'66'), col = dat$cols, lwd = 2.5)




# Individual simulations per position
load('./Data/vulnerability.RData')
yR <- c(-.0055,.0055)
xR <- c(-.125, .125)

pos <- c('omx','omy','omz','apx','apz','pax','pay','paz','dix','ttx','tty','ttz','exx','exz')
poscol <- colsPos[c(1,1,1,2,2,5,5,5,5,3,3,3,4,4)]
m <- substr(pos, 1,2)
p <- substr(pos, 3,3)

# For axes - not pretty, but it'll work
s1 <- c(F,F,F,F,F,F,F,F,F,T,T,T,T,T)
s2 <- c(T,F,F,F,F,T,T,F,T,T,F,F,F,F)
s3 <- c(T,T,T,T,T,F,F,F,F,F,F,F,F,F)
s4 <- c(F,F,F,F,T,F,F,T,F,F,F,F,F,T)

for(i in 1:length(pos)) {
  par(mar = c(2,2,2,2), family = 'serif')
  plot0(x = xR, y = yR)
  ext <- par('usr')
  if (s1[i]) axis(1, cex.axis = 1)
  if (s2[i]) axis(2, cex.axis = 1)
  if (s3[i]) axis(3, cex.axis = 1)
  if (s4[i]) axis(4, cex.axis = 1)
  box(lwd = 2)
  abline(h=0, lty = 2, lwd = 1)
  abline(v=0, lty = 2, lwd = 1)

  uid <- vulnerability$Position == pos[i]
  points(x = vulnerability$Sensitivity[uid], y = vulnerability$Amplification[uid],
         pch = 21, col = 'transparent', cex = .9, bg = paste0(poscol[i],'77'))


  # # Motifs
  plotMotifs(motif = m[i], position = p[i],
             x = xR[1]+diff(xR)*.05, y = yR[2]-diff(yR)*.1,
             scalingX = .03, scalingY = .0008,
             posCol = poscol[i], colLine = '#afacac',
             cex = 1.4, lwd2 = 3, lwd = .75, add = T)

  # yM <- mean(vulnerability$Amplification[uid], na.rm = TRUE)
  # xM <- mean(vulnerability$Sensitivity[uid], na.rm = TRUE)
  # points(x = xM, y = yM, pch = 21, cex = 1.25, bg = '#e98181', col = '#8e4747', lwd = 2.5)
}


# Legend
par(mar = c(2,2,2,2))
plot0()
points(x = rep(-.9, 5), y = seq(.9,by=-.2,length.out=5), pch = 21, cex = 1.8,
       bg = paste0(colsPos,'99'), col = colsPos, lwd = 3.5)

text(x = rep(-.75, 5), y = seq(.9,by=-.2,length.out=5), cex = 1.1, adj = c(0,.5),
     labels = c('Omnivory','Apparent competition','Tri-trophic food chain',
                'Exploitative competition','Controls'))



points(x = -.9, y = -.3, pch = 21, cex = 1.8, bg = '#00000066', col = '#000000', lwd = 3.5)
text(x = -.75, y = -.3, cex = 1.1, labels = 'Mean simulation value', adj = c(0,.5))
points(x = -.9, y = -.5, pch = 20, col = '#52657c99', cex = 2, bg = '#52657c99')
text(x = -.75, y = -.5, cex = 1.1, labels = 'Individual simulations', adj = c(0,.5))



dev.off()
