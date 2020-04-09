# Libraries
library(tidyverse)
library(graphicsutils)
library(magrittr)
library(latex2exp)


# Functions
source('./Functions/tritrophic.R')
source('./Functions/omnivory.R')
source('./Functions/apparent.R')
source('./Functions/exploitative.R')
source('./Functions/partial.R')
source('./Functions/disconnected.R')
source('./Functions/simAnnealing.R')
source('./Functions/candidateParameters.R')
source('./Functions/summarize_impacts.R')

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
