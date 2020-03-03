# source('./Code/12-Concept2.R')
# Libraries
library(graphicsutils)
library(latex2exp)
library(tidyverse)
library(deSolve)

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
# Layout
mat <- matrix(0, 7, 5)
mat[cbind(3:5,2)] <- 4
mat[6,2] <- 5
mat[3,3] <- 6
mat[4,3] <- 7
mat[5,3] <- 8
mat[6,3] <- 9
mat[3,4] <- 10
mat[4:6,4] <- 11
mat[2,2] <- 1
mat[2,3] <- 2
mat[2,4] <- 3


# Colors
colP <- c('#a84d4dcc','#a84d4d44')
colB <- c('#196f6fcc','#196f6f44')
colM <- c('#db9f38cc','#db9f3844')
# vars
cx_title <- 1.1




png('./Figures/Concept.png', res = 900, width = 180, height = 100, units = "mm")

# Layout
layout(mat, widths = c(.05, 1, 1, 1, .05), heights = c(.15, .35, 1, 1, 1, 1, .15))
# layout.show(10)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Titles
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
par(mar = c(0, 0, 0, 0), family = 'serif')
plot0()
text(x = -1, y = 1, adj = c(0,1), labels = "A) A gateway through\n      ecological communities", cex = cx_title, font = 2)

par(mar = c(0, 0, 0, 0), family = 'serif')
plot0()
text(x = -1, y = 1, adj = c(0,1), labels = "B) Dynamic impacts of\n      multiple stressors", cex = cx_title, font = 2)

par(mar = c(0, 0, 0, 0), family = 'serif')
plot0()
text(x = -1, y = 1, adj = c(0,1), labels = "C) Species motif profile", cex = cx_title, font = 2)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 1
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
par(mar = c(0, 0, 0, 1), family = 'serif')
plot0(x = c(-.7, .7), y = c(-.75, 1.7))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Food web
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Interactions
lines(x = c(0, 0), y = c(.15,.85), col = colB[1]) # bel to cap
lines(x = c(-.1, -.4), y = c(.1,.4), col = colB[1]) # hump to cap
lines(x = c(.1, .4), y = c(.1,.52)) # cod to cap
lines(x = c(.1, .4), y = c(.9325,.7275), col = colB[1]) # bel to cod
lines(x = c(.045, .2375), y = c(-.1,-.52), col = colP[1]) # cap to cop
lines(x = c(-.045, -.2375), y = c(-.1,-.52)) # cap to kri
lines(x = c(-.4725, -.325), y = c(.36,-.52), col = colB[1]) # hump to kri

# Pathways of effect
# lines(x = c(-.4,-.31), y = c(1.3,-.52), col = colP[2], lty = 4) # SST to kri
lines(x = c(-.4, .25), y = c(1.3,-.52), col = '#00000044', lty = 4) # SST to cop
lines(x = c(0, 0), y = c(1.3,1.1), col = '#00000044', lty = 4) # SHP to bew
lines(x = c(0, -.41), y = c(1.3,.6), col = '#00000044', lty = 4) # SHP to hump
lines(x = c(.4, .485), y = c(1.3,.75), col = '#00000044', lty = 4) # FISH to cod
lines(x = c(.4, .03), y = c(1.3,.1), col = '#00000044', lty = 4) # FISH to cap

# Species
cxy <- .6
pchImage(x = -.51, .5, obj = hump, cex.x = 2.2, cex.y = cxy+.1, col = colB[1])
pchImage(x = .01, 1, obj = bew, cex.x = 2, cex.y = cxy, col = colB[1])
pchImage(x = .5, .66, obj = cod, cex.x = 1.55, cex.y = cxy, col = colM[1])
pchImage(x = 0, .04, obj = cap, cex.x = 1.25, cex.y = cxy, col = colM[1])
pchImage(x = -.3, -.66, obj = kri, cex.x = .85, cex.y = cxy-.1)#, col = colP[1])
pchImage(x = .3, -.66, obj = cop, cex.x = .7, cex.y = cxy, col = colP[1])


