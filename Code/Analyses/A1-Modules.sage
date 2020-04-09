# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#                           Installing SAGE on iOS
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# brew cask install sage


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#                                   Modules
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ---------------------------------------------------
#                  Tri-trophic food chain
# ---------------------------------------------------
# Variables
x,y,z = var('x,y,z')
r,alpha,beta,mu,delta,omega,m_y,m_z = var('r,alpha,beta,mu,delta,omega,m_y,m_z')

# Equations
tt1 = x * (r - alpha*x - beta*y)
tt2 = y * (mu*beta*x - delta*z - m_y)
tt3 = z * (omega*delta*y - m_z)

# Matrix of symbolic equations
tt = matrix(SR, 1, [tt1, tt2, tt3])

# Solve
ttSol = solve([tt1 == 0, tt2 == 0, tt3 == 0], x, y, z)
ttSol = ttSol[4]

# Jacobian
ttJ = jacobian([tt1, tt2, tt3], (x, y, z))

# Jacobian at equilibrium
ttJEq = ttJ.substitute(ttSol)

# ---------------------------------------------------
#                         Omnivory
# ---------------------------------------------------
# Variables
x,y,z = var('x,y,z')
r,alpha,beta,mu,delta,omega,gamma,nu,m_y,m_z = var('r,alpha,beta,mu,delta,omega,gamma,nu,m_y,m_z')

# Equations
om1 = x * (r - alpha*x - beta*y - gamma*z)
om2 = y * (mu*beta*x - delta*z - m_y)
om3 = z * (nu*gamma*x + omega*delta*y - m_z)

# Equations
om = matrix(SR, 1, [om1, om2, om3])

# Solve
omSol = solve([om1 == 0, om2 == 0, om3 == 0], x, y, z)
omSol = omSol[5]

# Jacobian
omJ = jacobian([om1, om2, om3], (x, y, z))

# Jacobian at equilibrium
omJEq = omJ.substitute(omSol)


# ---------------------------------------------------
#               Exploitative competition
# ---------------------------------------------------
# First version, no equilibria without constraints to predator growth
# Variables
x,y,z = var('x,y,z')
r,alpha,beta,mu,delta,omega,gamma,nu,m_y,m_z = var('r,alpha,beta,mu,delta,omega,gamma,nu,m_y,m_z')

# Equations
ex1 = x * (r - alpha*x - beta*y - gamma*z)
ex2 = y * (mu*beta*x - m_y)
ex3 = z * (nu*gamma*x - m_z)

# Second version, with density dependence and competition for predators
# Variables
x,y,z = var('x,y,z')
r,alpha_x,beta,mu,gamma,nu,m_y,m_z,alpha_y,alpha_yz,alpha_z,alpha_zy = var('r,alpha_x,beta,mu,gamma,nu,m_y,m_z,alpha_y,alpha_yz,alpha_z,alpha_zy')

# Equations
ex1 = x * (r - alpha_x*x - beta*y - gamma*z)
ex2 = y * (mu*beta*x - m_y - alpha_y*y - alpha_y*alpha_yz*z)
ex3 = z * (nu*gamma*x - m_z - alpha_z*z - alpha_z*alpha_zy*y)

# Equations
ex = matrix(SR, 1, [ex1, ex2, ex3])

# Solve
exSol = solve([ex1 == 0, ex2 == 0, ex3 == 0], x, y, z)
exSol = exSol[7]

# Jacobian
exJ = jacobian([ex1, ex2, ex3], (x, y, z))

# Jacobian at equilibrium
exJEq = exJ.substitute(exSol)


# ---------------------------------------------------
#                Apparent competition
# ---------------------------------------------------
# Variables
x,y,z = var('x,y,z')
r_x,alpha_x,r_y,alpha_y,delta,omega,gamma,nu,m_z = var('r_x,alpha_x,r_y,alpha_y,delta,omega,gamma,nu,m_z')

# Equations
ap1 = x * (r_x - alpha_x*x - gamma*z)
ap2 = y * (r_y - alpha_y*y - delta*z)
ap3 = z * (nu*gamma*x + omega*delta*y - m_z)

# Equations
ap = matrix(SR, 1, [ap1, ap2, ap3])

# Solve
apSol = solve([ap1 == 0, ap2 == 0, ap3 == 0], x, y, z)
apSol = apSol[6]

# Jacobian
apJ = jacobian([ap1, ap2, ap3], (x, y, z))

# Jacobian at equilibrium
apJEq = apJ.substitute(apSol)


# ---------------------------------------------------
#               Partially disconnected
# ---------------------------------------------------
# Variables
x,y,z = var('x,y,z')
r_x,alpha_x,r_z,alpha_z,mu,beta,m_y = var('r_x,alpha_x,r_z,alpha_z,mu,beta,m_y')

# Equations
pd1 = x * (r_x - alpha_x*x - beta*y)
pd2 = y * (mu*beta*x - m_y)
pd3 = z * (r_z - alpha_z*z)

# Equations
pd = matrix(SR, 1, [pd1, pd2, pd3])

# Solve
pdSol = solve([pd1 == 0, pd2 == 0, pd3 == 0], x, y, z)
pdSol = pdSol[5]

# Jacobian
pdJ = jacobian([pd1, pd2, pd3], (x, y, z))

# Jacobian at equilibrium
pdJEq = pdJ.substitute(pdSol)


# ---------------------------------------------------
#                    Disconnected
# ---------------------------------------------------
# Variables
x,y,z = var('x,y,z')
r_x,alpha_x,r_y,alpha_y,r_z,alpha_z = var('r_x,alpha_x,r_y,alpha_y,r_z,alpha_z')

# Equations
di1 = x * (r_x - alpha_x*x)
di2 = y * (r_y - alpha_y*y)
di3 = z * (r_z - alpha_z*z)

# Equations
di = matrix(SR, 1, [di1, di2, di3])

# Solve
diSol = solve([di1 == 0, di2 == 0, di3 == 0], x, y, z)
diSol = diSol[7]

# Jacobian
diJ = jacobian([di1, di2, di3], (x, y, z))

# Jacobian at equilibrium
diJEq = diJ.substitute(diSol)
