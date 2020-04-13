scoreTable <- function(foodWeb, output) {
  source('./Functions/plotMotifs.R')

  # Parameters
  nSp <- nrow(foodWeb)
  textCex <- .5
  headCex <- .65
  cols <- c('#444643','#444643')
  # cols <- c('#4B7894','#B45423')
  pal1 <- colorRampPalette(c('#ffffff', '#444643'))
  # pal1 <- colorRampPalette(c('#ffffff',cols[2],cols[1]))

  # Graph
  png(output, res = 900, width = 260, height = 180,units = "mm")
  par(mar = rep(0.6, 4), xaxs = "i", yaxs = "i", lend = 1, family = "serif")
  plot0(c(-11, 12.2), c(-2, nSp+3.5))

  # Background
  if ((nSp %% 2) == 0) uid <- (nSp/2):1 * 2
  if ((nSp %% 2) == 1) uid <- (nSp/2):0 * 2
  for (i in uid) {
    rect(-10.8, i - 0.5, 12, i + 0.5, col = "grey95", border = NA)
  }



  # ----------------------------------------------------------------------
  # Species accronyms and description
  # ----------------------------------------------------------------------
  # Headers
  nm <- c('Id', 'Functional groups')
  posX <- c(-10.75, -10)
  text(x = posX, y = nSp+1.5, labels = nm, cex = headCex, adj = c(0,.5), font = 2)

  # Text
  for(i in 1:nSp) {
    text(x = rep(posX[1], nSp), y = 1:nSp, labels = foodWeb$Group, adj = c(0,.5), cex = textCex)
    text(x = rep(posX[2], nSp), y = 1:nSp, labels = foodWeb$Description, adj = c(0,.5), cex = textCex)
  }


  # ----------------------------------------------------------------------
  # Pathways of effect
  # ----------------------------------------------------------------------
  # Headers
  nm <- c('Mortality','Physiology','Behaviour')
  posX <- seq(-6.25, by=1.5, length.out = 3)
  text(x = posX[2], y = nSp+2.75, labels = TeX('\\textbf{Unitary pathways of effect} ($\\textit{k}$)'), cex = headCex, adj = c(.5,.5), font = 2)
  text(x = posX, y = nSp+1.5, labels = nm, cex = headCex, adj = c(.5,.5), font = 1)

  # Text
  Acidification <- png::readPNG('./img/ACID.png', native = T)
  Hypoxia <- png::readPNG('./img/HYP.png', native = T)
  SBT <- png::readPNG('./img/SBT.png', native = T) # modified from https://fontawesome.com/icons/thermometer-full?style=solid
  SST <- png::readPNG('./img/SST.png', native = T) # modified from https://fontawesome.com/icons/thermometer-full?style=solid
  Shipping <- png::readPNG('./img/ship-solid.png', native = T) # https://fontawesome.com/icons/ship?style=solid
  DD <- png::readPNG('./img/trawl.png', native = T)
  PHB <- png::readPNG('./img/PHB.png', native = T)
  DNH <- png::readPNG('./img/DNH.png', native = T)
  Hunting <- png::readPNG('./img/rifle.png', native = T)

  # Transparency
  Acidification[Acidification == -1] <- 0
  Hypoxia[Hypoxia == -1] <- 0
  SBT[SBT == -1] <- 0
  SST[SST == -1] <- 0
  Shipping[Shipping == -1] <- 0
  DD[DD == -1] <- 0
  PHB[PHB == -1] <- 0
  DNH[DNH == -1] <- 0
  Hunting[Hunting == -1] <- 0

  # Icon parameters
  drivers <- data.frame(drivers = c('Acidification','Hypoxia','SBT','SST','Shipping','DD','DNH','PHB'),
                        name = c('Acidification','Hypoxia','Bottom temperature \nanomalies',
                                 'Surface temperature \nanomalies','Shipping',
                                 'Trawl\nfisheries',
                                 'Trap\nfisheries',
                                 'Pelagic\nfisheries'),
                        width = c(.13,.11,.11,.11,.13,.11,.13,.13),
                        height = c(.15,.15,.2,.2,.2,.12,.12,.12),
                        stringsAsFactors = F)

  # Icons
  for(i in 1:nrow(foodWeb)) {
    # Extract effects
    mortality <- drivers$drivers[which(foodWeb[i, drivers$drivers] == 'm')]
    physiology <- drivers$drivers[which(foodWeb[i, drivers$drivers] == 'p')]
    behaviour <- drivers$drivers[which(foodWeb[i, drivers$drivers] == 'b')]
    effects <- list(mortality, physiology, behaviour)

    # Mortality
    for(j in 1:3) {
      nE <- length(effects[[j]]) # Number of effects
      xG <- .4 # Width occupied by a single icon
      if(nE > 0) {
        # Icon positioning
        xR <- c(posX[j]-(nE*xG)/2, posX[j]+(nE*xG)/2)  # Range over which icons should be distributed
        xM <- seq(xR[1]+xG/2, xR[2]-xG/2, by = xG) # Middle of positions for each icon

        # Draw icons on graph
        for(k in 1:length(xM)) {
          pchImage(x = xM[k], i, obj = get(effects[[j]][k]), col = '#000000',
                   cex.x = drivers$width[drivers$drivers == effects[[j]][k]],
                   cex.y = drivers$height[drivers$drivers == effects[[j]][k]])
        }
      }
    }
  }

  # Legend
  xI <- -9.75
  xP <- c(rep(xI,2), rep(xI+1.7, 2), rep(xI+4.1, 2), rep(xI+5.55,2))
  yP <- c(rep(c(-.2, -1.45), 4))
  for(k in 1:length(xP)) {
    pchImage(x = xP[k], yP[k], obj = get(drivers$drivers[k]), col = '#000000',
             cex.x = drivers$width[k],
             cex.y = drivers$height[k])

    text(x = xP[k]+.25, y = yP[k], labels = drivers$name[k], cex = textCex, adj = c(0,.5))
  }

  # ----------------------------------------------------------------------
  # Motifs
  # ----------------------------------------------------------------------
  # Headers
  motifs <- c('tt','tt','tt','om','om','om','ex','ex','ap','ap')
  pos <- c('x','y','z','x','y','z','x','z','x','z')
  xPos <- seq(-2.15, by = .4, length.out = 10)
  text(x = mean(xPos), y = nSp+2.75, labels = TeX('\\textbf{Motif profile} ($\\textit{M}$)'), cex = headCex, adj = c(.5,.5), font = 2)
  for(i in 1:length(pos)) {
    plotMotifs(motifs[i], pos[i], x = xPos[i], y = nSp+1.5, add = T,
               cex = .4, scalingX = .3, scalingY = .5, lwd = 1.2, lwd2 = 1.2)
  }

  # Data
  pos <- paste0(motifs, pos)
  for(i in 1:nrow(foodWeb)) {
    for(j in 1:length(pos)) {
      cl <- pal1(101)[(foodWeb[i, pos[j]]*100)+1]
      points(x = xPos[j], y = i, pch = 22, bg = cl, col = paste0(cols[1], '55'), cex = 1.4)
    }
  }

  # Legend
  x <- xPos[c(2,8)]
  x2 <- seq(x[1], x[2], length.out = 101)
  for(i in 2:length(x2)) polygon(x = c(x2[i-1],x2[i-1],x2[i],x2[i]), y = c(.25,-.25,-.25,.25), col = pal1(101)[i], border = '#00000000')
  polygon(x = c(x[1],x[1],x[2],x[2]), y = c(.25,-.25,-.25,.25))
  lab <- c(0,0.5,1)
  x3 <- seq(x[1],x[2], length.out = 3)
  for(i in 1:3) {
    lines(x = c(x3[i],x3[i]), y = c(-.25,-.55))
    text(x = x3[i], y = -.95, labels = lab[i], adj = c(.5,.5), cex = textCex)
  }


  # ----------------------------------------------------------------------
  # Sensitivity scores
  # ----------------------------------------------------------------------
  # Header
  xR <- c(2,5.75)
  x0 <- xR[1] + diff(xR)*.66
  text(x = mean(xR), y = nSp+2.75, labels = TeX('\\textbf{Trophic sensitivity} ($\\textit{S_m}$)'), cex = headCex, adj = c(.5,.5), font = 2)

  # Axis
  lines(x = xR, y = rep(nSp+1,2), lwd = 1.25)
  lines(x = xR, y = rep(0,2), lwd = 1.25)
  lines(x = rep(x0,2), y = c(0,nSp+1), lty = 2, lwd = 1)
  x <- seq(xR[1], xR[2],by = 1.25)
  for(i in x) lines(x = rep(i, 2), y = c(nSp+.95, nSp+1.3), lwd = 2)
  for(i in x) lines(x = rep(i, 2), y = c(0.05, -.3), lwd = 2)
  text(x = x, y = rep(nSp+1.75, 4), labels = c(-10, -5, 0, 5), cex = textCex, adj = c(.5,.5))
  text(x = x, y = rep(-.75, 4), labels = c(-10, -5, 0, 5), cex = textCex, adj = c(.5,.5))

  # Data
  dat <- ((foodWeb$Sensitivity / 10) * 2.5) + x0
  for(i in 1:length(dat)) {
    if(!is.na(dat[i])) {
      lines(x = c(x0, dat[i]), y = rep(i, 2), lwd = 10, col = cols[1])
    } else {
      next
    }
  }


  # ----------------------------------------------------------------------
  # Amplification scores
  # ----------------------------------------------------------------------
  # Header
  xR <- c(6.25,10)
  x0 <- xR[1] + diff(xR)*.33
  text(x = mean(xR), y = nSp+2.75, labels = TeX('\\textbf{Trophic amplification} ($\\textit{A_m}$)'), cex = headCex, adj = c(.5,.5), font = 2)

  # Axis
  lines(x = xR, y = rep(nSp+1,2), lwd = 1.25)
  lines(x = xR, y = rep(0,2), lwd = 1.25)
  lines(x = rep(x0,2), y = c(0,nSp+1), lty = 2, lwd = 1)
  x <- seq(xR[1], xR[2],by = 1.25)
  for(i in x) lines(x = rep(i, 2), y = c(nSp+.95, nSp+1.3), lwd = 2)
  for(i in x) lines(x = rep(i, 2), y = c(0.05, -.3), lwd = 2)
  text(x = x, y = rep(nSp+1.75, 4), labels = c(-0.1, 0, 0.1, 0.2), cex = textCex, adj = c(.5,.5))
  text(x = x, y = rep(-.75, 4), labels = c(-0.1, 0, 0.1, 0.2), cex = textCex, adj = c(.5,.5))

  # Data
  dat <- ((foodWeb$Amplification / .2) * 2.5) + x0
  for(i in 1:length(dat)) {
    if(!is.na(dat[i])) {
      lines(x = c(x0, dat[i]), y = rep(i, 2), lwd = 10, col = cols[2])
    } else {
      next
    }
   }

  dev.off()

}
