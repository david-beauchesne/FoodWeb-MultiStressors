# source('./Code/Figures/FR2-Pathways.R')
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

# Dynamics
source('./Code/Figures/FR2-DynamicsCode.R')

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





png('./Figures/FR2-Pathways.png', res = 900, width = 200, height = 120, units = "mm")
# Layout
# mat <- matrix(c(9:11,1,1,2,4,6,3,4,6,8,5,7,8,5,7,0), nrow = 3, ncol = 6)
mat <- matrix(0, nrow = 3, ncol = 9)
mat[1,] <- c(9,1,1,1,1,4,4,5,5)
mat[2,] <- c(10,1,1,1,1,6,6,7,7)
mat[3,] <- c(11,2,2,2,3,3,8,8,0)
# mat <- rbind(c(12,13,13,13,13,14,14,14,14),mat)
# layout(mat, widths = c(1,1,.5,.5,.5,.5))
layout(mat, widths = c(1,.25,.25,.25,.25,.5,.5,.5,.5))#, heights = c(.125,1,1,1))
# layout.show(11)

# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# Food web
# ------------------
# Plot 1
#
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
par(mar = c(2,.5,2,.5), family = 'serif')
plot0(x = c(-.7, .7), y = c(-.7, 1.5))
mtext(side = 3, at = -.65, text = 'A)', cex = .55)
# Emphasis
polygon(x = c(-.175,-.175,.7,.7), y = c(1.1,-.05,-.05,1.1), col = '#00000000', border = colsPos[3], lty = 2, lwd = lwdD)
polygon(x = c(-.5,-.5,.5,.5), y = c(0.15,-.76,-.76,0.15), col = '#00000000', border = colsPos[4], lty = 2, lwd = lwdD)

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
pchImage(x = -.51, .5, obj = hump, cex.x = 2.2, cex.y = cxy+.1, col = '#000000') #colsPos[1])
pchImage(x = .01, 1, obj = bew, cex.x = 2, cex.y = cxy, col = '#000000') #colsPos[1])
pchImage(x = .5, .66, obj = cod, cex.x = 1.55, cex.y = cxy, col = '#000000') #colsPos[1])
pchImage(x = 0, .04, obj = cap, cex.x = 1.25, cex.y = cxy, col = '#000000') #colsPos[1])
pchImage(x = -.3, -.66, obj = kri, cex.x = .85, cex.y = cxy-.1, col = '#000000') #colsPos[1])
pchImage(x = .3, -.66, obj = cop, cex.x = .7, cex.y = cxy, col = '#000000') #colsPos[1])


# Drivers
pchImage(x = -.4, 1.45, obj = SST, cex.x = .8, cex.y = .65, col = '#00000099')
pchImage(x = 0, 1.45, obj = Shipping, cex.x = .8, cex.y = .6, col = '#00000099')
pchImage(x = .4, 1.45, obj = DD, cex.x = .8, cex.y = .6, col = '#00000099')


# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# Legends
# ------------------
# Plot 2 & 3
#
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# Apparent competition
# --------------------
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #

# Points
pt <- data.frame(x = c(-.4,.4,0), y = c(-1,-1,1))

# Lines
cn <- '#000000'
# l <- data.frame(x1 = c(-.4,.4), x2 = c(0,0),
#                 y1 = c(-1,-1), y2 = c(1,1),
#                 arrow = c(1,2),
#                 col = c(cn,cn))


l <- data.frame(x1 = c(-.35,-.42,.42,.35), x2 = c(-.05,-.12,.12,.05),
                y1 = c(-.8,-.8,-.8,-.8), y2 = c(.8,.8,.8,.8),
                arrow = c(2,1,1,2),
                col = c(cn,cn,cn,colsPos[4]))


txt <- data.frame(txt = c('$e_{\\textit{xz}}$','$\\alpha_{\\textit{xz}}$',
                          '$\\alpha_{\\textit{yz}}$','$e_{\\textit{yz}}$'),
                  x = (l$x1+l$x2)/2,
                  y = (l$y1+l$y2)/2,
                  adjX = c(.2,.8,.2,.8),
                  adjY = c(.5,.5,.5,.5),
                  col = c(cn,cn,cn,colsPos[4]),
                  stringsAsFactors = F)

