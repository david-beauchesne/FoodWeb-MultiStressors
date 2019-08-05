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
      a_x = p$a_x
     beta = p$beta
       mu = p$mu
    gamma = p$gamma
       nu = p$nu
      m_y = p$m_y
      m_z = p$m_z
      a_y = p$a_y
     a_yz = p$a_yz
      a_z = p$a_z
     a_zy = p$a_zy

    # Species functions
    x <- ((a_z*a_zy*gamma - a_z*beta)*m_y + (a_y*a_yz*beta - a_y*gamma)*m_z + (a_y*a_yz*a_z*a_zy - a_y*a_z)*r)/(a_x*a_y*a_yz*a_z*a_zy - a_x*a_y*a_z + (a_z*a_zy*beta*gamma - a_z*beta^2)*mu + (a_y*a_yz*beta*gamma - a_y*gamma^2)*nu)
    y <- -(a_x*a_y*a_yz*m_z + beta*gamma*m_z*mu - gamma^2*m_y*nu - a_x*a_z*m_y - (a_y*a_yz*gamma*nu - a_z*beta*mu)*r)/(a_x*a_y*a_yz*a_z*a_zy - a_x*a_y*a_z + (a_z*a_zy*beta*gamma - a_z*beta^2)*mu + (a_y*a_yz*beta*gamma - a_y*gamma^2)*nu)
    z <- -(a_x*a_z*a_zy*m_y - beta^2*m_z*mu + beta*gamma*m_y*nu - a_x*a_y*m_z - (a_z*a_zy*beta*mu - a_y*gamma*nu)*r)/(a_x*a_y*a_yz*a_z*a_zy - a_x*a_y*a_z + (a_z*a_zy*beta*gamma - a_z*beta^2)*mu + (a_y*a_yz*beta*gamma - a_y*gamma^2)*nu)

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
      a_x = p$a_x
      r_y = p$r_y
      a_y = p$a_y
    delta = p$delta
    omega = p$omega
    gamma = p$gamma
       nu = p$nu
      m_z = p$m_z

    # Species functions
    x <- (delta^2*omega*r_x - delta*gamma*omega*r_y + a_y*gamma*m_z)/(a_y*gamma^2*nu + a_x*delta^2*omega)
    y <- -(delta*gamma*nu*r_x - gamma^2*nu*r_y - a_x*delta*m_z)/(a_y*gamma^2*nu + a_x*delta^2*omega)
    z <- (a_y*gamma*nu*r_x + a_x*delta*omega*r_y - a_x*a_y*m_z)/(a_y*gamma^2*nu + a_x*delta^2*omega)

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
     a_x = p$a_x
     r_z = p$r_z
     a_z = p$a_z
      mu = p$mu
    beta = p$beta
     m_y = p$m_y

    # Species functions
    x <- m_y/(beta*mu)
    y <- (beta*mu*r_x - a_x*m_y)/(beta^2*mu)
    z <- r_z/a_z

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
    a_x = p$a_x
    r_y = p$r_y
    a_y = p$a_y
    r_z = p$r_z
    a_z = p$a_z

    # Species functions
    x <- r_x/a_x
    y <- r_y/a_y
    z <- r_z/a_z

    # Evaluate
    xyz <- c(x, y, z, sum(x,y,z))
    names(xyz) <- c('x','y','z','total')
  }


  # Return
  xyz
}



ttEq <- function(r, alpha, beta, mu, delta, omega, m_y, m_z) {
  x <- (delta*omega*r - beta*m_z)/(alpha*delta*omega)
  y <- m_z/(delta*omega)
  z <- (beta*delta*mu*omega*r - beta^2*m_z*mu - alpha*delta*m_y*omega)/(alpha*delta^2*omega)
  return(c(x = x, y = y, z = z, total = sum(x,y,z)))
}

ttSt <- function(r, alpha, beta, mu, delta, omega, m_y, m_z) {
  # Jacobian at equilibrium
  J <- c(
    r - beta*m_z/(delta*omega) - 2*(delta*omega*r - beta*m_z)/(delta*omega), # xx
    -(delta*omega*r - beta*m_z)*beta/(alpha*delta*omega), # xy
    0, # xz
    beta*m_z*mu/(delta*omega), # yx
    -m_y + (delta*omega*r - beta*m_z)*beta*mu/(alpha*delta*omega) - (beta*delta*mu*omega*r - beta^2*m_z*mu - alpha*delta*m_y*omega)/(alpha*delta*omega), # yy
    -m_z/omega, # yz
    0, # zx
    (beta*delta*mu*omega*r - beta^2*m_z*mu - alpha*delta*m_y*omega)/(alpha*delta), # zy
    0) # zz

  # Jacobian matrix
  J <- matrix(J, nrow = 3)

  # Stability
  S <- as.numeric(eigen(J)$values[1])

  # Return
  return(S)
}
