#' Examples
#' param <- data.frame(param = c('r','my','mz','b','d','o','a'),
#'                     rangeMin = c(.3, 1, 1, .3, .3, .3, 1),
#'                     rangeMax = c(1, 1.7, 1.7, 1, 1, 1, 1.7),
#'                     stringsAsFactors = F)
#' disturbance(motif = 'tritrophic', param = param, n = 1000)
#'
#'
#'
#'
#'
#'


disturbBoxplot <- function(disturbanceData) {
  # Number of disturbances simulated
  n <- nrow(disturbanceData$deltaAbundance[[1]])

  # Parameters disturbed
  paramNames <- disturbanceData$parameterCombinations %>%
                lapply(., function(x) paste(x, collapse = '-')) %>%
                unlist()


  # Identifiers for additive vs joint models
  id0 <- lapply(disturbanceData$parameterCombinations, length) %>% unlist()
  id1 <- which(id0 == 1)
  id2 <- which(id0 > 1)

  # One graph per joint model comparing joint and additive model
  dfX <- dfY <- dfZ <- dfT <- matrix(ncol = length(id2), nrow = n)

  for(i in 1:length(id2)) {
    # Parameters of model considered
    p <- disturbanceData$parameterCombinations[[id2[i]]]

    # single parameters
    p1 <- lapply(disturbanceData$parameterCombinations[id1], function(x) x %in% p) %>% unlist() %>% which()

    # Sum of individual disturbances
    y <- bind_rows(disturbanceData$deltaAbundance[p1]) %>%
         mutate(id = rep(1:n, length(p1))) %>%
         group_by(id) %>%
         summarise_all(list(sum)) %>%
         select(-id) %>%
         as.data.frame()

    # Joint disturbances
    z <- disturbanceData$deltaAbundance[[id2[i]]]

    # Difference
    yz <- y - z

    # Add in data.frames
    dfX[,i] <- yz[,1]
    dfY[,i] <- yz[,2]
    dfZ[,i] <- yz[,3]
    dfT[,i] <- yz[,4]

    # list of data.frames
    df <- list(dfX, dfY, dfZ, dfT)
  }

  # All synergistic or all antagonistic
  syn <- lapply(df, function(x) apply(x, 2, function(y) all(y > 0)))
  ant <- lapply(df, function(x) apply(x, 2, function(y) all(y < 0)))
  add <-  lapply(df, function(x) apply(x, 2, function(y) all(y == 0)))

  # Plot
  par(mfrow = c(5,1), mar = c(1,4,1,.5))
  id <- c('Species X','Species Y','Species Z','Full motif')
  # Boxplots
  for(i in 1:4) {
    cols <- as.numeric(syn[[i]]) + (as.numeric(ant[[i]]) * 2) + (as.numeric(add[[i]]) * 3) + 1
    boxplot(df[[i]], lwd = .5, axes = F, ylim = c(-100,100), col = cols, border = cols)
    axis(1, at = 1:length(id2), labels = FALSE)
    axis(2, at = c(-100,0,100))
    text(x = -1, y = -95, labels = 'Antagonistic/Dominant', adj = c(0,0))
    text(x = -1, y = 5, labels = 'Additive', adj = c(0,0))
    text(x = -1, y = 95, labels = 'Synergistic', adj = c(0,1))
    mtext(at = length(id2)-1, text = id[i], adj = c(1,1), font = 2)
    abline(h = 0, col = '#c45b5f', lty = 2)
  }
  # Legend
  par(mar = c(1,4,0,.5))
  plot0(xlim = c(0,length(id2)), ylim = c(0,1))
  text(x = (0:(length(id2)-1))+.5,
       y = rep(1, length(id2)),
       labels = paramNames[id2],
       srt = 90,
       adj = c(1,.5))
}
