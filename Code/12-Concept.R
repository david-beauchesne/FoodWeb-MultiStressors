# source('./Code/12-Concept.R')
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
mat <- matrix(0, 6, 4)
mat[cbind(2:4,2)] <- 1
mat[5,2] <- 2
mat[2,3] <- 6
mat[3,3] <- 3
mat[4,3] <- 4
mat[5,3] <- 5
colP <- c('#a84d4dcc','#a84d4d44')
colB <- c('#196f6fcc','#196f6f44')
colM <- c('#db9f38cc','#db9f3844')
# vars
cx_title <- 1.2




png('./Figures/Concept.png', res = 900, width = 120, height = 100, units = "mm")

# Layout
layout(mat, widths = c(.05, 1, 1,.05), heights = c(.15, 1.4, 1, 1, 1, .15))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 1
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
par(mar = c(0, 0, 0, 1), family = 'serif')
plot0(x = c(-.62, .82), y = c(-.75, 1.9))
text(x = -.64, y = 1.82, labels = "A) Network", pos = 4, cex = cx_title, font = 2)

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



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Legend
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
plot0()
legend("left", c('Attack rate', 'Conversion rate','Stressor exposure'), lty = c(1, 1, 2), col = c(colB[1], colP[1], '#00000044'), bty = 'n', lwd = 1.2)
legend("right", c('Mortality','Physiology','Behaviour'), col = rep(NA, 3), bty = 'n', seg.len = 3)
pchImage(x = .4, .37, obj = cap, cex.x = .8, cex.y = 1, col = colM[1])
pchImage(x = .4, 0, obj = cap, cex.x = .8, cex.y = 1, col = colP[1])
pchImage(x = .4, -.37, obj = cap, cex.x = .8, cex.y = 1, col = colB[1])



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
  plot0(x = c(-3.5,60), y = c(-60,550))
  arrows(-2, 0, 59, 0, length = .05, code = 2, xpd = TRUE)
  arrows(-2, 0, -2, 550, length = .05, code = 2, xpd = TRUE)
  lines(x = c(5,5), y = c(-25,575), lty = 2, col = '#00000088')
  lines(x = c(5,5), y = c(-25,0), col = '#000000')
  text(x = 56, y = -15, adj = c(1,1), 'Time', cex = .75)
  text(x = -3, y = 275, adj = c(.5,0), 'Abundance (a)', cex = .75, srt = 90)
  text(x = 6, y = -15, adj = c(0,1), 'Disturbances', cex = .55)
  for(i in 1:3) lines(x = c(0,5), y = rep(init[i], 2), col = '#000000', lwd = .75)
  arrows(8, 540, 5.5, 530, length = .025, code = 2, xpd = TRUE)
  arrows(6, 20, 10, 20, length = .025, code = 2, xpd = TRUE)
}

# Disturbances 1
p1 <- p
p1['r'] <- p1['r']*.8
p1['m_y'] <- p1['m_y']*1.15

# Solve system of equations
res1 <- ode(init, times, deriv, p1)

# Disturbances
p2 <- p
p2['gamma'] <- p2['gamma']*.75
p2['delta'] <- p2['delta']*.8

# Solve system of equations
res2 <- ode(init, times, deriv, p2)

# Disturbances
p3 <- p
p3['r'] <- p3['r']*.8
p3['m_y'] <- p3['m_y']*1.15
p3['gamma'] <- p3['gamma']*.75
p3['delta'] <- p3['delta']*.8

# Solve system of equations
res3 <- ode(init, times, deriv, p3)

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
pchImage(x = 10, xI+50, obj = DD, cex.x = .4, cex.y = 1)#, col = colB[1])


# Population dynamics
for (i in 2:4) lines(x = c(5:55), y = res1[,i], lwd = lwdD)
pchImage(x = 1.5, 110, obj = bew, cex.x = .8, cex.y = 1)
pchImage(x = 1.5, 220, obj = cod, cex.x = .7, cex.y = .9, col = colM[1])
pchImage(x = 1.5, 460, obj = cap, cex.x = .5, cex.y = .9, col = colM[1])


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 3
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot
par(mar = c(.5, .5, 0, 0))
plotDynamic()
box2(side = '24', which = 'figure', lty = 2, col = colP[1], lwd = lwdD)

