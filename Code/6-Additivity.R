source('./Code/0-Param.R')

# Simulated disturbances
load('./Data/ParamSpace/ttSpace.RData')
load('./Data/ParamSpace/omSpace.RData')
load('./Data/ParamSpace/exSpace.RData')
load('./Data/ParamSpace/apSpace.RData')
load('./Data/ParamSpace/paSpace.RData')
load('./Data/ParamSpace/diSpace.RData')

# Additivity
tt <- vector('list', length(ttSpace))
om <- vector('list', length(omSpace))
ex <- vector('list', length(exSpace))
ap <- vector('list', length(apSpace))
pa <- vector('list', length(paSpace))
di <- vector('list', 1)

for(i in 1:length(ttSpace)) tt[[i]] <- additivity(ttSpace[[i]]) %>% mutate(motif = 'tt')
for(i in 1:length(omSpace)) om[[i]] <- additivity(omSpace[[i]]) %>% mutate(motif = 'om')
for(i in 1:length(exSpace)) ex[[i]] <- additivity(exSpace[[i]]) %>% mutate(motif = 'ex')
for(i in 1:length(apSpace)) ap[[i]] <- additivity(apSpace[[i]]) %>% mutate(motif = 'ap')
for(i in 1:length(paSpace)) pa[[i]] <- additivity(paSpace[[i]]) %>% mutate(motif = 'pa')
di[[1]] <- additivity(diSpace) %>% mutate(motif = 'di')

# Single dataset for all motifs and positions
for(i in 1:length(tt)) tt[[i]] <- mutate(tt[[i]], init = i)
for(i in 1:length(om)) om[[i]] <- mutate(om[[i]], init = i)
for(i in 1:length(ex)) ex[[i]] <- mutate(ex[[i]], init = i)
for(i in 1:length(ap)) ap[[i]] <- mutate(ap[[i]], init = i)
for(i in 1:length(pa)) pa[[i]] <- mutate(pa[[i]], init = i)

# -----------------------------------------------------------------------------
#                             Integrated dataset
# -----------------------------------------------------------------------------
# All data
int <- bind_rows(tt,om,ex,ap,pa,di) %>%
       gather(model, delta, -pathway, -motif, -param, -id, -init) %>%
       mutate(species = substr(model, 1, 1),
              model = substr(model, 2, nchar(model))) %>%
       spread(model, delta) %>%
       mutate(position = paste0(motif, species))

# Keep only unique positions
pos <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz','pax','pay','paz','dix')
int <- int[int$position %in% pos, ]

# Change name
intAdd <- int

# -----------------------------------------------------------------------------
#                             Additivity summary
# -----------------------------------------------------------------------------
# Pathways
addPath <- int %>%
           group_by(motif,pathway,species,position) %>%
           summarise(Mean = mean(Int),
                     SD = sd(Int),
                     SE = SD/sqrt(n()),
                     CIp = Mean + (1.96*SE),
                     CIm = Mean - (1.96*SE)) %>%
           arrange(Mean)

# Remove NAs
idNA <- is.na(addPath$SD)
addPath$SD[idNA] <- 0
addPath$SE[idNA] <- 0
addPath[idNA, c('CIp','CIm')] <- addPath$Mean[idNA]


# Positions
addPos <- int %>%
          group_by(position) %>%
          summarise(Mean = mean(Int),
                    SD = sd(Int),
                    SE = SD/sqrt(n()),
                    CIp = Mean + (1.96*SE),
                    CIm = Mean - (1.96*SE)) %>%
          arrange(Mean)

# -----------------------------------------------------------------------------
#                                  Export data
# -----------------------------------------------------------------------------
save(intAdd, file = './Data/AdditiveAll.RData')
save(addPath, file = './Data/AdditivePath.RData')
save(addPos, file = './Data/AdditivePosition.RData')
