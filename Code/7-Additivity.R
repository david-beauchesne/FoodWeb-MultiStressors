source('./Code/0-Param.R')

# Simulated disturbances
load('./Data/ParamSpace/ttSpaceAll.RData')
load('./Data/ParamSpace/omSpaceAll.RData')
load('./Data/ParamSpace/exSpaceAll.RData')
load('./Data/ParamSpace/apSpaceAll.RData')
load('./Data/ParamSpace/paSpaceAll.RData')
load('./Data/ParamSpace/diSpaceAll.RData')

# Additivity
tt <- om <- ex <- ap <- pa <- vector('list', length(ttSpace))
di <- vector('list', 1)
for(i in 1:length(tt)) tt[[i]] <- additivity(ttSpace[[i]]) %>% mutate(motif = 'tt')
for(i in 1:length(om)) om[[i]] <- additivity(omSpace[[i]]) %>% mutate(motif = 'om')
for(i in 1:length(ex)) ex[[i]] <- additivity(exSpace[[i]]) %>% mutate(motif = 'ex')
for(i in 1:length(ap)) ap[[i]] <- additivity(apSpace[[i]]) %>% mutate(motif = 'ap')
for(i in 1:length(pa)) pa[[i]] <- additivity(paSpace[[i]]) %>% mutate(motif = 'pa')
for(i in 1:length(di)) di[[i]] <- additivity(diSpace[[i]]) %>% mutate(motif = 'di')

# # Single dataset for all motifs and positions
# i = 1
# int <- bind_rows(tt[[i]],om[[i]],ex[[i]],ap[[i]],pa[[i]],di[[1]]) %>%
#        gather(model, delta, -pathway, -motif, -param, -id) %>%
#        mutate(species = substr(model, 1, 1),
#               model = substr(model, 2, nchar(model))) %>%
#        spread(model, delta) %>%
#        group_by(motif,pathway,species) %>%
#        summarise(Mean = mean(Joint),
#                  SD = sd(Joint),
#                  SE = SD/sqrt(n()),
#                  CIp = Mean + (1.96*SE),
#                  CIm = Mean - (1.96*SE)) %>%
#        mutate(position = paste0(motif, species)) %>%
#        arrange(Mean)
#
# # Unique positions
# pos <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz','pax','pay','paz','dix')
# int <- int[int$position %in% pos, ]
#
# # Figure 1 - All motifs and profiles
# # Plot figure
# par(mar = c(.5,3,.5,1), mfrow = c(1,1))
# plot0(x = c(0,nrow(int)), y = c(-1, 2))
# axis(2)
# abline(h = 0, lty = 2)
# polygon(x = c(1:nrow(int), nrow(int):1), y = c(int$CIm, rev(int$CIp)), col = '#23349922', border = 'transparent')
# lines(int$Mean, col = '#233499', lwd = 2)
#
#
# pos <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz','pax','pay','paz','dix')
# par(mfrow = c(7,2))
# for(k in pos) {
#   uid <- int$position == k
#   dat <- int[uid, ]
#   par(mar = c(.5,3,.5,1))
#   plot0(x = c(0,nrow(dat)), y = c(-.5, .5))
#   axis(2, las = 2)
#   abline(h = 0, lty = 2, col = '#00000044')
#   text(x = .05, y = .4, font = 2, labels = k, cex = 1.25)
#   polygon(x = c(1:nrow(dat), nrow(dat):1), y = c(dat$CIm, rev(dat$CIp)), col = '#23349922', border = 'transparent')
#   lines(dat$Mean, col = '#233499', lwd = 1)
# }


# All DATA
# Single dataset for all motifs and positions
for(i in 1:length(tt)) {
  tt[[i]] <- mutate(tt[[i]], init = i)
  om[[i]] <- mutate(om[[i]], init = i)
  ex[[i]] <- mutate(ex[[i]], init = i)
  ap[[i]] <- mutate(ap[[i]], init = i)
  pa[[i]] <- mutate(pa[[i]], init = i)
}

