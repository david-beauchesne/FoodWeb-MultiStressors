# source('./Code/14-Concept.R')
# Libraries
library(graphicsutils)
library(latex2exp)

# ----------------------------------------------------------------------
# Species
# ----------------------------------------------------------------------
# Humpback whale - Megaptera novaeangliae
# by Chris huh
# http://phylopic.org/image/ce70490a-79a5-47fc-afb9-834e45803ab4/
# License https://creativecommons.org/licenses/by-sa/3.0/
hump <- png::readPNG('./img/PhyloPic.ce70490a.Chris-huh.Balaenoptera-novaeangliae.png', native = T)

# Beluga whale - Delphinapterus leucas
# by Xavier Giroux-Bougard
# http://phylopic.org/image/f1367ab1-40cf-4e9a-a84b-37508f11a7c7/
bew <- png::readPNG('./img/PhyloPic.f1367ab1.Xavier-Giroux-Bougard.Delphinapterus_Delphinapterus-leucas_Monodontidae.png', native = T)

# Atlantic cod - Gadus morhua
# Milton Tan
# http://phylopic.org/image/bba1800a-dd86-451d-a79b-c5944cfe5231/
cod <- png::readPNG('./img/PhyloPic.bba1800a.Milton-Tan.Gadariae_Gadidae_Gadiformes_Gadinae_Gadus_Gadus-morhua_Zeiogadaria.png', native = T)

# Capelin - Mallotus villosus
# by xgirouxb
# http://phylopic.org/image/f1f91d08-b850-4600-ad64-622ce87f0199/
cap <- png::readPNG('./img/PhyloPic.f1f91d08.xgirouxb.Osmeridae_Osmeriformes_Osmerinae_Osmerini_Osmeroidea_Osmeroidei_Thaleichthys_Thaleichthys-pacificus.png', native = T)

# Krill - Meganyctiphanes norvegica
# by Steven Haddock • Jellywatch.org
# http://phylopic.org/image/44a3628d-aafd-45cc-97a6-1cb74bd43dec/
kri <- png::readPNG('./img/PhyloPic.44a3628d.Steven-Haddock-Jellywatch-org.Copepoda-Malacostraca_Eucarida_Eumalacostraca_Euphausiacea_Euphausiidae_Malacostraca.png', native = T)

# Copepoda
# by Joanna Wolfe
# http://phylopic.org/image/c5dbd85a-c4be-4990-a369-c830ad23cb22/
cop <- png::readPNG('./img/PhyloPic.c5dbd85a.Joanna-Wolfe.Calanoida_Copepoda_Epacteriscidae_Erebonectes_Gymnoplea_Neocopepoda.png', native = T)
cop[cop == 16777216] <-0
# ----------------------------------------------------------------------
# Drivers
# ----------------------------------------------------------------------
SST <- png::readPNG('./img/SST.png', native = T) # modified from https://fontawesome.com/icons/thermometer-full?style=solid
Shipping <- png::readPNG('./img/ship-solid.png', native = T) # https://fontawesome.com/icons/ship?style=solid
DD <- png::readPNG('./img/trawl.png', native = T)

# ----------------------------------------------------------------------
# Figure
# ----------------------------------------------------------------------
png('./Figures/Concept.png', res = 900, width = 120, height = 95, units = "mm")
# Layout
mat <- matrix(0, nrow = 5, ncol = 4)
mat[,2] <- 1
mat[2,3] <- 2
mat[3,3] <- 3
mat[4,3] <- 4
layout(mat, widths = c(.1,1,.66,.1), height = c(.6,1,1,1,.6))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 1
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
par(mar = c(0,0,0,0), family = 'serif')
plot0(x = c(-.75,.8), y = c(-1.8,1.55))
# abline(v=0,lty=2,col = '#00000044')
# abline(h=0,lty=2,col = '#00000044')
# lines(x = c(-.55,.55), y = rep(1.3, 2), lty = 2, col = '#00000099')
colP <- c('#a84d4dcc','#a84d4d44')
colB <- c('#196f6fcc','#196f6f44')
colM <- c('#db9f38cc','#db9f3844')

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Food web
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Interactions
lines(x = c(0,0), y = c(.15,.85), col = colB[1]) # bel to cap
lines(x = c(-.1,-.4), y = c(.1,.4), col = colB[1]) # hump to cap
lines(x = c(.1,.4), y = c(.1,.52)) # cod to cap
lines(x = c(.1,.4), y = c(.9325,.7275), col = colB[1]) # bel to cod
lines(x = c(.045,.2375), y = c(-.1,-.52), col = colP[1]) # cap to cop
lines(x = c(-.045,-.2375), y = c(-.1,-.52)) # cap to kri
lines(x = c(-.4725,-.325), y = c(.36,-.52), col = colB[1]) # hump to kri

