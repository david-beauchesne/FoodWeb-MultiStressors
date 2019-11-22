source('./Code/0-Param.R')
# Sensitivity
load('./Data/DisturbancesAll.RData')
sensPos <- int %>%
           group_by(position) %>%
           summarise(Med = median(delta),
                     Mean = mean(delta),
                     SD = sd(delta),
                     SE = SD/sqrt(n()),
                     CIp = Mean + (1.96*SE),
                     CIm = Mean - (1.96*SE)) %>%
           arrange(position)


# Amplification
load('./Data/AdditiveAll.RData')
ampPos <- intAdd %>%
          group_by(position) %>%
          summarise(Med = median(Int),
                    Mean = mean(Int),
                    SD = sd(Int),
                    SE = SD/sqrt(n()),
                    CIp = Mean + (1.96*SE),
                    CIm = Mean - (1.96*SE)) %>%
          arrange(position)

# Plot
plot0(x = c(-.0002,.0004), y = c(-.06, .06))
abline(h=0)
abline(v=0)
ampTh <- .0002
sensTh <- .01
abline(v = c(-ampTh,ampTh), lty = 2)
abline(h = c(-sensTh,sensTh), lty = 2)
mtext(side = 2, text = 'Sensitivity', line = 1, cex = 1.25, font = 2)
mtext(side = 3, text = 'Amplification', line = 1, cex = 1.25, font = 2)
text(x = par('usr')[1], y = sensTh, adj = c(0,0), labels = 'Weak entry points')
text(x = par('usr')[1], y = -sensTh, adj = c(0,1), labels = 'Weak entry points')
text(x = ampTh, y = par('usr')[4], adj = c(0,1), labels = 'Biotic amplifiers')
text(x = -ampTh, y = par('usr')[4], adj = c(1,1), labels = 'Biotic buffers')


points(x = ampPos$Mean, y = sensPos$Mean)

for(i in 1:nrow(ampPos)) {
#i = 1
plotMotifs(motif = substr(ampPos$position[i],1,2),
           position = substr(ampPos$position[i],3,3),
           x = ampPos$Mean[i], y = sensPos$Mean[i],
           add = T, scalingX = .000025, scalingY = .004, cex = 1.25)
}
