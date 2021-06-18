# source('./Code/Figures/FR1-FoodWeb.R')
source('./Code/0-Param.R')

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


# Colors
colP <- c('#a86262cc','#a84d4d44')
colB <- c('#097373cc','#196f6f44')
colM <- c('#c2851acc','#db9f3844')
# vars
cx_title <- 1.1
lwdD <- .75




# png('./Figures/FR1-FoodWeb.png', res = 900, width = 175, height = 120, units = "mm")
pdf('./Figures/Figure_1.pdf', width = 6.89, height = 4.72, pointsize = 12)

# Layout
mat <- matrix(1:2, ncol = 2)
layout(mat, widths = c(1,.75))

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 1
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
par(mar = c(0, 0, 0, 1), family = 'serif')
plot0(x = c(-.7, .7), y = c(-.7, 1.5))
text(x = -.65, 1.45, labels = 'A)', adj = c(0,.5), cex = .8)

# Emphasis
# circles(.5, .64, .17, lwd = 1)
# polygon(x = c(-.175,-.175,.7,.7), y = c(1.1,-.05,-.05,1.1), col = '#00000000', border = colP[1], lty = 2, lwd = lwdD)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Food web
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Interactions
lines(x = c(0, 0), y = c(.15,.85)) # bel to cap
lines(x = c(-.1, -.4), y = c(.1,.4)) # hump to cap
lines(x = c(.1, .4), y = c(.1,.52)) # cod to cap
lines(x = c(.1, .4), y = c(.9325,.7275)) # bel to cod
lines(x = c(.045, .2375), y = c(-.1,-.52)) # cap to cop
lines(x = c(-.045, -.2375), y = c(-.1,-.52)) # cap to kri
lines(x = c(-.4725, -.325), y = c(.36,-.52)) # hump to kri

# Pathways of effect
# lines(x = c(-.4,-.31), y = c(1.3,-.52), col = colP[2], lty = 4) # SST to kri
lines(x = c(-.4, .25), y = c(1.3,-.52), col = '#00000066', lty = 4) # SST to cop
lines(x = c(0, 0), y = c(1.3,1.1), col = '#00000066', lty = 4) # SHP to bew
lines(x = c(0, -.41), y = c(1.3,.6), col = '#00000066', lty = 4) # SHP to hump
lines(x = c(.4, .485), y = c(1.3,.75), col = '#00000066', lty = 4) # FISH to cod
lines(x = c(.4, .03), y = c(1.3,.1), col = '#00000066', lty = 4) # FISH to cap
lines(x = c(.4, -.41), y = c(1.3,.6), col = '#00000066', lty = 4) # FISH to hump



# Species
cxy <- .6
pchImage(x = -.51, .5, obj = hump, cex.x = 2.2, cex.y = cxy+.1, col = colsPos[1])
pchImage(x = .01, 1, obj = bew, cex.x = 2, cex.y = cxy, col = colsPos[1])
pchImage(x = .5, .66, obj = cod, cex.x = 1.55, cex.y = cxy, col = colsPos[1])
pchImage(x = 0, .04, obj = cap, cex.x = 1.25, cex.y = cxy, col = colsPos[1])
pchImage(x = -.3, -.66, obj = kri, cex.x = .85, cex.y = cxy-.1, col = colsPos[1])
pchImage(x = .3, -.66, obj = cop, cex.x = .7, cex.y = cxy, col = colsPos[1])


# Drivers
pchImage(x = -.4, 1.45, obj = SST, cex.x = .8, cex.y = .65, col = '#00000099')
pchImage(x = 0, 1.45, obj = Shipping, cex.x = .8, cex.y = .6, col = '#00000099')
pchImage(x = .4, 1.45, obj = DD, cex.x = .8, cex.y = .6, col = '#00000099')



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot 2
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
sc <- .7
par(mar = c(0, 0, 0, 0), family = 'serif')
plot0(x = c(-1.3,1.5), y = c(-1,1))

# # Text
text(x = -1.3, y = .8, labels = 'Stressor effect', adj = c(0,.5), cex = .8)
text(x = 0, y = .8, labels = 'Trophic interaction', adj = c(0,.5), cex = .8)
lines(x = c(-1.3, -1), y = c(.7,.7), col = '#00000066', lty = 4, lwd = 1.5)
lines(x = c(0, .3), y = c(.7,.7), col = '#000000', lwd = 1.5)
# arrows(-.425, 1.025, -.35, 1.1, length = .025, code = 2, xpd = TRUE)