txt2  <- data.frame(txt = c('$\\textit{r_x}$','$\\textit{r_y}','\\textit{m_z}'),
                    x = c(pt$x[1], pt$x[2], pt$x[3]),
                    y = c(pt$y[1]-.25, pt$y[2]-.25, pt$y[3]+.25),
                    col = c(cn,cn,colsPos[4]))

# Plotq
par(mar = c(0,1,1,1), family = 'serif')
plot0(x = c(-1,.6), y = c(-2.05,1.2))
text(x = -.95, 1.15, labels = 'B)', adj = c(0,.5), cex = .8)
text(x = c(-.25,-.25), y = c(-1.65,-1.95), adj = c(0,.5), cex = .75,
     labels = TeX(c('Mortality rate ($\\textit{m}$)', 'Growth rate ($\\textit{r}$)')))

# box(lty = 2, col = colsPos[3])
# Title
# text(x = -1, y = 1.6, labels = 'Pathways of effect', adj = c(0,.5))

# Arrows
for(i in 1:nrow(l)) arrows(l$x1[i], l$y1[i], l$x2[i], l$y2[i], length = .05, code = l$arrow[i], xpd = TRUE, lwd = 1, col = l$col[i])

# Positions
points(x = pt$x, y = pt$y, cex = 2, col = c(cn,colsPos[4],colsPos[4]), bg = '#bdbdbd', pch = 21, lwd = 1.25)

# Text
points(x = txt$x, y = txt$y, col = '#ffffff', bg = '#ffffff', pch = 21, lwd = 7)
text(x = pt$x, y = pt$y, labels = c('x','y','z'), adj = c(.5,.35), font = 4, cex = .85)
for(i in 1:nrow(txt)) text(x = txt$x[i], y = txt$y[i], labels = TeX(txt$txt[i]), adj = c(txt$adjX[i], txt$adjY[i]), cex = .75, col = txt$col[i])
text(x = txt2$x, y = txt2$y, labels = TeX(txt2$txt), adj = c(.5,.5), cex = .75, col = txt2$col)


# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# Omnivory
# --------------------
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# Points
pt <- data.frame(x = c(.35,-.35,.35),
                 y = c(-1,.3,1))

# Lines
cn <- '#000000'
l <- data.frame(x1 = c(-.24,  -0.285,   0.225, 0.26,  0.32,  0.38),
                x2 = c(.285,   0.2325, -0.26, -0.23,  0.32,  0.38),
                y1 = c(.15,    0.1,     .925,  0.86,  0.8,  0.8),
                y2 = c(-.825, -0.875,   0.44,  0.37, -0.8, -0.8),
                arrow = c(1,2,2,1,1,2),
                col = c(cn,cn,colsPos[3],cn,cn,colsPos[3]))

txt <- data.frame(txt = c('$e_{\\textit{xy}}$', '$\\alpha_{\\textit{xy}}$',
                          '$\\alpha_{\\textit{yz}}$', '$e_{\\textit{yz}}$',
                          '$e_{\\textit{xz}}$', '$\\alpha_{\\textit{xz}}$'),
                  x = (l$x1+l$x2)/2,
                  y = (l$y1+l$y2)/2,
                  adjX = c(.35,.65,.65,.2,.8,.2),
                  adjY = c(.4,.6,.3,.85,.5,.5),
                  col = c(cn,cn,colsPos[3],cn,cn,colsPos[3]),
                  stringsAsFactors = F)

txt2  <- data.frame(txt = c('$\\textit{r_x}$','$\\textit{m_y}','\\textit{m_z}'),
                    x = c(pt$x[1], pt$x[2]-.175, pt$x[3]),
                    y = c(pt$y[1]-.25, pt$y[2], pt$y[3]+.25),
                    col = c(colsPos[3],colsPos[3],cn))

# Plot
par(mar = c(0,1,1,1), family = 'serif')
plot0(x = c(-.6,1), y = c(-2.05,1.2))
mtext(side = 2, text = 'C)', at = 1.15, cex = .55, las = 2, line = .5)

