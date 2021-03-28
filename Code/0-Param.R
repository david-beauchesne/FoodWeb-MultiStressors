# Libraries
library(tidyverse)
library(graphicsutils)
library(magrittr)
library(latex2exp)


# Functions
source('./Code/Functions/tritrophic.R')
source('./Code/Functions/omnivory.R')
source('./Code/Functions/apparent.R')
source('./Code/Functions/exploitative.R')
source('./Code/Functions/partial.R')
source('./Code/Functions/disconnected.R')
source('./Code/Functions/simAnnealing.R')
source('./Code/Functions/candidateParameters.R')
source('./Code/Functions/summarize_impacts.R')

# Disturbance value to use
distValue = .01 # (1%)

# Thresholds
sensTh <- .01
ampTh <- .0002

# Colors
cols <- c('#4B7894','#B45423')
cols <- c('#96658c','#68908b','#4B7894','#971c3c')
colP <- c('#a84d4dcc','#a84d4d44')
colB <- c('#196f6fcc','#196f6f44')
colM <- c('#db9f38cc','#db9f3844')


colsPos <- c("#3fb3b2", "#ffdd55", "#c7254e", "#1b95e0", "#8555b4")
