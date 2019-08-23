# source('./Code/3-UnivariateDisturbances.R')
source('./Code/0-Param.R')

# # -----------------------------------------------------------------------------
# # Single set of initial parameters
# # -----------------------------------------------------------------------------
# # Disturbances
# tt <- univariateDisturbance(FUN = ttEq,
#                             param = defaultParam('tritrophic'),
#                             percent = .1)
#
# om <- univariateDisturbance(FUN = omEq,
#                             param = defaultParam('omnivory'),
#                             percent = .1)
#
# ex <- univariateDisturbance(FUN = exEq,
#                             param = defaultParam('exploitative'),
#                             percent = .1)
#
# ap <- univariateDisturbance(FUN = apEq,
#                             param = defaultParam('apparent'),
#                             percent = .1)
#
# pa <- univariateDisturbance(FUN = paEq,
#                             param = defaultParam('partial'),
#                             percent = .1)
#
# di <- univariateDisturbance(FUN = diEq,
#                             param = defaultParam('disconnected'),
#                             percent = .1)
#
# # Bind
# uni <- bind_rows(tt,om,ex,ap,pa,di)
# uni$r_x <- rowSums(uni[, c('r','r_x')], na.rm = T)
# uni$alpha_x <- rowSums(uni[, c('alpha','alpha_x')], na.rm = T)
# uni <- select(uni, -r, -alpha)
#
# # Name rows
# uni$positions <- c('ttx','tty','ttz','omx','omy','omz','exx','exy','exz','apx',
#                    'apy','apz','pax','pay','paz','dix','diy','diz')
#
# # Keep only unique positions
# pos <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz',
#          'pax','pay','paz','dix')
# uni <- uni[uni$positions %in% pos, ]
#
# # Remove parameters for which we do not wish to make predictions
# rmP <- c('alpha_z','alpha_y','alpha_x','alpha_zy','alpha_yz')
# uni <- uni[, !colnames(uni) %in% rmP]
#
# # Format data for figure
# x <- uni %>%
#      gather(parameters, delta, -positions) %>%
#      # mutate(label = paste0(positions, '-', parameters)) %>%
#      mutate(motif = substr(positions, 1, 2),
#             species = substr(positions, 3, 3)) %>%
#      na.omit() %>%
#      arrange(delta)
#
# # Labels
# lab <- x$parameters
# id <-  stringr::str_detect(x$parameters, '_', negate = T)
# lab[id] <- paste0('\\', lab[id])
# lab <- paste0("$", lab, "$")
#
#
# # Plot figure 1
# par(mar = c(6,5,1,1), family = 'serif')
# plot0(x = c(1,nrow(x)), y = c(-1, 1))
# axis(2, las = 2)
# axis(1, at = 1:nrow(x), labels = rep('', nrow(x)))
# # mtext(text = TeX(lab)[seq(1,nrow(x), by = 2)], 1, at = seq(1,nrow(x), by = 2), line = .75)
# # mtext(text = TeX(lab)[seq(2,nrow(x), by = 2)], 1, at = seq(2,nrow(x), by = 2), line = 1.75)
# # mtext(text = TeX('$\\delta Abundance (%)$'), side = 2, line = 2.5)
# abline(h = 0, lty = 2, col = '#00000055')
# points(x$delta, col = '#233499', cex = 1, pch = 20)
#
#


# -----------------------------------------------------------------------------
# 100 initial parameters (except disconnected module)
# -----------------------------------------------------------------------------
# Initial parameters
load('./Data/ParamInit/ttParam.RData')
load('./Data/ParamInit/omParam.RData')
load('./Data/ParamInit/exParam.RData')
load('./Data/ParamInit/apParam.RData')
load('./Data/ParamInit/paParam.RData')
load('./Data/ParamInit/diParam.RData')
ttParam <- ttParam[, 1:8]
omParam <- omParam[, 1:10]
exParam <- exParam[, 1:12]
apParam <- apParam[, 1:9]
paParam <- paParam[, 1:7]
diParam <- diParam[, 1:6]

# Lists
tt <- om <- ex <- ap <- pa <- vector('list', nrow(ttParam))