# box(lty = 2, col = colsPos[3])
text(x = c(-.5,-.5), y = c(-1.65,-1.95), adj = c(0,.5), cex = .75,
     labels = TeX(c('Attack rate ($\\alpha$)','Conversion rate ($e$)')))


# Arrows
for(i in 1:nrow(l)) arrows(l$x1[i], l$y1[i], l$x2[i], l$y2[i], length = .05, code = l$arrow[i], xpd = TRUE, lwd = 1, col = l$col[i])

# Positions
points(x = pt$x, y = pt$y, cex = 2, col = colsPos[3], bg = '#bdbdbd', pch = 21, lwd = 1.25)

# Text
points(x = txt$x, y = txt$y, col = '#ffffff', bg = '#ffffff', pch = 21, lwd = 7)
text(x = pt$x, y = pt$y, labels = c('x','y','z'), adj = c(.5,.35), font = 4, cex = .85)
for(i in 1:nrow(txt)) text(x = txt$x[i], y = txt$y[i], labels = TeX(txt$txt[i]), adj = c(txt$adjX[i], txt$adjY[i]), cex = .75, col = txt$col[i])
text(x = txt2$x, y = txt2$y, labels = TeX(txt2$txt), adj = c(.5,.5), cex = .75, col = txt2$col)

# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# Omnivory dynamics
# ------------------
#
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
dd <- function(x,y) pchImage(x = x, y = y, obj = DD, cex.x = .4, cex.y = .6, col = '#00000099')
sh <- function(x,y) pchImage(x = x, y = y, obj = Shipping, cex.x = .4, cex.y = .6, col = '#00000099')
tm <- function(x,y) pchImage(x = x, y = y, obj = SST, cex.x = .4, cex.y = .6, col = '#00000099')
path <- 655
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Unitary 1
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
par(mar = c(.5, .5, 0, 0))
plotOmnivory()
mtext(side = 2, las = 2, cex = .55, text = 'F)', at = path, line = -.5)


# box2(side = '234', which = 'figure', lty = 2, col = colP[1], lwd = lwdD)

# Delta abundances
lines(x = c(5,55), y = rep(init['x'],2), lty = 4, col = '#000000aa', lwd = lwdD)
xI <- init['x']
xE <- res1[50,'x']
xM <- mean(c(xI,xE))
arrows(55, xM+(xI-xM)*.35, 55, xI-8.5, length = .025, code = 2, xpd = TRUE, lwd = lwdD)
arrows(55, xM-(xI-xM)*.35, 55, xE+8.5, length = .025, code = 2, xpd = TRUE, lwd = lwdD)
text(x = 55, y = xM, adj = c(.5,.5), labels = TeX('Sensitivity'), cex = .55)
# text(x = 55, y = xM, adj = c(.5,.5), labels = TeX('$\\Delta a$'), cex = .55)

# Population dynamics
for (i in 2:4) lines(x = c(5:55), y = res1[,i], lwd = lwdD, col = colsPos[3])

# Disturbances
arrows(8, 550, 5.5, 520, length = .025, code = 2, xpd = TRUE)
dd(x = 10, y = xI+60)

# Pathway of effect
text(x = 5, y = path, labels = TeX('$g_1 = \\{\\textit{r}_{capelin}\\}$'), adj = c(0,.5), cex = .9)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Unitary 2
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot
par(mar = c(.5, .5, 0, 0))
plotOmnivory()
mtext(side = 2, las = 2, cex = .55, text = 'G)', at = path, line = -.5)
for (i in 2:4) lines(x = c(5:55), y = res2[,i], lwd = lwdD, col = colsPos[3])

# Disturbances
arrows(8, 320, 5.5, 280, length = .025, code = 2, xpd = TRUE)
dd(x = 10, y = 335)

