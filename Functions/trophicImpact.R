trophicImpact <- function(foodWeb, stressSources) {
  # Disturbance data
  distSL <- read.table('./Data/FoodWeb/disturbances.txt', sep = '\t', header = T, stringsAsFactors = F)

  # Pathways of effect sensitivity
  load('./Data/DisturbancesAll.RData')

  # Calculate score, which is the absolute value of the abundance variation in %
  # int$Score <- abs(int$delta)

  # Modify r for r_x -> should be done much sooner in the code hierarchy
  int$pathway <- gsub('r$', 'r_x', int$pathway)

  # Mean per motif / position / pathway
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  # Reevaluate whether the absolute of the delta should really be taken or not,
  # because it cancels the possibility of antagonistic pathways
  # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  int <- int %>%
         filter(motif %in% c('tt','om','ex','ap')) %>%
         group_by(motif, position, pathway) %>%
         summarise(Med = median(delta),
                   Mean = mean(delta),
                   SD = sd(delta),
                   SE = SD/sqrt(n()),
                   CIp = Mean + (1.96*SE),
                   CIm = Mean - (1.96*SE)) %>%
          as.data.frame()

  # Parameters disturbed in simulations
  param <- c('r_x','r_y','r_z','m_y','m_z','beta','delta','gamma','mu','nu','omega')

  # Pathways of effect in simulations data.frame
  intPathway <- matrix(FALSE, nrow = nrow(int), ncol = 11,
                       dimnames = list(c(), param)) %>%
                as.data.frame()

    # Fill it
    for(i in 1:nrow(int)) {
      dat <- str_split(int$pathway[i],'-') %>% unlist()
      intPathway[i, dat] <- T
    }

    # Add motif and position info to int
    int <- cbind(int, intPathway)

  # Triad classification
  triadClass <- triadClassification(foodWeb)

  # Empirical pathways data.frame
  pathway <- matrix(FALSE, nrow = nrow(triadClass), ncol = 11,
                    dimnames = list(c(), param)) %>%
             as.data.frame()

  # Evaluate pathway of effect for each triad
  for(i in 1:nrow(triadClass)) {
    # Motif
    motif <- colnames(triadClass)[1:4][triadClass[i, 1:4] == 1]

    # Data.frame to store empirical effects from impacts matrix
    impact <- data.frame(position = c('x','y','z'),
                         species = as.character(triadClass[i, 5:7]),
                         mortality = logical(3), physiology = logical(3),
                         behavior = logical(3))

    # Effects
    for(j in 1:3) {
      dat <- distSL[distSL$Group == impact$species[j], stressSources]
      impact$mortality[j] <- 'm' %in% dat
      impact$physiology[j] <- 'p' %in% dat
      impact$behavior[j] <- 'b' %in% dat
    }

    # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    #
    # We will play with these rules for now
    # Impacts on species mortality affects resource growth and mortality pathways (r_x, r_y, r_z, m_y, m_z)
    # Impacts on resource and consumer behavior affects the attack rates of the consumers (beta, delta, gamma)
    # Impacts on resource and consumer physiology effects the conversion rate of consumers (mu, nu, omega)
    #
    # !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


    # Evaluate per motif
    # Tri-trophic food chain
    if (motif == 'tt') {
      if (impact$mortality[1]) pathway$r_x[i] <- T                                 # Resource growth
      if (impact$mortality[2]) pathway$m_y[i] <- T                                 # Meso-predator mortality
      if (impact$mortality[3]) pathway$m_z[i] <- T                                 # Predator mortality
      if (impact$behavior[2] | impact$behavior[1]) pathway$beta[i] <- T            # Meso-predator attack rate
      if (impact$behavior[3] | impact$behavior[2]) pathway$delta[i] <- T           # Predator attack rate
      if (impact$physiology[2] | impact$physiology[1]) pathway$mu[i] <- T          # Meso-predator conversion rate
      if (impact$physiology[3] | impact$physiology[2]) pathway$omega[i] <- T       # Predator conversion rate
    }

    # Omnivory
    if (motif == 'om') {
      if (impact$mortality[1]) pathway$r_x[i] <- T                                 # Resource growth
      if (impact$mortality[2]) pathway$m_y[i] <- T                                 # Meso-predator mortality
      if (impact$mortality[3]) pathway$m_z[i] <- T                                 # Predator mortality
      if (impact$behavior[2] | impact$behavior[1]) pathway$beta[i] <- T            # Meso-predator attack rate
      if (impact$behavior[3] | impact$behavior[2]) pathway$delta[i] <- T           # Predator attack rate on meso-predator
      if (impact$behavior[3] | impact$behavior[1]) pathway$gamma[i] <- T           # Predator attack rate on resource
      if (impact$physiology[2] | impact$physiology[1]) pathway$mu[i] <- T          # Meso-predator conversion rate
      if (impact$physiology[3] | impact$physiology[2]) pathway$omega[i] <- T       # Predator conversion rate of meso-predator
      if (impact$physiology[3] | impact$physiology[1]) pathway$nu[i] <- T          # Predator conversion rate of resource
    }

    # Exploitative competition
    if (motif == 'ex') {
      if (impact$mortality[1]) pathway$r_x[i] <- T                                 # Resource growth
      if (impact$mortality[2]) pathway$m_y[i] <- T                                 # Meso-predator mortality
      if (impact$mortality[3]) pathway$m_z[i] <- T                                 # Predator mortality
      if (impact$behavior[2] | impact$behavior[1]) pathway$beta[i] <- T            # Meso-predator attack rate
      if (impact$behavior[3] | impact$behavior[1]) pathway$gamma[i] <- T           # Predator attack rate
      if (impact$physiology[2] | impact$physiology[1]) pathway$mu[i] <- T          # Meso-predator conversion rate
      if (impact$physiology[3] | impact$physiology[1]) pathway$nu[i] <- T          # Predator conversion rate
    }

    # Apparent competition
    if (motif == 'ap') {
      if (impact$mortality[1]) pathway$r_x[i] <- T                                 # Resource x growth
      if (impact$mortality[2]) pathway$r_y[i] <- T                                 # Resource y growth
      if (impact$mortality[3]) pathway$m_z[i] <- T                                 # Predator mortality
      if (impact$behavior[3] | impact$behavior[2]) pathway$delta[i] <- T           # Predator attack rate on resource y
      if (impact$behavior[3] | impact$behavior[1]) pathway$gamma[i] <- T           # Predator attack rate on resource x
      if (impact$physiology[3] | impact$physiology[2]) pathway$omega[i] <- T       # Predator conversion rate of resource y
      if (impact$physiology[3] | impact$physiology[1]) pathway$nu[i] <- T          # Predator conversion rate of resource x
    }
  }

  # Add empirical pathways to triad classification (might not be useful)
  triadClass <- cbind(triadClass, pathway)


  # Transform triad classification to have 1 row per species per triad
  triadClass <- triadClass %>%
                gather(position, species, -tt, -om, -ap, -ex, -r_x, -r_y, -r_z,
                                          -m_y, -m_z, -beta, -delta, -gamma,
                                          -mu, -nu, -omega) %>%
                gather(motif, value, -position, -species, -r_x, -r_y, -r_z,
                                     -m_y, -m_z, -beta, -delta, -gamma, -mu,
                                     -nu, -omega) %>%
                filter(value == 1) %>%
                mutate(position = paste0(motif, position)) %>%
                select(-value)

  # Score
  triadClass$Score <- 0

  # Evaluate score per triad classification as a function of pathway of effect
  for(i in 1:nrow(triadClass)) {
    # Parameters
    dat <- triadClass[i, param]
    motif <- triadClass$motif[i]
    pos <- triadClass$position[i]

    # Locate in simulated dataset - check conditions
      uid <- which(int$motif == motif &
                   int$position == pos &
                   int$r_x == dat$r_x &
                   int$r_y == dat$r_y &
                   int$r_z == dat$r_z &
                   int$m_y == dat$m_y &
                   int$m_z == dat$m_z &
                   int$beta == dat$beta &
                   int$delta == dat$delta &
                   int$gamma == dat$gamma &
                   int$mu == dat$mu &
                   int$nu == dat$nu &
                   int$omega == dat$omega)

    # Score
    if (length(uid) == 1) triadClass$Score[i] <- int$Mean[uid]
  }

  # Summarize by species
  scoreSp <- triadClass %>%
             select(species, Score) %>%
             group_by(species) %>%
             summarize(Score = sum(Score)) %>%
             arrange(Score)

  # Return
  return(scoreSp)
}
