apEq <- function(r_x,alpha_x,r_y,alpha_y,delta,omega,gamma,nu,m_z) {
  x <- (delta^2*omega*r_x - delta*gamma*omega*r_y + alpha_y*gamma*m_z)/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega)
  y <- -(delta*gamma*nu*r_x - gamma^2*nu*r_y - alpha_x*delta*m_z)/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega)
  z <- (alpha_y*gamma*nu*r_x + alpha_x*delta*omega*r_y - alpha_x*alpha_y*m_z)/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega)
  return(c(x = x, y = y, z = z))
}

apSt <- function(r_x,alpha_x,r_y,alpha_y,delta,omega,gamma,nu,m_z) {
  # Jacobian at equilibrium
  J <- c(
    -2*(delta^2*omega*r_x - delta*gamma*omega*r_y + alpha_y*gamma*m_z)*alpha_x/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega) - (alpha_y*gamma*nu*r_x + alpha_x*delta*omega*r_y - alpha_x*alpha_y*m_z)*gamma/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega) + r_x, # xx
    0, # xy
    (alpha_y*gamma*nu*r_x + alpha_x*delta*omega*r_y - alpha_x*alpha_y*m_z)*gamma*nu/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega), # xz
    0, # yx
    2*(delta*gamma*nu*r_x - gamma^2*nu*r_y - alpha_x*delta*m_z)*alpha_y/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega) - (alpha_y*gamma*nu*r_x + alpha_x*delta*omega*r_y - alpha_x*alpha_y*m_z)*delta/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega) + r_y, # yy
    (alpha_y*gamma*nu*r_x + alpha_x*delta*omega*r_y - alpha_x*alpha_y*m_z)*delta*omega/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega), # yz
    -(delta^2*omega*r_x - delta*gamma*omega*r_y + alpha_y*gamma*m_z)*gamma/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega), # zx
    (delta*gamma*nu*r_x - gamma^2*nu*r_y - alpha_x*delta*m_z)*delta/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega), # zy
    (delta^2*omega*r_x - delta*gamma*omega*r_y + alpha_y*gamma*m_z)*gamma*nu/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega) - (delta*gamma*nu*r_x - gamma^2*nu*r_y - alpha_x*delta*m_z)*delta*omega/(alpha_y*gamma^2*nu + alpha_x*delta^2*omega) - m_z) # zz

  # Jacobian matrix
  J <- matrix(J, nrow = 3)

  # Stability
  S <- as.numeric(eigen(J)$values[1])

  # Return
  return(S)
}

apIneq <- function(r_x,alpha_x,r_y,alpha_y,delta,omega,gamma,nu,m_z) {
  # Inequality expressions
  inequalities <- list(
    expression(),
    expression(apEq(r_x,alpha_x,r_y,alpha_y,delta,omega,gamma,nu,m_z)[1] < 1),
    expression(apEq(r_x,alpha_x,r_y,alpha_y,delta,omega,gamma,nu,m_z)[2] < 1),
    expression(apEq(r_x,alpha_x,r_y,alpha_y,delta,omega,gamma,nu,m_z)[3] < 1)
  )

  # Eval function
  lapply(inequalities, eval, envir = environment()) %>% unlist() %>% any()
}