# Pathway of effect
text(x = 5, y = path, labels = TeX('$g_2 = \\{\\textit{m}_{cod}\\}$'), adj = c(0,.5), cex = .9)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Unitary 3
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot
par(mar = c(.5, .5, 0, 0))
plotOmnivory()
mtext(side = 2, las = 2, cex = .55, text = 'H)', at = path, line = -.5)
for (i in 2:4) lines(x = c(5:55), y = res3[,i], lwd = lwdD, col = colsPos[3])


# Pathway of effect
arrows(8, 215, 5.5, 175, length = .025, code = 2, xpd = TRUE)
sh(x = 10, y = 230)

# Pathway of effect
text(x = 5, y = path, labels = TeX('$g_3 = \\{\\alpha_{capelin,beluga}\\}$'), adj = c(0,.5), cex = .9)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Unitary 4
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot
par(mar = c(.5, .5, 0, 0))
plotOmnivory()
mtext(side = 2, las = 2, cex = .55, text = 'I)', at = path, line = -.5)
for (i in 2:4) lines(x = c(5:55), y = res4[,i], lwd = lwdD, col = colsPos[3])

# Pathway of effect
arrows(8, 215, 5.5, 175, length = .025, code = 2, xpd = TRUE)
sh(x = 10, y = 230)

# Pathway of effect
text(x = 5, y = path, labels = TeX('$g_4 = \\{\\alpha_{cod,beluga}\\}$'), adj = c(0,.5), cex = .9)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Integrative
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot
par(mar = c(.5, .5, 0, 0))
plotOmnivory()
mtext(side = 2, las = 2, cex = .55, text = 'M)', at = path, line = -.5)


# Pathways of effect
arrows(8, 550, 5.5, 520, length = .025, code = 2, xpd = TRUE)
arrows(8, 225, 5.5, 245, length = .025, code = 2, xpd = TRUE)
arrows(8, 75, 5.5, 125, length = .025, code = 2, xpd = TRUE)
dd(x = 10, y = xI+60)
dd(x = 10, y = 235)
sh(x = 10, y = 60)


# Legends
## Pathways of effect
lines(x = c(51,55), y = rep(xI+45,2), lwd = lwdD, col = colsPos[3])
lines(x = c(51,55), y = rep(xI-20,2), lty = 3, lwd = lwdD, col = colsPos[3])
text(x = 50, y = xI+50, adj = c(1,.5), labels = TeX('Integrative pathway of effect ($\\textit{G}$)'), cex = .55)
text(x = 50, y = xI-15, adj = c(1,.5), labels = TeX('$\\sum$unitary pathways of effect ($\\textit{g}$)'), cex = .55)


# Enveloppes
#envelop(x = 5:55, upper = init['x']-((init['x']-res1[,'x'])+(init['x']-res2[,'x'])+(init['x']-res3[,'x'])+(init['x']-res4[,'x'])), lower = res5[,'x'], col = '#00000022', border = '#00000000')
#envelop(x = 5:55, upper = init['y']-((init['y']-res1[,'y'])+(init['y']-res2[,'y'])+(init['y']-res3[,'y'])+(init['y']-res4[,'y'])), lower = res5[,'y'], col = '#00000022', border = '#00000000')
#envelop(x = 5:55, upper = init['z']-((init['z']-res1[,'z'])+(init['z']-res2[,'z'])+(init['z']-res3[,'z'])+(init['z']-res4[,'z'])), lower = res5[,'z'], col = '#00000022', border = '#00000000')
envelop(x = 5:55, upper = init['x']-((init['x']-res1[,'x'])+(init['x']-res2[,'x'])+(init['x']-res3[,'x'])+(init['x']-res4[,'x'])), lower = res5[,'x'], col = paste0(colsPos[3], '11'), border = '#00000000')
envelop(x = 5:55, upper = init['y']-((init['y']-res1[,'y'])+(init['y']-res2[,'y'])+(init['y']-res3[,'y'])+(init['y']-res4[,'y'])), lower = res5[,'y'], col = paste0(colsPos[3], '11'), border = '#00000000')
envelop(x = 5:55, upper = init['z']-((init['z']-res1[,'z'])+(init['z']-res2[,'z'])+(init['z']-res3[,'z'])+(init['z']-res4[,'z'])), lower = res5[,'z'], col = paste0(colsPos[3], '11'), border = '#00000000')


