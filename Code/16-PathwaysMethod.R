# source('Code/16-PathwaysMethod.R')
# Library
library(graphicsutils)
library(latex2exp)


# Points
pt <- data.frame(x = c(.35,-.35,.35),
                 y = c(-1,.3,1))

# Lines
l <- data.frame(x1 = c(-.24,  -0.285,   0.225, 0.26,  0.32,  0.38),
                x2 = c(.285,   0.2325, -0.26, -0.23,  0.32,  0.38),
                y1 = c(.15,    0.1,     .925,  0.86,  0.8,  0.8),
                y2 = c(-.825, -0.875,   0.44,  0.37, -0.8, -0.8),
                arrow = c(1,2,2,1,1,2))

txt <- data.frame(txt = c('$e_{\\textit{ij}}$', '$\\alpha_{\\textit{ij}}$', '$\\alpha_{\\textit{jk}}$', '$e_{\\textit{jk}}$', '$e_{\\textit{ik}}$', '$\\alpha_{\\textit{ik}}$'),
                  x = (l$x1+l$x2)/2,
                  y = (l$y1+l$y2)/2,
                  adjX = c(.35,.65,.65,.35,.75,.25),
                  adjY = c(.4,.6,.35,.8,.5,.5),
                  stringsAsFactors = F)

txt2  <- data.frame(txt = c('$\\textit{r_i}$','$\\textit{m_j}','\\textit{m_k}'),
                    x = c(pt$x[1], pt$x[2]-.175, pt$x[3]),
                    y = c(pt$y[1]-.225, pt$y[2], pt$y[3]+.225))

# Plot
png('./Figures/PathwaysMethod.png', res = 900, width = 80, height = 100, units = "mm")
par(mar = c(0,0,0,0), family = 'serif')
plot0(x = c(-.8,.8), y = c(-1.5,1.5))

# Arrows
for(i in 1:nrow(l)) arrows(l$x1[i], l$y1[i], l$x2[i], l$y2[i], length = .05, code = l$arrow[i], xpd = TRUE, lwd = 2)

# Positions
points(x = pt$x, y = pt$y, cex = 4, col = '#000000', bg = '#bdbdbd', pch = 21, lwd = 3)

# Text
points(x = txt$x, y = txt$y, col = '#ffffff', bg = '#ffffff', pch = 21, lwd = 15)
text(x = pt$x, y = pt$y, labels = c('i','j','k'), adj = c(.5,.5), font = 4)
for(i in 1:nrow(txt)) text(x = txt$x[i], y = txt$y[i], labels = TeX(txt$txt[i]), adj = c(txt$adjX[i], txt$adjY[i]))
text(x = txt2$x, y = txt2$y, labels = TeX(txt2$txt), adj = c(.5,.5))
dev.off()
