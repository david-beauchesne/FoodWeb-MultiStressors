speciesScores <- function(foodWeb, stressSources, triadFreq = F) {
  # ------------------------------------------------
  #                    Data
  # ------------------------------------------------
  # Disturbance data
  distSL <- read.table('./Data/FoodWeb/disturbances0.txt', sep = '\t', header = T, stringsAsFactors = F)

  # Pathways of effect sensitivity
  load('./Data/DisturbancesAll.RData')

  # Pathways of effect amplification
  load('./Data/AdditiveAll.RData')

  # ------------------------------------------------
  #           Scores per individual pathway
  # ------------------------------------------------
  # Calculate score, which is the absolute value of the abundance variation in %
  # int$Score <- abs(int$delta)

  # Modify r for r_x -> should be done much sooner in the code hierarchy
  int$pathway <- gsub('r$', 'r_x', int$pathway)
  intAdd$pathway <- gsub('r$', 'r_x', intAdd$pathway)

  # Mean per motif / position / pathway
  # Sensitivity
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

  # Amplification
  intAdd <- intAdd %>%
            group_by(motif,pathway,species,position) %>%
            summarise(Mean = mean(Int),
                      SD = sd(Int),
                      SE = SD/sqrt(n()),
                      CIp = Mean + (1.96*SE),
                      CIm = Mean - (1.96*SE)) %>%
            mutate(param = stringr::str_split(pathway, '-')) %>%
            as.data.frame()

  # ------------------------------------------------
  #           Pathways of effect data ID
  # ------------------------------------------------
  # Parameters disturbed in simulations
  param <- c('r_x','r_y','r_z','m_y','m_z','beta','delta','gamma','mu','nu','omega')

  # Pathways of effect in simulations data.frame
  intPathway <-
    intPathAdd <- matrix(FALSE, nrow = nrow(int), ncol = 11,
                         dimnames = list(c(), param)) %>%
                  as.data.frame()

    # Fill em
      # Sensitivity
      for(i in 1:nrow(int)) {
        dat <- str_split(int$pathway[i],'-') %>% unlist()
        intPathway[i, dat] <- T
      }

      # Amplification
      for(i in 1:nrow(intAdd)) {
        dat <- str_split(intAdd$pathway[i],'-') %>% unlist()
        intPathAdd[i, dat] <- T
      }

    # Add motif and position info to int and intAdd
    int <- cbind(int, intPathway)
    intAdd <- cbind(intAdd, intPathAdd)


  # ------------------------------------------------
  #             Triad pathways of effects
  # ------------------------------------------------
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

  # Scores
  triadClass$Amplification <- triadClass$Sensitivity <- 0

  # Evaluate score per triad classification as a function of pathway of effect
  for(i in 1:nrow(triadClass)) {
    # Parameters
    dat <- triadClass[i, param]
    motif <- triadClass$motif[i]
    pos <- triadClass$position[i]

    # Locate in simulated sensitivity dataset - check conditions
      uidS <- which(int$motif == motif &
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

     # Locate in simulated amplification dataset - check conditions
       uidA <- which(intAdd$motif == motif &
                     intAdd$position == pos &
                     intAdd$r_x == dat$r_x &
                     intAdd$r_y == dat$r_y &
                     intAdd$r_z == dat$r_z &
                     intAdd$m_y == dat$m_y &
                     intAdd$m_z == dat$m_z &
                     intAdd$beta == dat$beta &
                     intAdd$delta == dat$delta &
                     intAdd$gamma == dat$gamma &
                     intAdd$mu == dat$mu &
                     intAdd$nu == dat$nu &
                     intAdd$omega == dat$omega)

    # Scores
    if (length(uidS) == 1) triadClass$Sensitivity[i] <- int$Mean[uidS]
    if (length(uidA) == 1) triadClass$Amplification[i] <- intAdd$Mean[uidA]
  }

  # Add pathways frequency
  triadClass$pathFreq <- apply(triadClass[, param], 1, any)


  # Summarize by species
  if (!triadFreq) {
    scoreSp <- triadClass %>%
               select(species, Sensitivity, Amplification) %>%
               group_by(species) %>%
               summarize(Sensitivity = sum(Sensitivity),
                         Amplification = sum(Amplification)) %>%
               arrange(Sensitivity)
  }
  if (triadFreq) {
    scoreSp <- triadClass %>%
               select(species, Sensitivity, Amplification, pathFreq) %>%
               group_by(species) %>%
               summarize(Sensitivity = sum(Sensitivity),
                         Amplification = sum(Amplification),
                         PathwayFrequency = sum(pathFreq)) %>%
               arrange(Sensitivity)
  }


  # Return
  return(scoreSp)
}