# Disturbances
pchImage(x = 10, xI+50, obj = Shipping, cex.x = .4, cex.y = 1)#, col = colB[1])

for (i in 2:4) lines(x = c(5:55), y = res2[,i], lwd = lwdD)
pchImage(x = 1.5, 110, obj = bew, cex.x = .8, cex.y = 1, col = colB[1])
pchImage(x = 1.5, 220, obj = cod, cex.x = .7, cex.y = .9)
pchImage(x = 1.5, 460, obj = cap, cex.x = .5, cex.y = .9)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 4
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot
par(mar = c(.5, .5, 0, 0))
plotDynamic()
box2(side = '124', which = 'figure', lty = 2, col = colP[1], lwd = lwdD)

# Disturbances
#Joint
pchImage(x = 10, xI+50, obj = DD, cex.x = .4, cex.y = 1)#, col = colB[1])
pchImage(x = 15, xI+50, obj = Shipping, cex.x = .4, cex.y = 1)#, col = colB[1])
lines(x = c(18,23), y = rep(xI+45,2), lwd = lwdD)
text(x = 26, y = xI+50, adj = c(0,.5), labels = 'Full model', cex = .55)
# Additive
pchImage(x = 10, xI-15, obj = DD, cex.x = .4, cex.y = 1)#, col = colB[1])
pchImage(x = 15, xI-15, obj = Shipping, cex.x = .4, cex.y = 1)#, col = colB[1])
text(x = 12.65, y = xI-15, adj = c(.5,.5), labels = '+', cex = .95)
lines(x = c(18,23), y = rep(xI-20,2), lty = 3, lwd = lwdD)
text(x = 26, y = xI-15, adj = c(0,.5), labels = 'Additive model', cex = .55)


# Enveloppes
envelop(x = 5:55, upper = init['x']-((init['x']-res1[,'x'])+(init['x']-res2[,'x'])), lower = res3[,'x'], col = '#00000022', border = '#00000000')
envelop(x = 5:55, upper = init['y']-((init['y']-res1[,'y'])+(init['y']-res2[,'y'])), lower = res3[,'y'], col = '#00000022', border = '#00000000')
envelop(x = 5:55, upper = init['z']-((init['z']-res1[,'z'])+(init['z']-res2[,'z'])), lower = res3[,'z'], col = '#00000022', border = '#00000000')

# Joint model
lines(x = c(5:55), y = res3[,'x'], lwd = lwdD)
lines(x = c(5:55), y = res3[,'y'], lwd = lwdD)
lines(x = c(5:55), y = res3[,'z'], lwd = lwdD)
pchImage(x = 1.5, 110, obj = bew, cex.x = .8, cex.y = 1, col = colB[1])
pchImage(x = 1.5, 220, obj = cod, cex.x = .7, cex.y = .9, col = colM[1])
pchImage(x = 1.5, 460, obj = cap, cex.x = .5, cex.y = .9, col = colM[1])

# Additive model
lines(x = c(5:55), y = init['x']-((init['x']-res1[,'x'])+(init['x']-res2[,'x'])), lwd = .4, lty = 3)
lines(x = c(5:55), y = init['y']-((init['y']-res1[,'y'])+(init['y']-res2[,'y'])), lwd = .4, lty = 3)
lines(x = c(5:55), y = init['z']-((init['z']-res1[,'z'])+(init['z']-res2[,'z'])), lwd = .4, lty = 3)

# Non-additive
xI <- init['x']-((init['x']-res1[,'x'])+(init['x']-res2[,'x']))[50]
xE <- res3[50,'x']
xM <- mean(c(xI,xE))
text(x = 54, y = xM, labels = 'Amplification', cex = .55, adj = c(1,.5))
# text(x = 54, y = xM, labels = 'Synergy', cex = .55, adj = c(1,.5))


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Motifs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
par(mar = c(0, 0, 0, 0))
plot0(x = c(-.75, .8), y = c(-2.1, -.8))
text(x = -.75, y = -.9, labels = "B) Motifs", pos = 4, cex = cx_title, font = 2)
text(x = -.75, y = -2.05, labels = "C) Dynamics", pos = 4, cex = cx_title, font = 2)
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



dev.off()
