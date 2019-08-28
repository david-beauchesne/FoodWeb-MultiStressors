# Parameters and functions
source('./Code/0-Param.R')

# Initial parameters
load('./Data/ParamInit/ttParam.RData')
load('./Data/ParamInit/omParam.RData')
load('./Data/ParamInit/exParam.RData')
load('./Data/ParamInit/apParam.RData')
load('./Data/ParamInit/paParam.RData')
load('./Data/ParamInit/diParam.RData')

# Simulated disturbances
load('./Data/ParamSpace/ttSpace.RData')
load('./Data/ParamSpace/omSpace.RData')
load('./Data/ParamSpace/exSpace.RData')
load('./Data/ParamSpace/apSpace.RData')
load('./Data/ParamSpace/paSpace.RData')
load('./Data/ParamSpace/diSpace.RData')

# Delta abundance
distSpace <- function(space, motif) {
  dat <- vector('list', length(space))
  for(i in 1:length(dat)) {
    dat[[i]] <- space[[i]][[3]] %>%
                bind_rows() %>%
                mutate(motif = motif, pathway = names(space[[i]][[3]]))
  }
  dat
}

tt <- distSpace(ttSpace, 'tt')
om <- distSpace(omSpace, 'om')
ex <- distSpace(exSpace, 'ex')
ap <- distSpace(apSpace, 'ap')
pa <- distSpace(paSpace, 'pa')
di <- bind_rows(diSpace[[3]]) %>% mutate(motif = 'di', pathway = names(diSpace[[3]]))

# Single data.frame per motif
tt <- bind_rows(tt)
om <- bind_rows(om)
ex <- bind_rows(ex)
ap <- bind_rows(ap)
pa <- bind_rows(pa)
di <- bind_rows(di)

# -----------------------------------------------------------------------------
#                             Integrated dataset
# -----------------------------------------------------------------------------
# All data
int <- bind_rows(tt,om,ex,ap,pa,di)

# Univariate vs multivariate disturbances
int$nParam <- stringr::str_split(int$pathway, '-') %>%
              lapply(length) %>%
              unlist()

# Integrated dataset
int <- int %>%
       gather(species, delta, -pathway, -motif, -nParam) %>%
       mutate(position = paste0(motif, species))

# Keep only unique positions
pos <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz','pax','pay','paz','dix')
int <- int[int$position %in% pos, ]

# -----------------------------------------------------------------------------
#                           Univariate disturbances
# -----------------------------------------------------------------------------
# Data
uni <- int[int$nParam == 1, ]

# Change parameter name
uni$pathway <- gsub('^r$','r_x', uni$pathway)


# Pathways
uniPath <- uni %>%
           group_by(motif,pathway,species,position) %>%
           summarise(Med = median(delta),
                     Mean = mean(delta),
                     SD = sd(delta),
                     SE = SD/sqrt(n()),
                     CIp = Mean + (1.96*SE),
                     CIm = Mean - (1.96*SE)) %>%
           arrange(Mean)

# Positions
uniPos <- uni %>%
          group_by(position) %>%
          summarise(Med = median(delta),
                    Mean = mean(delta),
                    SD = sd(delta),
                    SE = SD/sqrt(n()),
                    CIp = Mean + (1.96*SE),
                    CIm = Mean - (1.96*SE)) %>%
          arrange(Mean)


# -----------------------------------------------------------------------------
#                           Multivariate disturbances
# -----------------------------------------------------------------------------
# Data
multi <- int[int$nParam > 1, ]

# Pathways
multiPath <- multi %>%
             group_by(motif,pathway,species,position) %>%
             summarise(Med = median(delta),
                       Mean = mean(delta),
                       SD = sd(delta),
                       SE = SD/sqrt(n()),
                       CIp = Mean + (1.96*SE),
                       CIm = Mean - (1.96*SE)) %>%
             arrange(Mean)

# Remove NAs
idNA <- is.na(multiPath$SD)
multiPath$SD[idNA] <- 0
multiPath$SE[idNA] <- 0
multiPath[idNA, c('CIp','CIm')] <- multiPath$Mean[idNA]

# Positions
multiPos <- multi %>%
            group_by(position) %>%
            summarise(Med = median(delta),
                      Mean = mean(delta),
                      SD = sd(delta),
                      SE = SD/sqrt(n()),
                      CIp = Mean + (1.96*SE),
                      CIm = Mean - (1.96*SE)) %>%
            arrange(Mean)


# -----------------------------------------------------------------------------
#                                  Export data
# -----------------------------------------------------------------------------
save(int, file = './Data/DisturbancesAll.RData')
save(uniPath, file = './Data/UnivariatePath.RData')
save(uniPos, file = './Data/UnivariatePosition.RData')
save(multiPath, file = './Data/MultivariatePath.RData')
save(multiPos, file = './Data/MultivariatePosition.RData')
