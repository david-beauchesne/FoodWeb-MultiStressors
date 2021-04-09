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
png('./Figures/FR7-NSL_KC.png', units = "mm", width = 140, height = 150, res = 300)
mat <- matrix(1:2, nrow = 2)
layout(mat, heights = c(2.2, 1))
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

points(x = fwNSL$Sensitivity, y = fwNSL$Amplification, pch = 21,
       cex = 1.6, bg = "grey80", col = "grey50")
n <- nrow(fwNSL)
# vc_pos <- rep(3, n)
# vc_pos[c(3, 8, 9, 19, 21, 26, 28)] <- 1
# vc_pos[c(8, 12, 17, 24, 27)] <- 2
# vc_pos[c(10, 18, 23, 25, 28, 29)] <- 4
txt <- seq_len(n)
slc <- c(8, 17, 18)
txt[slc] <- ""
text(fwNSL$Sensitivity, y = fwNSL$Amplification, label = txt, cex = .625,  col = "grey10")
text(x = fwNSL$Sensitivity[slc], y = fwNSL$Amplification[slc], label = slc,   cex = .625, pos = c(2, 2, 4), col = "grey10", offset = c(.4, .5, .5))
# 

# , 17:19)
# points(x = fwNSL$Sensitivity[slc], y = fwNSL$Amplification[slc], pch = 19,
#        cex = 1.5, col = "grey80")
# vc_pos <- rep(1, n)
# vc_pos[c(1, 3)] <- 2
# vc_pos[c(4)] <- 3
# 

# Legend
par(mar = c(0,0,0,0), xaxs = "i", yaxs = "i")
plot0(c(0, 3), y = c(0, 12))
k <- 1
for(i in 0:2) {
  for(j in 1:11) {
    text(x = 1*i + .15, y = 12-j, labels = paste0(k, "."), cex = .7, offset = .2, pos = 2)
    text(x = 1*i + .15, y = 12-j, labels = fwNSL$Description[k], pos = 4, cex = .7, offset = .2)
    k <- k + 1
    if (k == 33) break
  }
}

dev.off()