# Drivers
pchImage(x = -.4, 1.45, obj = SST, cex.x = .8, cex.y = .65)#, col = colP[1])
pchImage(x = 0, 1.45, obj = Shipping, cex.x = .8, cex.y = .6)#, col = colB[1])
pchImage(x = .4, 1.45, obj = DD, cex.x = .8, cex.y = .6)#, col = colM[1])

# Emphasis
circles(.5, .64, .17, lwd = 1)

# Text
text(x = -.65, y = 1, labels = 'Stressor\nexposure', adj = c(0,.5), cex = .75)
arrows(-.425, 1.025, -.35, 1.1, length = .025, code = 2, xpd = TRUE)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Legend
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
plot0(y = c(-.8,1.2))
text(x = -1, y = 1, adj = c(0,1), labels = "Pathways of effect", font = 2)
pchImage(x = -.9, .37, obj = cap, cex.x = .8, cex.y = 1, col = colM[1])
pchImage(x = -.9, 0, obj = cap, cex.x = .8, cex.y = 1, col = colP[1])
pchImage(x = -.9, -.37, obj = cap, cex.x = .8, cex.y = 1, col = colB[1])
lines(x = c(0,.15), y = c(.37, .37), col = colB[1], lwd = 1.2)
lines(x = c(0,.15), y = c(0,0), col = colP[1], lwd = 1.2)
text(x = rep(-.7, 3), y = c(.37,0,-.37), adj = c(0,.5),
     labels = c('Mortality','Physiology','Behaviour'))
text(x = rep(.25, 2), y = c(.37,0), adj = c(0,.5),
     labels = c('Attack rate','Conversion rate'))


# legend("left", c('Attack rate', 'Conversion rate'), lty = c(1, 1), col = c(colB[1], colP[1]), bty = 'n', lwd = 1.2, title = 'Pathways of effect')
# legend("right", c('Mortality','Physiology','Behaviour'), col = rep(NA, 3), bty = 'n', seg.len = 3)



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Disturbances & dynamics
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #

# load('./Data/ParamInit/omParam.RData')
# omParam <- as.data.frame(omParam)
# uid = 88
lwdD <- .75

# # initial state
# init <- c(x = omParam$x[uid],
#           y = omParam$y[uid],
#           z = omParam$z[uid])
# initial state
init <- c(x = 497.6478,
          y = 259.8222,
          z = 155.5680)

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

# # Parameters
# p <- c(r = 1.02,
#    alpha = 0.0009,
#     beta = omParam$beta[uid],
#    delta = omParam$delta[uid],
#    gamma = omParam$gamma[uid],
#       mu = .5,
#       nu = .5,
#    omega = .5,
#      m_y = omParam$m_y[uid],
#      m_z = omParam$m_z[uid])
# Parameters
p <- c(r = 1.0200000000,
   alpha = 0.0009000000,
    beta = 0.0017214390,
   delta = 0.0026447249,
   gamma = 0.0003540844,
      mu = 0.5000000000,
      nu = 0.5000000000,
   omega = 0.5000000000,
     m_y = 0.0169005008,
     m_z = 0.4316837251)

plotDynamic <- function() {
  plot0(x = c(-3.5,60), y = c(-60,625))
  arrows(-2, 0, 59, 0, length = .05, code = 2, xpd = TRUE)
  arrows(-2, 0, -2, 600, length = .05, code = 2, xpd = TRUE)
  lines(x = c(5,5), y = c(-25,600), lty = 2, col = '#00000088')
  lines(x = c(5,5), y = c(-25,0), col = '#000000')
  text(x = 56, y = -15, adj = c(1,1), 'Time', cex = .75)
  text(x = -3, y = 275, adj = c(.5,0), 'Abundance', cex = .75, srt = 90)
  text(x = 6, y = -42, adj = c(0,1), 'Stressors', cex = .55)
  for(i in 1:3) lines(x = c(0,5), y = rep(init[i], 2), col = '#000000', lwd = .75)
  arrows(6, -25, 10, -25, length = .025, code = 2, xpd = TRUE)
}

