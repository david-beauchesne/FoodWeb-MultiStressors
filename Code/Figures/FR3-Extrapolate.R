# source('./Code/Figures/FR3-Extrapolate.R')
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
cxy1 <- .9

# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# Part D
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# Data
load('./Data/vulnerability.RData')

# Sensitivity and amplification vector for cod
dat <- data.frame(id = c(5,4,3,2,.75),
                  sensitivity = numeric(5),
                  amplification = numeric(5))

# =-=-=-=-=-=-=-=-=-=-=-= #
# Competitive exploitation
# =-=-=-=-=-=-=-=-=-=-=-= #
uid <- vulnerability$Position == 'exz' & vulnerability$Pathways == 'beta-m_z-r'
dat$sensitivity[1] <- vulnerability$Sensitivity[uid]
dat$amplification[1] <- vulnerability$Amplification[uid]

# =-=-=-=-=-=-=-=-=-=-=-= #
# Food chain 1
# =-=-=-=-=-=-=-=-=-=-=-= #
uid <- vulnerability$Position == 'ttz' & vulnerability$Pathways == 'm_y-m_z'
dat$sensitivity[2] <- vulnerability$Sensitivity[uid]
dat$amplification[2] <- vulnerability$Amplification[uid]

# =-=-=-=-=-=-=-=-=-=-=-= #
# Food chain 2
# =-=-=-=-=-=-=-=-=-=-=-= #
uid <- vulnerability$Position == 'ttz' & vulnerability$Pathways == 'm_y-m_z-mu'
dat$sensitivity[3] <- vulnerability$Sensitivity[uid]
dat$amplification[3] <- vulnerability$Amplification[uid]

# =-=-=-=-=-=-=-=-=-=-=-= #
# Omnivory
# =-=-=-=-=-=-=-=-=-=-=-= #
# Sensitivity
uid <- vulnerability$Position == 'omy' & vulnerability$Pathways == 'delta-gamma-m_y-r'
dat$sensitivity[4] <- vulnerability$Sensitivity[uid]
dat$amplification[4] <- vulnerability$Amplification[uid]

# =-=-=-=-=-=-=-=-=-=-=-= #
# Cod values
# =-=-=-=-=-=-=-=-=-=-=-= #
dat$sensitivity[5] <- sum(dat$sensitivity[1:4])
dat$amplification[5] <- sum(dat$amplification[1:4])

# # =-=-=-=-=-=-=-=-=-=-=-= #
# # %
# # =-=-=-=-=-=-=-=-=-=-=-= #
# dat[, 2:3] <- dat[, 2:3] *100
#
mat <- matrix(0, nrow = 4, ncol = 3)
mat[1,] <- 1
mat[2,] <- 3
mat[3,] <- 2
mat[4,1] <- 4
mat[4,2] <- 5
mat[4,3] <- 6
mat <- rbind(0,mat,0)
mat <- cbind(0,mat,0)


png('./Figures/FR3-Extrapolate.png', res = 900, width = 60, height = 100, units = "mm")
layout(mat, widths = c(.05,1,1,1,.05), heights = c(.05,.35,1,.35,2.65,.05))
# layout.show(6)
par(mar = c(0, 0, 0, 0), family = 'serif')
plot0()
text(x = -1, y = 1, adj = c(0,1), labels = "A) Species motif census", cex = cx_title, font = 2)
pchImage(x = .35, .55, obj = cod, cex.x = 1.5, cex.y = 5)

par(mar = c(0, 0, 0, 0))
plot0()
text(x = -1, y = 1, adj = c(0,1), labels = "B) Scaling back to species \n      in complex food webs", cex = cx_title, font = 2)


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Motif census
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
par(mar = c(0, 0, 0, 0))
plot0(x = c(-.85, .85), y = c(-2.1, -1))

# Motif 1
cxy1 <- .9
# text(-.6, -.95, labels = "Motifs involving", cex = 2.8)
# pchImage(x = -.4, -.9, obj = cod, cex.x = .7, cex.y = cxy1, col = colM[1])
lines(x = c(-.5725, -.6575), y = c(-1.6, -1.225), col = colB[1], lwd = lwdD)
lines(x = c(-.5275, -.4475), y = c(-1.6, -1.225), lwd = lwdD)
pchImage(x = -.68, -1.125, obj = hump, cex.x = .8, cex.y = cxy1)
pchImage(x = -.42, -1.1, obj = cod, cex.x = .8, cex.y = cxy1)
# circles(-.42, -1.1, .08)
pchImage(x = -.55, -1.7, obj = cap, cex.x = .6, cex.y = cxy1)

