source('./Code/0-Param.R')

# Initial parameters
load('./Data/ParamInit/ttParam.RData')
load('./Data/ParamInit/omParam.RData')
load('./Data/ParamInit/exParam.RData')
load('./Data/ParamInit/apParam.RData')
load('./Data/ParamInit/paParam.RData')
load('./Data/ParamInit/diParam.RData')

# Simulated disturbances
load('./Data/ParamSpace/ttSpace1P.RData')
load('./Data/ParamSpace/omSpace1P.RData')
load('./Data/ParamSpace/exSpace1P.RData')
load('./Data/ParamSpace/apSpace1P.RData')
load('./Data/ParamSpace/paSpace1P.RData')
load('./Data/ParamSpace/diSpace1P.RData')


# -----------------------------------------------------------------------------
# Single initial parameter
# -----------------------------------------------------------------------------
# # ---------------------------
# # Single figure
# # ---------------------------
# # Delta abundance
# i = 1
# tt <- multiDF(init = ttParam[i, ], disturb = ttSpace[[i]]) %>% mutate(motif = 'tt')
# om <- multiDF(init = omParam[i, ], disturb = omSpace[[i]]) %>% mutate(motif = 'om')
# ex <- multiDF(init = exParam[i, ], disturb = exSpace[[i]]) %>% mutate(motif = 'ex')
# ap <- multiDF(init = apParam[i, ], disturb = apSpace[[i]]) %>% mutate(motif = 'ap')
# pa <- multiDF(init = paParam[i, ], disturb = paSpace[[i]]) %>% mutate(motif = 'pa')
# di <- multiDF(init = diParam[1, ], disturb = diSpace[[1]]) %>% mutate(motif = 'di')
#
#
# # One figure for all motifs/positions
# int <- bind_rows(tt,om,ex,ap,pa,di) %>%
#        gather(species, delta, -pathway, -motif) %>%
#        group_by(motif,pathway,species) %>%
#        summarise(Med = mean(delta),
#                  SD = sd(delta),
#                  SE = SD/sqrt(n()),
#                  SEp = Med+SE,
#                  SEm = Med-SE,
#                  CIp = Med + (1.96*SE),
#                  CIm = Med - (1.96*SE)) %>%
#        mutate(position = paste0(motif, species)) %>%
#        arrange(Med)
#
# # Figure 1 - All motifs and profiles
# # Plot figure
# par(mar = c(6,3,1,1))
# plot0(x = c(0,nrow(int)), y = c(-1, 2))
# axis(2)
# axis(1)#, at = 1:nrow(x), labels = x$species, las = 2, cex.axis = .75)
# abline(h = 0, lty = 2)
# polygon(x = c(1:nrow(int), nrow(int):1), y = c(int$CIm, rev(int$CIp)), col = '#23349922', border = 'transparent')
# lines(int$Med, col = '#233499', lwd = 2)
#
# # ---------------------------
# # One plot per position
# # ---------------------------
# pos <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz','pax','pay','paz','dix')
# par(mfrow = c(7,2))
# for(k in pos) {
#   uid <- int$position == k
#   dat <- int[uid, ]
#   par(mar = c(.5,3,.5,1))
#   plot0(x = c(0,nrow(dat)), y = c(-1, 1))
#   axis(2, las = 2)
#   abline(h = 0, lty = 2, col = '#00000044')
#   text(x = .05, y = .95, font = 2, labels = k, cex = 1.25)
#   polygon(x = c(1:nrow(dat), nrow(dat):1), y = c(dat$CIm, rev(dat$CIp)), col = '#23349955', border = 'transparent')
#   lines(dat$Med, col = '#233499', lwd = 1)
# }








# -----------------------------------------------------------------------------
# 100 initial parameters
# -----------------------------------------------------------------------------
# Check for negative abundances
check <- function(space) {
  checkEq <- logical(length(space))
  s <- vector('list', length(space))
  for(i in 1:length(space)) {
    s[[i]] <- vector('list', length(space[[i]]))
    names(s[[i]]) <- names(space[[i]])
    for(j in 1:length(space[[i]])) {
      s[[i]][[j]] <- space[[i]][[j]][, c('x','y','z')] # Select only abundances
    }

    # Transform as data.frame for each initial parameter set
    s[[i]] <- unlist(s[[i]]) %>%
              matrix(data = ., ncol = 3, byrow = T,
                     dimnames = list(c(), c('x','y','z')))

    # Check if any abundance is < 0
    checkEq[i] <- any(s[[i]] < 0)
  }

  # Return
  !checkEq
}

