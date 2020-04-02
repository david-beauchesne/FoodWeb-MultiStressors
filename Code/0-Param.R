# Libraries
library(tidyverse)
library(graphicsutils)
library(magrittr)
library(latex2exp)


# Functions
# source('./Functions/defaultParameters.R')
# source('./Functions/equilibrium.R')
# source('./Functions/disturbance.R')
# source('./Functions/disturbBoxplot.R')
# source('./Functions/stability.R')
source('./Functions/simAnnealing.R')
source('./Functions/tritrophic.R')
source('./Functions/omnivory.R')
source('./Functions/apparent.R')
source('./Functions/exploitative.R')
source('./Functions/partial.R')
source('./Functions/disconnected.R')
source('./Functions/paramFix.R')


# source('./Functions/parameterSpace.R')
source('./Functions/univariateDisturbance.R')
source('./Functions/multivariateDisturbance.R')
source('./Functions/additivity.R')
source('./Functions/variance.R')
source('./Functions/plotMotifs.R')

# Disturbance value to use
distValue = .01 # (1%)

# Colors
cols <- c('#4B7894','#B45423')
cols <- c('#96658c','#68908b','#4B7894','#971c3c')
colP <- c('#a84d4dcc','#a84d4d44')
colB <- c('#196f6fcc','#196f6f44')
colM <- c('#db9f38cc','#db9f3844')
