# source('./Code/Figures/FR6-Variance.R')
source('./Code/0-Param.R')
source('./Code/Functions/plotMotifs.R')
load('./Data/vulnerability.RData')

# ------------------------------------------------------------------------------
# FIGURE 2
# ------------------------------------------------------------------------------
# Parameters
mot <- c('ttz','tty','ttx','omz','omy','omx','exz','exx','apz','apx','pay','pax','paz','dix')
pos <- c('om','ap','tt','ex','pa','di')
colsMotif <- colsPos[c(1,2,3,4,5,5)]
xR <- c(0,.01)
yR <- c(0,10)

# png('./Figures/FR6-Variance.png', width = 1500, height = 1000, res = 200, pointsize = 12)
pdf('./Figures/Figure_6.pdf', width = 5.9*1.25, height = 3.94*1.25, pointsize = 12)
par(mfrow = c(3,2), mar = c(4,4,1,1), family = 'serif')

titleX <- function() {
  mtext(text = TeX('\\textbf{Trophic variance} ($\\textit{V_{m,G}}$)'), side = 1, line = 2.5, cex = .8)
}
titleY <- function() {
  mtext(text = TeX('\\textbf{log(Density + 1)}'), side = 2, line = 2, cex = .8)
}


# ------------------------------------------------------------------------------
# Omnivory
# ------------------------------------------------------------------------------
pos <- c('omx','omy','omz')
l <- list()

for(i in 1:3) {
  # Parameters
  uid <- vulnerability$Position == pos[i] & vulnerability$nParam > 1
  dat <- vulnerability[uid, ]

  # Density
  l[[i]] <- density(dat$Variance, from = 0, to = .01)
  l[[i]]$y <- log(l[[i]]$y+1)
}

# yR <- c(0,max(c(l[[1]]$y,l[[2]]$y,l[[3]]$y))) # Not reproducible

plot0(x = xR, y = yR)
axis(1, cex.axis = .9)
axis(2, cex.axis = .9)
titleY()

for(i in 1:3) {
  lines(x = l[[i]]$x, y = l[[i]]$y, lwd = 1.25, col = colsMotif[1], lty = i)
}

# Legend
x <- c('x','y','z')
p <- c(.006,.0075,.009)
lr <- .0003
for(i in 1:length(x)) {
plotMotifs(motif = 'om', position = x[i], x = p[i], y = 9,
           scalingX = .0006, scalingY = 1.1,
           posCol = colsMotif[1], colLine = '#afacac',
           cex = 1, lwd2 = 3, lwd = .75, add = TRUE)
lines(x = c(p[i]-lr,p[i]+lr), y = c(6.5,6.5), col = colsMotif[1], lty = i, lwd = 1.5)
}


# ------------------------------------------------------------------------------
# Apparent competition
# ------------------------------------------------------------------------------
pos <- c('apx','apz')
l <- list()

for(i in 1:length(pos)) {
  # Parameters
  uid <- vulnerability$Position == pos[i] & vulnerability$nParam > 1
  dat <- vulnerability[uid, ]

  # Density
  l[[i]] <- density(dat$Variance, from = 0, to = .01)
  l[[i]]$y <- log(l[[i]]$y+1)
}

# yR <- c(0,max(c(l[[1]]$y,l[[2]]$y))) # Not reproducible
par(mar = c(4,4,1,1), family = 'serif')
plot0(x = xR, y = yR)
axis(1, cex.axis = .9)
axis(2, cex.axis = .9)

for(i in 1:length(pos)) {
  lines(x = l[[i]]$x, y = l[[i]]$y, lwd = 1.25, col = colsMotif[2], lty = i)
}

# Legend
x <- c('x','z')
p <- c(.0075,.009)
lr <- .0003
for(i in 1:length(x)) {
plotMotifs(motif = 'ap', position = x[i], x = p[i], y = 9,
           scalingX = .0006, scalingY = 1.1,
           posCol = colsMotif[2], colLine = '#afacac',
           cex = 1, lwd2 = 3, lwd = .75, add = TRUE)
lines(x = c(p[i]-lr,p[i]+lr), y = c(6.5,6.5), col = colsMotif[2], lty = i, lwd = 1.5)
}

# ------------------------------------------------------------------------------
# Apparent competition
# ------------------------------------------------------------------------------
pos <- c('ttx','tty','ttz')
l <- list()

for(i in 1:length(pos)) {
  # Parameters
  uid <- vulnerability$Position == pos[i] & vulnerability$nParam > 1
  dat <- vulnerability[uid, ]

  # Density
  l[[i]] <- density(dat$Variance, from = 0, to = .01)
  l[[i]]$y <- log(l[[i]]$y+1)
}

# yR <- c(0,max(c(l[[1]]$y,l[[2]]$y,l[[3]]$y))) # Not reproducible
par(mar = c(4,4,1,1), family = 'serif')
plot0(x = xR, y = yR)
axis(1, cex.axis = .9)
axis(2, cex.axis = .9)
titleY()

for(i in 1:length(pos)) {
  lines(x = l[[i]]$x, y = l[[i]]$y, lwd = 1.25, col = colsMotif[3], lty = i)
}