# Pathways of effect
# lines(x = c(-.4,-.31), y = c(1.3,-.52), col = colP[2], lty = 4) # SST to kri
lines(x = c(-.4,.25), y = c(1.3,-.52), col = colP[2], lty = 4) # SST to cop
lines(x = c(0,0), y = c(1.3,1.1), col = colB[2], lty = 4) # SHP to bew
lines(x = c(0,-.435), y = c(1.3,.6), col = colB[2], lty = 4) # SHP to hump
lines(x = c(.4,.485), y = c(1.3,.75), col = colM[2], lty = 4) # FISH to cod
lines(x = c(.4,.03), y = c(1.3,.1), col = colM[2], lty = 4) # FISH to cap

# Species
pchImage(x = -.5, .5, obj = hump, cex.x = 1.4, cex.y = .55, col = colB[1])
pchImage(x = 0, 1, obj = bew, cex.x = 1.3, cex.y = .5, col = colB[1])
pchImage(x = .5, .66, obj = cod, cex.x = 1.2, cex.y = .4, col = colM[1])
pchImage(x = 0, 0, obj = cap, cex.x = .85, cex.y = .4, col = colM[1])
pchImage(x = -.3, -.66, obj = kri, cex.x = .75, cex.y = .35)#, col = colP[1])
pchImage(x = .3, -.66, obj = cop, cex.x = .65, cex.y = .5, col = colP[1])

# Drivers
pchImage(x = -.4, 1.45, obj = SST, cex.x = .5, cex.y = .55)#, col = colP[1])
pchImage(x = 0, 1.45, obj = Shipping, cex.x = .7, cex.y = .5)#, col = colB[1])
pchImage(x = .4, 1.45, obj = DD, cex.x = .75, cex.y = .45)#, col = colM[1])

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Motifs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
polygon(x = c(.3,.3,.7,.7), c(.52,.80,.80,.52), lty = 2)
polygon(x = c(-.8,-.8,.8,.8), c(-1,-1.8,-1.8,-1), lty = 2)

# Motif 1
lines(x = c(-.5725, -.6575), y = c(-1.6, -1.225), col = colB[1])
lines(x = c(-.5275, -.4475), y = c(-1.6, -1.225))
pchImage(x = -.68, -1.125, obj = hump, cex.x = .77, cex.y = .32, col = colB[1])
pchImage(x = -.42, -1.1, obj = cod, cex.x = .7, cex.y = .25, col = colM[1])
pchImage(x = -.55, -1.7, obj = cap, cex.x = .55, cex.y = .25)#, col = colM[1])

# Motif 2
lines(x = c(-.15, -.15), y = c(-1.2, -1.3))
lines(x = c(-.15, -.15), y = c(-1.5, -1.6))
pchImage(x = -.15, -1.1, obj = cod, cex.x = .7, cex.y = .25, col = colM[1])
pchImage(x = -.15, -1.4, obj = cap, cex.x = .55, cex.y = .25, col = colM[1])
pchImage(x = -.15, -1.7, obj = kri, cex.x = .45, cex.y = .2)#, col = colP[1])

# Motif 3
lines(x = c(.15, .15), y = c(-1.2, -1.3))
lines(x = c(.15, .15), y = c(-1.5, -1.6), col = colP[1])
pchImage(x = .15, -1.1, obj = cod, cex.x = .7, cex.y = .25, col = colM[1])
pchImage(x = .15, -1.4, obj = cap, cex.x = .55, cex.y = .25, col = colM[1])
pchImage(x = .15, -1.7, obj = cop, cex.x = .45, cex.y = .25, col = colP[1])