# Subset initial parameters and parameter space to remove those that result in negative abundances with 1% parameter variation
ttParam <- ttParam[check(ttSpace), ]
omParam <- omParam[check(omSpace), ]
exParam <- exParam[check(exSpace), ]
apParam <- apParam[check(apSpace), ]
paParam <- paParam[check(paSpace), ]
diParam <- diParam[check(diSpace), ]
ttSpace <- ttSpace[check(ttSpace)]
omSpace <- omSpace[check(omSpace)]
exSpace <- exSpace[check(exSpace)]
apSpace <- apSpace[check(apSpace)]
paSpace <- paSpace[check(paSpace)]
diSpace <- diSpace[check(diSpace)]


# Delta abundance
nInit <- 100
tt <- om <- ex <- ap <- pa <- di <- vector('list', nInit)
for(i in 1:length(ttSpace)) tt[[i]] <- multiDF(init = ttParam[i, ], disturb = ttSpace[[i]]) %>% mutate(motif = 'tt')
for(i in 1:length(omSpace)) om[[i]] <- multiDF(init = omParam[i, ], disturb = omSpace[[i]]) %>% mutate(motif = 'om')
for(i in 1:length(exSpace)) ex[[i]] <- multiDF(init = exParam[i, ], disturb = exSpace[[i]]) %>% mutate(motif = 'ex')
for(i in 1:length(apSpace)) ap[[i]] <- multiDF(init = apParam[i, ], disturb = apSpace[[i]]) %>% mutate(motif = 'ap')
for(i in 1:length(paSpace)) pa[[i]] <- multiDF(init = paParam[i, ], disturb = paSpace[[i]]) %>% mutate(motif = 'pa')
for(i in 1) di[[i]] <- multiDF(init = diParam, disturb = diSpace[[i]]) %>% mutate(motif = 'di')

tt <- bind_rows(tt)
om <- bind_rows(om)
ex <- bind_rows(ex)
ap <- bind_rows(ap)
pa <- bind_rows(pa)
di <- bind_rows(di)

# One figure for all motifs/positions
int <- bind_rows(tt,om,ex,ap,pa,di) %>%
       gather(species, delta, -pathway, -motif) %>%
       group_by(motif,pathway,species) %>%
       summarise(Med = median(delta),
                 Mean = mean(delta),
                 SD = sd(delta),
                 SE = SD/sqrt(n()),
                 CIp = Mean + (1.96*SE),
                 CIm = Mean - (1.96*SE)) %>%
       mutate(position = paste0(motif, species)) %>%
       arrange(Mean)

# Remove NAs
  idNA <- is.na(int$SD)
  int$SD[idNA] <- 0
  int$SE[idNA] <- 0
  int[idNA, c('CIp','CIm')] <- int$Mean[idNA]

# Unique positions
pos <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz','pax','pay','paz','dix')
int <- int[int$position %in% pos, ]


# Export data
save(int, file = './Data/Multivariate1P.RData')


# Dataset for species profile
spProf <- bind_rows(tt,om,ex,ap,pa,di) %>%
          gather(species, delta, -pathway, -motif) %>%
          mutate(position = paste0(motif, species)) %>%
          group_by(position) %>%
          summarise(Mean = mean(delta),
                    SD = sd(delta),
                    SE = SD/sqrt(n()),
                    CIp = Mean + (1.96*SE),
                    CIm = Mean - (1.96*SE)) %>%
          arrange(Mean)

# Remove NAs
  idNA <- is.na(spProf$SD)
  spProf$SD[idNA] <- 0
  spProf$SE[idNA] <- 0
  spProf[idNA, c('CIp','CIm')] <- spProf$Mean[idNA]


# Unique positions
spProf <- spProf[spProf$position %in% pos, ]

# Export
save(spProf, file = './Data/MultivariatePosition1P.RData')


# Pathway profiles
pProf <- bind_rows(tt,om,ex,ap,pa,di) %>%
         gather(species, delta, -pathway, -motif) %>%
         mutate(position = paste0(motif, species))

# Unique positions
pProf <- pProf[pProf$position %in% pos, ]

# Summarise
pProf <- pProf %>%
         group_by(pathway) %>%
         summarise(Mean = mean(delta),
                   SD = sd(delta),
                   SE = SD/sqrt(n()),
                   CIp = Mean + (1.96*SE),
                   CIm = Mean - (1.96*SE)) %>%
         arrange(Mean)

# Remove NAs
  idNA <- is.na(pProf$SD)
  pProf$SD[idNA] <- 0
  pProf$SE[idNA] <- 0
  pProf[idNA, c('CIp','CIm')] <- pProf$Mean[idNA]


# Export
save(pProf, file = './Data/MultivariatePathway1P.RData')
