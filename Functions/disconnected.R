diEq <- function(r_x,alpha_x,r_y,alpha_y,r_z,alpha_z) {
  x <- r_x/alpha_x
  y <- r_y/alpha_y
  z <- r_z/alpha_z
  return(c(x = x, y = y, z = z))
}

diSt <- function(r_x,alpha_x,r_y,alpha_y,r_z,alpha_z) {
  # Jacobian at equilibrium
  J <- c(
    -r_x, # xx
    0, # xy
    0, # xz
    0, # yx
    -r_y, # yy
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

diIneq <- function(r_x,alpha_x,r_y,alpha_y,r_z,alpha_z) {
  # Inequality expressions
  inequalities <- list(
    expression(),
    expression(diEq(r_x,alpha_x,r_y,alpha_y,r_z,alpha_z)[1] < 1),
    expression(diEq(r_x,alpha_x,r_y,alpha_y,r_z,alpha_z)[2] < 1),
    expression(diEq(r_x,alpha_x,r_y,alpha_y,r_z,alpha_z)[3] < 1)
  )

  # Eval function
  lapply(inequalities, eval, envir = environment()) %>% unlist() %>% any()
}
