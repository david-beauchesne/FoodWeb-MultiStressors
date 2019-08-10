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
      alpha = .001,   # Resource density-dependence effect
       beta = .01 ,   # Meso-predator attack rate
         mu = .1,     # Meso-predator conversion efficiency
      delta = .01,    # Predator attack rate
      omega = .5,     # Predator conversion efficiency
        m_y = .01,    # Meso-predator mortality rate
        m_z = .1      # Predator mortality rate
    ),

    omnivory = list(
          r = 1,      # Growth rate
      alpha = .001,   # Resource density-dependence effect
       beta = .0008,  # Meso-predator attack rate
         mu = .375,   # Meso-predator conversion efficiency
      gamma = .0008,  # Predator attack rate on resource
         nu = .125,   # Predator conversion efficiency of resource
      delta = .0002,  # Predator attack rate on meso-predator
      omega = .5,     # Predator conversion efficiency of meso-predator
        m_y = .1,     # Meso-predator mortality rate
        m_z = .1      # Predator mortality rate
    ),

    exploitative = list(
          r = 1,      # Growth rate
        alpha_x =  .001,  # Resource density-dependence effect
       beta = .01,    # Species y attack rate on species x
         mu = .1,     # Species y conversion rate of species x
      gamma = .01,    # Species z attack rate on species x
         nu = .1,     # Species z conversion rate of species x
        m_y = .1,     # Species y mortality rate
        m_z = .1,     # Species z mortality rate
        alpha_y = .01,    # Density dependence effect of species y on itself
       alpha_yz = .01,    # Competitive effect of species z on species y
        alpha_z = .01,    # Density dependence effect of species z on itself
       alpha_zy = .01     # Competitive effect of species y on species z
   ),

    apparent = list(
        r_x = 1,      # Growth rate of species x
        r_y = 1,      # Growth rate of species y
        alpha_x = .001,   # Species x density-dependence effect
        alpha_y = .001,   # Species y density-dependence effect
      gamma = .01,    # Predator attack rate on species x
         nu = .1,     # Predator conversion efficiency of soecies x
      delta = .01,    # Predator attack rate on speciex y
      omega = .1,     # Predator conversion efficiency of speciex y
        m_z = .1      # Predator mortality rate
    ),

    partial = list(
        r_x = 1,      # Growth rate of species x
        alpha_x = .001,   # Species x density-dependence effect
        r_z = 1,      # Growth rate of species z
        alpha_z = .001,   # Species z density-dependence effect
       beta = .01,    # Species y attack rate on species x
         mu = .1,     # Species y conversion rate of species x
        m_y = .1      # Species y mortality rate
    ),

    disconnected = list(
        r_x = 1,      # Growth rate of species x
        alpha_x = .001,   # Species x density-dependence effect
        r_y = 1,      # Growth rate of species y
        alpha_y = .001,   # Species y density-dependence effect
        r_z = 1,      # Growth rate of species z
        alpha_z = .001    # Species z density-dependence effect
    )
  )

  p[[motif]]
}