# Disturbances 1
p1 <- p
p1['r'] <- p1['r']*.8
# Solve system of equations
res1 <- ode(init, times, deriv, p1)

# Disturbances 2
p2 <- p
p2['m_y'] <- p2['m_y']*1.15
# Solve system of equations
res2 <- ode(init, times, deriv, p2)

# Disturbances 3
p3 <- p
p3['gamma'] <- p3['gamma']*.75
p3['delta'] <- p3['delta']*.8
# Solve system of equations
res3 <- ode(init, times, deriv, p3)

# Disturbances 4
p4 <- p
p4['r'] <- p4['r']*.8
p4['m_y'] <- p4['m_y']*1.15
p4['gamma'] <- p4['gamma']*.75
p4['delta'] <- p4['delta']*.8
# Solve system of equations
res4 <- ode(init, times, deriv, p4)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 2
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
par(mar = c(.5, .5, 0, 0))
plotDynamic()
box2(side = '234', which = 'figure', lty = 2, col = colP[1], lwd = lwdD)

# Delta abundances
lines(x = c(5,55), y = rep(init['x'],2), lty = 4, col = '#000000aa', lwd = lwdD)
xI <- init['x']
xE <- res1[50,'x']
xM <- mean(c(xI,xE))
arrows(55, xM+(xI-xM)*.35, 55, xI-8.5, length = .025, code = 2, xpd = TRUE, lwd = lwdD)
arrows(55, xM-(xI-xM)*.35, 55, xE+8.5, length = .025, code = 2, xpd = TRUE, lwd = lwdD)
text(x = 55, y = xM, adj = c(.5,.5), labels = TeX('Sensitivity'), cex = .55)
# text(x = 55, y = xM, adj = c(.5,.5), labels = TeX('$\\Delta a$'), cex = .55)

# Disturbances
arrows(8, 550, 5.5, 520, length = .025, code = 2, xpd = TRUE)
pchImage(x = 10, xI+60, obj = DD, cex.x = .4, cex.y = 1)#, col = colB[1])


# Population dynamics
for (i in 2:4) lines(x = c(5:55), y = res1[,i], lwd = lwdD)
pchImage(x = 1.5, 110, obj = bew, cex.x = .8, cex.y = 1)
pchImage(x = 1.5, 220, obj = cod, cex.x = .7, cex.y = .9)
pchImage(x = 1.5, 460, obj = cap, cex.x = .5, cex.y = .9, col = colM[1])


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 3
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot
par(mar = c(.5, .5, 0, 0))
plotDynamic()
box2(side = '24', which = 'figure', lty = 2, col = colP[1], lwd = lwdD)

# Disturbances
arrows(8, 320, 5.5, 280, length = .025, code = 2, xpd = TRUE)
pchImage(x = 10, 335, obj = DD, cex.x = .4, cex.y = 1)#, col = colB[1])

for (i in 2:4) lines(x = c(5:55), y = res2[,i], lwd = lwdD)
pchImage(x = 1.5, 110, obj = bew, cex.x = .8, cex.y = 1)
pchImage(x = 1.5, 220, obj = cod, cex.x = .7, cex.y = .9, col = colM[1])
pchImage(x = 1.5, 460, obj = cap, cex.x = .5, cex.y = .9)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 4
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot
par(mar = c(.5, .5, 0, 0))
plotDynamic()
box2(side = '24', which = 'figure', lty = 2, col = colP[1], lwd = lwdD)

# Disturbances
arrows(8, 215, 5.5, 175, length = .025, code = 2, xpd = TRUE)
pchImage(x = 10, 230, obj = Shipping, cex.x = .4, cex.y = 1)#, col = colB[1])

