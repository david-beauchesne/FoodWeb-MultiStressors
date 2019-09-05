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
di <- distSpace(diSpace, 'di')

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
#                                  Exploration
# -----------------------------------------------------------------------------
int$delta2 <- abs(int$delta)/.01
int$delta3 <- abs(int$delta)/(int$nParam*.01)

# Data
multi <- int

par(mfrow = c(2,3))
# Pathways
multiPath <- multi %>%
             group_by(motif,pathway,species,position) %>%
             summarise(Med = median(delta2),
                       Mean = mean(delta2),
                       SD = sd(delta2),
                       SE = SD/sqrt(n()),
                       CIp = Mean + (1.96*SE),
                       CIm = Mean - (1.96*SE)) %>%
             mutate(param = stringr::str_split(pathway, '-')) %>%
             arrange(Mean)

# Remove NAs
idNA <- is.na(multiPath$SD)
multiPath$SD[idNA] <- 0
multiPath$SE[idNA] <- 0
multiPath[idNA, c('CIp','CIm')] <- multiPath$Mean[idNA]

# Positions
multiPos <- multi %>%
            group_by(position) %>%
            summarise(Med = median(delta2),
                      Mean = mean(delta2),
                      SD = sd(delta2),
                      SE = SD/sqrt(n()),
                      CIp = Mean + (1.96*SE),
                      CIm = Mean - (1.96*SE)) %>%
            arrange(Mean)


# Motifs
multiMot <- multi %>%
            group_by(motif) %>%
            summarise(Med = median(delta2),
                      Mean = mean(delta2),
                      SD = sd(delta2),
                      SE = SD/sqrt(n()),
                      CIp = Mean + (1.96*SE),
                      CIm = Mean - (1.96*SE)) %>%
            arrange(Mean)


