library(deSolve)
lwdD <- .75
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Omnivory
#
# Disturbances & dynamics
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# load('./Data/ParamInit/omParam.RData')
# omParam <- as.data.frame(omParam)
# uid = 88

# # initial state
# init <- c(x = omParam$x[uid],
#           y = omParam$y[uid],
#           z = omParam$z[uid])
# initial state
init <- c(x = 497.6478,
          y = 259.8222,
          z = 155.5680)

# times
times <- seq(0, 50, by = 1)

deriv <- function(t, state, pars) {
  with(as.list(c(state, pars)), {
    dx <- x * (r - alpha*x - beta*y - gamma*z)
    dy <- y * (-m_y + mu*beta*x - delta*z)
    dz <- z * (-m_z + nu*gamma*x + omega*delta*y)
    return(list(c(x = dx, y = dy, z = dz)))
  })
}

# # Parameters
# p <- c(r = 1.02,
#    alpha = 0.0009,
#     beta = omParam$beta[uid],
#    delta = omParam$delta[uid],
#    gamma = omParam$gamma[uid],
#       mu = .5,
#       nu = .5,
#    omega = .5,
#      m_y = omParam$m_y[uid],
#      m_z = omParam$m_z[uid])
# Parameters
p <- c(r = 1.0200000000,
   alpha = 0.0009000000,
    beta = 0.0017214390,
   delta = 0.0026447249,
   gamma = 0.0003540844,
      mu = 0.5000000000,
      nu = 0.5000000000,
   omega = 0.5000000000,
     m_y = 0.0169005008,
     m_z = 0.4316837251)

plotOmnivory <- function() {
  # plot0(x = c(-3.5,60), y = c(-60,625))
  plot0(x = c(-3.5,60), y = c(-60,750))
  arrows(-2, 0, 59, 0, length = .05, code = 2, xpd = TRUE)
  arrows(-2, 0, -2, 600, length = .05, code = 2, xpd = TRUE)
  lines(x = c(5,5), y = c(-25,600), lty = 2, col = '#00000088')
  lines(x = c(5,5), y = c(-25,0), col = '#000000')
  text(x = 56, y = -15, adj = c(1,1), 'Time', cex = .75)
  text(x = -3, y = 275, adj = c(.5,0), TeX('Abundance ($\\textit{a}$)'), cex = .75, srt = 90)
  text(x = 6, y = -42, adj = c(0,1), 'Stressors', cex = .55)
  for(i in 1:3) lines(x = c(0,5), y = rep(init[i], 2), col = '#000000', lwd = .75)
  arrows(6, -25, 10, -25, length = .025, code = 2, xpd = TRUE)
  pchImage(x = 1.5, 110, obj = bew, cex.x = .8, cex.y = .6)#, col = colsPos[3]) # Beluga
  pchImage(x = 1.5, 220, obj = cod, cex.x = .7, cex.y = .5)#, col = colsPos[3]) # Cod
  pchImage(x = 1.5, 460, obj = cap, cex.x = .5, cex.y = .5)#, col = colsPos[3]) # Capelin
}

# Disturbances 1
p1 <- p
p1['r'] <- p1['r']*.8
# Solve system of equations
res1 <- ode(init, times, deriv, p1)

# Disturbances 2
p2 <- p
p2['m_y'] <- p2['m_y']*1.15
# Solve system of equations
res2 <- ode(init, times, deriv, p2)

# # Disturbances 3
# p3 <- p
# p3['gamma'] <- p3['gamma']*.75
# p3['delta'] <- p3['delta']*.8
# # Solve system of equations
# res3 <- ode(init, times, deriv, p3)

# Disturbances 3
p3 <- p
p3['gamma'] <- p3['gamma']*.75
# Solve system of equations
res3 <- ode(init, times, deriv, p3)

# Disturbances 3
p4 <- p
p4['delta'] <- p4['delta']*.8
# Solve system of equations
res4 <- ode(init, times, deriv, p4)


# Disturbances 5
p5 <- p
p5['r'] <- p5['r']*.8
p5['m_y'] <- p5['m_y']*1.15
p5['gamma'] <- p5['gamma']*.75
p5['delta'] <- p5['delta']*.8
# Solve system of equations
res5 <- ode(init, times, deriv, p5)

# # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# # Measure trophic sensitivity, amplification and variance
# Trophic sensitivity
# resTS1 <- (res1[50, 2:4] - res1[1, 2:4])/res1[1,2:4]
# resTS2 <- (res2[50, 2:4] - res2[1, 2:4])/res2[1,2:4]
# resTS3 <- (res3[50, 2:4] - res3[1, 2:4])/res3[1,2:4]
# resTS4 <- (res4[50, 2:4] - res4[1, 2:4])/res4[1,2:4]
# resTS5 <- (res5[50, 2:4] - res5[1, 2:4])/res5[1,2:4]
#
# # Trophic amplification
# expTS <- resTS5/4
# resTA <- (resTS1-expTS) + (resTS2-expTS) + (resTS3-expTS) + (resTS4-expTS)
#
# # Trophic amplification
# resTV <- (resTS1-expTS)^2 + (resTS2-expTS)^2 + (resTS3-expTS)^2 + (resTS4-expTS)^2
# # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #



# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# Apparent competition
#
# Disturbances & dynamics
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #
# load('./Data/ParamInit/apParam.RData')
# load('./Data/ParamImpact/apImpact.RData')

# i = 50
# ParamInit = apParam[i,]
# equilibrium = apEq
# nParam <- length(ParamInit)
# nmParam <- names(ParamInit)
# lsInit <- split(as.matrix(ParamInit), nmParam)
# InitAbundances <- do.call(equilibrium, lsInit)
#
# apParam <- as.data.frame(apParam)
# uid = 88
#
# # initial state
# init <- c(x = apParam$x[uid],
#           y = apParam$y[uid],
#           z = apParam$z[uid])

# initial state
apInit <- c(x = 388.2725,
          y = 457.4762,
          z = 1153.5065)

# times
times <- seq(0, 50, by = 1)

deriv <- function(t, state, pars) {
  with(as.list(c(state, pars)), {
    dx <- x * (r_x - alpha_x*x - gamma*z)
    dy <- y * (r_y - alpha_y*y - delta*z)
    dz <- z * (-m_z + nu*gamma*x + omega*delta*y)
    return(list(c(x = dx, y = dy, z = dz)))
  })
}


# Parameters
p <- c(alpha_x = 0.0010000000,
       alpha_y = 0.0010000000,
         delta = 0.0004703257,
         gamma = 0.0005303200,
           m_z = 0.2505357424,
            nu = 0.5000000000,
         omega = 0.5000000000,
           r_x = 0.9000000000,
           r_y = 1.100000000)


# Plot function
plotApparent <- function() {
  # plot0(x = c(-3.5,60), y = c(-60,625))
  plot0(x = c(-3.5,60), y = c(-140,1850))
  arrows(-2, 0, 59, 0, length = .05, code = 2, xpd = TRUE)
  arrows(-2, 0, -2, 1500, length = .05, code = 2, xpd = TRUE)
  lines(x = c(5,5), y = c(-25,1500), lty = 2, col = '#00000088')
  lines(x = c(5,5), y = c(-25,0), col = '#000000')
  text(x = 56, y = -35, adj = c(1,1), 'Time', cex = .75)
  text(x = -3, y = 700, adj = c(.5,0), TeX('Abundance ($\\textit{a}$)'), cex = .75, srt = 90)
  text(x = 6, y = -110, adj = c(0,1), 'Stressors', cex = .55)
  for(i in 1:3) lines(x = c(0,5), y = rep(apInit[i], 2), col = '#000000', lwd = .75)
  arrows(6, -65, 10, -65, length = .025, code = 2, xpd = TRUE)
  pchImage(x = 1.5, 550, obj = cop, cex.x = .5, cex.y = .6, col = '#000000')#, col = colsPos[4]) # Copepods
  pchImage(x = 1.5, 290, obj = kri, cex.x = .5, cex.y = .5)#, col = colsPos[4]) # Krill
  pchImage(x = 1.5, 1080, obj = cap, cex.x = .5, cex.y = .5)#, col = colsPos[4]) # Capelin
}

# Unitary 1
p1 <- p
p1['omega'] <- p1['omega']*.8
# Solve system of equations
ap1 <- ode(apInit, times, deriv, p1)

# Unitary 2
p2 <- p
p2['m_z'] <- p2['m_z']*.8
# Solve system of equations
ap2 <- ode(apInit, times, deriv, p2)

# Unitary 1
p3 <- p
p3['m_z'] <- p3['m_z']*.8
p3['omega'] <- p3['omega']*.8
# Solve system of equations
ap3 <- ode(apInit, times, deriv, p3)

# # # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
# # # Measure trophic sensitivity, amplification and variance
# # Trophic sensitivity
# resTS1 <- (ap1[50, 2:4] - ap1[1, 2:4])/ap1[1,2:4]
# resTS2 <- (ap2[50, 2:4] - ap2[1, 2:4])/ap2[1,2:4]
# resTS3 <- (ap3[50, 2:4] - ap3[1, 2:4])/ap3[1,2:4]
#
# # Trophic amplification
# expTS <- resTS3/2
# resTA <- (resTS1-expTS) + (resTS2-expTS)
#
# # Trophic amplification
# resTV <- (resTS1-expTS)^2 + (resTS2-expTS)^2
# # # =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= #
