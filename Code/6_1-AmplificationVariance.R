source('./Code/0-Param.R')

# Simulated disturbances
load('./Data/ParamSpace/ttSpace.RData')
load('./Data/ParamSpace/omSpace.RData')
load('./Data/ParamSpace/exSpace.RData')
load('./Data/ParamSpace/apSpace.RData')
load('./Data/ParamSpace/paSpace.RData')
load('./Data/ParamSpace/diSpace.RData')

# Amplification
tt <- vector('list', length(ttSpace))
om <- vector('list', length(omSpace))
ex <- vector('list', length(exSpace))
ap <- vector('list', length(apSpace))
pa <- vector('list', length(paSpace))
di <- vector('list', 1)

for(i in 1:length(ttSpace)) tt[[i]] <- variance(ttSpace[[i]]) %>% mutate(motif = 'tt')
for(i in 1:length(omSpace)) om[[i]] <- variance(omSpace[[i]]) %>% mutate(motif = 'om')
for(i in 1:length(exSpace)) ex[[i]] <- variance(exSpace[[i]]) %>% mutate(motif = 'ex')
for(i in 1:length(apSpace)) ap[[i]] <- variance(apSpace[[i]]) %>% mutate(motif = 'ap')
for(i in 1:length(paSpace)) pa[[i]] <- variance(paSpace[[i]]) %>% mutate(motif = 'pa')
for(i in 1:length(diSpace)) di[[i]] <- variance(diSpace[[i]]) %>% mutate(motif = 'di')

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
       mutate(position = paste0(motif, species)) %>%
       rename(Sensitivity = V1, Variance = Var)

# Number of parameters
int$nParam <- lapply(int$param, length) %>% unlist()

# Keep only unique positions
pos <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz','pax','pay','paz','dix')
int <- int[int$position %in% pos, ]

# Rename
varAll <- int

# -----------------------------------------------------------------------------
#                             Additivity summary
# -----------------------------------------------------------------------------
# Pathways
varPath <- int %>%
           group_by(motif,pathway,species,position) %>%
           summarise(Mean = mean(Variance),
                     SD = sd(Variance),
                     SE = SD/sqrt(n()),
                     CIp = Mean + (1.96*SE),
                     CIm = Mean - (1.96*SE)) %>%
           mutate(param = stringr::str_split(pathway, '-')) %>%
           arrange(Mean)

# Number of parameters
varPath$nParam <- lapply(varPath$param, length) %>% unlist()

# Remove NAs
idNA <- is.na(varPath$SD)
varPath$SD[idNA] <- 0
varPath$SE[idNA] <- 0
varPath[idNA, c('CIp','CIm')] <- varPath$Mean[idNA]


# Positions
varPos <- int %>%
          group_by(position) %>%
          summarise(Mean = mean(Variance),
                    SD = sd(Variance),
                    SE = SD/sqrt(n()),
                    CIp = Mean + (1.96*SE),
                    CIm = Mean - (1.96*SE)) %>%
          arrange(Mean)

# -----------------------------------------------------------------------------
#                                  Export data
# -----------------------------------------------------------------------------
save(varAll, file = './Data/VarianceAll.RData')
save(varPath, file = './Data/VariancePath.RData')
save(varPos, file = './Data/VariancePosition.RData')
