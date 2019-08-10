omEq <- function(r, alpha, beta, mu, delta, omega, gamma, nu, m_y, m_z) {
  x <- -(gamma*m_y*omega + delta*omega*r - beta*m_z)/(beta*gamma*nu - (beta*gamma*mu + alpha*delta)*omega)
  y <- -(beta*gamma*m_z*mu - gamma^2*m_y*nu - delta*gamma*nu*r + alpha*delta*m_z)/(beta*delta*gamma*nu - (beta*delta*gamma*mu + alpha*delta^2)*omega)
  z <- -(beta*delta*mu*omega*r - beta^2*m_z*mu + beta*gamma*m_y*nu - alpha*delta*m_y*omega)/(beta*delta*gamma*nu - (beta*delta*gamma*mu + alpha*delta^2)*omega)
  return(c(x = x, y = y, z = z))
}

omSt <- function(r, alpha, beta, mu, delta, omega, gamma, nu, m_y, m_z) {
  # Jacobian at equilibrium
  J <- c(
    2*(gamma*m_y*omega + delta*omega*r - beta*m_z)*alpha/(beta*gamma*nu - (beta*gamma*mu + alpha*delta)*omega) + (beta*gamma*m_z*mu - gamma^2*m_y*nu - delta*gamma*nu*r + alpha*delta*m_z)*beta/(beta*delta*gamma*nu - (beta*delta*gamma*mu + alpha*delta^2)*omega) + (beta*delta*mu*omega*r - beta^2*m_z*mu + beta*gamma*m_y*nu - alpha*delta*m_y*omega)*gamma/(beta*delta*gamma*nu - (beta*delta*gamma*mu + alpha*delta^2)*omega) + r, # xx
    -(beta*gamma*m_z*mu - gamma^2*m_y*nu - delta*gamma*nu*r + alpha*delta*m_z)*beta*mu/(beta*delta*gamma*nu - (beta*delta*gamma*mu + alpha*delta^2)*omega), # xy
    -(beta*delta*mu*omega*r - beta^2*m_z*mu + beta*gamma*m_y*nu - alpha*delta*m_y*omega)*gamma*nu/(beta*delta*gamma*nu - (beta*delta*gamma*mu + alpha*delta^2)*omega), # xz
    (gamma*m_y*omega + delta*omega*r - beta*m_z)*beta/(beta*gamma*nu - (beta*gamma*mu + alpha*delta)*omega), # yx
    -(gamma*m_y*omega + delta*omega*r - beta*m_z)*beta*mu/(beta*gamma*nu - (beta*gamma*mu + alpha*delta)*omega) + (beta*delta*mu*omega*r - beta^2*m_z*mu + beta*gamma*m_y*nu - alpha*delta*m_y*omega)*delta/(beta*delta*gamma*nu - (beta*delta*gamma*mu + alpha*delta^2)*omega) - m_y, # yy
    -(beta*delta*mu*omega*r - beta^2*m_z*mu + beta*gamma*m_y*nu - alpha*delta*m_y*omega)*delta*omega/(beta*delta*gamma*nu - (beta*delta*gamma*mu + alpha*delta^2)*omega), # yz
    (gamma*m_y*omega + delta*omega*r - beta*m_z)*gamma/(beta*gamma*nu - (beta*gamma*mu + alpha*delta)*omega), # zx
    (beta*gamma*m_z*mu - gamma^2*m_y*nu - delta*gamma*nu*r + alpha*delta*m_z)*delta/(beta*delta*gamma*nu - (beta*delta*gamma*mu + alpha*delta^2)*omega), # zy
    -(gamma*m_y*omega + delta*omega*r - beta*m_z)*gamma*nu/(beta*gamma*nu - (beta*gamma*mu + alpha*delta)*omega) - (beta*gamma*m_z*mu - gamma^2*m_y*nu - delta*gamma*nu*r + alpha*delta*m_z)*delta*omega/(beta*delta*gamma*nu - (beta*delta*gamma*mu + alpha*delta^2)*omega) - m_z) # zz

  # Jacobian matrix
  J <- matrix(J, nrow = 3)

  # Stability
  S <- as.numeric(eigen(J)$values[1])

  # Return
  return(S)
}

omIneq <- function(r, alpha, beta, mu, delta, omega, gamma, nu, m_y, m_z) {
  # Inequality expressions
  inequalities <- list(
    expression(omEq(r, alpha, beta, mu, delta, omega, gamma, nu, m_y, m_z)[1] < 1),
    expression(omEq(r, alpha, beta, mu, delta, omega, gamma, nu, m_y, m_z)[2] < 1),
    expression(omEq(r, alpha, beta, mu, delta, omega, gamma, nu, m_y, m_z)[3] < 1)
  )

  # Eval function
  lapply(inequalities, eval, envir = environment()) %>% unlist() %>% any()
}
