paEq <- function(r_x,alpha_x,r_z,alpha_z,mu,beta,m_y) {
  x <- m_y/(beta*mu)
  y <- (beta*mu*r_x - alpha_x*m_y)/(beta^2*mu)
  z <- r_z/alpha_z
  return(c(x = x, y = y, z = z))
}

paSt <- function(r_x,alpha_x,r_z,alpha_z,mu,beta,m_y) {
  # Jacobian at equilibrium
  J <- c(
    r_x - 2*alpha_x*m_y/(beta*mu) - (beta*mu*r_x - alpha_x*m_y)/(beta*mu), # xx
    (beta*mu*r_x - alpha_x*m_y)/beta, # xy
    0, # xz
    -m_y/mu, # yx
    0, # yy
    0, # yz
    0, # zx
    0, # zy
    -r_z) # zz

  # Jacobian matrix
  J <- matrix(J, nrow = 3)

  # Stability
  S <- as.numeric(eigen(J)$values[1])

  # Return
  return(S)
}

paIneq <- function(r_x,alpha_x,r_z,alpha_z,mu,beta,m_y) {
  # Inequality expressions
  inequalities <- list(
    expression(),
    expression(paEq(r_x,alpha_x,r_z,alpha_z,mu,beta,m_y)[1] < 1),
    expression(paEq(r_x,alpha_x,r_z,alpha_z,mu,beta,m_y)[2] < 1),
    expression(paEq(r_x,alpha_x,r_z,alpha_z,mu,beta,m_y)[3] < 1)
  )

  # Eval function
  lapply(inequalities, eval, envir = environment()) %>% unlist() %>% any()
}