# Plot
par(mar = c(2,5,.5,.5))
plot0(x = c(0,nrow(multiPath)), y = c(0, 20))
axis(2)
abline(h = 1, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(multiPath), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
polygon(x = c(1:nrow(multiPath), nrow(multiPath):1), y = c(multiPath$CIm, rev(multiPath$CIp)), col = '#23349922', border = 'transparent')
lines(multiPath$Mean, col = '#233499', lwd = 2)
# lines(multiPath$Med, col = '#233499', lwd = 2)


par(mar = c(2,5,.5,.5))
plot0(x = c(1,nrow(multiPos)), y = c(0, 10))
axis(2)
abline(h = 1, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(multiPos), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
for(i in 1:nrow(multiPos)) {
  lines(x = c(i,i), y = c(multiPos$Mean[i], multiPos$CIp[i]), col = '#233499')
  lines(x = c(i,i), y = c(multiPos$CIm[i], multiPos$Mean[i]), col = '#233499')
  lines(x = c(i-.2, i+.2), y = c(multiPos$CIp[i], multiPos$CIp[i]))
  lines(x = c(i-.2, i+.2), y = c(multiPos$CIm[i], multiPos$CIm[i]))
}
points(multiPos$Mean, col = '#233499', cex = 1, pch = 15)
points(multiPos$Med, col = '#997123', cex = 1, pch = 15)

# Add motifs
motif <- substr(multiPos$position,1,2)
sp <- substr(multiPos$position,3,3)

for(i in 1:nrow(multiPos)) {
  plotMotifs(motif = motif[i], position = sp[i],
             # path = '', x = i, y = multiPos$Mean[i], scalingY = .2, scalingX = .5,
             path = '', x = i, y = 9, scalingY = .4, scalingX = .5,
             add = T, cex = 1, lwd = 1.15)
}

par(mar = c(2,5,.5,.5))
plot0(x = c(1,nrow(multiMot)), y = c(0, 10))
axis(2)
abline(h = 1, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(multiMot), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
for(i in 1:nrow(multiMot)) {
  lines(x = c(i,i), y = c(multiMot$Mean[i], multiMot$CIp[i]), col = '#233499')
  lines(x = c(i,i), y = c(multiMot$CIm[i], multiMot$Mean[i]), col = '#233499')
  lines(x = c(i-.2, i+.2), y = c(multiMot$CIp[i], multiMot$CIp[i]))
  lines(x = c(i-.2, i+.2), y = c(multiMot$CIm[i], multiMot$CIm[i]))
}
points(multiMot$Mean, col = '#233499', cex = 1, pch = 15)
points(multiMot$Med, col = '#997123', cex = 1, pch = 15)

# Add motifs
motif <- multiMot$motif

for(i in 1:nrow(multiMot)) {
  plotMotifs(motif = motif[i], position = '',
             # path = '', x = i, y = multiMot$Mean[i], scalingY = .2, scalingX = .5,
             path = '', x = i, y = 9, scalingY = .4, scalingX = .25,
             add = T, cex = 1, lwd = 1.15)
}

# Pathways
multiPath <- multi %>%
             group_by(motif,pathway,species,position) %>%
             summarise(Med = median(delta3),
                       Mean = mean(delta3),
                       SD = sd(delta3),
                       SE = SD/sqrt(n()),
                       CIp = Mean + (1.96*SE),
                       CIm = Mean - (1.96*SE)) %>%
             mutate(param = stringr::str_split(pathway, '-')) %>%
             arrange(Mean)

# Remove NAs
idNA <- is.na(multiPath$SD)
multiPath$SD[idNA] <- 0
multiPath$SE[idNA] <- 0
multiPath[idNA, c('CIp','CIm')] <- multiPath$Mean[idNA]

# Positions
multiPos <- multi %>%
            group_by(position) %>%
            summarise(Med = median(delta3),
                      Mean = mean(delta3),
                      SD = sd(delta3),
                      SE = SD/sqrt(n()),
                      CIp = Mean + (1.96*SE),
                      CIm = Mean - (1.96*SE)) %>%
            arrange(Mean)

# Motifs
multiMot <- multi %>%
            group_by(motif) %>%
            summarise(Med = median(delta3),
                      Mean = mean(delta3),
                      SD = sd(delta3),
                      SE = SD/sqrt(n()),
                      CIp = Mean + (1.96*SE),
                      CIm = Mean - (1.96*SE)) %>%
            arrange(Mean)


# Plot
par(mar = c(2,5,.5,.5))
plot0(x = c(0,nrow(multiPath)), y = c(0, 5))
axis(2)
abline(h = 1, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(multiPath), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
polygon(x = c(1:nrow(multiPath), nrow(multiPath):1), y = c(multiPath$CIm, rev(multiPath$CIp)), col = '#23349922', border = 'transparent')
lines(multiPath$Mean, col = '#233499', lwd = 2)


par(mar = c(2,5,.5,.5))
plot0(x = c(1,nrow(multiPos)), y = c(0, 2.5))
axis(2)
abline(h = 1, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(multiPos), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
for(i in 1:nrow(multiPos)) {
  lines(x = c(i,i), y = c(multiPos$Mean[i], multiPos$CIp[i]), col = '#233499')
  lines(x = c(i,i), y = c(multiPos$CIm[i], multiPos$Mean[i]), col = '#233499')
  lines(x = c(i-.2, i+.2), y = c(multiPos$CIp[i], multiPos$CIp[i]))
  lines(x = c(i-.2, i+.2), y = c(multiPos$CIm[i], multiPos$CIm[i]))
}
points(multiPos$Mean, col = '#233499', cex = 1, pch = 15)
points(multiPos$Med, col = '#997123', cex = 1, pch = 15)

# Add motifs
motif <- substr(multiPos$position,1,2)
sp <- substr(multiPos$position,3,3)

for(i in 1:nrow(multiPos)) {
  plotMotifs(motif = motif[i], position = sp[i],
             #path = '', x = i, y = multiPos$Mean[i], scalingY = .2, scalingX = .5,
             path = '', x = i, y = 2, scalingY = .1, scalingX = .5,
             add = T, cex = 1, lwd = 1.15)
}

par(mar = c(2,5,.5,.5))
plot0(x = c(1,nrow(multiMot)), y = c(0, 2.5))
axis(2)
abline(h = 1, lty = 2, col = '#00000055')
mtext(text = 'Rank', side = 1, at = nrow(multiMot), line = .75)
u <- par("usr")
arrows(u[1], u[3], u[2], u[3], length = .05, code = 2, xpd = TRUE)
for(i in 1:nrow(multiMot)) {
  lines(x = c(i,i), y = c(multiMot$Mean[i], multiMot$CIp[i]), col = '#233499')
  lines(x = c(i,i), y = c(multiMot$CIm[i], multiMot$Mean[i]), col = '#233499')
  lines(x = c(i-.2, i+.2), y = c(multiMot$CIp[i], multiMot$CIp[i]))
  lines(x = c(i-.2, i+.2), y = c(multiMot$CIm[i], multiMot$CIm[i]))
}
points(multiMot$Mean, col = '#233499', cex = 1, pch = 15)
points(multiMot$Med, col = '#997123', cex = 1, pch = 15)

# Add motifs
motif <- multiMot$motif

for(i in 1:nrow(multiMot)) {
  plotMotifs(motif = motif[i], position = '',
             # path = '', x = i, y = multiMot$Mean[i], scalingY = .2, scalingX = .5,
             path = '', x = i, y = 2, scalingY = .1, scalingX = .25,
             add = T, cex = 1, lwd = 1.15)
}