for (i in 2:4) lines(x = c(5:55), y = res3[,i], lwd = lwdD)
pchImage(x = 1.5, 110, obj = bew, cex.x = .8, cex.y = 1, col = colB[1])
pchImage(x = 1.5, 220, obj = cod, cex.x = .7, cex.y = .9)
pchImage(x = 1.5, 460, obj = cap, cex.x = .5, cex.y = .9)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 5
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot
par(mar = c(.5, .5, 0, 0))
plotDynamic()
box2(side = '124', which = 'figure', lty = 2, col = colP[1], lwd = lwdD)

# Disturbances
# Capelin
arrows(8, 550, 5.5, 520, length = .025, code = 2, xpd = TRUE)
pchImage(x = 10, xI+60, obj = DD, cex.x = .4, cex.y = 1)#, col = colB[1])

# Cod
arrows(8, 225, 5.5, 245, length = .025, code = 2, xpd = TRUE)
pchImage(x = 10, 235, obj = DD, cex.x = .4, cex.y = 1)#, col = colB[1])

# Cod
arrows(8, 75, 5.5, 125, length = .025, code = 2, xpd = TRUE)
pchImage(x = 10, 60, obj = Shipping, cex.x = .4, cex.y = 1)#, col = colB[1])

# Pathways of effect
lines(x = c(51,55), y = rep(xI+45,2), lwd = lwdD)
lines(x = c(51,55), y = rep(xI-20,2), lty = 3, lwd = lwdD)
text(x = 50, y = xI+50, adj = c(1,.5), labels = 'Integrative pathway of effect', cex = .55)
text(x = 50, y = xI-15, adj = c(1,.5), labels = 'Additive pathway of effect', cex = .55)


# # Additive
# pchImage(x = 10, xI-15, obj = DD, cex.x = .4, cex.y = 1)#, col = colB[1])
# pchImage(x = 15, xI-15, obj = Shipping, cex.x = .4, cex.y = 1)#, col = colB[1])
# text(x = 12.65, y = xI-15, adj = c(.5,.5), labels = '+', cex = .95)


# Enveloppes
envelop(x = 5:55, upper = init['x']-((init['x']-res1[,'x'])+(init['x']-res2[,'x'])+(init['x']-res3[,'x'])), lower = res4[,'x'], col = '#00000022', border = '#00000000')
envelop(x = 5:55, upper = init['y']-((init['y']-res1[,'y'])+(init['y']-res2[,'y'])+(init['y']-res3[,'y'])), lower = res4[,'y'], col = '#00000022', border = '#00000000')
envelop(x = 5:55, upper = init['z']-((init['z']-res1[,'z'])+(init['z']-res2[,'z'])+(init['z']-res3[,'z'])), lower = res4[,'z'], col = '#00000022', border = '#00000000')

# Joint model
lines(x = c(5:55), y = res4[,'x'], lwd = lwdD)
lines(x = c(5:55), y = res4[,'y'], lwd = lwdD)
lines(x = c(5:55), y = res4[,'z'], lwd = lwdD)
pchImage(x = 1.5, 110, obj = bew, cex.x = .8, cex.y = 1, col = colB[1])
pchImage(x = 1.5, 220, obj = cod, cex.x = .7, cex.y = .9, col = colM[1])
pchImage(x = 1.5, 460, obj = cap, cex.x = .5, cex.y = .9, col = colM[1])

# Additive model
lines(x = c(5:55), y = init['x']-((init['x']-res1[,'x'])+(init['x']-res2[,'x'])+(init['x']-res3[,'x'])), lwd = .4, lty = 3)
lines(x = c(5:55), y = init['y']-((init['y']-res1[,'y'])+(init['y']-res2[,'y'])+(init['y']-res3[,'y'])), lwd = .4, lty = 3)
lines(x = c(5:55), y = init['z']-((init['z']-res1[,'z'])+(init['z']-res2[,'z'])+(init['z']-res3[,'z'])), lwd = .4, lty = 3)