# Disturbances
for(i in 1:100) {
tt[[i]] <- univariateDisturbance(FUN = ttEq,
                            param = split(ttParam[i, ], colnames(ttParam)),
                            percent = .1)

om[[i]] <- univariateDisturbance(FUN = omEq,
                            param = split(omParam[i, ], colnames(omParam)),
                            percent = .1)

ex[[i]] <- univariateDisturbance(FUN = exEq,
                            param = split(exParam[i, ], colnames(exParam)),
                            percent = .1)

ap[[i]] <- univariateDisturbance(FUN = apEq,
                            param = split(apParam[i, ], colnames(apParam)),
                            percent = .1)

pa[[i]] <- univariateDisturbance(FUN = paEq,
                            param = split(paParam[i, ], colnames(paParam)),
                            percent = .1)
}

di <- univariateDisturbance(FUN = diEq,
                            param = split(diParam, names(diParam)),
                            percent = .1)

# Transform to data frames and add species and motif names
tt <- bind_rows(tt) %>% mutate(motif = 'tt', species = rep(c('x','y','z'), length(tt)))
om <- bind_rows(om) %>% mutate(motif = 'om', species = rep(c('x','y','z'), length(om)))
ex <- bind_rows(ex) %>% mutate(motif = 'ex', species = rep(c('x','y','z'), length(ex)))
ap <- bind_rows(ap) %>% mutate(motif = 'ap', species = rep(c('x','y','z'), length(ap)))
pa <- bind_rows(pa) %>% mutate(motif = 'pa', species = rep(c('x','y','z'), length(pa)))
di <- bind_rows(di) %>% mutate(motif = 'di', species = c('x','y','z'))



# Single dataset - abundance variation per pathway of univariate effect
uni <- bind_rows(tt,om,ex,ap,pa,di) %>%
       mutate(position = paste0(motif, species)) %>%
       gather(parameters, delta, -motif, -species, -position) %>%
       mutate(pathway = paste0(position,'-',parameters)) %>%
       na.omit()


# Remove positions and unstudied parameters
pos <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz','pax','pay','paz','dix')
rmP <- c('alpha','alpha_z','alpha_y','alpha_x','alpha_zy','alpha_yz')
uni <- uni[uni$position %in% pos & !uni$parameters %in% rmP, ]

# Transform 'r' parameter
uni$parameters <- gsub('^r$','r_x', uni$parameters)

# Summarise dataset
uni <- uni %>%
       group_by(pathway, motif, species, parameters, position) %>%
       summarise(Mean = mean(delta),
                 Med = median(delta),
                 SD = sd(delta),
                 SE = SD/sqrt(n()),
                 CIp = Mean + (1.96*SE),
                 CIm = Mean - (1.96*SE)) %>%
       arrange(Mean)

# Export
save(uni, file = './Data/Univariate.RData')

# Dataset for species profile
spProf <- bind_rows(tt,om,ex,ap,pa,di) %>%
          mutate(position = paste0(motif, species)) %>%
          gather(parameters, delta, -motif, -species, -position) %>%
          mutate(pathway = paste0(position,'-',parameters)) %>%
          na.omit()

# Remove positions and unstudied parameters
pos <- c('ttx','tty','ttz','omx','omy','omz','exx','exz','apx','apz','pax','pay','paz','dix')
rmP <- c('alpha','alpha_z','alpha_y','alpha_x','alpha_zy','alpha_yz')
spProf <- spProf[spProf$position %in% pos & !spProf$parameters %in% rmP, ]

# Transform 'r' parameter
uni$parameters <- gsub('^r$','r_x', uni$parameters)


# Summarise dataset
spProf <- spProf %>%
       group_by(position) %>%
       summarise(Mean = mean(delta),
                 Med = median(delta),
                 SD = sd(delta),
                 SE = SD/sqrt(n()),
                 CIp = Mean + (1.96*SE),
                 CIm = Mean - (1.96*SE)) %>%
       arrange(Mean)

# Export
save(spProf, file = './Data/UnivariatePosition.RData')
