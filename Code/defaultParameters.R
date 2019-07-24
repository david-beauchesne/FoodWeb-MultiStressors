#' Examples
#' defaultParam('tritrophic')
#' defaultParam('omnivory')
#' defaultParam('apparent')
#' defaultParam('competitive')
#' defaultParam('partial')
#'
#'
#'

defaultParam <- function(motif) {
  p <- list(
    tritrophic = list(
      r = 1,      # Growth rate
      a = .001,   # Resource density-dependence effect
      b = .01 ,   # Meso-predator attack rate
      u = .1,     # Meso-predator conversion efficiency
      d = .01,    # Predator attack rate
      w = .5,     # Predator conversion efficiency
     my = .01,    # Meso-predator mortality rate
     mz = .1      # Predator mortality rate
    ),

    omnivory = list(
      r = 1,      # Growth rate
      a = .001,   # Resource density-dependence effect
      b = .0008,  # Meso-predator attack rate
      u = .375,   # Meso-predator conversion efficiency
      g = .0008,  # Predator attack rate on resource
      v = .125,   # Predator conversion efficiency of resource
      d = .0002,  # Predator attack rate on meso-predator
      w = .5,     # Predator conversion efficiency of meso-predator
     my = .1,     # Meso-predator mortality rate
     mz = .1      # Predator mortality rate
    ),

    exploitative = list(
      r = 1,      # Growth rate
    aii = .001,   # Resource density-dependence effect
      b = .01,    # Species y attack rate on species x
      u = .1,     # Species y conversion rate of species x
      g = .01,    # Species z attack rate on species x
      v = .1,     # Species z conversion rate of species x
     my = .1,     # Species y mortality rate
     mz = .1,     # Species z mortality rate
    ajj = .01,    # Density dependence effect of species y on itself
    ajk = .01,    # Competitive effect of species z on species y
    akk = .01,    # Density dependence effect of species z on itself
    akj = .01     # Competitive effect of species y on species z
   ),

    apparent = list(
     rx = 1,      # Growth rate of species x
     ry = 1,      # Growth rate of species y
     ax = .001,   # Species x density-dependence effect
     ay = .001,   # Species y density-dependence effect
      g = .01,    # Predator attack rate on species x
      v = .1,     # Predator conversion efficiency of soecies x
      d = .01,    # Predator attack rate on speciex y
      w = .1,     # Predator conversion efficiency of speciex y
     mz = .1      # Predator mortality rate
    ),

    partial = list(
     rx = 1,      # Growth rate of species x
     ax = .001,   # Species x density-dependence effect
     rz = 1,      # Growth rate of species z
     az = .001,   # Species z density-dependence effect
      b = .01,    # Species y attack rate on species x
      u = .1,     # Species y conversion rate of species x
     my = .1      # Species y mortality rate
    ),

    disconnected = list(
     rx = 1,      # Growth rate of species x
     ax = .001,   # Species x density-dependence effect
     ry = 1,      # Growth rate of species y
     ay = .001,   # Species y density-dependence effect
     rz = 1,      # Growth rate of species z
     az = .001   # Species z density-dependence effect
    )
  )

  p[[motif]]
}
