ttEq <- function(r, alpha, beta, mu, delta, omega, m_y, m_z) {
  x <- (delta*omega*r - beta*m_z)/(alpha*delta*omega)
  y <- m_z/(delta*omega)
  z <- (beta*delta*mu*omega*r - beta^2*m_z*mu - alpha*delta*m_y*omega)/(alpha*delta^2*omega)
  return(c(x = x, y = y, z = z))
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
