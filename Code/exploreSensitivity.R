library(tidyverse)
load('./Data/UnivariatePath.RData')
load('./Data/MultivariatePath.RData')

# Proportion of weak entry points in univariate pathways of effect
th <- 0.01
WEPnegU <- sum(uniPath$Mean < -th) / nrow(uniPath)
WEPposU <- sum(uniPath$Mean > th) / nrow(uniPath)
WEPU <- WEPnegU + WEPposU
WEPnegU
WEPposU
WEPU

# Proportion of biotic sinks in univariate pathways of effect
BSU <- sum(uniPath$Mean == 0) / nrow(uniPath)
BSU

# ------------------------------------------------------------------------
# Proportion of weak entry points in multivariate pathways of effect
WEPnegM <- sum(multiPath$Mean < -th) / nrow(multiPath)
WEPposM <- sum(multiPath$Mean > th) / nrow(multiPath)
WEPM <- WEPnegM + WEPposM
WEPnegM
WEPposM
WEPM

# Proportion of biotic sinks in multivariate pathways of effect
BSM <- sum(multiPath$Mean == 0) / nrow(multiPath)
BSM

# ------------------------------------------------------------------------
# Motifs in univariate and multivariate weak entry points
WEPmotifsUM <- sort(table(uniPath$motif[uniPath$Mean < -th]))
WEPmotifsUP <- sort(table(uniPath$motif[uniPath$Mean > th]))
BSmotifsU <- sort(table(uniPath$motif[uniPath$Mean == 0]))
WEPmotifsUM
WEPmotifsUP
BSmotifsU

WEPmotifsMM <- sort(table(multiPath$motif[multiPath$Mean < -th]))
WEPmotifsMP <- sort(table(multiPath$motif[multiPath$Mean > th]))
BSmotifsM <- sort(table(multiPath$motif[multiPath$Mean == 0]))
WEPmotifsMM
WEPmotifsMP
BSmotifsM

# ------------------------------------------------------------------------
# Positions in univariate and multivariate weak entry points
WEPmotifsUM <- sort(table(uniPath$position[uniPath$Mean < -th]))
WEPmotifsUP <- sort(table(uniPath$position[uniPath$Mean > th]))
BSmotifsU <- sort(table(uniPath$position[uniPath$Mean == 0]))
WEPmotifsUM
WEPmotifsUP
BSmotifsU

WEPmotifsMM <- sort(table(multiPath$position[multiPath$Mean < -th]))
WEPmotifsMP <- sort(table(multiPath$position[multiPath$Mean > th]))
BSmotifsM <- sort(table(multiPath$position[multiPath$Mean == 0]))
WEPmotifsMM
WEPmotifsMP
BSmotifsM
