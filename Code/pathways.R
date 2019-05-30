# source('./code/pathways.R')
library(graphicsutils)

png('./figures/pathways.png', width = 1000, height = 1280, res = 300, pointsize = 6)
par(mar = c(1,1,2,1))
plot0(xlim = c(0,10), ylim = c(-1,13.25))
abline(v = c(2,3,4,7)+.5, lty = 2)
abline(h = c(0,3,5,7,10,13), lty = 2)

# Names
nmR <- c('Tri-trophic\nchain','Omnivory','Exploitative \ncompetition',
        'Apparent \ncompetition','Partially \nconnected','Disconnected')
nmC <- c('Positions', 'Direct', 'Indirect', 'Direct & indirect')
yR <- c(0,3,5,7,10,13)-.2
xC <- c(3,4,6,9)
text(x = -.2, y = yR, labels = rev(nmR), adj = c(0,1), cex = .75)
text(x = xC, y = 13.35, labels = nmC, adj = c(.5,.5), cex = .75)
mtext('Pathways of effect', side = 3, adj = c(.5,.5), line = .5, at = 7)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
#                               Tri-trophic chain                              #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Tritrophic chains
posY <- c(.2,.5,.8)
posX <- c(0,0,0)
pos <- data.frame(x = c(2,3,3,3,4,4,4,5,5,5,6,6,6,7,7,7,8,8,8,9,9,9,10,10,10),
                  y = c(2,rep(0:2, 8)))

for(i in 1:nrow(pos)) {
  position <- pos$y[i] + 1
  Y <- posY+pos$y[i]+10
  X <- posX+pos$x[i]
  polygon(x = X, y = Y)
  points(x = X, y = Y, pch = 21, col = '#777777', bg = '#f4f4f4', cex = .8)
  if(i > 1) points(x = X[position], y = Y[position], pch = 21, col = '#00000000', bg = '#000000', cex = .8)
  if(pos$x[i] %in% c(4,8,9,10)) points(x = X[position], y = Y[position], pch = 1, col = '#de3636', cex = 1) # Direct
  if(pos$x[i] %in% c(5,7,8,10)) points(x = rep(X,2)[position+2], y = rep(Y,2)[position+2], pch = 1, col = '#de3636', cex = 1) # Indirect 1
  if(pos$x[i] %in% c(6,7,9,10)) points(x = rep(X,2)[position+1], y = rep(Y,2)[position+1], pch = 1, col = '#de3636', cex = 1) # Indirect 2
}


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
#                                     Omnivory                                 #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Omnivory
posY <- c(.2,.55,.8)
posX <- c(.2,-.2,.2)
pos <- data.frame(x = c(2,3,3,3,4,4,4,5,5,5,6,6,6,7,7,7,8,8,8,9,9,9,10,10,10),
                  y = c(2,rep(0:2, 8)))

for(i in 1:nrow(pos)) {
  Y <- posY+pos$y[i]+7
  X <- posX+pos$x[i]
  position <- pos$y[i] + 1
  polygon(x = X, y = Y, border = '#505353')
  points(x = X, y = Y, pch = 21, col = '#777777', bg = '#f4f4f4', cex = .8)
  if(i > 1) points(x = X[position], y = Y[position], pch = 21, col = '#00000000', bg = '#000000', cex = .8)
  if(pos$x[i] %in% c(4,8,9,10)) points(x = X[position], y = Y[position], pch = 1, col = '#de3636', cex = 1) # Direct
  if(pos$x[i] %in% c(5,7,8,10)) points(x = rep(X,2)[position+2], y = rep(Y,2)[position+2], pch = 1, col = '#de3636', cex = 1) # Indirect 1
  if(pos$x[i] %in% c(6,7,9,10)) points(x = rep(X,2)[position+1], y = rep(Y,2)[position+1], pch = 1, col = '#de3636', cex = 1) # Indirect 2
}


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
#                           Exploitative competition                           #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Exploitative competition
posY <- c(.75,.25,.75)
posX <- c(-.2,0,.2)
pos <- data.frame(x = c(2,3,3,4,4,5,5,6,7,7,8,8,9,9,10,10),
                  y = c(1,rep(0:1,3), 0, rep(0:1,4)))