# Motif 2
lines(x = c(-.15, -.15), y = c(-1.2, -1.3), lwd = lwdD)
lines(x = c(-.15, -.15), y = c(-1.5, -1.6), lwd = lwdD)
pchImage(x = -.15, -1.1, obj = cod, cex.x = .8, cex.y = cxy1)
# circles(-.15, -1.1, .08, lwd = lwdD)
pchImage(x = -.15, -1.4, obj = cap, cex.x = .8, cex.y = cxy1)
pchImage(x = -.15, -1.7, obj = kri, cex.x = .5, cex.y = cxy1)#, col = colP[1])

# Motif 3
lines(x = c(.15, .15), y = c(-1.2, -1.3), lwd = lwdD)
lines(x = c(.15, .15), y = c(-1.5, -1.6), col = colP[1], lwd = lwdD)
pchImage(x = .15, -1.1, obj = cod, cex.x = .8, cex.y = 1)
# circles(.15, -1.1, .08, lwd = lwdD)
pchImage(x = .15, -1.4, obj = cap, cex.x = .8, cex.y = 1)
pchImage(x = .15, -1.7, obj = cop, cex.x = .6, cex.y = 1, col = '#000000')

# Motif 4
lines(x = c(.45, .45), y = c(-1.2, -1.6), col = colB[1], lwd = lwdD)
lines(x = c(.51, .6), y = c(-1.17, -1.27), col = colB[1], lwd = lwdD)
lines(x = c(.6075, .4875), y = c(-1.41, -1.63), lwd = lwdD)
pchImage(x = .45, -1.1, obj = bew, cex.x = .8, cex.y = 1)
pchImage(x = .65, -1.33, obj = cod, cex.x = .8, cex.y = 1)
# circles(.65, -1.33, .08, lwd = lwdD)
pchImage(x = .45, -1.7, obj = cap, cex.x = .6, cex.y = 1)

# Emphasis
# polygon(x = c(.35,.35,.75,.75), y = c(-1.77,-1.025,-1.025,-1.77), col = '#00000000', border = colP[1], lty = 2, lwd = lwdD)

# Text
text(x = c(-.55, -.15, .15, .55), y = rep(-1.9,4), labels = TeX(c('$M_1$','$M_2$','$M_3$','$M_4$')), cex = .7)


# =-=-=-=-=-=-=-=-=-=-=-= #
# Motifs extrapolation
# =-=-=-=-=-=-=-=-=-=-=-= #
par(mar = c(2,.5,3.5,.5), family = 'serif')
plot0(x = c(-1,1), y = c(.5,5.5))
# lines(x = c(-.75,7.15), y = c(1.2,1.2), lty = 2, lwd = .75)
abline(h = 1.2, lty = 2, lwd = .75)

# Competitive exploitation
lines(x = c(-.85, -.6), y = c(5.2, 4.8), col = colB[1], lwd = lwdD)
lines(x = c(-.15, -.4), y = c(5.2, 4.8), lwd = lwdD)
# ellipse(-.1, 5.4, .2, mjradi = .25, mnradi = .15, lwd = lwdD)
pchImage(x = -.4-.5, 5.375, obj = hump, cex.x = 2, cex.y = cxy1*.4)
pchImage(x = .4-.5, 5.4, obj = cod, cex.x = 2, cex.y = cxy1*.4)
pchImage(x = 0-.5, 4.6, obj = cap, cex.x = 1.8, cex.y = cxy1*.4)

# Food chain 1
lines(x = c(.5, .5), y = c(4.15, 4.3), lwd = lwdD)
lines(x = c(.5, .5), y = c(3.7, 3.85), lwd = lwdD)
# ellipse(.5, 4.45, .2, mjradi = .25, mnradi = .15, lwd = lwdD)
pchImage(x = 0+.5, 4.45, obj = cod, cex.x = 2, cex.y = cxy1*.4)
pchImage(x = 0+.5, 4, obj = cap, cex.x = 1.8, cex.y = cxy1*.4)
pchImage(x = 0+.5, 3.55, obj = kri, cex.x = 1.5, cex.y = cxy1*.4)#, col = colP[1])

# Food chain 2
lines(x = c(-.5, -.5), y = c(3.15, 3.3), lwd = lwdD)
lines(x = c(-.5, -.5), y = c(2.7, 2.85), col = colP[1], lwd = lwdD)
# ellipse(-.5, 3.45, .2, mjradi = .25, mnradi = .15, lwd = lwdD)
pchImage(x = 0-.5, 3.45, obj = cod, cex.x = 2, cex.y = cxy1*.4)
pchImage(x = 0-.5, 3, obj = cap, cex.x = 1.8, cex.y = cxy1*.4)
pchImage(x = 0-.5, 2.55, obj = cop, cex.x = 1.5, cex.y = cxy1*.4, col = '#000000')

