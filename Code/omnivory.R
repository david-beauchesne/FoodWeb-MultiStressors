  # source('./code/omnivory.R')
library(graphicsutils)

png('./figures/omnivory.png', width = 400, height = 200, res = 200, pointsize = 6)
par(mar = c(0,0,0,0))
plot0(xlim = c(-1,3), ylim = c(0,1.25))


# Stressors
# Species
Y <- c(.2,.6,.8)
X <- c(.65,-.15,.85)

# Stressors
sY <- c(.15, .85)
sX <- c(-.85, -.85)

# Lines
polygon(x = X, y = Y, border = '#505353', lwd = .8)
for(i in 1:3) lines(x = c(X[i], sX[1]), y = c(Y[i], sY[1]), lty = 3, lwd = .8, col = '#c92f2f77')
for(i in 1:3) lines(x = c(X[i], sX[2]), y = c(Y[i], sY[2]), lty = 3, lwd = .8, col = '#c92f2f77')

# Points
points(x = X, y = Y, pch = 21, col = '#777777', bg = '#f4f4f4', cex = 3)
points(x = sX, y = sY, pch = 21, col = '#c92f2f', bg = '#f4f4f4', cex = 3)

# Text
text(x = X, y = Y, adj = c(.5,.5), labels = c('i','j','k'), cex = .8, font = 3)
text(x = sX, y = sY, adj = c(.5,.5), labels = c('S1', 'S2'), cex = .8, font = 3)
text(x = 0, y = 1.15, adj = c(.5,.5), labels = 'Stressors', cex = 1, font = 2)

# Disturbances
# Species
Y <- c(.2,.6,.8)
X <- c(2.35,1.55,2.55)

# Disturbances
dY <- c(.15, .85, .55)
dX <- c(1.75, 1.35, 2.9)

# Lines
polygon(x = X, y = Y, border = '#505353', lwd = .8)
for(i in 1:3) lines(x = c(X[i], dX[i]), y = c(Y[i], dY[i]), lty = 3, lwd = .8, col = '#c92f2f77')

# Points
points(x = X, y = Y, pch = 21, col = '#777777', bg = '#f4f4f4', cex = 3)
points(x = dX, y = dY, pch = 21, col = '#c92f2f', bg = '#f4f4f4', cex = 3)

# Text
text(x = X, y = Y, adj = c(.5,.5), labels = c('i','j','k'), cex = .8, font = 3)
text(x = dX, y = dY, adj = c(.5,.5), labels = c('D', 'D', 'D'), cex = .8, font = 3)
text(x = 2, y = 1.15, adj = c(.5,.5), labels = 'Disturbances', cex = 1, font = 2)


dev.off()
