# source('./Functions/plotMotifs.R')
plotMotifs <- function(motif, position = '', path = '', x = 0, y = 0,
                       scalingX = 1, scalingY = 1, cex = 2, lwd = 2, lwd2 = 2, add = F, posCol = '#000000',
                       growth = '#db5656', attack = '#db5656',
                       conversion = '#53998e') {
  # motif = 'di'
  # position = 'z'
  # path = ''
  # x = 0
  # y = 0
  # scaling = 1
  # add = F
  # posCol = '#000000'
  # growth = '#db5656'
  # attack = '#db5656'
  # conversion = '#53998e'

  # Parameters per motif
  # ---------------------------------------------------
  #                  Tri-trophic food chain
  # ---------------------------------------------------
  if (motif == 'tt') {
    # Points
    pt <- data.frame(x = c(0,0,0), y = c(-1,0,1), col = '#000000',
                     bg = '#f4f4f4', stringsAsFactors = F)

    # Positions
    if (position == 'x') pt$bg[1] <- posCol
    if (position == 'y') pt$bg[2] <- posCol
    if (position == 'z') pt$bg[3] <- posCol

    # Pathways
    if (path == 'r_x') pt$col[1] <- growth
    if (path == 'm_y') pt$col[2] <- growth
    if (path == 'm_z') pt$col[3] <- growth

    # Lines
    l <- data.frame(x1 = c(0,0), x2 = c(0,0), y1 = c(-1,0), y2 = c(0,1),
                     col = '#000000', stringsAsFactors = F)

    if (path == 'beta') l$col[1] <- attack
    if (path == 'delta') l$col[2] <- attack
    if (path == 'mu') l$col[1] <- conversion
    if (path == 'omega') l$col[2] <- conversion
  }

  # ---------------------------------------------------
  #                      Omnivory
  # ---------------------------------------------------
  if (motif == 'om') {
    # Points
    pt <- data.frame(x = c(.35,-.35,.35), y = c(-1,.3,1), col = '#000000',
                     bg = '#f4f4f4', stringsAsFactors = F)

    # Positions
    if (position == 'x') pt$bg[1] <- posCol
    if (position == 'y') pt$bg[2] <- posCol
    if (position == 'z') pt$bg[3] <- posCol

    # Pathways
    if (path == 'r_x') pt$col[1] <- growth
    if (path == 'm_y') pt$col[2] <- growth
    if (path == 'm_z') pt$col[3] <- growth

    # Lines
    l <- data.frame(x1 = c(-.35,.35,.35), x2 = c(.35,-.35,.35),
                    y1 = c(.3,1,1), y2 = c(-1,.3,-1),
                    col = '#000000', stringsAsFactors = F)

    if (path == 'beta') l$col[1] <- attack
    if (path == 'delta') l$col[2] <- attack
    if (path == 'gamma') l$col[3] <- attack
    if (path == 'mu') l$col[1] <- conversion
    if (path == 'omega') l$col[2] <- conversion
    if (path == 'nu') l$col[3] <- conversion
  }

  # ---------------------------------------------------
  #                Exploitative competition
  # ---------------------------------------------------
  if (motif == 'ex') {
    # Points
    pt <- data.frame(x = c(-.4,0,.4), y = c(1,-1,1), col = '#000000',
                     bg = '#f4f4f4', stringsAsFactors = F)

    # Positions
    if (position == 'z') pt$bg[1] <- posCol
    if (position == 'x') pt$bg[2] <- posCol
    if (position == 'y') pt$bg[3] <- posCol

    # Pathways
    if (path == 'm_z') pt$col[1] <- growth
    if (path == 'r_x') pt$col[2] <- growth
    if (path == 'm_y') pt$col[3] <- growth

    # Lines
    l <- data.frame(x1 = c(-.4,.4), x2 = c(0,0),
                    y1 = c(1,1), y2 = c(-1,-1),
                    col = '#000000', stringsAsFactors = F)

    if (path == 'gamma') l$col[1] <- attack
    if (path == 'beta') l$col[2] <- attack
    if (path == 'nu') l$col[1] <- conversion
    if (path == 'mu') l$col[2] <- conversion
  }

  # ---------------------------------------------------
  #                  Apparent competition
  # ---------------------------------------------------
  if (motif == 'ap') {
    # Points
    pt <- data.frame(x = c(-.4,.4,0), y = c(-1,-1,1), col = '#000000',
                     bg = '#f4f4f4', stringsAsFactors = F)

    # Positions
    if (position == 'x') pt$bg[1] <- posCol
    if (position == 'y') pt$bg[2] <- posCol
    if (position == 'z') pt$bg[3] <- posCol

    # Pathways
    if (path == 'r_x') pt$col[1] <- growth
    if (path == 'r_y') pt$col[2] <- growth
    if (path == 'm_z') pt$col[3] <- growth

    # Lines
    l <- data.frame(x1 = c(-.4,.4), x2 = c(0,0),
                    y1 = c(-1,-1), y2 = c(1,1),
                    col = '#000000', stringsAsFactors = F)

    if (path == 'gamma') l$col[1] <- attack
    if (path == 'delta') l$col[2] <- attack
    if (path == 'nu') l$col[1] <- conversion
    if (path == 'omega') l$col[2] <- conversion
  }

  # ---------------------------------------------------
  #                Partially disconnected
  # ---------------------------------------------------
  if (motif == 'pa') {
    # Points
    pt <- data.frame(x = c(0,0,0), y = c(-1,0,1), col = '#000000',
                     bg = '#f4f4f4', stringsAsFactors = F)

    # Positions
    if (position == 'y') pt$bg[1] <- posCol
    if (position == 'x') pt$bg[2] <- posCol
    if (position == 'z') pt$bg[3] <- posCol

    # Pathways
    if (path == 'r_y') pt$col[1] <- growth
    if (path == 'r_x') pt$col[2] <- growth
    if (path == 'm_z') pt$col[3] <- growth

    # Lines
    l <- data.frame(x1 = 0, x2 = 0,
                    y1 = 0, y2 = 1,
                    col = '#000000', stringsAsFactors = F)

    if (path == 'gamma') l$col[1] <- attack
    if (path == 'nu') l$col[1] <- conversion
  }

  # ---------------------------------------------------
  #                    Disconnected
  # ---------------------------------------------------
  if (motif == 'di') {
    # Points
    pt <- data.frame(x = c(0,0,0), y = c(-1,0,1), col = '#000000',
                     bg = '#f4f4f4', stringsAsFactors = F)

    # Positions
    if (position == 'x') pt$bg[1] <- posCol
    if (position == 'y') pt$bg[2] <- posCol
    if (position == 'z') pt$bg[3] <- posCol

    # Pathways
    if (path == 'r_x') pt$col[1] <- growth
    if (path == 'r_y') pt$col[2] <- growth
    if (path == 'r_z') pt$col[3] <- growth

    # Lines
    l <- data.frame(x1 = numeric(), x2 = numeric(), y1 = numeric(), y2 = numeric(),
                     col = character(), stringsAsFactors = F)


  }




  # Modify according to parameters
  pt$x <- (pt$x * scalingX) + x
  pt$y <- (pt$y * scalingY) + y
  l$x1 <- (l$x1 * scalingX) + x
  l$x2 <- (l$x2 * scalingX) + x
  l$y1 <- (l$y1 * scalingY) + y
  l$y2 <- (l$y2 * scalingY) + y


  # png('./Figures/motifs.png', width = 300, height = 300, res = 200, pointsize = 6)
  # Plot motif
  par(mar = c(0,0,0,0))
  if (!add) graphicsutils::plot0(x = c(-1,1), y = c(-1,1))
  for(i in 1:nrow(l)) lines(x = c(l$x1[i], l$x2[i]), y = c(l$y1[i], l$y2[i]), col = l$col[i], lwd = lwd2)
  points(x = pt$x, y = pt$y, cex = cex, col = pt$col, bg = pt$bg, pch = 21, lwd = lwd)


  # dev.off()

}