# Joint model
lines(x = c(5:55), y = res5[,'x'], lwd = lwdD, col = colsPos[3])
lines(x = c(5:55), y = res5[,'y'], lwd = lwdD, col = colsPos[3])
lines(x = c(5:55), y = res5[,'z'], lwd = lwdD, col = colsPos[3])

# Additive model
lines(x = c(5:55), y = init['x']-((init['x']-res1[,'x'])+(init['x']-res2[,'x'])+(init['x']-res3[,'x'])+(init['x']-res4[,'x'])), lwd = .4, lty = 3, col = colsPos[3])
lines(x = c(5:55), y = init['y']-((init['y']-res1[,'y'])+(init['y']-res2[,'y'])+(init['y']-res3[,'y'])+(init['y']-res4[,'y'])), lwd = .4, lty = 3, col = colsPos[3])
lines(x = c(5:55), y = init['z']-((init['z']-res1[,'z'])+(init['z']-res2[,'z'])+(init['z']-res3[,'z'])+(init['z']-res4[,'z'])), lwd = .4, lty = 3, col = colsPos[3])

# Non-additive
xI <- init['x']-((init['x']-res1[,'x'])+(init['x']-res2[,'x'])+(init['x']-res3[,'x'])+(init['x']-res4[,'x']))[50]
xE <- res5[50,'x']
xM <- mean(c(xI,xE))
text(x = 54, y = xM, labels = 'Amplification', cex = .55, adj = c(1,.5))
# text(x = 54, y = xM, labels = 'Synergy', cex = .55, adj = c(1,.5))


# Pathway of effect
text(x = 5, y = path, labels = TeX('$G = \\{g_1, g_2, g_3, g_4\\}$'), adj = c(0,.5), cex = .9)

# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# Omnivory dynamics
# ------------------
#
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
# =~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~=~-~= #
path <- 1640
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Unitary 1
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
par(mar = c(.5, .5, 0, 0))
plotApparent()
mtext(side = 2, las = 2, cex = .55, text = 'D)', at = path, line = -.5)
for (i in 2:4) lines(x = c(5:55), y = ap1[,i], lwd = lwdD, col = colsPos[4])

# Delta abundances
lines(x = c(5,55), y = rep(apInit['z'],2), lty = 4, col = '#000000aa', lwd = lwdD)
xI <- apInit['z']
xE <- ap1[50,'z']
xM <- mean(c(xI,xE))
arrows(55, xM+(xI-xM)*.35, 55, xI-8.5, length = .025, code = 2, xpd = TRUE, lwd = lwdD)
arrows(55, xM-(xI-xM)*.35, 55, xE+8.5, length = .025, code = 2, xpd = TRUE, lwd = lwdD)
text(x = 55, y = xM, adj = c(.5,.5), labels = TeX('Sensitivity'), cex = .55)

# Disturbances
arrows(8, xI+100, 5.5, xI+30, length = .025, code = 2, xpd = TRUE)
# arrows(8, 550, 5.5, 520, length = .025, code = 2, xpd = TRUE)
dd(x = 10, y = xI+120)

# Pathway of effect
text(x = 5, y = path, labels = TeX('$g_1 = \\{\\textit{m}_{capelin}\\}$'), adj = c(0,.5), cex = .9)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Unitary 2
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot
par(mar = c(.5, .5, 0, 0))
plotApparent()
mtext(side = 2, las = 2, cex = .55, text = 'E)', at = path, line = -.5)
for (i in 2:4) lines(x = c(5:55), y = ap2[,i], lwd = lwdD, col = colsPos[4])

# Disturbances
arrows(8, apInit['y']+180, 5.5, apInit['y']+70, length = .025, code = 2, xpd = TRUE)
# arrows(8, 550, 5.5, 520, length = .025, code = 2, xpd = TRUE)
tm(x = 10, y = apInit['y']+200)