# Motif 4
lines(x = c(.45, .45), y = c(-1.2, -1.6), col = colB[1])
lines(x = c(.51, .6), y = c(-1.17, -1.27), col = colB[1])
lines(x = c(.6075, .4875), y = c(-1.41, -1.63))
pchImage(x = .45, -1.1, obj = bew, cex.x = .75, cex.y = .3, col = colB[1])
pchImage(x = .65, -1.33, obj = cod, cex.x = .7, cex.y = .25, col = colM[1])
pchImage(x = .45, -1.7, obj = cap, cex.x = .55, cex.y = .25, col = colM[1])

# Emphasis
polygon(x = c(.35,.35,.75,.75), y = c(-1.77,-1.025,-1.025,-1.77), col = '#00000000', border = colP[1], lty = 4)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Legend
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
posY <- c(1.2,1.075,.95)
text(x = rep(-.7,3), y = posY, adj = c(0,.5),
     labels = c('Mortality','Physiology','Behaviour'), cex = .65)
lines(x = c(-.8,-.725), y = rep(posY[1], 2), col = colM[1], lwd = 1.25)
lines(x = c(-.8,-.725), y = rep(posY[2], 2), col = colP[1], lwd = 1.25)
lines(x = c(-.8,-.725), y = rep(posY[3], 2), col = colB[1], lwd = 1.25)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Disturbances & dynamics
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
library(tidyverse)
library(deSolve)
load('./Data/ParamInit/omParam.RData')
omParam <- as.data.frame(omParam)
uid = 88

# initial state
init <- c(x = omParam$x[uid],
          y = omParam$y[uid],
          z = omParam$z[uid])

# times
times <- seq(0, 50, by = 1)

deriv <- function(t, state, pars) {
  with(as.list(c(state, pars)), {
    dx <- x * (r - alpha*x - beta*y - gamma*z)
    dy <- y * (-m_y + mu*beta*x - delta*z)
    dz <- z * (-m_z + nu*gamma*x + omega*delta*y)
    return(list(c(x = dx, y = dy, z = dz)))
  })
}

# Parameters
p <- c(r = 1,
   alpha = 0.001,
    beta = omParam$beta[uid],
   delta = omParam$delta[uid],
   gamma = omParam$gamma[uid],
      mu = .5,
      nu = .5,
   omega = .5,
     m_y = omParam$m_y[uid],
     m_z = omParam$m_z[uid])

plotDynamic <- function() {
  plot0(x = c(-3.5,60), y = c(-60,550))
  arrows(-2, 0, 59, 0, length = .05, code = 2, xpd = TRUE)
  arrows(-2, 0, -2, 550, length = .05, code = 2, xpd = TRUE)
  lines(x = c(5,5), y = c(0,550), lty = 2, col = '#00000088')
  text(x = 30, y = -15, adj = c(.5,1), 'Time', cex = .75)
  text(x = -3, y = 275, adj = c(.5,0), 'Abundance (a)', cex = .75, srt = 90)
  for(i in 1:3) lines(x = c(0,5), y = rep(init[i], 2), col = '#000000', lwd = 1.25)
  # box(which = 'plot', lty = 4, col = colP[1])
}

# Disturbances 1
p1 <- p
p1['r'] <- p1['r']*.85
p1['m_y'] <- p1['m_y']*1.15

# Solve system of equations
res1 <- ode(init, times, deriv, p1)

# Disturbances
p2 <- p
p2['gamma'] <- p2['gamma']*.75
p2['delta'] <- p2['delta']*.75

# Solve system of equations
res2 <- ode(init, times, deriv, p2)

# Disturbances
p3 <- p
p3['r'] <- p3['r']*.85
p3['m_y'] <- p3['m_y']*1.15
p3['gamma'] <- p3['gamma']*.75
p3['delta'] <- p3['delta']*.75

# Solve system of equations
res3 <- ode(init, times, deriv, p3)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 2
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
par(mar = c(0,0,0,0))
plotDynamic()

