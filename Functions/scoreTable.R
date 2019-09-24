scoreTable <- function(foodWeb, output) {
  source('./Functions/plotMotifs.R')

  # Parameters
  nSp <- nrow(foodWeb)
  textCex <- .5
  headCex <- .65
  cols <- c('#444643','#b55151')
  pal1 <- colorRampPalette(c('#ffffff', '#444643'))

  # Graph
  png(output, res = 900, width = 260, height = 180,units = "mm")
  par(mar = rep(0.6, 4), xaxs = "i", yaxs = "i", lend = 1, family = "serif")
  plot0(c(-12.2, 12.2), c(-1.2, nSp+4.2))

  # Background
  for (i in 0:25 * 2 + 2) {
    rect(-12, i - 0.5, 12, i + 0.5, col = "grey95", border = NA)
  }

  # Species accronyms and description
    # Headers
    nm <- c('Id', 'Functional groups')
    posX <- c(-12, -11.25)
    text(x = posX, y = nSp+1.5, labels = nm, cex = headCex, adj = c(0,.5), font = 2)

    # Text
    for(i in 1:nSp) {
      text(x = rep(posX[1], nSp), y = 1:nSp, labels = foodWeb$Group, adj = c(0,.5), cex = textCex)
      text(x = rep(posX[2], nSp), y = 1:nSp, labels = foodWeb$Description, adj = c(0,.5), cex = textCex)
    }

  # Region
    # Header
    text(x = -7.5, y = nSp+1.5, labels = 'Regions', cex = headCex, adj = c(.5,.5), font = 2)


  # Pathways of effect
    # Headers
    nm <- c('Mortality','Behaviour','Physiology')
    posX <- seq(-6,-3,by=1.5)
    text(x = posX, y = nSp+1.5, labels = nm, cex = headCex, adj = c(.5,.5), font = 2)

    # Text
    # ...

  # Motifs
    # Headers
    motifs <- c('tt','tt','tt','om','om','om','ex','ex','ap','ap')
    pos <- c('x','y','z','x','y','z','x','z','x','z')
    xPos <- seq(-2.15, by = .4, length.out = 10)
    text(x = mean(xPos), y = nSp+2.75, labels = 'Position frequency', cex = headCex, adj = c(.5,.5), font = 2)
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


  # Sensitivity scores
    # Header
    xR <- c(2,5.75)
    x0 <- xR[1] + diff(xR)*.66
    text(x = mean(xR), y = nSp+2.75, labels = 'Sensitivity score', cex = headCex, adj = c(.5,.5), font = 2)

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


    # # Data
    # dat <- ((foodWeb$Sensitivity / 10) * 2.5) + x0
    # for(i in 1:length(dat)) {
    #   if(!is.na(dat[i])) {
    #     lines(x = c(x0, dat[i]), y = rep(i+.2, 2), lwd = 5, col = cols[1])
    #   } else {
    #     next
    #   }
    # }
    #
    # # Data 2
    # dat <- ((foodWeb$SensitivityTopo / 10) * 2.5) + x0
    # for(i in 1:length(dat)) {
    #  if(!is.na(dat[i])) {
    #    lines(x = c(x0, dat[i]), y = rep(i-.2, 2), lwd = 5, col = cols[2])
    #  } else {
    #    next
    #  }
    # }


  # Amplification scores
    # Header
    xR <- c(6.25,10)
    x0 <- xR[1] + diff(xR)*.33
    text(x = mean(xR), y = nSp+2.75, labels = 'Amplification score', cex = headCex, adj = c(.5,.5), font = 2)

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
        lines(x = c(x0, dat[i]), y = rep(i, 2), lwd = 10, col = cols[1])
      } else {
        next
      }
     }

    # # Data
    # dat <- ((foodWeb$Amplification / .2) * 2.5) + x0
    # for(i in 1:length(dat)) {
    #   if(!is.na(dat[i])) {
    #     lines(x = c(x0, dat[i]), y = rep(i+.2, 2), lwd = 5, col = cols[1])
    #   } else {
    #     next
    #   }
    #  }

     # # Data 2
     # dat <- ((foodWeb$AmplificationTopo / .2) * 2.5) + x0
     # for(i in 1:length(dat)) {
     #  if(!is.na(dat[i])) {
     #    lines(x = c(x0, dat[i]), y = rep(i-.2, 2), lwd = 5, col = cols[2])
     #  } else {
     #    next
     #  }
     # }



  dev.off()

}