# Pathway of effect
text(x = 5, y = path, labels = TeX('$g_2 = \\{\\textit{e}_{copepod,capelin}\\}$'), adj = c(0,.5), cex = .9)

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Integrative
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Plot
par(mar = c(.5, .5, 0, 0))
plotApparent()
mtext(side = 2, las = 2, cex = .55, text = 'L)', at = path, line = -.5)
for (i in 2:4) lines(x = c(5:55), y = ap3[,i], lwd = lwdD, col = colsPos[4])

# Legends
## Pathways of effect
lines(x = c(51,55), y = rep(xI+175,2), lwd = lwdD, col = colsPos[4])
lines(x = c(51,55), y = rep(xI+50,2), lty = 3, lwd = lwdD, col = colsPos[4])
text(x = 50, y = xI+175, adj = c(1,.5), labels = TeX('Integrative pathway of effect ($\\textit{G}$)'), cex = .55)
text(x = 50, y = xI+50, adj = c(1,.5), labels = TeX('$\\sum$unitary pathways of effect ($\\textit{g}$)'), cex = .55)


# Enveloppes
# envelop(x = 5:55, upper = apInit['x']-((apInit['x']-ap1[,'x'])+(apInit['x']-ap2[,'x'])), lower = ap3[,'x'], col = '#00000022', border = '#00000000')
# envelop(x = 5:55, upper = apInit['y']-((apInit['y']-ap1[,'y'])+(apInit['y']-ap2[,'y'])), lower = ap3[,'y'], col = '#00000022', border = '#00000000')
# envelop(x = 5:55, upper = apInit['z']-((apInit['z']-ap1[,'z'])+(apInit['z']-ap2[,'z'])), lower = ap3[,'z'], col = '#00000022', border = '#00000000')
envelop(x = 5:55, upper = apInit['x']-((apInit['x']-ap1[,'x'])+(apInit['x']-ap2[,'x'])), lower = ap3[,'x'], col = paste0(colsPos[4], '11'), border = '#00000000')
envelop(x = 5:55, upper = apInit['y']-((apInit['y']-ap1[,'y'])+(apInit['y']-ap2[,'y'])), lower = ap3[,'y'], col = paste0(colsPos[4], '11'), border = '#00000000')
envelop(x = 5:55, upper = apInit['z']-((apInit['z']-ap1[,'z'])+(apInit['z']-ap2[,'z'])), lower = ap3[,'z'], col = paste0(colsPos[4], '11'), border = '#00000000')

# Joint model
lines(x = c(5:55), y = ap3[,'x'], lwd = lwdD, col = colsPos[4])
lines(x = c(5:55), y = ap3[,'y'], lwd = lwdD, col = colsPos[4])
lines(x = c(5:55), y = ap3[,'z'], lwd = lwdD, col = colsPos[4])

# Additive model
lines(x = c(5:55), y = apInit['x']-((apInit['x']-ap1[,'x'])+(apInit['x']-ap2[,'x'])), lwd = .4, lty = 3, col = colsPos[4])
lines(x = c(5:55), y = apInit['y']-((apInit['y']-ap1[,'y'])+(apInit['y']-ap2[,'y'])), lwd = .4, lty = 3, col = colsPos[4])
lines(x = c(5:55), y = apInit['z']-((apInit['z']-ap1[,'z'])+(apInit['z']-ap2[,'z'])), lwd = .4, lty = 3, col = colsPos[4])

# Non-additive
xI <- apInit['z']-((apInit['z']-ap1[,'z'])+(apInit['z']-ap2[,'z']))[50]
xE <- ap3[50,'z']
xM <- mean(c(xI,xE))
text(x = 54, y = xM, labels = 'Amplification', cex = .55, adj = c(1,.5))

# Disturbances
arrows(8, apInit['z']+100, 5.5, apInit['z']+30, length = .025, code = 2, xpd = TRUE)
arrows(8, apInit['y']-50, 5.5, apInit['y']-20, length = .025, code = 2, xpd = TRUE)
dd(x = 10, y = apInit['z']+120)
tm(x = 10, y = apInit['y']-40)


# Pathway of effect
text(x = 5, y = path, labels = TeX('$G = \\{g_1,g_2\\}$'), adj = c(0,.5), cex = .9)

dev.off()
