# source('./Code/Figures/FS2-Stability.R')
load('./Data/stability.RData')
source('./Code/0-Param.R')


# New figure 1
png('./Figures/FS2-Stability.png', width = 2000, height = 1250, res = 200, pointsize = 12)
par(mar = c(5,5,1,1), family = 'serif')
yR <- c(-0.1 , 0.03)
xR <- c(0.5, 9.5)
plot0(x = xR, y = yR)
axis(1, cex.axis = .9, at = 1:9, labels = 1:9, line = 1)
axis(2, cex.axis = .9)#, at = seq(0,0.15,by=.025), labels = seq(0,.15,by=.025))
mtext(text = TeX('\\textbf{Variation in stability} ($\\textit{St_{i,G}}$)'), side = 2, line = 2.75, cex = 1.25)
mtext(text = TeX('\\textbf{Number of parameters}'), side = 1, line = 3.5, cex = 1.25)
# text(x = xR[1]+.4, y = .145, labels = 'Positive trophic sensitivity', adj = c(0,.5), cex = .95)
# text(x = xR[1]+.4, y = .135, labels = 'Negative trophic sensitivity', adj = c(0,.5), cex = .95)
# polygon(x = c(xR[1], rep(xR[1]+.3, 2), xR[1]), y = c(.1475,.1475,.1425,.1425), col = '#52657c66', bg = '#52657c66')
# polygon(x = c(xR[1], rep(xR[1]+.3, 2), xR[1]), y = c(.1375,.1375,.1325,.1325), col = '#db9f3866', bg = '#db9f3866')
# points(x = xR[1], y = .115, pch = 20, cex = 1,
# points(x = xR[1], y = .125, pch = 20, cex = 1, col = '#c4793c', bg = '#c4793c')
abline(h = 0, lty = 2)
arrows(9, -.02, 9, -.05, length = .05, code = 2, xpd = TRUE, lwd = 1.5, col = '#000000')
text(x=9.3, y=-.035, labels="Increasing\nstability", srt=90, adj=c(.5,.5))

# Positive and negative values
pos <- stability
mot <- c('om','tt','ex','ap')
colmotif <- colsPos[c(1,3,4,2)]
jr <- c(-.3,-.1,.1,.3)

for(i in 1:9) {
  for(j in 1:4) {
    uid <- pos$nParam == i & pos$Motif %in% mot[j]
    if (sum(uid) > 3) {
      boxplot(pos$StabilityVariation[uid], add = TRUE, at = i+jr[j], frame = FALSE, range = 3,
              col = paste0(colmotif[j],'66'), boxwex=0.3, axes=FALSE)
    } else if (sum(uid) > 0) {
      points(x = i+jr[j], y = pos$StabilityVariation[uid], pch = 20, cex = 1.25, col = paste0(colmotif[j], '66'))
    }
  }
}

# Legend
points(x = rep(.5, 4), y = seq(-.07,by=-.01,length.out=4), pch = 22, cex = 1.8,
       bg = paste0(colmotif,'66'), lwd = 1)

text(x = rep(.75, 4), y = seq(-.07,by=-.01,length.out=4), cex = 1.1, adj = c(0,.5),
     labels = c('Omnivory','Tri-trophic food chain',
                'Exploitative competition','Apparent competition'))


dev.off()
