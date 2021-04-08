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
png('./Figures/FR7-NSL_KC.png', units = "mm", width = 110, height = 150, res = 300)
mat <- matrix(1:2, nrow = 2)
layout(mat, heights = c(1, .5))
par(mar = c(4, 4, 2.25, 2.5), family = 'serif', mgp = c(2, .7, 0))
yR <- c(-.05,.15)
xR <- c(-7, 5)
plot0(x = xR, y = yR)
ext <- par('usr')
for (i in 1:4) axis(i, cex.axis = 1, las = 1)
box(lwd = 2)
abline(h=0, lty = 2, lwd = 2)
abline(v=0, lty = 2, lwd = 2)
mtext(text = TeX('\\textbf{Trophic sensitivity} ($\\textit{S_m}$)'), side = 1, line = 2.5, cex = 1)
mtext(text = TeX('\\textbf{Trophic amplification} ($\\textit{A_m}$)'), side = 2, line = 2.5, cex = 1)

points(x = fwNSL$Sensitivity, y = fwNSL$Amplification, pch = 19,
       cex = .7, col = "grey15")
n <- nrow(fwNSL)
vc_pos <- rep(3, n)
vc_pos[c(3, 8, 9, 19, 21, 26, 28)] <- 1
vc_pos[c(8, 12, 17, 24, 27)] <- 2
vc_pos[c(10, 18, 23, 25, 28, 29)] <- 4
text(fwNSL$Sensitivity, y = fwNSL$Amplification, label = seq_len(n), 
  pos = vc_pos, cex = .9, offset = .28)

# Legend
par(mar = c(0,0,0,0), xaxs = "i", yaxs = "i")
plot0(c(0,5), y = c(0,9))
k <- 1
for(i in 0:3) {
  for(j in 1:8) {
    text(x = i + .25, y = 9.06-j, labels = paste0(k, "."), cex = .75, offset = .4)
    text(x = i + .25, y = 9-j, labels = fw$Description[k], pos = 4, cex = .7, offset = .4)
    k <- k + 1
  }
}

dev.off()