# Non-additive
xI <- init['x']-((init['x']-res1[,'x'])+(init['x']-res2[,'x'])+(init['x']-res3[,'x']))[50]
xE <- res4[50,'x']
xM <- mean(c(xI,xE))
text(x = 54, y = xM, labels = 'Amplification', cex = .55, adj = c(1,.5))
# text(x = 54, y = xM, labels = 'Synergy', cex = .55, adj = c(1,.5))


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Motifs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
par(mar = c(0, 0, 0, 0))
plot0(x = c(-.85, .85), y = c(-2.1, -1))
# polygon(x = c(.3,.3,.7,.7), c(.52,.80,.80,.52), lty = 2)

# polygon(x = c(-.8,-.8,.8,.8), c(-1,-1.8,-1.8,-1), lty = 2)

# Motif 1
cxy1 <- .9
# text(-.6, -.95, labels = "Motifs involving", cex = 2.8)
# pchImage(x = -.4, -.9, obj = cod, cex.x = .7, cex.y = cxy1, col = colM[1])
lines(x = c(-.5725, -.6575), y = c(-1.6, -1.225), col = colB[1], lwd = lwdD)
lines(x = c(-.5275, -.4475), y = c(-1.6, -1.225), lwd = lwdD)
pchImage(x = -.68, -1.125, obj = hump, cex.x = .8, cex.y = cxy1, col = colB[1])
pchImage(x = -.42, -1.1, obj = cod, cex.x = .8, cex.y = cxy1, col = colM[1])
circles(-.42, -1.1, .08)
pchImage(x = -.55, -1.7, obj = cap, cex.x = .6, cex.y = cxy1, col = colM[1])

# Motif 2
lines(x = c(-.15, -.15), y = c(-1.2, -1.3), lwd = lwdD)
lines(x = c(-.15, -.15), y = c(-1.5, -1.6), lwd = lwdD)
pchImage(x = -.15, -1.1, obj = cod, cex.x = .8, cex.y = cxy1, col = colM[1])
circles(-.15, -1.1, .08, lwd = lwdD)
pchImage(x = -.15, -1.4, obj = cap, cex.x = .8, cex.y = cxy1, col = colM[1])
pchImage(x = -.15, -1.7, obj = kri, cex.x = .5, cex.y = cxy1)#, col = colP[1])

# Motif 3
lines(x = c(.15, .15), y = c(-1.2, -1.3), lwd = lwdD)
lines(x = c(.15, .15), y = c(-1.5, -1.6), col = colP[1], lwd = lwdD)
pchImage(x = .15, -1.1, obj = cod, cex.x = .8, cex.y = 1, col = colM[1])
circles(.15, -1.1, .08, lwd = lwdD)
pchImage(x = .15, -1.4, obj = cap, cex.x = .8, cex.y = 1, col = colM[1])
pchImage(x = .15, -1.7, obj = cop, cex.x = .6, cex.y = 1, col = colP[1])

# Motif 4
lines(x = c(.45, .45), y = c(-1.2, -1.6), col = colB[1], lwd = lwdD)
lines(x = c(.51, .6), y = c(-1.17, -1.27), col = colB[1], lwd = lwdD)
lines(x = c(.6075, .4875), y = c(-1.41, -1.63), lwd = lwdD)
pchImage(x = .45, -1.1, obj = bew, cex.x = .8, cex.y = 1, col = colB[1])
pchImage(x = .65, -1.33, obj = cod, cex.x = .8, cex.y = 1, col = colM[1])
circles(.65, -1.33, .08, lwd = lwdD)
pchImage(x = .45, -1.7, obj = cap, cex.x = .6, cex.y = 1, col = colM[1])

# Emphasis
polygon(x = c(.35,.35,.75,.75), y = c(-1.77,-1.025,-1.025,-1.77), col = '#00000000', border = colP[1], lty = 2, lwd = lwdD)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Species
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
par(mar = c(0, 0, 0, 0))
plot0()
text(x = -1, y = 1, adj = c(0,0), labels = "D) Scaling back to species \n      in complex food webs", cex = cx_title, font = 2)

dev.off()