# Delta abundances
lines(x = c(5,55), y = rep(init['x'],2), lty = 4, col = '#000000aa', lwd = .75)
xI <- init['x']
xE <- res1[50,'x']
xM <- mean(c(xI,xE))
arrows(55, xM+(xI-xM)*.35, 55, xI-8.5, length = .025, code = 2, xpd = TRUE)
arrows(55, xM-(xI-xM)*.35, 55, xE+8.5, length = .025, code = 2, xpd = TRUE)
text(x = 55, y = xM, adj = c(.5,.5), labels = TeX('$\\Delta a$'), cex = .55)

# Disturbances
arrows(8, xI+40, 5.5, xI+10, length = .025, code = 2, xpd = TRUE)
pchImage(x = 10, xI+50, obj = DD, cex.x = .4, cex.y = .75)#, col = colB[1])


# Population dynamics
lines(x = c(5:55), y = res1[,'x'], lwd = 1.25, col = colM[1])
lines(x = c(5:55), y = res1[,'y'], lwd = 1.25, col = colM[1])
lines(x = c(5:55), y = res1[,'z'], lwd = 1.25)
pchImage(x = 1.5, 110, obj = bew, cex.x = .8, cex.y = .9)
pchImage(x = 1.5, 300, obj = cod, cex.x = .7, cex.y = .8)
pchImage(x = 1.5, 460, obj = cap, cex.x = .5, cex.y = .7)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 3
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot
par(mar = c(0,0,0,0))
plotDynamic()

# Disturbances
arrows(8, xI+40, 5.5, xI+10, length = .025, code = 2, xpd = TRUE)
pchImage(x = 10, xI+50, obj = Shipping, cex.x = .4, cex.y = .75)#, col = colB[1])

lines(x = c(5:55), y = res2[,'x'], lwd = 1.25)
lines(x = c(5:55), y = res2[,'y'], lwd = 1.25)
lines(x = c(5:55), y = res2[,'z'], lwd = 1.25, col = colB[1])
pchImage(x = 1.5, 110, obj = bew, cex.x = .8, cex.y = .9)
pchImage(x = 1.5, 300, obj = cod, cex.x = .7, cex.y = .8)
pchImage(x = 1.5, 460, obj = cap, cex.x = .5, cex.y = .7)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 4
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot
par(mar = c(0,0,0,0))
plotDynamic()

# Disturbances
#Joint
arrows(8, xI+40, 5.5, xI+10, length = .025, code = 2, xpd = TRUE)
pchImage(x = 10, xI+50, obj = DD, cex.x = .4, cex.y = .75)#, col = colB[1])
pchImage(x = 15, xI+50, obj = Shipping, cex.x = .4, cex.y = .75)#, col = colB[1])
text(x = 11.75, y = xI+50, adj = c(.5,.5), labels = ',')
lines(x = c(17.5,22.5), y = rep(xI+45,2))
# Additive
pchImage(x = 10, xI-15, obj = DD, cex.x = .4, cex.y = .75)#, col = colB[1])
pchImage(x = 15, xI-15, obj = Shipping, cex.x = .4, cex.y = .75)#, col = colB[1])
text(x = 12.65, y = xI-15, adj = c(.5,.5), labels = '+', cex = .65)
lines(x = c(17.5,22.5), y = rep(xI-20,2), lty = 3)


# Joint model
lines(x = c(5:55), y = res3[,'x'], lwd = 1.25, col = colM[1])
lines(x = c(5:55), y = res3[,'y'], lwd = 1.25, col = colM[1])
lines(x = c(5:55), y = res3[,'z'], lwd = 1.25, col = colB[1])
pchImage(x = 1.5, 110, obj = bew, cex.x = .8, cex.y = .9)
pchImage(x = 1.5, 300, obj = cod, cex.x = .7, cex.y = .8)
pchImage(x = 1.5, 460, obj = cap, cex.x = .5, cex.y = .7)

# Additive model
lines(x = c(5:55), y = init['x']-((init['x']-res1[,'x'])+(init['x']-res2[,'x'])), lwd = 1, lty = 3, col = colM[1])
lines(x = c(5:55), y = init['y']-((init['y']-res1[,'y'])+(init['y']-res2[,'y'])), lwd = 1, lty = 3, col = colM[1])
lines(x = c(5:55), y = init['z']-((init['z']-res1[,'z'])+(init['z']-res2[,'z'])), lwd = 1, lty = 3, col = colB[1])


dev.off()
