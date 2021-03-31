# source('./Code/Figures/FR7-NSL.R')
source('./Code/0-Param.R')

# Data
load('./Data/Food_Web_Vulnerability.RData')
fw <- read.table('./Data/FoodWeb/disturbances0.txt', sep = '\t', header = T, stringsAsFactors = F) # FW


# Build dataset for figure per food web
# Northern St. Lawrence
fwNSL <- fw %>%
         select(-Species) %>%
         left_join(foodwebVulnerability[[2]], by = c('Group' = 'species')) %>%
         filter(!is.na(Sensitivity)) %>%
         arrange(Sensitivity)

# Figure
png('./Figures/FR7-NSL.png', width = 1500, height = 2250, res = 200, pointsize = 12)
mat <- matrix(1:2, nrow = 2)
layout(mat, heights = c(1,.5))
par(mar = c(4,4,4,4), family = 'serif')
yR <- c(-.05,.15)
xR <- c(-7, 5)
plot0(x = xR, y = yR)
ext <- par('usr')
axis(1, cex.axis = 1.3)
axis(2, cex.axis = 1.3)
axis(3, cex.axis = 1.3)
axis(4, cex.axis = 1.3)
box(lwd = 2)
abline(h=0, lty = 2, lwd = 2)
abline(v=0, lty = 2, lwd = 2)
mtext(text = TeX('\\textbf{Trophic sensitivity} ($\\textit{S_m}$)'), side = 1, line = 2.5, cex = 1.25)
mtext(text = TeX('\\textbf{Trophic amplification} ($\\textit{A_m}$)'), side = 2, line = 2.5, cex = 1.25)

points(x = fwNSL$Sensitivity, y = fwNSL$Amplification, pch = 21,
       cex = 1, bg = paste0('#4d4d4f','66'), col = paste0('#4d4d4f','66'), lwd = 2.5)

# Legend
par(mar = c(0,0,0,0))
plot0(c(0,5), y = c(0,9))
for(i in 0:3) {
  for(j in 1:8) {
    text(x = i+.25, y = j, labels = fw$Description[j], adj = c(0,.5), cex = .75)

  }
}



dev.off()
