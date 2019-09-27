# source('./Code/14-Concept.R')
# Libraries
library(graphicsutils)

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

# ----------------------------------------------------------------------
# Drivers
# ----------------------------------------------------------------------
SST <- png::readPNG('./img/SST.png', native = T) # modified from https://fontawesome.com/icons/thermometer-full?style=solid
Shipping <- png::readPNG('./img/ship-solid.png', native = T) # https://fontawesome.com/icons/ship?style=solid
DD <- png::readPNG('./img/trawl.png', native = T)

# ----------------------------------------------------------------------
# Figure
# ----------------------------------------------------------------------
png('./Figures/Concept.png', res = 900, width = 70, height = 80,units = "mm")

par(mar = c(0,0,0,0))
plot0(y = c(-1,2))
abline(v=0,lty=2,col = '#00000044')
abline(h=0,lty=2,col = '#00000044')
lines(x = c(-.55,.55), y = rep(1.3, 2), lty = 2, col = '#00000099')




# Interactions
lines(x = c(0,0), y = c(.15,.85)) # bel to cap
lines(x = c(-.1,-.4), y = c(.1,.4)) # hump to cap
lines(x = c(.1,.4), y = c(.1,.52)) # cod to cap
lines(x = c(.1,.4), y = c(.9325,.7275)) # bel to cod
lines(x = c(.045,.2375), y = c(-.1,-.52)) # cap to cop
lines(x = c(-.045,-.2375), y = c(-.1,-.52)) # cap to kri
lines(x = c(-.48,-.325), y = c(.4,-.52)) # hump to cop

# Species
pchImage(x = -.5, .5, obj = hump, cex.x = 1.4, cex.y = .55)
pchImage(x = 0, 1, obj = bew, cex.x = 1.3, cex.y = .5)
pchImage(x = .5, .66, obj = cod, cex.x = 1.2, cex.y = .4)
pchImage(x = 0, 0, obj = cap, cex.x = .85, cex.y = .4)
pchImage(x = -.3, -.66, obj = kri, cex.x = .75, cex.y = .35)
pchImage(x = .3, -.66, obj = cop, cex.x = .65, cex.y = .5)

# Drivers
drCol <- '#772d2d'
pchImage(x = -.4, 1.45, obj = SST, cex.x = .5, cex.y = .55, col = drCol)
pchImage(x = 0, 1.45, obj = Shipping, cex.x = .7, cex.y = .55, col = drCol)
pchImage(x = .4, 1.45, obj = DD, cex.x = .75, cex.y = .45, col = drCol)


dev.off()