# Legend
x <- c('x','y','z')
p <- c(.006,.0075,.009)
lr <- .0003
for(i in 1:length(x)) {
plotMotifs(motif = 'tt', position = x[i], x = p[i], y = 9,
           scalingX = .0006, scalingY = 1.1,
           posCol = colsMotif[3], colLine = '#afacac',
           cex = 1, lwd2 = 3, lwd = .75, add = TRUE)
lines(x = c(p[i]-lr,p[i]+lr), y = c(6.5,6.5), col = colsMotif[3], lty = i, lwd = 1.5)
}

# ------------------------------------------------------------------------------
# Exploitative competition
# ------------------------------------------------------------------------------
pos <- c('exx','exz')
l <- list()

for(i in 1:length(pos)) {
  # Parameters
  uid <- vulnerability$Position == pos[i] & vulnerability$nParam > 1
  dat <- vulnerability[uid, ]

  # Density
  l[[i]] <- density(dat$Variance, from = 0, to = .01)
  l[[i]]$y <- log(l[[i]]$y+1)
}

# yR <- c(0,max(c(l[[1]]$y,l[[2]]$y))) # Not reproducible
par(mar = c(4,4,1,1), family = 'serif')
plot0(x = xR, y = yR)
axis(1, cex.axis = .9)
axis(2, cex.axis = .9)

for(i in 1:length(pos)) {
  lines(x = l[[i]]$x, y = l[[i]]$y, lwd = 1.25, col = colsMotif[4], lty = i)
}

# Legend
x <- c('x','z')
p <- c(.0075,.009)
lr <- .0003
for(i in 1:length(x)) {
plotMotifs(motif = 'ex', position = x[i], x = p[i], y = 9,
           scalingX = .0006, scalingY = 1.1,
           posCol = colsMotif[4], colLine = '#afacac',
           cex = 1, lwd2 = 3, lwd = .75, add = TRUE)
lines(x = c(p[i]-lr,p[i]+lr), y = c(6.5,6.5), col = colsMotif[4], lty = i, lwd = 1.5)
}


# ------------------------------------------------------------------------------
# Partial
# ------------------------------------------------------------------------------
pos <- c('pax','pay','paz')
l <- list()

for(i in 1:length(pos)) {
  # Parameters
  uid <- vulnerability$Position == pos[i] & vulnerability$nParam > 1
  dat <- vulnerability[uid, ]

  # Density
  l[[i]] <- density(dat$Variance, from = 0, to = .01)
  l[[i]]$y <- log(l[[i]]$y+1)
}

# yR <- c(0,max(c(l[[1]]$y,l[[2]]$y,l[[3]]$y))) # Not reproducible
par(mar = c(4,4,1,1), family = 'serif')
plot0(x = xR, y = yR)
axis(1, cex.axis = .9)
axis(2, cex.axis = .9)
titleY()
titleX()

for(i in 1:length(pos)) {
  lines(x = l[[i]]$x, y = l[[i]]$y, lwd = 1.25, col = colsMotif[5], lty = i)
}

# Legend
x <- c('x','y','z')
p <- c(.006,.0075,.009)
lr <- .0003
for(i in 1:length(x)) {
plotMotifs(motif = 'pa', position = x[i], x = p[i], y = 9,
           scalingX = .0006, scalingY = 1.1,
           posCol = colsMotif[5], colLine = '#afacac',
           cex = 1, lwd2 = 3, lwd = .75, add = TRUE)
lines(x = c(p[i]-lr,p[i]+lr), y = c(6.5,6.5), col = colsMotif[5], lty = i, lwd = 1.5)
}

# ------------------------------------------------------------------------------
# Dix
# ------------------------------------------------------------------------------
pos <- c('dix')
l <- list()

for(i in 1:length(pos)) {
  # Parameters
  uid <- vulnerability$Position == pos[i] & vulnerability$nParam > 1
  dat <- vulnerability[uid, ]

  # Density
  l[[i]] <- density(dat$Variance, from = 0, to = .01)
  l[[i]]$y <- log(l[[i]]$y+1)
}

# yR <- c(0,max(l[[1]]$y)) # Not reproducible
par(mar = c(4,4,1,1), family = 'serif')
plot0(x = xR, y = yR)
axis(1, cex.axis = .9)
axis(2, cex.axis = .9)
titleX()

for(i in 1:length(pos)) {
  lines(x = l[[i]]$x, y = l[[i]]$y, lwd = 1.25, col = colsMotif[5], lty = i)
}

# Legend
x <- c('x')
p <- c(.009)
lr <- .0003
for(i in 1:length(x)) {
plotMotifs(motif = 'di', position = x[i], x = p[i], y = 9,
           scalingX = .0006, scalingY = 1.1,
           posCol = colsMotif[5], colLine = '#afacac',
           cex = 1, lwd2 = 3, lwd = .75, add = TRUE)
lines(x = c(p[i]-lr,p[i]+lr), y = c(6.5,6.5), col = colsMotif[5], lty = i, lwd = 1.5)
}

dev.off()