# Direct effects
y <- .3
text(x = -1.3, y = y+.2, labels = 'B) Direct effects', adj = c(0,.5), cex = .8)
pchImage(x = -1.2, y = y, obj = DD, cex.x = .8*sc, cex.y = .6*sc, col = '#00000099')
pchImage(x = -.4, y = y, obj = cod, cex.x = 1.55*sc, cex.y = cxy*sc, col = colsPos[1])
pchImage(x = .4, y = y, obj = cap, cex.x = 1.25*sc, cex.y = cxy*sc, col = colsPos[1])
pchImage(x = 1.2, y = y, obj = kri, cex.x = .85*sc, cex.y = (cxy-.1)*sc, col = colsPos[1])
l <- data.frame(x1 = c(-1,-.2,.6), x2 = c(-.65,.2,1), y = c(y,y,y))
lines(x = l[1,1:2], y = l[1,c(3,3)], col = '#00000066', lty = 4)
lines(x = l[2,1:2], y = l[2,c(3,3)], col = '#000000')
lines(x = l[3,1:2], y = l[3,c(3,3)], col = '#000000')

# Indirect effects
y <- y-.5
text(x = -1.3, y = y+.2, labels = 'C) Indirect effects', adj = c(0,.5), cex = .8)
pchImage(x = -1.2, y = y, obj = DD, cex.x = .8*sc, cex.y = .6*sc, col = '#00000099')
pchImage(x = -.4, y = y, obj = cod, cex.x = 1.55*sc, cex.y = cxy*sc, col = colsPos[1])
pchImage(x = .4, y = y, obj = cap, cex.x = 1.25*sc, cex.y = cxy*sc, col = colsPos[1])
pchImage(x = 1.2, y = y, obj = kri, cex.x = .85*sc, cex.y = (cxy-.1)*sc, col = colsPos[1])
xspline(x = c(-1.2, -.4, .4), y = c(y-.075,y-.125,y-.075), shape = -1, draw = TRUE, border = '#00000066', lty = 4)
xspline(x = c(-1.2, 0, 1.2), y = c(y+.075,y+.175,y+.075), shape = 1, draw = TRUE, border = '#00000066', lty = 4)
xspline(x = c(-.4, .4, 1.2), y = c(y-.075,y-.125,y-.075), shape = -1, draw = TRUE, border = '#000000')


# Net effects
y <- y-.5
text(x = -1.3, y = y+.2, labels = 'D) Net effects', adj = c(0,.5), cex = .8)
pchImage(x = -1.2, y = y, obj = DD, cex.x = .8*sc, cex.y = .6*sc, col = '#00000099')
pchImage(x = -.4, y = y, obj = cod, cex.x = 1.55*sc, cex.y = cxy*sc, col = colsPos[1])
pchImage(x = .4, y = y, obj = cap, cex.x = 1.25*sc, cex.y = cxy*sc, col = colsPos[1])
pchImage(x = 1.2, y = y, obj = kri, cex.x = .85*sc, cex.y = (cxy-.1)*sc, col = colsPos[1])
xspline(x = c(-1.2, -.4, .4), y = c(y-.075,y-.125,y-.075), shape = -1, draw = TRUE, border = '#00000066', lty = 4)
xspline(x = c(-1.2, 0, 1.2), y = c(y+.075,y+.175,y+.075), shape = 1, draw = TRUE, border = '#00000066', lty = 4)
xspline(x = c(-.4, .4, 1.2), y = c(y-.075,y-.125,y-.075), shape = -1, draw = TRUE, border = '#000000')
l <- data.frame(x1 = c(-1,-.2,.6), x2 = c(-.65,.2,1), y = c(y,y,y))
lines(x = l[1,1:2], y = l[1,c(3,3)], col = '#00000066', lty = 4)
lines(x = l[2,1:2], y = l[2,c(3,3)], col = '#000000')
lines(x = l[3,1:2], y = l[3,c(3,3)], col = '#000000')



# lines(x = l[1,1:2], y = l[1,c(3,3)], col = '#00000066', lty = 4)
# lines(x = l[2,1:2], y = l[2,c(3,3)], col = '#000000')
# lines(x = l[3,1:2], y = l[3,c(3,3)], col = '#000000')


dev.off()