for(i in 1:nrow(pos)) {
  Y <- posY+pos$y[i]+5
  X <- posX+pos$x[i]
  position <- pos$y[i] + 1
  lines(x = X, y = Y, col = '#505353')
  points(x = X, y = Y, pch = 21, col = '#777777', bg = '#f4f4f4', cex = .8)
  if(i > 1) points(x = X[position], y = Y[position], pch = 21, col = '#00000000', bg = '#000000', cex = .8)
  if(pos$x[i] %in% c(4,8,9,10)) points(x = X[position], y = Y[position], pch = 1, col = '#de3636', cex = 1) # Direct
  if(pos$x[i] %in% c(5,7,8,10)) points(x = rep(X,2)[position+2], y = rep(Y,2)[position+2], pch = 1, col = '#de3636', cex = 1) # Indirect 1
  if(pos$x[i] %in% c(6,7,9,10)) points(x = rep(X,2)[position+1], y = rep(Y,2)[position+1], pch = 1, col = '#de3636', cex = 1) # Indirect 2
}


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
#                             Apparent competition                             #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Apparent competition
posY <- c(.25,.75,.25)
posX <- c(-.2,0,.2)
pos <- data.frame(x = c(2,3,3,4,4,5,5,6,7,7,8,8,9,9,10,10),
                  y = c(1,rep(0:1,3), 0, rep(0:1,4)))

for(i in 1:nrow(pos)) {
  Y <- posY+pos$y[i]+3
  X <- posX+pos$x[i]
  position <- pos$y[i] + 1
  lines(x = X, y = Y, col = '#505353')
  points(x = X, y = Y, pch = 21, col = '#777777', bg = '#f4f4f4', cex = .8)
  if(i > 1) points(x = X[position], y = Y[position], pch = 21, col = '#00000000', bg = '#000000', cex = .8)
  if(pos$x[i] %in% c(4,8,9,10)) points(x = X[position], y = Y[position], pch = 1, col = '#de3636', cex = 1) # Direct
  if(pos$x[i] %in% c(5,7,8,10)) points(x = rep(X,2)[position+2], y = rep(Y,2)[position+2], pch = 1, col = '#de3636', cex = 1) # Indirect 1
  if(pos$x[i] %in% c(6,7,9,10)) points(x = rep(X,2)[position+1], y = rep(Y,2)[position+1], pch = 1, col = '#de3636', cex = 1) # Indirect 2
}


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
#                             Partially connected                              #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Partially connected
posY <- c(.2,.5,.8)
posX <- c(0,0,0)
pos <- data.frame(x = c(2,3,3,4,4,5,8),
                  y = c(1,rep(0:1,2),1,1))
pos <- data.frame(x = c(2,3,3,3,4,4,4,5,5,8,8),
                  y = c(2,rep(0:2,2),1,2,1,2))

for(i in 1:nrow(pos)) {
  Y <- posY+pos$y[i]
  X <- posX+pos$x[i]
  position <- pos$y[i] + 1
  lines(x = X[2:3], y = Y[2:3])
  points(x = X, y = Y, pch = 21, col = '#777777', bg = '#f4f4f4', cex = .8)
  if(i > 1) points(x = X[position], y = Y[position], pch = 21, col = '#00000000', bg = '#000000', cex = .8)
  if(pos$x[i] %in% c(4,8,9,10)) points(x = X[position], y = Y[position], pch = 1, col = '#de3636', cex = 1) # Direct
  if(pos$x[i] %in% c(5,8) & pos$y[i] %in% 1) points(x = rep(X,2)[position+1], y = rep(Y,2)[position+1], pch = 1, col = '#de3636', cex = 1) # Indirect 1
  if(pos$x[i] %in% c(5,8) & pos$y[i] %in% 2) points(x = rep(X,2)[position+2], y = rep(Y,2)[position+2], pch = 1, col = '#de3636', cex = 1) # Indirect 1

}


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
#                                   Disconnected                               #
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Disconnected
posY <- c(.2,.5,.8)
posX <- c(0,0,0)
pos <- data.frame(x = c(2,3,4),
                  y = c(0,0,0))

for(i in 1:nrow(pos)) {
  Y <- posY+pos$y[i]-1
  X <- posX+pos$x[i]
  position <- pos$y[i] + 1
  points(x = X, y = Y, pch = 21, col = '#777777', bg = '#f4f4f4', cex = .8)
  if(i > 1) points(x = X[position], y = Y[position], pch = 21, col = '#00000000', bg = '#000000', cex = .8)
  if(pos$x[i] %in% c(4,8,9,10)) points(x = X[position], y = Y[position], pch = 1, col = '#de3636', cex = 1) # Direct
  if(pos$x[i] %in% c(5,7,8,10)) points(x = rep(X,2)[position+2], y = rep(Y,2)[position+2], pch = 1, col = '#de3636', cex = 1) # Indirect 1
  if(pos$x[i] %in% c(6,7,9,10)) points(x = rep(X,2)[position+1], y = rep(Y,2)[position+1], pch = 1, col = '#de3636', cex = 1) # Indirect 2
}
dev.off()
