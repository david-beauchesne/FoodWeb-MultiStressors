# source('./code/pathways.R')
library(graphicsutils)
library(latex2exp)

png('./figures/pathways.png', width = 1280, height = 1280, res = 300, pointsize = 6)
par(mar = c(1,1,2,1))
plot0(xlim = c(0,15), ylim = c(-1,13.25))
abline(v = c(2,3,4,7,10)+.5, lty = 2)
abline(h = c(0,3,5,7,10,13), lty = 2)

# Names
nmR <- c('Tri-trophic\nchain','Omnivory','Exploitative \ncompetition',
        'Apparent \ncompetition','Partially \nconnected','Disconnected')
nmC <- c('Direct', 'Indirect', 'Direct & indirect')
yR <- c(0,3,5,7,10,13)-.2
xC <- c(4,6,9)
text(x = -.2, y = yR, labels = rev(nmR), adj = c(0,1), cex = .75)
text(x = xC, y = 13.35, labels = nmC, adj = c(.5,.5), cex = .75)
mtext('Pathways of effect', side = 3, adj = c(.5,.5), line = .5, at = 7)
mtext('Equation systems', side = 3, adj = c(.5,.5), line = .5, at = 13)
mtext('Motifs', side = 3, adj = c(.5,.5), line = .5, at = 1)
mtext('Positions', side = 3, adj = c(.5,.5), line = .5, at = 3)


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

# Equations
text(x = 11, y = 12.5, labels = TeX('$\\frac{dP}{dt} = \\alpha_{CP} CP - m_P P$'), adj = c(0, .5), cex = .7)
text(x = 11, y = 11.5, labels = TeX('$\\frac{dC}{dt} = \\alpha_{RC} RC - \\alpha_{CP} CP - m_C C$'), adj = c(0, .5), cex = .7)
text(x = 11, y = 10.5, labels = TeX('$\\frac{dR}{dt} = r_RR(1-R/K_R) - \\alpha_{RC} RC$'), adj = c(0, .5), cex = .7)


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

# Equations
text(x = 11, y = 9.5, labels = TeX('$\\frac{dP}{dt} = \\alpha_{RP} RP + \\alpha_{CP} CP - m_P P$'), adj = c(0, .5), cex = .7)
text(x = 11, y = 8.5, labels = TeX('$\\frac{dC}{dt} = \\alpha_{RC} RC - \\alpha_{CP} CP - m_C C$'), adj = c(0, .5), cex = .7)
text(x = 11, y = 7.5, labels = TeX('$\\frac{dR}{dt} = r_RR(1-R/K_R) - \\alpha_{RC} RC - \\alpha_{RP} RP$'), adj = c(0, .5), cex = .7)



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

# Equations
text(x = 11, y = 6.5, labels = TeX('$\\frac{dR}{dt} = r_RR(1-R/K_R) - \\alpha_{RC_1} RC_1 - \\alpha_{RC_1} RC_2$'), adj = c(0, .5), cex = .7)
text(x = 11, y = 5.5, labels = TeX('$\\frac{dC_{1|2}}{dt} = \\alpha_{RC_{1|2}} RC_{1|2} - m_{C_{1|2}} C_{1|2}$'), adj = c(0, .5), cex = .7)


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

# Equations
text(x = 11, y = 4.5, labels = TeX('$\\frac{dC}{dt} = \\alpha_{R_1C} R_1C + \\alpha_{R_2C} R_2C - m_{C} C$'), adj = c(0, .5), cex = .7)
text(x = 11, y = 3.5, labels = TeX('$\\frac{dR_{1|2}}{dt} = r_{R_{1|2}}R_{1|2}(1-R_{1|2}/K_{1|2}) - \\alpha_{R_{1|2}C} R_{1|2}C$'), adj = c(0, .5), cex = .7)


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

# Equations
text(x = 11, y = 2.5, labels = TeX('$\\frac{dC}{dt} = \\alpha_{RC} RC - m_{C} C$'), adj = c(0, .5), cex = .7)
text(x = 11, y = 1.5, labels = TeX('$\\frac{dR}{dt} = r_RR(1-R/K_R) - \\alpha_{RC} RC$'), adj = c(0, .5), cex = .7)
text(x = 11, y = 0.5, labels = TeX('$\\frac{dS}{dt} = r_SS(1-S/K_S)$'), adj = c(0, .5), cex = .7)


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

# Equation
text(x = 11, y = -.5, labels = TeX('$\\frac{dS_{1|2|3}}{dt} = r_{S_{1|2|3}}S_{1|2|3}(1-S_{1|2|3}/K_{S_{1|2|3}})$'), adj = c(0, .5), cex = .7)

dev.off()