int <- bind_rows(tt,om,ex,ap,pa,di) %>%
       gather(model, delta, -pathway, -motif, -param, -id, -init) %>%
       mutate(species = substr(model, 1, 1),
              model = substr(model, 2, nchar(model))) %>%
       spread(model, delta) %>%
       group_by(motif,pathway,species) %>%
       summarise(Mean = mean(Int),
                 SD = sd(Int),
                 SE = SD/sqrt(n()),
                 CIp = Mean + (1.96*SE),
                 CIm = Mean - (1.96*SE)) %>%
       mutate(position = paste0(motif, species)) %>%
       arrange(Mean)

# Unique positions
pos <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz','pax','pay','paz','dix')
int <- int[int$position %in% pos, ]

# Export
intAdd <- int
save(intAdd, file = './Data/MultivariateAdditivity.RData')

# Dataset for species profile
spProf <- bind_rows(tt,om,ex,ap,pa,di) %>%
           gather(model, delta, -pathway, -motif, -param, -id, -init) %>%
           mutate(species = substr(model, 1, 1),
                  model = substr(model, 2, nchar(model))) %>%
           spread(model, delta) %>%
           mutate(position = paste0(motif, species)) %>%
           group_by(position) %>%
           summarise(Mean = mean(Int),
                     SD = sd(Int),
                     SE = SD/sqrt(n()),
                     CIp = Mean + (1.96*SE),
                     CIm = Mean - (1.96*SE)) %>%
           arrange(Mean)

# Unique positions
spProf <- spProf[spProf$position %in% pos, ]

# Export
spProfAdd <- spProf
save(spProfAdd, file = './Data/MultivariateAddPosition.RData')


# Pathway profiles
pProf <- bind_rows(tt,om,ex,ap,pa,di) %>%
           gather(model, delta, -pathway, -motif, -param, -id, -init) %>%
           mutate(species = substr(model, 1, 1),
                  model = substr(model, 2, nchar(model))) %>%
           spread(model, delta) %>%
           mutate(position = paste0(motif, species))

# Unique positions
pProf <- pProf[pProf$position %in% pos, ]

# Summarise
pProf <- pProf %>%
         group_by(pathway) %>%
         summarise(Mean = mean(Int),
                   SD = sd(Int),
                   SE = SD/sqrt(n()),
                   CIp = Mean + (1.96*SE),
                   CIm = Mean - (1.96*SE)) %>%
         arrange(Mean)


# Export
pProfAdd <- pProf
save(pProfAdd, file = './Data/MultivariateAddPathway.RData')
















par(mfrow = c(7,2))
for(k in pos) {
  uid <- int$position == k
  dat <- int[uid, ]
  par(mar = c(.5,3,.5,1))
  plot0(x = c(1,nrow(dat)), y = c(-.5,  .75))
  axis(2, las = 2, at = seq(-.5,.5,by=.25), label = round(seq(-.5,.5,by=.25), 2))
  abline(h = 0, lty = 2)
  abline(h = c(-.1,.1), lty = 2, col = '#d0d0d0')
  text(x = 1.05, y = .4, font = 2, labels = k, cex = 1.25)
  polygon(x = c(1:nrow(dat), nrow(dat):1), y = c(dat$CIm, rev(dat$CIp)), col = '#23349922', border = 'transparent')
  lines(dat$Mean, col = '#233499', lwd = 1)
}






par(mfrow = c(7,2))
for(k in pos) {
  uid <- int$position == k
  dat <- int[uid, ]
  par(mar = c(.5,3,.5,1))
  plot0(x = c(1,nrow(dat)), y = c(-.5,  .75))
  axis(2, las = 2, at = seq(-.5,.5,by=.25), label = round(seq(-.5,.5,by=.25), 2))
  abline(h = 0, lty = 2)
  abline(h = c(-.1,.1), lty = 2, col = '#d0d0d0')
  text(x = 1.05, y = .4, font = 2, labels = k, cex = 1.25)
  polygon(x = c(1:nrow(dat), nrow(dat):1), y = c(dat$CIm, rev(dat$CIp)), col = '#23349922', border = 'transparent')
  lines(dat$Mean, col = '#233499', lwd = 1)
}