# Omnivory
lines(x = c(.25, .25), y = c(2.2, 1.7), col = colB[1], lwd = lwdD)
lines(x = c(.4, .7), y = c(2.3, 2.15), col = colB[1], lwd = lwdD)
lines(x = c(.4, .7), y = c(1.65, 1.9), lwd = lwdD)
# ellipse(.85, 2.05, .2, mjradi = .25, mnradi = .15, lwd = lwdD)
pchImage(x = .25, 2.4, obj = bew, cex.x = 2, cex.y = cxy1*.4)
pchImage(x = .85, 2.05, obj = cod, cex.x = 2, cex.y = cxy1*.4)
pchImage(x = .25, 1.5, obj = cap, cex.x = 1.8, cex.y = cxy1*.4)

# Cod
pchImage(x = 0, .75, obj = cod, cex.x = 4.5, cex.y = cxy1*.9)

# =-=-=-=-=-=-=-=-=-=-=-= #
# Plot sensitivity
# =-=-=-=-=-=-=-=-=-=-=-= #
cols <- c(rep("#444643", 4), '#4B7894')
par(mar = c(2,.5,3.5,.5), family = 'serif')
plot0(x = c(-.05,.05), y = c(.5,5.5))
abline(h = 1.2, lty = 2, lwd = .75)
for(i in 1:5) rect(0, dat$id[i] - 0.2, dat$sensitivity[i], dat$id[i]+.2, col = cols[i], border = NA)
lines(x = c(0,0), y = c(.25,5.75))
axis(1, at = c(-.05,0,.05), tck = -.055, labels = FALSE)
axis(3, at = c(-.05,0,.05), tck = -.055, labels = FALSE)
mtext(side = 1, at = c(-.05,0,.05), text = c(-.05,0,.05), cex = .4, line = .25)
mtext(side = 3, at = c(-.05,0,.05), text = c(-.05,0,.05), cex = .4, line = .5)
mtext(side = 3, at = 0, adj = c(.5,.5), cex = .5, line = 1.85, text = 'Trophic sensitivity')
mtext(side = 3, at = 0, adj = c(.5,.5), cex = .5, line = 1, text = TeX('($\\textit{S_m}$)'))
txt <- data.frame(x = c(.005,.005,.005,-.005,.005), y = c(5:2,.75), adjX = c(0,0,0,1,0), adjY = c(.5,.5,.5,.5,.6),
                  lab = c('$S_{m,M_1}$','$S_{m,M_2}$','$S_{m,M_3}$','$S_{m,M_4}$','$\\sum_i S_{m,M_i}$'))
for(i in 1:nrow(txt)) text(x = txt$x[i], y = txt$y[i], labels = TeX(txt$lab[i]), cex = .7, adj = c(txt$adjX[i],txt$adjY[i]))

# =-=-=-=-=-=-=-=-=-=-=-= #
# Plot amplification
# =-=-=-=-=-=-=-=-=-=-=-= #
par(mar = c(2,.5,3.5,.5), family = 'serif')
plot0(x = c(-.0003,.0003), y = c(.5,5.5))
abline(h = 1.2, lty = 2, lwd = .75)
for(i in 1:5) rect(0, dat$id[i] - 0.2, dat$amplification[i], dat$id[i]+.2, col = cols[i], border = NA)
lines(x = c(0,0), y = c(.25,5.75))
axis(1, at = c(-.0003,0,.0003), tck = -.055, labels = FALSE)
axis(3, at = c(-.0003,0,.0003), tck = -.055, labels = FALSE)
mtext(side = 1, at = c(-.0003,0,.0003), text = c(-.0003,0,.0003), cex = .4, line = .25)
mtext(side = 3, at = c(-.0003,0,.0003), text = c(-.0003,0,.0003), cex = .4, line = .5)
mtext(side = 3, at = 0, adj = c(.5,.5), cex = .5, line = 1.85, text = 'Trophic amplification')
mtext(side = 3, at = 0, adj = c(.5,.5), cex = .5, line = 1, text = TeX('($\\textit{A_m}$)'))
txt <- data.frame(x = c(.000025,.000025,-.000025,.000025,-.000025), y = c(5:2,.75), adjX = c(0,0,1,0,1), adjY = c(.5,.5,.5,.5,.6),
                  lab = c('$A_{m,M_1}$','$A_{m,M_2}$','$A_{m,M_3}$','$A_{m,M_4}$','$\\sum_i A_{m,M_i}$'))
for(i in 1:nrow(txt)) text(x = txt$x[i], y = txt$y[i], labels = TeX(txt$lab[i]), cex = .7, adj = c(txt$adjX[i],txt$adjY[i]))



# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# End figure
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
dev.off()
