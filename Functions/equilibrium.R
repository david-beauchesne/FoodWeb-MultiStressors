#' Examples
#' equilibrium(motif = 'tritrophic', param = defaultParam('tritrophic'))
#' equilibrium(motif = 'omnivory', param = defaultParam('omnivory'))
#' equilibrium(motif = 'exploitative', param = defaultParam('exploitative'))
#' equilibrium(motif = 'apparent', param = defaultParam('apparent'))
#' equilibrium(motif = 'partial', param = defaultParam('partial'))
#' equilibrium(motif = 'disconnected', param = defaultParam('disconnected'))
#'
#'
#'

equilibrium <- function(motif, param) {
  # Load default parameters
  p <- param

  # ---------------------------------------------------------------------------
  #                              Tri-trophic food chain
  # ---------------------------------------------------------------------------
  if(motif == 'tritrophic') {
    # Parameters
    r     = p$r
    alpha = p$alpha
    beta  = p$beta
    mu    = p$mu
    delta = p$delta
    omega = p$omega
    m_y   = p$m_y
    m_z   = p$m_z

    # Species functions
    x <- (delta*omega*r - beta*m_z)/(alpha*delta*omega)
    y <- m_z/(delta*omega)
    z <- (beta*delta*mu*omega*r - beta^2*m_z*mu - alpha*delta*m_y*omega)/(alpha*delta^2*omega)

    # Evaluate
    xyz <- c(x, y, z, sum(x,y,z))
    names(xyz) <- c('x','y','z','total')
  }

  # ---------------------------------------------------------------------------
  #                                   Omnivory
  # ---------------------------------------------------------------------------
  if(motif == 'omnivory') {
    # Parameters
        r = p$r
    alpha = p$alpha
     beta = p$beta
       mu = p$mu
    delta = p$delta
    omega = p$omega
    gamma = p$gamma
       nu = p$nu
      m_y = p$m_y
      m_z = p$m_z

    # Species functions
    x <- -(gamma*m_y*omega + delta*omega*r - beta*m_z)/(beta*gamma*nu - (beta*gamma*mu + alpha*delta)*omega)
    y <- -(beta*gamma*m_z*mu - gamma^2*m_y*nu - delta*gamma*nu*r + alpha*delta*m_z)/(beta*delta*gamma*nu - (beta*delta*gamma*mu + alpha*delta^2)*omega)
    z <- -(beta*delta*mu*omega*r - beta^2*m_z*mu + beta*gamma*m_y*nu - alpha*delta*m_y*omega)/(beta*delta*gamma*nu - (beta*delta*gamma*mu + alpha*delta^2)*omega)

    # Evaluate
    xyz <- c(x, y, z, sum(x,y,z))
    names(xyz) <- c('x','y','z','total')
  }

  # ---------------------------------------------------------------------------
  #                             Exploitative competition
  # ---------------------------------------------------------------------------
  if(motif == 'exploitative') {
    # Parameters
        r = p$r
      alpha_x = p$alpha_x
     beta = p$beta
       mu = p$mu
    gamma = p$gamma
       nu = p$nu
      m_y = p$m_y
      m_z = p$m_z
      alpha_y = p$alpha_y
     alpha_yz = p$alpha_yz
      alpha_z = p$alpha_z
     alpha_zy = p$alpha_zy

    # Species functions
    x <- ((alpha_z*alpha_zy*gamma - alpha_z*beta)*m_y + (alpha_y*alpha_yz*beta - alpha_y*gamma)*m_z + (alpha_y*alpha_yz*alpha_z*alpha_zy - alpha_y*alpha_z)*r)/(alpha_x*alpha_y*alpha_yz*alpha_z*alpha_zy - alpha_x*alpha_y*alpha_z + (alpha_z*alpha_zy*beta*gamma - alpha_z*beta^2)*mu + (alpha_y*alpha_yz*beta*gamma - alpha_y*gamma^2)*nu)
    y <- -(alpha_x*alpha_y*alpha_yz*m_z + beta*gamma*m_z*mu - gamma^2*m_y*nu - alpha_x*alpha_z*m_y - (alpha_y*alpha_yz*gamma*nu - alpha_z*beta*mu)*r)/(alpha_x*alpha_y*alpha_yz*alpha_z*alpha_zy - alpha_x*alpha_y*alpha_z + (alpha_z*alpha_zy*beta*gamma - alpha_z*beta^2)*mu + (alpha_y*alpha_yz*beta*gamma - alpha_y*gamma^2)*nu)
    z <- -(alpha_x*alpha_z*alpha_zy*m_y - beta^2*m_z*mu + beta*gamma*m_y*nu - alpha_x*alpha_y*m_z - (alpha_z*alpha_zy*beta*mu - alpha_y*gamma*nu)*r)/(alpha_x*alpha_y*alpha_yz*alpha_z*alpha_zy - alpha_x*alpha_y*alpha_z + (alpha_z*alpha_zy*beta*gamma - alpha_z*beta^2)*mu + (alpha_y*alpha_yz*beta*gamma - alpha_y*gamma^2)*nu)

    # Evaluate
    xyz <- c(x, y, z, sum(x,y,z))
    names(xyz) <- c('x','y','z','total')
  }


  # ---------------------------------------------------------------------------
  #                             Apparent competition
  # ---------------------------------------------------------------------------
  if(motif == 'apparent') {
    # Parameters
      r_x = p$r_x
      alpha_x = p$alpha_x
      r_y = p$r_y
      alpha_y = p$alpha_y
    delta = p$delta
    omega = p$omega
    gamma = p$gamma
       nu = p$nu
      m_z = p$m_z

    # Species functions
    x <- (delta^2*omega*r_x - delta*gamma*omega*r_y + alpha_y*gamma*m_z)/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega)
    y <- -(delta*gamma*nu*r_x - gamma^2*nu*r_y - alpha_x*delta*m_z)/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega)
    z <- (alpha_y*gamma*nu*r_x + alpha_x*delta*omega*r_y - alpha_x*alpha_y*m_z)/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega)

    # Evaluate
    xyz <- c(x, y, z, sum(x,y,z))
    names(xyz) <- c('x','y','z','total')
  }


  # ---------------------------------------------------------------------------
  #                             Partially disconnected
  # ---------------------------------------------------------------------------
  if(motif == 'partial') {
    # Parameters
     r_x = p$r_x
     alpha_x = p$alpha_x
     r_z = p$r_z
     alpha_z = p$alpha_z
      mu = p$mu
    beta = p$beta
     m_y = p$m_y

    # Species functions
    x <- m_y/(beta*mu)
    y <- (beta*mu*r_x - alpha_x*m_y)/(beta^2*mu)
    z <- r_z/alpha_z

    # Evaluate
    xyz <- c(x, y, z, sum(x,y,z))
    names(xyz) <- c('x','y','z','total')
  }


  # ---------------------------------------------------------------------------
  #                                 Disconnected
  # ---------------------------------------------------------------------------
  if(motif == 'disconnected') {
    # Parameters
    r_x = p$r_x
    alpha_x = p$alpha_x
    r_y = p$r_y
    alpha_y = p$alpha_y
    r_z = p$r_z
    alpha_z = p$alpha_z

    # Species functions
    x <- r_x/alpha_x
    y <- r_y/alpha_y
    z <- r_z/alpha_z

    # Evaluate
    xyz <- c(x, y, z, sum(x,y,z))
    names(xyz) <- c('x','y','z','total')
  }


  # Return
  xyz
}
